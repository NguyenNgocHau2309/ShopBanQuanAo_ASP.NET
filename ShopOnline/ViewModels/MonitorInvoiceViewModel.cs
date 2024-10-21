namespace ShopOnline.ViewModels
{
    public class ProductInVoiceViewModel
    {
        public bool IsDanhGia { get; set; }
        public string MaCTSPS { get; set; }
        public string MaSP {  get; set; }   
        public string AnhSP { get; set; }
        public string TenSP { get; set; }
        public string Mausac { get; set; }
        public string Size { get; set; }
        public int Soluong { get; set; }
        public decimal Gia { get; set; }
        public decimal Tong { get; set; }
    }
    public class MonitorInvoiceViewModel
    {
        public string MaDH { get; set; }
        public string MaCode { get; set; }
        public string TrangThai { get; set; }
        public decimal TongGia { get; set; }
        public decimal GiamGia { get; set; }
        public decimal PhiVC { get; set; }
        public decimal TongCong { get; set; }
        public List<ProductInVoiceViewModel> SanPham { get; set; }
    }
}
