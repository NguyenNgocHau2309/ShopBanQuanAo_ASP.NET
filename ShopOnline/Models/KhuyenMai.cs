using System;
using System.Collections.Generic;

namespace ShopOnline.Models;

public partial class KhuyenMai
{
    public string MaKm { get; set; } = null!;

    public string? MaSp { get; set; }

    public string? MaDm { get; set; }

    public string? MoTa { get; set; }

    public string LoaiKm { get; set; } = null!;

    public int? SoTienPhanTram { get; set; }

    public DateOnly NgayBd { get; set; }

    public DateOnly NgayKt { get; set; }

    public decimal? TienToiThieu { get; set; }

    public virtual SanPham? MaSpNavigation { get; set; }
}
