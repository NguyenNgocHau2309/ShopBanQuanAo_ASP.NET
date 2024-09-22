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
    }
}
