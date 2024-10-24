namespace ShopOnline.Areas.Admin.ViewModels
{
    public class CTDHViewModel
    {
        public List<CTSPViewModel> CTSPs { get; set; }
        public string TrangThai { get; set; }
        public string madh { get; set; }
    }
    public class CTSPViewModel
    {
        public string Ha { get; set; }
        public string TenSP { get; set; }
        public string MauSac { get; set; }
        public string Size { get; set; }
        public decimal SoLuong { get; set; }
        public decimal Gia { get; set; }
        public decimal Tong { get; set; }
    }
}
