using System;
using System.Collections.Generic;

namespace ShopOnline.Models;

public partial class MauSac
{
    public string MaMs { get; set; } = null!;

    public string TenMs { get; set; } = null!;

    public virtual ICollection<Ctsp> Ctsps { get; set; } = new List<Ctsp>();
}
