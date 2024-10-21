namespace ShopOnline.ViewModels
{
    public class DetailProductDGViewModel
    {
        public string madg { get; set; }
        public string tenkh { get; set; }
        public string noidung { get; set; }
        public int diem { get; set; }
        public DateOnly ngaydg { get; set; }
        public List<string> hinhanh { get; set; }
        public List<string> video { get; set; }
    }
}
