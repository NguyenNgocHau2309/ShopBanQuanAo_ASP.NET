using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShopOnline.Areas.Admin.ViewModels;
using ShopOnline.Models;
using ShopOnline.ViewModels;
using System.Reflection.Metadata;
using X.PagedList.Extensions;

namespace ShopOnline.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin")]
    [Route("admin/Order")]
    public class OrderController : Controller
    {
        QuanLyShopOnlineContext db = new QuanLyShopOnlineContext();
        [HttpGet("hoadon")]
        public IActionResult HoaDon(int? page)
        {
            int pageSize = 10;
            int pageNumber = page ?? 1;

            var hoaDons = db.DonHangs.OrderBy(dh => dh.MaDh);
            var pagedList = hoaDons.ToPagedList(pageNumber, pageSize);

            return View(pagedList);
        }
        [HttpGet("chitiethoadon")]
        public IActionResult ChiTietHoaDon(string madh)
        {
           var cthd = db.Ctdhs.Where(x => x.MaDh == madh).ToList();
            string trangthai = db.DonHangs.FirstOrDefault(x => x.MaDh == madh).TrangThai; 
            List<CTSPViewModel> listSP = new List<CTSPViewModel>();
            foreach (var c in cthd) 
            {
                var ctspsize = db.CtspSizes.FirstOrDefault(x => x.MaCtspSize == c.MaCtspSize);
                var ctsp = db.Ctsps.FirstOrDefault(x => x.MaCtsp == ctspsize.MaCtsp);
                var sp = db.SanPhams.FirstOrDefault(x => x.MaSp == ctsp.MaSp);
                var CTSP = new CTSPViewModel
                {
                    Ha = sp.HinhAnhDd,
                    TenSP = sp.TenSp,
                    MauSac = db.MauSacs.FirstOrDefault(x => x.MaMs == ctsp.MaMs).TenMs,
                    Size = db.Sizes.FirstOrDefault(x => x.MaSize == ctspsize.MaSize).TenSize,
                    SoLuong = c.SoLuong,
                    Gia = c.GiaBan,
                    Tong = c.TongTien
                };
                listSP.Add(CTSP);
            }
            var CTDH = new CTDHViewModel
            {
                madh = madh,
                CTSPs = listSP,
                TrangThai = trangthai
            };

            return View(CTDH);
        }
        [HttpPost]
        public IActionResult CapNhapTrangThai(string madh, string trangThai)
        {
            // Kiểm tra xem mã đơn hàng có hợp lệ không
            if (string.IsNullOrEmpty(madh) || string.IsNullOrEmpty(trangThai))
            {
                TempData["ErrorMessage"] = "Mã đơn hàng hoặc trạng thái không hợp lệ.";
                return View(); // Trả về view hiện tại với thông báo lỗi
            }
            var donHang = db.DonHangs.FirstOrDefault(x => x.MaDh == madh);

            if (donHang != null)
            {
                donHang.TrangThai = trangThai;
                db.SaveChanges();

                return RedirectToAction("HoaDon"); 
            }

            TempData["ErrorMessage"] = "Đơn hàng không tồn tại.";
            return View(); 
        }


        [HttpGet("danhgia")]
        public IActionResult DanhGia(int? page)
        {
            int pageSize = 10;
            int pageNumber = page ?? 1;
            var dg = db.DanhGia.ToList();
            List<DanhGiaViewModel> ListDanhGia = new List<DanhGiaViewModel>();
            foreach( var d in dg)
            {
                var ctspsize = db.CtspSizes.FirstOrDefault(x => x.MaCtspSize == d.MaCtspSize);
                var ctsp = db.Ctsps.FirstOrDefault(x => x.MaCtsp == ctspsize.MaCtsp);
                var sp = db.SanPhams.FirstOrDefault(x => x.MaSp == ctsp.MaSp);
                var DanhGia = new DanhGiaViewModel
                {
                    MaDG = d.MaDg,
                    MaDH = d.MaDh,
                    NgayDG = d.NgayDg,
                    MaSP = sp.MaSp,
                    TenSP = sp.TenSp,
                    NoiDung = d.NoiDung,
                    Diem = d.DiemSao
                };
                ListDanhGia.Add(DanhGia);
            }
           
            var pagedList = ListDanhGia.ToPagedList(pageNumber, pageSize);

            return View(pagedList);
        }
        [HttpGet("chitietdanhgia")]
        public IActionResult ChiTietDanhGia(string MaDG)
        {
            var danhGias = db.DanhGia.FirstOrDefault(dg => dg.MaDg == MaDG);
            string ctsp = db.CtspSizes.FirstOrDefault(x => x.MaCtspSize == danhGias.MaCtspSize).MaCtsp;
            string sp = db.Ctsps.FirstOrDefault(x => x.MaCtsp == ctsp).MaSp;
            string ha = db.SanPhams.FirstOrDefault(x => x.MaSp == sp).HinhAnhDd;
            string tensp = db.SanPhams.FirstOrDefault(x => x.MaSp == sp).TenSp;


            var HaDG = db.HinhAnhDanhGia.Where(x => x.MaDg == danhGias.MaDg).Select(x => x.DuongDan).ToList();
            var VdDG = db.VideoDanhGia.Where(x => x.MaDg == danhGias.MaDg).Select(x => x.DuongDan).ToList();

            string mact = db.CtspSizes.FirstOrDefault(x => x.MaCtspSize == danhGias.MaCtspSize).MaCtsp;
            string masp = db.Ctsps.FirstOrDefault(x => x.MaCtsp == mact).MaSp;

            string makh = db.DonHangs.FirstOrDefault(x => x.MaDh == danhGias.MaDh).MaKh;
            string tenkh = db.KhachHangs.FirstOrDefault(x => x.MaKh == makh).HovaTen;

            var danhGia = new ChiTietDGViewModel
            {
                madg = danhGias.MaDg,
                tenkh = tenkh,
                masp = masp,
                ngaydg = danhGias.NgayDg,
                TenSp = tensp,
                HaSP = ha,
                noidung = danhGias.NoiDung,
                diem =danhGias.DiemSao,
                ha = HaDG,
                vd = VdDG
            };
            return View(danhGia);
        
        }

    }
}
