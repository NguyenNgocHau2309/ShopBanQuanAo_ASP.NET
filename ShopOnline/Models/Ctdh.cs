using System;
using System.Collections.Generic;

namespace ShopOnline.Models;

public partial class Ctdh
{
    public string? MaDh { get; set; }

    public string? MaCtspSize { get; set; }

    public string SoLuong { get; set; } = null!;

    public decimal? GiaBan { get; set; }

    public decimal? TongTien { get; set; }

    public virtual CtspSize? MaCtspSizeNavigation { get; set; }

    public virtual DonHang? MaDhNavigation { get; set; }
}
