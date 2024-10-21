using Microsoft.AspNetCore.Mvc;
using ShopOnline.Models;
using X.PagedList.Extensions;

namespace ShopOnline.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin")]
    [Route("admin/homeadmin")]
    public class PromotionController : Controller
    {
        QuanLyShopOnlineContext db = new QuanLyShopOnlineContext();
        [HttpGet("khuyenmai")]
        public IActionResult KhuyenMai(int? page)
        {
            int pageSize = 10; 
            int pageNumber = page ?? 1;

            var khuyenMais = db.KhuyenMais.OrderBy(km => km.MaKm);
            var pagedList = khuyenMais.ToPagedList(pageNumber, pageSize);

            return View(pagedList);
        }


        [Route("AddKhuyenMai")]
        [HttpGet]
        public IActionResult AddKhuyenMai()
        {
            return View();
        }
        [Route("AddKhuyenMai")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult AddKhuyenMai(KhuyenMai khuyenmai)
        {
            // Kiểm tra xem cả hai mã có nhập hay không
            if (!string.IsNullOrWhiteSpace(khuyenmai.MaDm) && !string.IsNullOrWhiteSpace(khuyenmai.MaSp)
                && !khuyenmai.MaDm.Equals("null", StringComparison.OrdinalIgnoreCase)
                && !khuyenmai.MaSp.Equals("null", StringComparison.OrdinalIgnoreCase))
            {
                TempData["Message"] = "Chỉ được phép nhập mã khuyến mãi hoặc mã danh mục, không được phép nhập cả hai.";
                return RedirectToAction("AddKhuyenMai");
            }
            khuyenmai.MaKm = GenerateUniquePromotionCode();

            if (string.IsNullOrEmpty(khuyenmai.MaDm) || khuyenmai.MaDm.Equals("null", StringComparison.OrdinalIgnoreCase))
            {
                khuyenmai.MaDm = null; 
            }
            else
            {
                var exitsDM = db.DanhMucs.FirstOrDefault(x => x.MaDm == khuyenmai.MaDm);
                if (exitsDM == null)
                {
                    TempData["Message"] = "Mã danh mục không hợp lệ."; 
                    return View(khuyenmai); 
                }
            }

            if (string.IsNullOrEmpty(khuyenmai.MaSp) || khuyenmai.MaSp.Equals("null", StringComparison.OrdinalIgnoreCase))
            {
                khuyenmai.MaSp = null; 
            }
            else
            {
                // Kiểm tra xem sản phẩm có tồn tại không
                var exitsSP = db.SanPhams.FirstOrDefault(x => x.MaSp == khuyenmai.MaSp);
                if (exitsSP == null)
                {
                    TempData["Message"] = "Mã sản phẩm không hợp lệ."; 
                    return View(khuyenmai);
                }
            }
            db.Add(khuyenmai);
            db.SaveChanges();
            return RedirectToAction("KhuyenMai");
        }

        [Route("EditKhuyenMai")]
        [HttpGet]
        public IActionResult EditKhuyenMai(string makm)
        {
            var khuyenmai = db.KhuyenMais.Find(makm);
            return View(khuyenmai);
        }

        [Route("EditKhuyenMai")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult EditKhuyenMai(KhuyenMai khuyenmai)
        {
            // Giữ nguyên MaKm khi chỉnh sửa
            string makm = khuyenmai.MaKm;

            if (!string.IsNullOrWhiteSpace(khuyenmai.MaDm) && !string.IsNullOrWhiteSpace(khuyenmai.MaSp)
                && !khuyenmai.MaDm.Equals("null", StringComparison.OrdinalIgnoreCase)
                && !khuyenmai.MaSp.Equals("null", StringComparison.OrdinalIgnoreCase))
            {
                TempData["Message"] = "Chỉ được phép nhập mã khuyến mãi hoặc mã danh mục, không được phép nhập cả hai.";
                return RedirectToAction("EditKhuyenMai", new { makm = khuyenmai.MaKm });
            }

            if (string.IsNullOrEmpty(khuyenmai.MaDm) || khuyenmai.MaDm.Equals("null", StringComparison.OrdinalIgnoreCase))
            {
                khuyenmai.MaDm = null;
            }
            else
            {
                var exitsDM = db.DanhMucs.FirstOrDefault(x => x.MaDm == khuyenmai.MaDm);
                if (exitsDM == null)
                {
                    TempData["Message"] = "Mã danh mục không hợp lệ.";
                    return View(khuyenmai);
                }
            }

            if (string.IsNullOrEmpty(khuyenmai.MaSp) || khuyenmai.MaSp.Equals("null", StringComparison.OrdinalIgnoreCase))
            {
                khuyenmai.MaSp = null;
            }
            else
            {
                // Kiểm tra xem sản phẩm có tồn tại không
                var exitsSP = db.SanPhams.FirstOrDefault(x => x.MaSp == khuyenmai.MaSp);
                if (exitsSP == null)
                {
                    TempData["Message"] = "Mã sản phẩm không hợp lệ.";
                    return View(khuyenmai);
                }
            }

            if (ModelState.IsValid)
            {
                db.Entry(khuyenmai).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("KhuyenMai", "Promotion");
            }

            var errorMessages = string.Join("<br>", ModelState.Values
                .SelectMany(v => v.Errors)
                .Select(e => e.ErrorMessage));

            TempData["Message"] = $"Dữ liệu không hợp lệ: <br>{errorMessages}";
            return View(khuyenmai);
        }

        [Route("DeleteKhuyenMai")]
        [HttpGet]
        public IActionResult DeleteKhuyenMai(String makm)
        {

            TempData["Message"] = "";
            // Lấy tất cả sản phẩm trong danh mục
            var ctkms = db.Ctkms.Where(x => x.MaKm == makm).Select(x => new Ctkm
            {
                MaKm = x.MaKm,
                NgaySd = x.NgaySd,
                TienGiam = x.TienGiam,
                Khac = x.Khac ?? "null"
            }).ToList();
            // Nếu không có sản phẩm trong danh mục, xóa danh mục ngay
            if (ctkms.Count != 0)
            {
                TempData["Message"] = "Khuyến mãi không xóa được vì khuyến mãi đã được sử dụng trong hóa đơn.";
                return RedirectToAction("KhuyenMai", "Promotion");
            }
            else 
            {
                // Xóa danh mục
                var khuyenmaiToDelete = db.KhuyenMais.Find(makm);
                db.KhuyenMais.Remove(khuyenmaiToDelete);
                db.SaveChanges();

                TempData["Message"] = "Khuyến mãi đã được xóa thành công";
            }
            return RedirectToAction("KhuyenMai", "Promotion");
        }

        //Xử lý mã khuyến mãi
        public string MaxPromotionCode
        {
            get
            {
                // Lấy mã khách hàng lớn nhất, nếu không có sẽ trả về null
                var maxPromotionCode = db.KhuyenMais
                    .OrderByDescending(c => c.MaKm)
                    .Select(c => c.MaKm)
                    .FirstOrDefault();

                return maxPromotionCode;
            }
        }

        [Route("DetailKhuyenMai")]
        [HttpGet]
        public IActionResult DetailKhuyenMai(int? page,String makm)
        {
            int pageSize = 15;
            int pageNumber = page == null || page < 1 ? 1 : page.Value;

            TempData["Message"] = "";
            // Lấy tất cả sản phẩm trong danh mục
            var ctkms = db.Ctkms.Where(x => x.MaKm == makm).Select(x => new Ctkm
            {
                MaKm = x.MaKm,
                NgaySd = x.NgaySd,
                TienGiam = x.TienGiam,
                Khac = x.Khac ?? "null"
            }).ToList();
            // Nếu không có sản phẩm trong danh mục, xóa danh mục ngay
            if (ctkms.Count == 0)
            {
                TempData["Message"] = "Khuyến mãi chưa được sử dụng, chưa có chi tiết khuyến mãi.";
                return RedirectToAction("KhuyenMai", "Promotion");
            }
            else
            {
                ViewBag.Makm = makm;
                var pagedList = ctkms.ToPagedList(pageNumber, pageSize);
                return View(pagedList);
            }
        }

        //Xử lý mã khuyến mãi
        [Route("GetMaxPromotionCode")]
        public string GetMaxPromotionCode()
        {
            // Lấy mã khách hàng lớn nhất, nếu không có sẽ trả về null
            var maxPromotionCode = db.KhuyenMais
                .OrderByDescending(c => c.MaKm)
                .Select(c => c.MaKm)
                .FirstOrDefault();

            return maxPromotionCode;
        }

        private string GenerateUniquePromotionCode()
        {
            var maxPromotionCode = MaxPromotionCode;

            if (maxPromotionCode == null)
            {
                // Nếu không có mã nào, bắt đầu từ DH001
                return "KM001";
            }

            // Lấy phần số từ mã đơn hàng lớn nhất
            string numericPart = maxPromotionCode.Substring(2);
            int newNumber = int.Parse(numericPart) + 1;

            return "KM" + newNumber.ToString().PadLeft(3, '0');
        }
    }
}
