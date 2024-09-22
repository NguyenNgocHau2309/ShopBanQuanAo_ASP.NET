using System;
using System.Collections.Generic;

namespace ShopOnline.Models;

public partial class Ctkm
{
    public string? MaDh { get; set; }

    public string? MaKm { get; set; }

    public DateOnly NgaySd { get; set; }

    public decimal? TienGiam { get; set; }

    public virtual DonHang? MaDhNavigation { get; set; }

    public virtual KhuyenMai? MaKmNavigation { get; set; }
}
