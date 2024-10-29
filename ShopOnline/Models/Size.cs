using System;
using System.Collections.Generic;

namespace ShopOnline.Models;

public partial class Size
{
    public string MaSize { get; set; }

    public string TenSize { get; set; }

    public virtual ICollection<CtspSize> CtspSizes { get; set; } = new List<CtspSize>();
}
