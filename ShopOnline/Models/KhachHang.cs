using System;
using System.Collections.Generic;

namespace ShopOnline.Models;

public partial class KhachHang
{
    public string MaKh { get; set; }

    public string? HovaTen { get; set; }

    public string? GioiTinh { get; set; }

    public DateOnly? NgaySinh { get; set; }

    public string Sdt { get; set; } 

    public string Email { get; set; } 

    public string? DiaChi { get; set; }

    public string Username { get; set; }

    public string Password { get; set; }

    public virtual ICollection<DonHang> DonHangs { get; set; } = new List<DonHang>();
}
