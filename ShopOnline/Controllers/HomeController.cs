using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShopOnline.Models;
using ShopOnline.ViewModels;
using System.Diagnostics;
using System.Drawing.Printing;
using X.PagedList;
using X.PagedList.Extensions;

namespace ShopOnline.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        QuanLyShopOnlineContext db = new QuanLyShopOnlineContext();

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        private async Task<List<SanPhamViewModel>> GetSanPhams()
        {
            return await (from sp in db.SanPhams
                          join ctsp in db.Ctsps on sp.MaSp equals ctsp.MaSp
                          join ctspSize in db.CtspSizes on ctsp.MaCtsp equals ctspSize.MaCtsp
                          group ctspSize by new { sp.MaSp, sp.TenSp, sp.HinhAnhDd, sp.MoTa } into spGroup
                          select new SanPhamViewModel
                          {
                              MaSP = spGroup.Key.MaSp,
                              TenSP = spGroup.Key.TenSp,
                              HinhAnhDD = spGroup.Key.HinhAnhDd,
                              MoTa = spGroup.Key.MoTa,
                              GiaCaoNhat = spGroup.Max(ctspSize => (decimal?)ctspSize.Gia) ?? 0, // Chuyển đổi về decimal và xử lý giá trị null
                              GiaThapNhat = spGroup.Min(ctspSize => (decimal?)ctspSize.Gia) ?? 0 
                          })
                          .AsNoTracking()
                          .OrderBy(x => x.TenSP)
                          .ToListAsync();
        }

        public async Task<IActionResult> IndexAsync(int ? page)
        {
            int pageSize = 12;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var ListSanPham = await GetSanPhams();
            var pagedList = new PagedList<SanPhamViewModel>(ListSanPham, pageNumber, pageSize);

            return View(pagedList);
        }

        public async Task<IActionResult> SanPhamTheoDanhMuc(string madm, int? page)
        {
            if (string.IsNullOrEmpty(madm))
            {
                return RedirectToAction("Index");
            }

            // Lấy danh sách danh mục
            var danhMucs = await db.DanhMucs.ToListAsync();

            int pageSize = 12; // Số sản phẩm trên mỗi trang
            int pageNumber = page ?? 1; // Số trang hiện tại

            var ListSanPham = await (from sp in db.SanPhams
                                     join ctsp in db.Ctsps on sp.MaSp equals ctsp.MaSp
                                     join ctspSize in db.CtspSizes on ctsp.MaCtsp equals ctspSize.MaCtsp
                                     where sp.MaDm == madm // Chỉ lấy sản phẩm thuộc danh mục
                                     group ctspSize by new { sp.MaSp, sp.TenSp, sp.HinhAnhDd, sp.MaDm } into spGroup
                                     select new SanPhamViewModel
                                     {
                                         MaSP = spGroup.Key.MaSp,
                                         TenSP = spGroup.Key.TenSp,
                                         HinhAnhDD = spGroup.Key.HinhAnhDd,
                                         MaDM = spGroup.Key.MaDm,
                                         GiaCaoNhat = (decimal)spGroup.Max(ctspSize => ctspSize.Gia ?? 0),
                                         GiaThapNhat = (decimal)spGroup.Min(ctspSize => ctspSize.Gia ?? 0)
                                     })
                                      .OrderBy(x => x.TenSP)
                                      .ToListAsync();

            // Tạo phân trang
            var pagedList = ListSanPham.ToPagedList(pageNumber, pageSize);

            ViewBag.ListSanPham = pagedList; // Truyền danh sách sản phẩm đã phân trang qua ViewBag
            ViewBag.MadM = madm; // Truyền mã danh mục qua ViewBag

            return View(pagedList); // Trả về danh sách sản phẩm đã phân trang
        }
        public async Task<IActionResult> ChiTietSanPham(string masp)
        {
            if (string.IsNullOrEmpty(masp))
            {
                return RedirectToAction("Index");
            }

            // Lấy danh sách sản phẩm
            var sanPhamList = await GetSanPhams();
            var sanPhamChiTiet = sanPhamList.FirstOrDefault(x => x.MaSP == masp);
            if (sanPhamChiTiet == null)
            {
                return NotFound(); // Nếu không tìm thấy sản phẩm
            }
            //var sanPhamChiTiet = (from sp in db.SanPhams
            //                         join ctsp in db.Ctsps on sp.MaSp equals ctsp.MaSp
            //                         join ctspSize in db.CtspSizes on ctsp.MaCtsp equals ctspSize.MaCtsp
            //                         where sp.MaSp == masp 
            //                         group ctspSize by new { sp.MaSp, sp.TenSp, sp.HinhAnhDd, sp.MaDm, sp.MoTa } into spGroup
            //                         select new SanPhamViewModel
            //                         {
            //                             MaSP = spGroup.Key.MaSp,
            //                             TenSP = spGroup.Key.TenSp,
            //                             MoTa = spGroup.Key.MoTa,
            //                             HinhAnhDD = spGroup.Key.HinhAnhDd,
            //                             GiaCaoNhat = (decimal)spGroup.Max(ctspSize => ctspSize.Gia ?? 0),
            //                             GiaThapNhat = (decimal)spGroup.Min(ctspSize => ctspSize.Gia ?? 0)
            //                         }).ToList();
            //Lấy danh sách size sản phẩm
            var chiTietSize = (from ctspSize in db.CtspSizes
                               join size in db.Sizes on ctspSize.MaSize equals size.MaSize
                               join ctsp in db.Ctsps on ctspSize.MaCtsp equals ctsp.MaCtsp
                               where ctsp.MaSp == masp
                               select new ChiTietSanPhamSizeViewModel
                               {
                                   MaCtspSize = ctspSize.MaSize,
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
            var homeDetailViewModel = new HomeDetailViewModel
            {
                SanPham = sanPhamChiTiet,
                ChiTietSanPham = chiTietAnhMS,
                ChiTietSanPhamSize = chiTietSize,
                GiaThapNhat = chiTietSize.Min(s => s.Gia),
                GiaCaoNhat = chiTietSize.Max(s => s.Gia)
            };

            return View(homeDetailViewModel);
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
