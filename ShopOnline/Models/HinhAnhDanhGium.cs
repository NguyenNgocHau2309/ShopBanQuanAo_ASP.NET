using System;
using System.Collections.Generic;

namespace ShopOnline.Models;

public partial class HinhAnhDanhGium
{
    public string MaHinhAnh { get; set; } = null!;

    public string? MaDg { get; set; }

    public string DuongDan { get; set; } = null!;

    public virtual DanhGia? MaDgNavigation { get; set; }
}
