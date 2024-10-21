using Microsoft.AspNetCore.Mvc;

namespace ShopOnline.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin")]
    [Route("admin/homeadmin")]
    public class OrderController : Controller
    {
        [HttpGet("hoadon")]
        public IActionResult HoaDon()
        {
            return View();
        }
        [HttpGet("danhgia")]
        public IActionResult DanhGia()
        {
            return View();
        }
    }
}
