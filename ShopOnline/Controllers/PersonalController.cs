using Microsoft.AspNetCore.Mvc;
using ShopOnline.Models;
using ShopOnline.ViewModels;

namespace ShopOnline.Controllers
{
    public class PersonalController : Controller
    {
        QuanLyShopOnlineContext db = new QuanLyShopOnlineContext();
        [HttpGet]
        public IActionResult ThongTinCaNhan(string activeTab)
        {
            ViewData["ActiveTab"] = activeTab ?? "personal-info";
            var username = HttpContext.Session.GetString("Username");

            var khachHang = db.KhachHangs.FirstOrDefault(c => c.Username == username);
            if (khachHang == null)
            {
                return NotFound("Không tìm thấy thông tin khách hàng.");
            }
            var donHangs = db.DonHangs.Where(d => d.MaKh == khachHang.MaKh).ToList();
            var maDonHangList = donHangs.Select(dh => dh.MaDh).ToList();
            var danhGias = db.DanhGia.Where(dg => maDonHangList.Contains(dg.MaDh)).ToList();
            var listdanhgia = new List<DanhGiaCaNhanViewModel>();
            foreach (var item in danhGias)
            {
                string ctsp = db.CtspSizes.FirstOrDefault(x => x.MaCtspSize == item.MaCtspSize).MaCtsp;
                string sp = db.Ctsps.FirstOrDefault(x => x.MaCtsp == ctsp).MaSp;
                string ha = db.SanPhams.FirstOrDefault(x => x.MaSp == sp).HinhAnhDd;
                string tensp = db.SanPhams.FirstOrDefault(x => x.MaSp == sp).TenSp;


                var HaDG = db.HinhAnhDanhGia.Where(x => x.MaDg == item.MaDg).Select(x => x.DuongDan).ToList();
                var VdDG = db.VideoDanhGia.Where(x => x.MaDg == item.MaDg).Select(x => x.DuongDan).ToList();

                string mact = db.CtspSizes.FirstOrDefault(x => x.MaCtspSize == item.MaCtspSize).MaCtsp;
                string masp = db.Ctsps.FirstOrDefault(x => x.MaCtsp == mact).MaSp;

                var evaluate = new DanhGiaCaNhanViewModel
                {
                    madg = item.MaDg,
                    masp = masp,
                    ngaydg = item.NgayDg,
                    TenSp = tensp,
                    HaSP = ha,
                    noidung = item.NoiDung,
                    diem = item.DiemSao,
                    ha = HaDG,
                    vd = VdDG
                };
                listdanhgia.Add(evaluate);
            }
            var viewModel = new InformationViewModel
            {
                KhachHang = khachHang,
                donHangs = donHangs,
                danhgias = listdanhgia// Chỉ cần hiển thị tất cả đánh giá
            };
            return View(viewModel);
        }
        [HttpPost]
        public IActionResult ThongTinCaNhan(KhachHang model)
        {
            var username = HttpContext.Session.GetString("Username");
            var khachHang = db.KhachHangs.FirstOrDefault(k => k.Username == username);

            if (khachHang == null)
            {
                return NotFound("Không tìm thấy khách hàng.");
            }

            if (ModelState.IsValid)
            {
                // Cập nhật thông tin khách hàng
                khachHang.HovaTen = model.HovaTen;
                khachHang.GioiTinh = model.GioiTinh;
                khachHang.NgaySinh = model.NgaySinh;
                khachHang.Sdt = model.Sdt;
                khachHang.Email = model.Email;
                khachHang.DiaChi = model.DiaChi;

                // Lưu thay đổi vào cơ sở dữ liệu
                db.SaveChanges();

                TempData["Message"] = "Cập nhật thông tin khách hàng thành công.";
                return RedirectToAction("ThongTinCaNhan"); // Chuyển hướng về trang thông tin cá nhân
            }

            // Nếu không hợp lệ, thông báo lỗi và chuyển hướng về trang thông tin cá nhân
            TempData["Message"] = "Có lỗi xảy ra khi cập nhật thông tin. Vui lòng kiểm tra lại.";
            return RedirectToAction("ThongTinCaNhan"); // Chuyển hướng về trang thông tin cá nhân
        }
    }
}
