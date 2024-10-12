using Microsoft.AspNetCore.Mvc;
using ShopOnline.Models;
using ShopOnline.ViewModels;
using X.PagedList;
using X.PagedList.Extensions;

namespace ShopOnline.Controllers
{
    public class MonitorInvoiceController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        QuanLyShopOnlineContext db = new QuanLyShopOnlineContext();
        private readonly IHttpContextAccessor _httpContextAccessor;
        public IActionResult TheoDoiDonHang(string macode = null, int? page = 1)
        {
            List<MonitorInvoiceViewModel> invoiceList = new List<MonitorInvoiceViewModel>();
            var username = HttpContext.Session.GetString("Username");
            var makh = db.KhachHangs.Where(c => c.Username == username).Select(c => c.MaKh).FirstOrDefault();
            if (macode == null) 
            {
                macode = HttpContext.Session.GetString("Macode");
                HttpContext.Session.Remove("Macode");
            }
            if (macode == null) 
            {
                if (makh == null)
                {
                    return View();
                }
                else
                {
                    var donhang = db.DonHangs
                        .Where(x => x.MaKh == makh)
                        .OrderByDescending(x => x.NgayDh) // Sắp xếp theo ngày đặt hàng giảm dần
                        .ThenByDescending(x => x.TrangThai == "Đang giao hàng") // Sắp xếp trạng thái "Đang giao hàng" lên đầu
                        .ToList();
                    foreach (var item in donhang)
                    {
                        var result = ItemDonHang(item.MaCode) as ViewResult; // Cast về ViewResult để lấy Model
                        if (result != null && result.Model is MonitorInvoiceViewModel model)
                        {
                            invoiceList.Add(model); // Thêm vào danh sách nếu kết quả không null
                        }
                    }
                }
            }
            else
            {
                if (makh != null)
                {
                    bool check = CheckMacode(macode, makh);
                    if (check) 
                    {
                        var result = ItemDonHang(macode) as ViewResult; // Gọi ItemDonHang với mã code
                        if (result != null && result.Model is MonitorInvoiceViewModel model)
                        {
                            invoiceList.Add(model); // Thêm vào danh sách nếu kết quả không null
                        }
                    }
                    else
                    {
                        TempData["ErrorMessage"] = "Mã đơn hàng không phải của khách hàng.";
                    }
                }
                else
                {
                    bool check = CheckMacode(macode, null);
                    if (check)
                    {
                        var result = ItemDonHang(macode) as ViewResult; // Gọi ItemDonHang với mã code
                        if (result != null && result.Model is MonitorInvoiceViewModel model)
                        {
                            invoiceList.Add(model); // Thêm vào danh sách nếu kết quả không null
                        }
                    }
                    else
                    {
                        TempData["ErrorMessage"] = "Mã đơn hàng không phải của khách hàng.";
                    }
                }
               
            }
            // Số sản phẩm trên mỗi trang
            int pageSize = 2;
            // Số trang hiện tại
            int pageNumber = page ?? 1;

            // Tạo phân trang
            var pagedList = invoiceList.ToPagedList(pageNumber, pageSize);

            // Tạo ViewModel và gán dữ liệu phân trang vào ViewModel
            var invoiceListViewModel = new MonitorInvoiceListViewModel
            {
                DonHangs = pagedList
            };

            ViewBag.invoiceList = pagedList;
            return View(invoiceListViewModel);

        }
        public IActionResult ItemDonHang(string macode)
        {
            if (macode == null)
            {
                return View();
            }
            var donhang = db.DonHangs.Where(x => x.MaCode == macode).FirstOrDefault();
            if (donhang == null) 
            {
                TempData["ErrorMessage"] = "Mã đơn hàng không tồn tại.";
            }
            var ctdh = db.Ctdhs.Where(x=> x.MaDh == donhang.MaDh).ToList();

            List<ProductInVoiceViewModel> cartItems = new List<ProductInVoiceViewModel>();
            foreach (var item in ctdh)
            {
                cartItems.Add(new ProductInVoiceViewModel
                {
                    AnhSP = GetAnhSp(item.MaCtspSize),  
                    TenSP = GetTenSp(item.MaCtspSize),  
                    Mausac = GetMauSacSp(item.MaCtspSize),  
                    Soluong = item.SoLuong, 
                    Gia = item.GiaBan, 
                    Tong = item.TongTien  
                });
            }
            var monitor = new MonitorInvoiceViewModel
            {
                MaDH = donhang.MaDh,
                MaCode = donhang.MaCode,
                TrangThai = donhang.TrangThai,
                TongGia = donhang.TongTien,
                GiamGia = donhang.TienGiam,
                PhiVC = donhang.TienShip,
                TongCong = donhang.TienThu,
                SanPham = cartItems
            };
            return View(monitor);
        }

        public bool CheckMacode(string MaCode, string makh)
        {
            bool exitCustomer = false;
            var Customer = db.DonHangs.Where(x => x.MaCode == MaCode && x.MaKh == makh ).Select(x => x.MaCode).FirstOrDefault();
            if (Customer != null)
            {
                exitCustomer = true;
            }
            return exitCustomer;
        }
            
        public string GetAnhSp(string macts)
        {
            var cts = db.CtspSizes.Where(x => x.MaCtspSize == macts).FirstOrDefault();
            var anh = db.Ctsps.Where(x => x.MaCtsp == cts.MaCtsp).Select(x => x.HinhAnh).FirstOrDefault();
            return anh;
        }
        public string GetTenSp(string macts)
        {
            var cts = db.CtspSizes.Where(x => x.MaCtspSize == macts).FirstOrDefault();
            var ctsp = db.Ctsps.Where(x => x.MaCtsp == cts.MaCtsp).FirstOrDefault();
            var ten = db.SanPhams.Where(x => x.MaSp == ctsp.MaSp).Select(x => x.TenSp).FirstOrDefault();
            return ten;
        }
        public string GetMauSacSp(string macts)
        {
            var cts = db.CtspSizes.Where(x => x.MaCtspSize == macts).FirstOrDefault();
            var ctsp = db.Ctsps.Where(x => x.MaCtsp == cts.MaCtsp).FirstOrDefault();
            var mausac = db.MauSacs.Where(x => x.MaMs == ctsp.MaMs).Select(x => x.TenMs).FirstOrDefault();
            return mausac;
        }
        public string GetSizeSp(string macts)
        {
            var cts = db.CtspSizes.Where(x => x.MaCtspSize == macts).FirstOrDefault();
            var size = db.Sizes.Where(x => x.MaSize == cts.MaSize).Select(x => x.TenSize).FirstOrDefault();
            return size;
        }

    }
}
