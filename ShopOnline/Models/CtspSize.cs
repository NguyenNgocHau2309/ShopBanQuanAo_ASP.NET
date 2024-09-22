using ShopOnline.ViewModels;
using System;
using System.Collections.Generic;

namespace ShopOnline.Models;

public partial class CtspSize
{
    public string MaCtspSize { get; set; } = null!;

    public string? MaCtsp { get; set; }

    public string MaSize { get; set; } = null!;

    public decimal? Gia { get; set; }

    public int SoLuongTon { get; set; }

    public virtual ICollection<DanhGium> DanhGia { get; set; } = new List<DanhGium>();

    public virtual ICollection<DoiTra> DoiTras { get; set; } = new List<DoiTra>();

    public virtual Ctsp? MaCtspNavigation { get; set; }

    public virtual Size MaSizeNavigation { get; set; } = null!;

    public static implicit operator CtspSize(ChiTietSanPhamSizeViewModel v)
    {
        if (v == null)
            return null;

        return new CtspSize
        {
            MaCtspSize = v.MaCtspSize,
            Gia = v.Gia,    
            SoLuongTon = v.SoLuongTon
        };
    }
}
