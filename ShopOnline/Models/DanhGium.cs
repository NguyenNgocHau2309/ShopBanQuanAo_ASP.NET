using System;
using System.Collections.Generic;

namespace ShopOnline.Models;

public partial class DanhGium
{
    public string MaDg { get; set; } = null!;

    public string? MaDh { get; set; }

    public string? MaCtspSize { get; set; }

    public string? NoiDung { get; set; }

    public string? DiemSao { get; set; }

    public virtual ICollection<HinhAnhDanhGium> HinhAnhDanhGia { get; set; } = new List<HinhAnhDanhGium>();

    public virtual CtspSize? MaCtspSizeNavigation { get; set; }

    public virtual DonHang? MaDhNavigation { get; set; }

    public virtual ICollection<VideoDanhGium> VideoDanhGia { get; set; } = new List<VideoDanhGium>();
}
