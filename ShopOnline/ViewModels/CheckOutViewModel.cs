namespace ShopOnline.ViewModels
{
    public class ProductCheckoutViewModel
    {
        public string TenSp { get; set; }  // Tên sản phẩm
        public decimal GiaGoc { get; set; } // Giá gốc
        public decimal GiaGiam { get; set; } // Giá sau khi giảm
    }
    public class CheckOutViewModel
    {
        public decimal TongTien { get; set; }
        public decimal GiamGia { get; set; }
        public decimal TienShip { get; set; }
        public List<string>? QuaTang { get; set; }
        public decimal TienThu { get; set; }
        public List<ProductCheckoutViewModel> SanPham { get; set; }

    }
}
