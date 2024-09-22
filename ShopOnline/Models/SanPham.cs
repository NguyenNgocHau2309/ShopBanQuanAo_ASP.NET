using System;
using System.Collections.Generic;
using ShopOnline.ViewModels;

namespace ShopOnline.Models;

public partial class SanPham
{
    public string MaSp { get; set; } = null!;

    public string? MaDm { get; set; }

    public string? TenSp { get; set; }

    public string? MoTa { get; set; }

    public string HinhAnhDd { get; set; } = null!;

    public virtual ICollection<Ctsp> Ctsps { get; set; } = new List<Ctsp>();

    public virtual ICollection<KhuyenMai> KhuyenMais { get; set; } = new List<KhuyenMai>();

    public virtual DanhMuc? MaDmNavigation { get; set; }

    public static implicit operator SanPham(SanPhamViewModel v)
    {
        if (v == null)
            return null;

        return new SanPham
        {
            MaSp = v.MaSP,        
            TenSp = v.TenSP,
            HinhAnhDd = v.HinhAnhDD,
            MaDm = v.MaDM,
            MoTa = v.MoTa
        };
    }
}
