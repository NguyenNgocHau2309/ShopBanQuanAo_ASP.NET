using ShopOnline.ViewModels;
using System;
using System.Collections.Generic;

namespace ShopOnline.Models;

public partial class Ctsp
{
    public string MaCtsp { get; set; } = null!;

    public string MaSp { get; set; } = null!;

    public string? MaMs { get; set; }

    public string HinhAnh { get; set; } = null!;

    public virtual ICollection<CtspSize> CtspSizes { get; set; } = new List<CtspSize>();

    public virtual MauSac? MaMsNavigation { get; set; }

    public virtual SanPham MaSpNavigation { get; set; } = null!;

    public static implicit operator Ctsp(ChiTietSanPhamAnhMSViewModel v)
    {
        if (v == null)
            return null;

        return new Ctsp
        {
            MaCtsp = v.MaCtsp,
            HinhAnh = v.Hinhanh
        };
    }
}
