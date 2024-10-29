using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShopOnline.Models;
using System.Drawing;
using System.Globalization;
using System.Text;
using X.PagedList;
using X.PagedList.Extensions;

namespace ShopOnline.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin")]
    [Route("admin/homeadmin")]
    public class ColorSizeController : Controller
    {
        QuanLyShopOnlineContext db = new QuanLyShopOnlineContext();
        [Route("MauSac")]
        public IActionResult MauSac(int? page, string search)
        {
            int pageSize = 15;
            int pageNumber = page == null || page < 1 ? 1 : page.Value;

            // Lấy tất cả màu sắc từ cơ sở dữ liệu
            var originalMauSacList = db.MauSacs
                .AsNoTracking()
                .OrderBy(ms => ms.MaMs)
                .ToList();

            // Nếu có từ khóa tìm kiếm
            if (!string.IsNullOrEmpty(search))
            {
                search = search.Trim();
                var processedSearch = RemoveDiacritics(search.ToLower());
                var searchKeywords = processedSearch.Split(' ', StringSplitOptions.RemoveEmptyEntries);

                var currentFilteredList = originalMauSacList;

                foreach (var keyword in searchKeywords)
                {
                    var filteredList = currentFilteredList
                        .Where(ms => RemoveDiacritics(ms.TenMs.ToLower()).Contains(keyword))
                        .ToList();

                    if (filteredList.Any())
                    {
                        currentFilteredList = filteredList;
                    }
                }

                // Gán danh sách đã lọc vào kết quả
                originalMauSacList = currentFilteredList;
            }

            // Phân trang kết quả
            var pagedList = originalMauSacList.ToPagedList(pageNumber, pageSize);

            // Trả về view với danh sách màu sắc đã tìm kiếm và phân trang
            return View(pagedList);
        }

        //Tìm kiếm theo tên
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

        [Route("AddMauSac")]
        [HttpGet]
        public IActionResult AddMauSac()
        {
            return View();
        }
        [Route("AddMauSac")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult AddMauSac(MauSac mauSac)
        {
            var exitsMS = db.MauSacs.FirstOrDefault(x => x.TenMs == mauSac.TenMs);
            if (exitsMS != null)
            {
                TempData["ErrorMessage"] = "Màu sắc này đã tồn tại";
                return View();
            }
            var newMS = new MauSac
            {
                MaMs = GenerateUniqueMSCode(),
                TenMs = mauSac.TenMs
            };
            db.MauSacs.Add(newMS);
            db.SaveChanges();
            TempData["Message"] = "Thêm thành công";
            return RedirectToAction("MauSac");
        }

        [Route("EditMauSac")]
        [HttpGet]
        public IActionResult EditMauSac(string mams)
        {
            var mausac = db.MauSacs.Find(mams);
            var MS = new MauSac
            {
                MaMs = mams,
                TenMs = mausac.TenMs
            };
            return View(MS);
        }
        [Route("EditMauSac")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult EditMauSac(MauSac mauSac)
        {
            var exitsMS = db.MauSacs.FirstOrDefault(x => x.TenMs == mauSac.TenMs);
            if (exitsMS != null)
            {
                TempData["ErrorMessage"] = "Màu sắc này đã tồn tại";
                return RedirectToAction("EditMauSac", new { mams = mauSac.MaMs });
            }
            var color = db.MauSacs.FirstOrDefault(x => x.MaMs == mauSac.MaMs);
            color.TenMs = mauSac.TenMs;
            db.SaveChanges();
            return RedirectToAction("MauSac");
        }
        [Route("DeleteMauSac")]
        [HttpGet]
        public IActionResult DeleteMauSac (string mams)
        {
            var color = db.MauSacs.FirstOrDefault(x =>x.MaMs == mams);
            bool check = true;
            var CTSP = db.Ctsps.ToList();
            foreach(var item in CTSP)
            {
                if (item.MaMs == mams)
                {
                    check = false; break;
                }
            }
            if (check)
            {
                TempData["Message"] = "Màu sắc này đã xóa thành công";
                db.MauSacs.Remove(color);
                db.SaveChanges();
                return RedirectToAction("MauSac");
            }
            else
            {
                TempData["ErrorMessage"] = "Không xóa được. Màu sắc này đã thuộc sản phẩm rồi!";
                return RedirectToAction("MauSac");
            }
        }


        //Xử lý size
        [Route("Size")]
        public IActionResult Size(int? page)
        {
            int pageSize = 15;
            int pageNumber = page == null || page < 1 ? 1 : page.Value;

            // Lấy dữ liệu từ database và sắp xếp trước khi phân trang
            var listSize = db.Sizes.OrderBy(dm => dm.MaSize).ToList();

            // Tạo PagedList dựa trên dữ liệu
            var pagedList = listSize.ToPagedList(pageNumber, pageSize);

            return View(pagedList);
        }
        [Route("AddSize")]
        [HttpGet]
        public IActionResult AddSize()
        {
            return View();
        }
        [Route("AddSize")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult AddSize(Models.Size size)
        {
            var exitsSize = db.Sizes.FirstOrDefault(x => x.TenSize == size.TenSize);
            if (exitsSize != null)
            {
                TempData["ErrorMessage"] = "Size này đã tồn tại";
                return View();
            }
            var newMS = new Models.Size
            {
                MaSize = GenerateUniqueSizeCode(),
                TenSize = size.TenSize
            };
            db.Sizes.Add(newMS);
            db.SaveChanges();
            TempData["Message"] = "Thêm Size thành công.";
            return RedirectToAction("Size");
        }


        [Route("EditSize")]
        [HttpGet]
        public IActionResult EditSize(string maSize)
        {
            var size = db.Sizes.Find(maSize);
            var Size = new Models.Size
            {
                MaSize = maSize,
                TenSize = size.TenSize
            };
            return View(Size);
        }
        [Route("EditSize")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult EditSize(Models.Size size)
        {
            var exitsSize = db.Sizes.FirstOrDefault(x => x.TenSize == size.TenSize);
            if (exitsSize != null)
            {
                TempData["ErrorMessage"] = "Size này đã tồn tại";
                return RedirectToAction("EditSize", new { maSize = size.MaSize });
            }
            var  kichThuoc = db.Sizes.FirstOrDefault(x => x.MaSize == size.MaSize);
            kichThuoc.TenSize = size.TenSize;
            db.SaveChanges();
            return RedirectToAction("Size");
        }
        [Route("DeleteSize")]
        [HttpGet]
        public IActionResult DeleteSize(string maSize)
        {
            var size = db.Sizes.FirstOrDefault(x => x.MaSize == maSize);

            if (size == null)
            {
                TempData["ErrorMessage"] = "Size không tồn tại!";
                return RedirectToAction("Size");
            }

            bool check = true;
            var CTSP_Size = db.CtspSizes.ToList();
            foreach (var item in CTSP_Size)
            {
                if (item.MaSize == maSize)
                {
                    check = false;
                    break;
                }
            }

            if (check)
            {
                TempData["Message"] = "Size này đã xóa thành công";
                db.Sizes.Remove(size);  // Safe to remove now
                db.SaveChanges();
                return RedirectToAction("Size");
            }
            else
            {
                TempData["ErrorMessage"] = "Không xóa được. Size đã này thuộc sản phẩm rồi!";
                return RedirectToAction("Size");
            }
        }


        //Xử lý mã màu sắc
        [Route("GetMaxMSCode")]
        [HttpGet]
        public string GetMaxMSCode()
        {
            var maxMSCode = db.MauSacs
                .AsNoTracking() 
                .Select(c => c.MaMs)
                .Max(); 

            return maxMSCode;
        }

        private string GenerateUniqueMSCode()
        {
            var maxMSCode = GetMaxMSCode();

            if (maxMSCode == null)
            {
                // Nếu không có mã nào, bắt đầu từ DH001
                return "MS01";
            }

            // Lấy phần số từ mã đơn hàng lớn nhất
            string numericPart = maxMSCode.Substring(2);
            int newNumber = int.Parse(numericPart) + 1;

            return "CTSPS" + newNumber.ToString().PadLeft(2, '0');
        }
        //Xử lý mã size
        [Route("GetMaxSizeCode")]
        [HttpGet]
        public string GetMaxSizeCode()
        {
            var maxSizeCode = db.Sizes
                .AsNoTracking()
                .Select(c => c.MaSize)
                .Max();

            return maxSizeCode;
        }

        private string GenerateUniqueSizeCode()
        {
            var maxSizeCode = GetMaxSizeCode();

            if (maxSizeCode == null)
            {
                // Nếu không có mã nào, bắt đầu từ DH001
                return "S01";
            }

            // Lấy phần số từ mã đơn hàng lớn nhất
            string numericPart = maxSizeCode.Substring(1);
            int newNumber = int.Parse(numericPart) + 1;

            return "S" + newNumber.ToString().PadLeft(2, '0');
        }
    }
}
