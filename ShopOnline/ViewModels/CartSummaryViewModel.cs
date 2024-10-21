namespace ShopOnline.ViewModels
{
    public class CartSummaryViewModel
    {
        public decimal TongTien { get; set; }
        public decimal GiamGia { get; set; }
        public decimal TienShip { get; set; }
        public List<string>? QuaTang { get; set; } 
    }
}
