namespace ShopOnline.Models
{
    public class GioHang
    {
        public string MaGH { get; set; }
        public string MaKH { get; set; }

        // Khóa ngoại
        public virtual ICollection<Ctgh> Ctgh { get; set; }
        public virtual KhachHang MaKhNavigation { get; set; } // Điều hướng tới KhachHang
    }
}
