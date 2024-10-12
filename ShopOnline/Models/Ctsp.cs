using ShopOnline.ViewModels;
using System;
using System.Collections.Generic;

namespace ShopOnline.Models;

public partial class Ctsp
{
    public string MaCtsp { get; set; }

    public string MaSp { get; set; } 

    public string? MaMs { get; set; }

    public string HinhAnh { get; set; }

    public virtual ICollection<CtspSize> CtspSizes { get; set; } = new List<CtspSize>();

    public virtual MauSac? MaMsNavigation { get; set; }

    public virtual SanPham MaSpNavigation { get; set; } 

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
