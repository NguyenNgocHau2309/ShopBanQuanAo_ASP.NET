using ShopOnline.Models;
using Microsoft.AspNetCore.Mvc;
using ShopOnline.Respository;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
namespace ShopOnline.ViewComponents
{
    public class DanhmucMenuViewComponent: ViewComponent
    {
        private readonly DanhMucRespository _Danhmuc;
        public DanhmucMenuViewComponent(DanhMucRespository danhmuc)
        {
            _Danhmuc = danhmuc;
        }
        public IViewComponentResult Invoke()
        {
            var danhmuc = _Danhmuc.GetAllDanhmuc().OrderBy(x => x.TenDm);
            return View(danhmuc);
        }
    }
}
