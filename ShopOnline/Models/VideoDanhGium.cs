﻿using System;
using System.Collections.Generic;

namespace ShopOnline.Models;

public partial class VideoDanhGium
{
    public string MaVideo { get; set; }

    public string MaDg { get; set; }

    public string DuongDan { get; set; } = null!;

    public virtual DanhGia MaDgNavigation { get; set; }
}
