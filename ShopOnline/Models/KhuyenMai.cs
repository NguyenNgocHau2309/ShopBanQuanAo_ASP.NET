using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ShopOnline.Models;

public partial class KhuyenMai
{
    [Key]
    [Required(ErrorMessage = "Mã khuyến mãi là bắt buộc")]
    public string MaKm { get; set; }

    public string? MaSp { get; set; }

    public string? MaDm { get; set; }

    public string? MoTa { get; set; }

    public string LoaiKm { get; set; } = null!;

    public int SoTienPhanTram { get; set; }

    public DateOnly NgayBd { get; set; }

    public DateOnly NgayKt { get; set; }

    public decimal? TienToiThieu { get; set; }

    public virtual SanPham? MaSpNavigation { get; set; }
}
