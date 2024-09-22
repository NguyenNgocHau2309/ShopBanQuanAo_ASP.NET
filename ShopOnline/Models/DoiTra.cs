using System;
using System.Collections.Generic;

namespace ShopOnline.Models;

public partial class DoiTra
{
    public string MaDt { get; set; } = null!;

    public string? MaDh { get; set; }

    public string? MaCtsps { get; set; }

    public string HinhThuc { get; set; } = null!;

    public DateOnly NgayDoiTra { get; set; }

    public string LyDo { get; set; } = null!;

    public string? VideoMinhChung { get; set; }

    public string TrangThai { get; set; } = null!;

    public decimal? TienHoan { get; set; }

    public string? PthucHoan { get; set; }

    public decimal? TienBu { get; set; }

    public virtual CtspSize? MaCtspsNavigation { get; set; }

    public virtual DonHang? MaDhNavigation { get; set; }
}
