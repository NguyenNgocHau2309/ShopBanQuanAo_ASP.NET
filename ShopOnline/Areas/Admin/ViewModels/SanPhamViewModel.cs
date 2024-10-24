using ShopOnline.Models;

namespace ShopOnline.Areas.Admin.ViewModels
{
    public class SanPhamViewModel
    {
        public string TenSP { get; set; }
        public IFormFile HinhanhDD { get; set; }
        public string MoTa {  get; set; }
        public string Tendm {  get; set; }

        public List<string> listTenDM { get; set; }
    }
}
