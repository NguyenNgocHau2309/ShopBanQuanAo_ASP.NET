using System;
using System.Collections.Generic;
using ShopOnline.ViewModels;

namespace ShopOnline.Models;

public partial class SanPham
{
    public string MaSp { get; set; } 

    public string MaDm { get; set; }

    public string? TenSp { get; set; }

    public string? MoTa { get; set; }

    public string HinhAnhDd { get; set; }
    public decimal MinGia { get; set; }
    public decimal MaxGia { get; set; }

    public virtual ICollection<Ctsp> Ctsps { get; set; } = new List<Ctsp>();

    public virtual ICollection<KhuyenMai> KhuyenMais { get; set; } = new List<KhuyenMai>();

    public virtual DanhMuc? MaDmNavigation { get; set; }
}
