using Microsoft.AspNetCore.Mvc;
using ShopOnline.Models;
using ShopOnline.ViewModels;
using X.PagedList;
using X.PagedList.Extensions;

namespace ShopOnline.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin")]
    [Route("admin/homeadmin")]
    public class HomeAdminController : Controller
    {
        QuanLyShopOnlineContext db = new QuanLyShopOnlineContext();
        [Route("")]
        [Route("index")]
        public IActionResult Index()
        {
            return View();
        }
        [Route("danhmucsanpham")]
        public IActionResult DanhMucSanPham(int? page)
        {
            int pageSize = 15;
            int pageNumber = page == null || page < 1 ? 1 : page.Value;

            // Lấy dữ liệu từ database và sắp xếp trước khi phân trang
            var listDanhMuc = db.DanhMucs.OrderBy(dm => dm.TenDm).AsQueryable();

            // Tạo PagedList dựa trên dữ liệu
            var pagedList = listDanhMuc.ToPagedList(pageNumber, pageSize);

            return View(pagedList);
        }
        [Route("AddDanhMuc")]
        [HttpGet]
        public IActionResult AddDanhMuc()
        {
            return View();
        }
        [Route("AddDanhMuc")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult AddDanhMuc (DanhMuc DanhMuc)
        {
            // Kiểm tra mã danh mục (dm) có tồn tại trong cơ sở dữ liệu hay không
            var existingDanhMuc = db.DanhMucs.FirstOrDefault(dm => dm.MaDm == DanhMuc.MaDm);

            if (existingDanhMuc != null)
            {
                // Nếu tồn tại, thêm thông báo lỗi vào ModelState
                ModelState.AddModelError("MaDm", "Mã danh mục đã tồn tại.");
            }

            if (ModelState.IsValid)
            {
                db.Add(DanhMuc);
                db.SaveChanges();
                return RedirectToAction("DanhMucSanPham");
            }

            // Trả lại View với thông tin lỗi (nếu có)
            return View(DanhMuc);
        }

        [Route("EditDanhMuc")]
        [HttpGet]
        public IActionResult EditDanhMuc(string madm)
        {
            var danhmuc = db.DanhMucs.Find(madm);
            return View();
        }
        [Route("EditDanhMuc")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult EditDanhMuc(DanhMuc DanhMuc)
        {
            if (ModelState.IsValid)
            {
                db.Entry(DanhMuc).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("DanhMucSanPham", "HomeAdmin");
            }
            // Trả lại View với thông tin lỗi (nếu có)
            return View(DanhMuc);
        }
        [Route("DeleteDanhMuc")]
        [HttpGet]
        public IActionResult DeleteDanhMuc(String madm)
        {
           
            TempData["Message"] = "";
            // Lấy tất cả sản phẩm trong danh mục
            var sanPhams = db.SanPhams.Where(x => x.MaDm == madm).ToList();
            // Nếu không có sản phẩm trong danh mục, xóa danh mục ngay
            if (sanPhams.Count == 0)
            {
                var danhmuc = db.DanhMucs.FirstOrDefault(x => x.MaDm == madm);
                if (danhmuc != null)
                {
                    db.DanhMucs.Remove(danhmuc);
                    db.SaveChanges();

                    TempData["Message"] = "Danh mục đã được xóa vì không có sản phẩm nào.";
                }
                else
                {
                    TempData["Message"] = "Không tìm thấy danh mục cần xóa.";
                }
                return RedirectToAction("DanhMucSanPham", "HomeAdmin");
            }
            // Cờ để xác định có thể xóa hay không
            bool canDelete = true;

            // Kiểm tra xem có sản phẩm nào trong danh mục liên quan đến hóa đơn không
            foreach (var sanPham in sanPhams)
            {
                var ctsps = db.Ctsps.Where(x => x.MaSp == sanPham.MaSp).ToList();
                foreach (var ctsp in ctsps)
                {
                    var chitietspsize = db.CtspSizes.Where(x => x.MaCtsp == ctsp.MaCtsp).ToList();
                    foreach (var size in chitietspsize)
                    {
                        var chitiethoadon = db.Ctdhs.Where(x => x.MaCtspSize == size.MaCtspSize).ToList();

                        // Nếu tìm thấy hóa đơn, không thể xóa danh mục
                        if (chitiethoadon.Count > 0)
                        {
                            canDelete = false;
                            TempData["Message"] = "Không thể xóa danh mục này vì có sản phẩm liên quan đến hóa đơn.";
                            break;
                        }
                    }
                    // Nếu không thể xóa, thoát khỏi vòng lặp ngoài
                    if (!canDelete) break;
                }
                // Nếu không thể xóa, thoát khỏi vòng lặp ngoài
                if (!canDelete) break;
            }

            // Nếu có thể xóa (không có sản phẩm nào liên quan đến hóa đơn), tiến hành xóa
            if (canDelete)
            {
                foreach (var sanPham in sanPhams)
                {
                    var ctsps = db.Ctsps.Where(x => x.MaSp == sanPham.MaSp).ToList();
                    foreach (var ctsp in ctsps)
                    {
                        var chitietspsize = db.CtspSizes.Where(x => x.MaCtsp == ctsp.MaCtsp).ToList();
                        db.CtspSizes.RemoveRange(chitietspsize);
                    }
                    db.Ctsps.RemoveRange(ctsps);
                }
                db.SanPhams.RemoveRange(sanPhams);

                // Xóa danh mục
                var danhmucToDelete = db.DanhMucs.Find(madm);
                db.DanhMucs.Remove(danhmucToDelete);
                db.SaveChanges();

                TempData["Message"] = "Danh mục và các sản phẩm liên quan đã được xóa thành công.";
            }
            return RedirectToAction("DanhMucSanPham", "HomeAdmin");
        }
    }
}
