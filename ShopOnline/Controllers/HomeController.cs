using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShopOnline.Models;
using ShopOnline.Models.Authentication;
using ShopOnline.ViewModels;
using System;
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
        private readonly IHttpContextAccessor _httpContextAccessor;

        public HomeController(ILogger<HomeController> logger, IHttpContextAccessor httpContextAccessor)
        {
            _logger = logger;
            _httpContextAccessor = httpContextAccessor;
        }

        //[Authentication]
        public IActionResult Index(int ? page)
        {
            var username = _httpContextAccessor.HttpContext.Session.GetString("Username");

            int pageSize = 12;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;


            var ListSanPham = db.SanPhams.ToList();

            var pagedList = ListSanPham.ToPagedList( pageNumber, pageSize);

            return View(pagedList);
        }

        public IActionResult SanPhamTheoDanhMuc(string madm, int? page)
        {
            if (string.IsNullOrEmpty(madm))
            {
                return RedirectToAction("Index");
            }

            var danhMucs = db.DanhMucs.ToList();

            int pageSize = 12; // Số sản phẩm trên mỗi trang
            int pageNumber = page ?? 1; 

            var ListSanPham = db.SanPhams.Where(x => x.MaDm == madm).OrderBy(x => x.TenSp).ToList();

            // Tạo phân trang
            var pagedList = ListSanPham.ToPagedList(pageNumber, pageSize);

            ViewBag.ListSanPham = pagedList; 
            ViewBag.MadM = madm;

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
