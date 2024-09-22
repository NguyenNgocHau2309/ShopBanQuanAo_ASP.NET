using System;
using System.Collections.Generic;
using ShopOnline.Models;
namespace ShopOnline.ViewModels
{
    public class SanPhamViewModel
    {
        public string MaSP { get; set; }
        public string TenSP { get; set; }
        public string HinhAnhDD { get; set; }
        public string MaDM { get; set; }
        public string MoTa { get; set; }
        public decimal GiaCaoNhat { get; set; }
        public decimal GiaThapNhat { get; set; }

    }
}
