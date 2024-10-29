using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShopOnline.Models;
using ShopOnline.Models.Authentication;
using ShopOnline.ViewModels;
using System;
using System.Diagnostics;
using System.Drawing.Printing;
using System.Globalization;
using System.Linq;
using System.Text;
using X.PagedList;
using X.PagedList.Extensions;

namespace ShopOnline.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        QuanLyShopOnlineContext db = new QuanLyShopOnlineContext();
        private readonly IHttpContextAccessor _httpContextAccessor;

        public HomeController(ILogger<HomeController> logger, IHttpContextAccessor httpContextAccessor)
        {
            _logger = logger;
            _httpContextAccessor = httpContextAccessor;
        }
        public IActionResult Index(int? page, string search, string selectedColor, string selectedSize, string selectedPrice)
        {
            ViewBag.Search = search;
            ViewBag.SelectedColor = selectedColor;
            ViewBag.SelectedSize = selectedSize;
            ViewBag.SelectedPrice = selectedPrice;

            var username = _httpContextAccessor.HttpContext.Session.GetString("Username");

            int pageSize = 12;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;


            var ListSanPham = db.SanPhams.Where(sp => sp.MinGia > 0).OrderBy(sp => sp.MaSp);

            var sanPhamList = ListSanPham.ToList();

            var originalSanPhamList = new List<SanPham>(sanPhamList);

            //Xử lý tìm kiếm theo tên

            if (!string.IsNullOrEmpty(search))
            {
                search = search.Trim();

                var processedSearch = RemoveDiacritics(search.ToLower());

                var searchKeywords = processedSearch.Split(' ', StringSplitOptions.RemoveEmptyEntries);

                var currentFilteredList = originalSanPhamList;

                foreach (var keyword in searchKeywords)
                {
                    var filteredList = currentFilteredList.Where(sp =>
                        RemoveDiacritics(sp.TenSp.ToLower()).Contains(keyword)).ToList();

                    if (filteredList.Any())
                    {
                        currentFilteredList = filteredList; 
                    }
                }

                sanPhamList = currentFilteredList;
            }

            //Xử lý tìm kiếm theo giá
            if (!string.IsNullOrEmpty(selectedPrice) && !selectedPrice.Contains("Tất cả"))
            {
                // Xóa ký tự không cần thiết khỏi chuỗi giá
                var priceRange = selectedPrice.Replace("₫", "").Replace(".", "").Replace(" ", "");

                // Tách chuỗi khoảng giá thành mảng chứa 2 phần tử [minPrice, maxPrice]
                var priceValues = priceRange.Split('-');

                if (priceValues.Length == 2)
                {
                    // Chuyển đổi chuỗi thành số nguyên
                    int minPrice = int.Parse(priceValues[0]) / 1000;
                    int maxPrice = int.Parse(priceValues[1]) / 1000;

                    // Lọc sản phẩm theo khoảng giá đã tách
                    sanPhamList = sanPhamList.Where(sp => sp.MinGia > minPrice && sp.MinGia <= maxPrice).ToList();
                }
                else if (selectedPrice.Contains("Trên")) // Xử lý trường hợp "Trên 400.000₫"
                {
                    int minPrice = int.Parse(selectedPrice.Replace("Trên", "").Replace("₫", "").Replace(".", "").Trim()) / 1000;
                    sanPhamList = sanPhamList.Where(sp => sp.MinGia > minPrice).ToList();
                }
                else if (selectedPrice.Contains("Dưới")) // Xử lý trường hợp "Dưới 100.000₫"
                {
                    int maxPrice = int.Parse(selectedPrice.Replace("Dưới", "").Replace("₫", "").Replace(".", "").Trim()) / 1000;
                    sanPhamList = sanPhamList.Where(sp => sp.MaxGia <= maxPrice).ToList();
                }
            }

            //Xử lý tìm kiếm theo màu sắc
            var colorCounts = new Dictionary<string, int>();
            if (!string.IsNullOrEmpty(selectedColor) && !selectedColor.Contains("Tất cả"))
            {
                var maMauSacs = db.MauSacs.Where(x => x.TenMs.Contains(selectedColor)).Select(x => x.MaMs).ToList();

                var filteredProducts = new List<SanPham>();

                foreach (var sp in sanPhamList)
                {
                    var listCtsp = db.Ctsps.Where(x => x.MaSp == sp.MaSp).Select(x => x.MaMs).ToList();

                    if (listCtsp.Any(ctsp => maMauSacs.Contains(ctsp)))
                    {
                        filteredProducts.Add(sp);
                    }
                }

                sanPhamList = filteredProducts;
            }

            //Xử lý tìm kiếm theosize
            if (!string.IsNullOrEmpty(selectedSize) && !selectedSize.Contains("Tất cả"))
            {
                var maSizes = db.Sizes.Where(x => x.TenSize == selectedSize).Select(x => x.MaSize).FirstOrDefault();

                var filteredProducts = new List<SanPham>();

                foreach (var sp in sanPhamList)
                {
                    var listCtsp = db.Ctsps.Where(x => x.MaSp == sp.MaSp).Select(x => x.MaCtsp).ToList();

                    bool hasMatchingSize = false;

                    foreach (var ctsp in listCtsp)
                    {
                        var cts = db.CtspSizes.Where(x => x.MaCtsp == ctsp).Select(x => x.MaSize).ToList();
                        foreach(var mas in cts)
                        {
                            if (mas == maSizes)
                            {
                                hasMatchingSize = true;
                                break; // Tìm thấy kích thước phù hợp, không cần lặp nữa
                            }
                        }
                    }
                    if (hasMatchingSize)
                    {
                        filteredProducts.Add(sp); // Chỉ thêm sản phẩm nếu có kích thước phù hợp
                    }
                }

                sanPhamList = filteredProducts;
            }

            var pagedList = sanPhamList.ToPagedList(pageNumber, pageSize);

            ViewBag.AllProducts = sanPhamList;

            //Xử lý số lượng theo màu sắc
            int mauDen = 0, mauTrang = 0, mauDo = 0, mauXanh = 0, mauNau = 0;
            int sizeXS = 0, sizeS = 0, sizeM = 0, sizeL = 0, sizeXL = 0, sizeFreeSize = 0;

            foreach (var sp in sanPhamList)
            {
                // Flags for each color, initialized to true for each product
                bool checkMauDen = true, checkMauTrang = true, checkMauDo = true, checkMauXanh = true, checkMauNau = true;
                bool checkSizeXS = true, checkSizeS = true, checkSizeM = true, checkSizeL = true, checkSizeXL = true, checkSizeFreesize = true;

                var CTSP = db.Ctsps.Where(x => x.MaSp == sp.MaSp).ToList();
                foreach (var ctsp in CTSP)
                {
                    string tenMS = db.MauSacs.FirstOrDefault(x => x.MaMs == ctsp.MaMs)?.TenMs?.Trim();

                    // Count colors once per product
                    if (tenMS != null)
                    {
                        if (checkMauDen && tenMS.Contains("Đen"))
                        {
                            mauDen += 1;
                            checkMauDen = false;
                        }
                        else if (checkMauTrang && tenMS.Contains("Trắng"))
                        {
                            mauTrang += 1;
                            checkMauTrang = false;
                        }
                        else if (checkMauDo && tenMS.Contains("Đỏ"))
                        {
                            mauDo += 1;
                            checkMauDo = false;
                        }
                        else if (checkMauXanh && tenMS.Contains("Xanh"))
                        {
                            mauXanh += 1;
                            checkMauXanh = false;
                        }
                        else if (checkMauNau && tenMS.Contains("Nâu"))
                        {
                            mauNau += 1;
                            checkMauNau = false;
                        }
                    }

                    // Count sizes once per product
                    var CTSPSize = db.CtspSizes.Where(x => x.MaCtsp == ctsp.MaCtsp).ToList();
                    foreach (var ctspSize in CTSPSize)
                    {
                        string tenSize = db.Sizes.FirstOrDefault(x => x.MaSize == ctspSize.MaSize)?.TenSize?.Trim();

                        if (checkSizeXS && tenSize == "XS")
                        {
                            sizeXS += 1;
                            checkSizeXS = false;
                        }
                        else if (checkSizeS && tenSize == "S")
                        {
                            sizeS += 1;
                            checkSizeS = false;
                        }
                        else if (checkSizeM && tenSize == "M")
                        {
                            sizeM += 1;
                            checkSizeM = false;
                        }
                        else if (checkSizeL && tenSize == "L")
                        {
                            sizeL += 1;
                            checkSizeL = false;
                        }
                        else if (checkSizeXL && tenSize == "XL")
                        {
                            sizeXL += 1;
                            checkSizeXL = false;
                        }
                        else if (checkSizeFreesize && tenSize == "FreeSize")
                        {
                            sizeFreeSize += 1;
                            checkSizeFreesize = false;
                        }
                    }
                }
            }
            //Viewbag màu sắc
            ViewBag.MauDen = mauDen;
            ViewBag.MauTrang = mauTrang;
            ViewBag.MauDo = mauDo;
            ViewBag.MauXanh = mauXanh;
            ViewBag.MauNau = mauNau;

            //Viewbag size
            ViewBag.SizeXS = sizeXS;
            ViewBag.SizeS = sizeS;
            ViewBag.SizeM = sizeM;
            ViewBag.SizeL = sizeL;
            ViewBag.SizeXL = sizeXL;
            ViewBag.FreeSize = sizeFreeSize;

            return View(pagedList);
        }

        // Phương thức RemoveDiacritics
        public static string RemoveDiacritics(string text)
        {
            var normalizedString = text.Normalize(NormalizationForm.FormD);
            var stringBuilder = new StringBuilder();

            foreach (var c in normalizedString)
            {
                var unicodeCategory = CharUnicodeInfo.GetUnicodeCategory(c);
                if (unicodeCategory != UnicodeCategory.NonSpacingMark)
                {
                    stringBuilder.Append(c);
                }
            }
            return stringBuilder.ToString().Normalize(NormalizationForm.FormC);
        }


        public IActionResult SanPhamTheoDanhMuc(string madm, int? page,string selectedColorDM, string selectedSizeDM, string selectedPriceDM)
        {
            if (string.IsNullOrEmpty(madm))
            {
                return RedirectToAction("Index");
            }
            ViewBag.MadM = madm;
            ViewBag.SelectedColorDM = selectedColorDM;
            ViewBag.SelectedSizeDM = selectedSizeDM;
            ViewBag.SelectedPriceDM = selectedPriceDM;

            var danhMucs = db.DanhMucs.ToList();

            int pageSize = 12; // Số sản phẩm trên mỗi trang
            int pageNumber = page == null || page < 0 ? 1 : page.Value;

            var ListSanPham = db.SanPhams.Where(x => x.MaDm == madm).AsQueryable();
            var sanPhamList = ListSanPham.ToList();
            
            // Xử lý tìm kiếm theo giá (giống hàm Index)
            if (!string.IsNullOrEmpty(selectedPriceDM) && !selectedPriceDM.Contains("Tất cả"))
            {
                var priceRange = selectedPriceDM.Replace("₫", "").Replace(".", "").Replace(" ", "");
                var priceValues = priceRange.Split('-');

                if (priceValues.Length == 2)
                {
                    int minPrice = int.Parse(priceValues[0]) / 1000;
                    int maxPrice = int.Parse(priceValues[1]) / 1000;
                    sanPhamList = sanPhamList.Where(sp => sp.MinGia >= minPrice && sp.MinGia <= maxPrice).ToList();
                }
                else if (selectedPriceDM.Contains("Trên"))
                {
                    int minPrice = int.Parse(selectedPriceDM.Replace("Trên", "").Replace("₫", "").Replace(".", "").Trim()) / 1000;
                    sanPhamList = sanPhamList.Where(sp => sp.MinGia > minPrice).ToList();
                }
                else if (selectedPriceDM.Contains("Dưới"))
                {
                    int maxPrice = int.Parse(selectedPriceDM.Replace("Dưới", "").Replace("₫", "").Replace(".", "").Trim()) / 1000;
                    sanPhamList = sanPhamList.Where(sp => sp.MaxGia < maxPrice).ToList();
                }
            }

            // Xử lý tìm kiếm theo màu sắc (giống hàm Index)
            if (!string.IsNullOrEmpty(selectedColorDM) && !selectedColorDM.Contains("Tất cả"))
            {
                var maMauSacs = db.MauSacs.Where(x => x.TenMs.Contains(selectedColorDM)).Select(x => x.MaMs).ToList();
                var filteredProducts = new List<SanPham>();

                foreach (var sp in sanPhamList)
                {
                    var listCtsp = db.Ctsps.Where(x => x.MaSp == sp.MaSp).Select(x => x.MaMs).ToList();
                    if (listCtsp.Any(ctsp => maMauSacs.Contains(ctsp)))
                    {
                        filteredProducts.Add(sp);
                    }
                }

                sanPhamList = filteredProducts;
            }

            // Xử lý tìm kiếm theo size (giống hàm Index)
            if (!string.IsNullOrEmpty(selectedSizeDM) && !selectedSizeDM.Contains("Tất cả"))
            {
                var maSizes = db.Sizes.Where(x => x.TenSize == selectedSizeDM).Select(x => x.MaSize).FirstOrDefault();
                var filteredProducts = new List<SanPham>();

                foreach (var sp in sanPhamList)
                {
                    var listCtsp = db.Ctsps.Where(x => x.MaSp == sp.MaSp).Select(x => x.MaCtsp).ToList();
                    bool hasMatchingSize = false;

                    foreach (var ctsp in listCtsp)
                    {
                        var cts = db.CtspSizes.Where(x => x.MaCtsp == ctsp).Select(x => x.MaSize).ToList();
                        foreach (var mas in cts)
                        {
                            if (mas == maSizes)
                            {
                                hasMatchingSize = true;
                                break;
                            }
                        }
                    }

                    if (hasMatchingSize)
                    {
                        filteredProducts.Add(sp);
                    }
                }

                sanPhamList = filteredProducts;
            }

            // Tạo phân trang
            var pagedList = sanPhamList.ToPagedList(pageNumber, pageSize);

            ViewBag.AllProducts = sanPhamList;
            ViewBag.MadM = madm;
            //Xử lý số lượng theo màu sắc
            int mauDen = 0, mauTrang = 0, mauDo = 0, mauXanh = 0, mauNau = 0;
            int sizeXS = 0, sizeS = 0, sizeM = 0, sizeL = 0, sizeXL = 0, sizeFreeSize = 0;

            foreach (var sp in sanPhamList)
            {
                // Flags for each color, initialized to true for each product
                bool checkMauDen = true, checkMauTrang = true, checkMauDo = true, checkMauXanh = true, checkMauNau = true;
                bool checkSizeXS = true, checkSizeS = true, checkSizeM = true, checkSizeL = true, checkSizeXL = true, checkSizeFreesize = true;

                var CTSP = db.Ctsps.Where(x => x.MaSp == sp.MaSp).ToList();
                foreach (var ctsp in CTSP)
                {
                    string tenMS = db.MauSacs.FirstOrDefault(x => x.MaMs == ctsp.MaMs)?.TenMs?.Trim();

                    // Count colors once per product
                    if (tenMS != null)
                    {
                        if (checkMauDen && tenMS.Contains("Đen"))
                        {
                            mauDen += 1;
                            checkMauDen = false;
                        }
                        else if (checkMauTrang && tenMS.Contains("Trắng"))
                        {
                            mauTrang += 1;
                            checkMauTrang = false;
                        }
                        else if (checkMauDo && tenMS.Contains("Đỏ"))
                        {
                            mauDo += 1;
                            checkMauDo = false;
                        }
                        else if (checkMauXanh && tenMS.Contains("Xanh"))
                        {
                            mauXanh += 1;
                            checkMauXanh = false;
                        }
                        else if (checkMauNau && tenMS.Contains("Nâu"))
                        {
                            mauNau += 1;
                            checkMauNau = false;
                        }
                    }

                    // Count sizes once per product
                    var CTSPSize = db.CtspSizes.Where(x => x.MaCtsp == ctsp.MaCtsp).ToList();
                    foreach (var ctspSize in CTSPSize)
                    {
                        string tenSize = db.Sizes.FirstOrDefault(x => x.MaSize == ctspSize.MaSize)?.TenSize?.Trim();

                        if (checkSizeXS && tenSize == "XS")
                        {
                            sizeXS += 1;
                            checkSizeXS = false;
                        }
                        else if (checkSizeS && tenSize == "S")
                        {
                            sizeS += 1;
                            checkSizeS = false;
                        }
                        else if (checkSizeM && tenSize == "M")
                        {
                            sizeM += 1;
                            checkSizeM = false;
                        }
                        else if (checkSizeL && tenSize == "L")
                        {
                            sizeL += 1;
                            checkSizeL = false;
                        }
                        else if (checkSizeXL && tenSize == "XL")
                        {
                            sizeXL += 1;
                            checkSizeXL = false;
                        }
                        else if (checkSizeFreesize && tenSize == "FreeSize")
                        {
                            sizeFreeSize += 1;
                            checkSizeFreesize = false;
                        }
                    }
                }
            }
            //Viewbag màu sắc
            ViewBag.MauDen = mauDen;
            ViewBag.MauTrang = mauTrang;
            ViewBag.MauDo = mauDo;
            ViewBag.MauXanh = mauXanh;
            ViewBag.MauNau = mauNau;

            //Viewbag size
            ViewBag.SizeXS = sizeXS;
            ViewBag.SizeS = sizeS;
            ViewBag.SizeM = sizeM;
            ViewBag.SizeL = sizeL;
            ViewBag.SizeXL = sizeXL;
            ViewBag.FreeSize = sizeFreeSize;

            return View(pagedList);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

    }
}
