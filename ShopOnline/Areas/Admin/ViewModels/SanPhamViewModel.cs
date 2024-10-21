using ShopOnline.Models;

namespace ShopOnline.Areas.Admin.ViewModels
{
    public class SanPhamViewModel
    {
        public string TenSP { get; set; }
        public IFormFile HinhanhDD { get; set; }
        public string MoTa {  get; set; }
        public string Madm {  get; set; }
        public List<ChiTietSPTamViewModel> Ctsp { get; set; }

        public List<string> DanhMucs { get; set; } // Danh sách danh mục
        public List<string> Colors { get; set; } // Danh sách màu sắc
        public List<string> Kichthuocs { get; set; } // Danh sách kích thước
    }
    public class ChiTietSPTamViewModel
    {
        public string MauSac { get; set; }
        public string HinhAnh { get; set; }
        public string Size { get; set; }
        public decimal Gia { get; set; }
        public int SoLuongTon { get; set; }
    }
}
