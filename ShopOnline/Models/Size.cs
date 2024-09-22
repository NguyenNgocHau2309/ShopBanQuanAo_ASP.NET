using System;
using System.Collections.Generic;

namespace ShopOnline.Models;

public partial class Size
{
    public string MaSize { get; set; } = null!;

    public string TenSize { get; set; } = null!;

    public virtual ICollection<CtspSize> CtspSizes { get; set; } = new List<CtspSize>();
}
