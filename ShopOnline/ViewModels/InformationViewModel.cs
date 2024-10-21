using ShopOnline.Models;

namespace ShopOnline.ViewModels
{
    public class InformationViewModel
    {
        public KhachHang KhachHang { get; set; }
        public List<DonHang> donHangs { get; set; }
        public List<DanhGiaCaNhanViewModel> danhgias { get; set; }
    }
}
