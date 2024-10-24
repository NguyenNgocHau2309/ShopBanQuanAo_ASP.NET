using ShopOnline.ViewModels;
using System;
using System.Collections.Generic;

namespace ShopOnline.Models;

public partial class CtspSize
{
    public string MaCtspSize { get; set; }

    public string? MaCtsp { get; set; }

    public string MaSize { get; set; } 

    public decimal Gia { get; set; }

    public int SoLuongTon { get; set; }

    public virtual ICollection<DanhGia> DanhGia { get; set; } = new List<DanhGia>();

    public virtual ICollection<DoiTra> DoiTras { get; set; } = new List<DoiTra>();

    public virtual Ctsp? MaCtspNavigation { get; set; }

    public virtual Size MaSizeNavigation { get; set; } 

    public static implicit operator CtspSize(ChiTietSanPhamSizeViewModel v)
    {
        if (v == null)
            return null;

        return new CtspSize
        {
            MaCtspSize = v.MactspSize,
            MaSize = v.MaSize,
            Gia = v.Gia,    
            SoLuongTon = v.SoLuongTon
        };
    }
}
