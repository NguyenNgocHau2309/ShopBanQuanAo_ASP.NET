using System;
using System.Collections.Generic;

namespace ShopOnline.Models;

public partial class DonHang
{
    public string MaDh { get; set; }

    public string? MaKh { get; set; }
    public string MaCode { get; set; }

    public DateOnly NgayDh { get; set; }

    public string TrangThai { get; set; }

    public string Pttt { get; set; }

    public decimal TienGiam { get; set; }

    public decimal TienShip { get; set; }

    public decimal TongTien { get; set; }
    public string TenNguoiNhan {  get; set; }
    public string SoDienThoai { get; set; }

    public string Dcgh { get; set; }

    public string Ptgh { get; set; }

    public decimal TienThu { get; set; }

    public virtual ICollection<DanhGia>? DanhGia { get; set; } = new List<DanhGia>();

    public virtual ICollection<DoiTra>? DoiTras { get; set; } = new List<DoiTra>();

    public virtual KhachHang? MaKhNavigation { get; set; }
}
