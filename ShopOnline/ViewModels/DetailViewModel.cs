using ShopOnline.Models;

namespace ShopOnline.ViewModels
{
    public class DetailViewModel
    {
        public SanPham SanPham { get; set; }
        public List<ChiTietSanPhamAnhMSViewModel> ChiTietSanPham { get; set; }
        public List<ChiTietSanPhamSizeViewModel> ChiTietSanPhamSize { get; set; }

        public string SelectedColor { get; set; }
        public string SelectedSize { get; set; }
        public decimal? GiaThapNhat { get; set; }
        public decimal? GiaCaoNhat { get; set; }

    }
}
