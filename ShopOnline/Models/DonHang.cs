using System;
using System.Collections.Generic;

namespace ShopOnline.Models;

public partial class DonHang
{
    public string MaDh { get; set; } = null!;

    public string? MaKh { get; set; }

    public DateOnly NgayDh { get; set; }

    public string TrangThai { get; set; } = null!;

    public string Pttt { get; set; } = null!;

    public decimal? TienGiam { get; set; }

    public decimal? TienShip { get; set; }

    public decimal? TongTien { get; set; }

    public string Dcgh { get; set; } = null!;

    public string Ptgh { get; set; } = null!;

    public decimal? TienThu { get; set; }

    public virtual ICollection<DanhGium> DanhGia { get; set; } = new List<DanhGium>();

    public virtual ICollection<DoiTra> DoiTras { get; set; } = new List<DoiTra>();

    public virtual KhachHang? MaKhNavigation { get; set; }
}
