﻿using System;
using System.Collections.Generic;

namespace ShopOnline.Models;

public partial class DanhGia
{
    public string MaDg { get; set; }

    public string MaDh { get; set; }

    public string MaCtspSize { get; set; }

    public string? NoiDung { get; set; }

    public int DiemSao { get; set; }
    public DateOnly NgayDg { get; set; }

    public virtual ICollection<HinhAnhDanhGium> HinhAnhDanhGia { get; set; } = new List<HinhAnhDanhGium>();

    public virtual CtspSize? MaCtspSizeNavigation { get; set; }

    public virtual DonHang? MaDhNavigation { get; set; }

    public virtual ICollection<VideoDanhGium> VideoDanhGia { get; set; } = new List<VideoDanhGium>();
}
