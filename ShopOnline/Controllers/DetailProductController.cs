using Microsoft.AspNetCore.Mvc;
using ShopOnline.Models;
using ShopOnline.ViewModels;
using System;
using System.Drawing;

namespace ShopOnline.Controllers
{
    public class DetailProductController : Controller
    {
        private readonly ILogger<DetailProductController> _logger;
        QuanLyShopOnlineContext db = new QuanLyShopOnlineContext();
        private readonly IHttpContextAccessor _httpContextAccessor;

        public DetailProductController(ILogger<DetailProductController> logger, IHttpContextAccessor httpContextAccessor)
        {
            _logger = logger;
            _httpContextAccessor = httpContextAccessor;
        }

        [HttpGet("api/getPrice")]
        public IActionResult GetPrice(string masp, string mams, string masize)
        {
            // Giả sử bạn có context của EF
            var price = db.CtspSizes
                .Join(db.Ctsps, ctspSize => ctspSize.MaCtsp, ctsp => ctsp.MaCtsp, (ctspSize, ctsp) => new { ctspSize, ctsp })
                .Where(joined => joined.ctsp.MaSp == masp && joined.ctsp.MaMs == mams && joined.ctspSize.MaSize == masize)
                .Select(joined => joined.ctspSize.Gia)
                .FirstOrDefault();

            if (price != null)
            {
                return Json(new { gia = price });
            }
            return NotFound();
        }
        public IActionResult ChiTietSP(string masp, string activeTab)
        {
            ViewData["ActiveTab"] = activeTab ?? "tab-pane-1";
            if (string.IsNullOrEmpty(masp))
            {
                return RedirectToAction("Index");
            }

            // Lấy danh sách sản phẩm
            var sanPhamList = db.SanPhams.ToList();
            var sanPhamChiTiet = sanPhamList.FirstOrDefault(x => x.MaSp == masp);
            if (sanPhamChiTiet == null)
            {
                return NotFound(); // Nếu không tìm thấy sản phẩm
            }
            
            var chiTietSize = (from ctspSize in db.CtspSizes
                               join size in db.Sizes on ctspSize.MaSize equals size.MaSize
                               join ctsp in db.Ctsps on ctspSize.MaCtsp equals ctsp.MaCtsp
                               where ctsp.MaSp == masp
                               select new ChiTietSanPhamSizeViewModel
                               {
                                   MactspSize = ctspSize.MaCtspSize,
                                   MaSize = ctspSize.MaSize,
                                   SizeName = size.TenSize,
                                   Gia = (decimal)ctspSize.Gia,
                                   SoLuongTon = ctspSize.SoLuongTon
                               }).Distinct().ToList();

            // Lấy danh sách ảnh sản phẩm
            var chiTietAnhMS = (from ctsp in db.Ctsps
                                join mausac in db.MauSacs on ctsp.MaMs equals mausac.MaMs
                                where ctsp.MaSp == masp
                                select new ChiTietSanPhamAnhMSViewModel
                                {
                                    MaCtsp = ctsp.MaCtsp,
                                    MaMS = ctsp.MaMs,
                                    Mausac = mausac.TenMs,
                                    Hinhanh = ctsp.HinhAnh,
                                }).ToList();


            // Tạo ViewModel cho chi tiết sản phẩm
            var homeDetailViewModel = new DetailViewModel
            {
                SanPham = sanPhamChiTiet,
                ChiTietSanPham = chiTietAnhMS,
                ChiTietSanPhamSize = chiTietSize,
                GiaThapNhat = chiTietSize.Min(s => s.Gia),
                GiaCaoNhat = chiTietSize.Max(s => s.Gia)
            };

            var listDanhGia = new List<DetailProductDGViewModel>();
            var danhgia = db.DanhGia.ToList();
            foreach (var item in danhgia)
            {
                if (GetMaSP(item.MaCtspSize) == masp) // Kiểm tra nếu đánh giá thuộc về sản phẩm hiện tại
                {
                    string makh = db.DonHangs.FirstOrDefault(x => x.MaDh == item.MaDh).MaKh; // Lấy mã khách hàng từ đơn hàng
                    string tenkh = db.KhachHangs.FirstOrDefault(x => x.MaKh == makh).Username; // Lấy tên khách hàng

                    // Lấy danh sách hình ảnh liên quan đến đánh giá
                    var hinhanh = db.HinhAnhDanhGia
                                    .Where(h => h.MaDg == item.MaDg)
                                    .Select(h => h.DuongDan)
                                    .ToList();

                    // Lấy danh sách video liên quan đến đánh giá
                    var videodg = db.VideoDanhGia
                                    .Where(h => h.MaDg == item.MaDg)
                                    .Select(h => h.DuongDan)
                                    .ToList();

                    // Tạo mới đối tượng đánh giá để hiển thị
                    var newdanhgia = new DetailProductDGViewModel
                    {
                        madg = item.MaDg,
                        tenkh = tenkh,
                        noidung = item.NoiDung,
                        diem = item.DiemSao,
                        ngaydg = item.NgayDg,
                        hinhanh = hinhanh,
                        video = videodg
                    };

                    // Thêm vào danh sách
                    listDanhGia.Add(newdanhgia);
                }
            }

            var DetailEvaluateProductViewModel = new DetailEvaluateProductViewModel
            {
                DetailViewModel = homeDetailViewModel,
                DanhGia = listDanhGia 
            };
            return View(DetailEvaluateProductViewModel);
        }
        private string GetMaSP(string macts)
        {
            string mact = db.CtspSizes.FirstOrDefault(x => x.MaCtspSize == macts).MaCtsp;
            return db.Ctsps.FirstOrDefault(x => x.MaCtsp == mact).MaSp;
        }
    }
}
