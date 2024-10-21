namespace ShopOnline.Models
{
    public class Ctgh
    {
        public string MaGH { get; set; } // Foreign key referencing GioHang
        public string MaCTSP_Size { get; set; } // Foreign key referencing CTSP_Size
        public int SoLuong { get; set; }

        // Navigation properties
        public virtual GioHang GioHang { get; set; } // Changed from MaghNavigation to GioHang
        public virtual CtspSize MaCtspSizeNavigation { get; set; } // Navigation to CTSP_Size
    }
}
