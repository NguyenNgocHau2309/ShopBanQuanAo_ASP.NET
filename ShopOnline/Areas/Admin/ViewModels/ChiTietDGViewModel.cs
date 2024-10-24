namespace ShopOnline.Areas.Admin.ViewModels
{
    public class ChiTietDGViewModel
    {
        public string madg { get; set; }
        public string tenkh { get; set; }
        public DateOnly ngaydg { get; set; }
        public string masp { get; set; }
        public string TenSp { get; set; }
        public string HaSP { get; set; }
        public string noidung { get; set; }
        public int diem { get; set; }
        public List<string> ha { get; set; }
        public List<string> vd { get; set; }
    }
}
