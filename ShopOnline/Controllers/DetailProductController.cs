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
        public IActionResult ChiTietSP(string masp)
        {
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

            return View(homeDetailViewModel);
        }

        
    }
}
