namespace ShopOnline.Models
{
    public class GioHang
    {
        public string MaKH { get; set; }
        public string MaSP { get; set; }
        public string MaMS { get; set; }
        public string MaS { get; set; }
        public int SoLuong { get; set; }
        public decimal Gia { get; set; }

        // Khóa ngoại
        public virtual KhachHang MaKhNavigation { get; set; } // Điều hướng tới KhachHang
        public virtual SanPham MaSpNavigation { get; set; } // Điều hướng tới SanPham
        public virtual Ctsp MaCtspNavigation { get; set; } // Điều hướng tới Ctsp (chi tiết sản phẩm)
        public virtual CtspSize MaCtspSizeNavigation { get; set; } // Điều hướng tới Ctsp (chi tiết sản phẩm)
    }
}
