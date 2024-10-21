using ShopOnline.Models;

namespace ShopOnline.ViewModels
{
    public class DetailEvaluateProductViewModel
    {
        public DetailViewModel DetailViewModel { get; set; }
        public List<DetailProductDGViewModel> DanhGia {  get; set; }
    }
}
