using System.Collections.Generic; // Đảm bảo thêm namespace này để sử dụng List
using System.Drawing;

namespace ShopOnline.Areas.Admin.ViewModels
{
    public class ChiTietSPViewModel
    {
        public string MaSP { get; set; }
        public List<CTMauSacViewModel> MauSacs { get; set; }
    }

    public class CTMauSacViewModel
    {
        public string MaCTSP { get; set; }
        public string TenMS { set; get; }
        public string HinhAnhDD { get; set; }
        public List<CTSizeViewModel> Sizes { get; set; }
    }

    public class CTSizeViewModel
    {
        public string MaCTSP_Size { get; set; }
        public string TenSize { set; get; }
        public decimal Gia { get; set; }
        public int SoLuongTon { get; set; }
    }
}
