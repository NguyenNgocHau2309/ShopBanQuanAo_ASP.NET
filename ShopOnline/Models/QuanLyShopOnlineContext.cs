﻿using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace ShopOnline.Models;

public partial class QuanLyShopOnlineContext : DbContext
{
    public QuanLyShopOnlineContext()
    {
    }

    public QuanLyShopOnlineContext(DbContextOptions<QuanLyShopOnlineContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Ctdh> Ctdhs { get; set; }

    public virtual DbSet<Ctkm> Ctkms { get; set; }

    public virtual DbSet<Ctsp> Ctsps { get; set; }

    public virtual DbSet<CtspSize> CtspSizes { get; set; }

    public virtual DbSet<DanhGia> DanhGia { get; set; }

    public virtual DbSet<DanhMuc> DanhMucs { get; set; }

    public virtual DbSet<DoiTra> DoiTras { get; set; }

    public virtual DbSet<DonHang> DonHangs { get; set; }

    public virtual DbSet<HinhAnhDanhGium> HinhAnhDanhGia { get; set; }

    public virtual DbSet<KhachHang> KhachHangs { get; set; }

    public virtual DbSet<KhuyenMai> KhuyenMais { get; set; }

    public virtual DbSet<MauSac> MauSacs { get; set; }

    public virtual DbSet<SanPham> SanPhams { get; set; }

    public virtual DbSet<Size> Sizes { get; set; }
    public virtual DbSet<GioHang> GioHangs { get; set; }
    public virtual DbSet<Ctgh> Ctghs { get; set; }
    public virtual DbSet<VideoDanhGium> VideoDanhGia { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=LAPTOP-HAU03\\SQL2022;Initial Catalog=QuanLyShopOnline;Integrated Security=True;Connect Timeout=100;Encrypt=True;Trust Server Certificate=True;Application Intent=ReadWrite;Multi Subnet Failover=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Ctdh>(entity =>
        {
            entity
                .ToTable("CTDH");

            entity.HasKey(g => new { g.MaDh, g.MaCtspSize});

            entity.Property(e => e.GiaBan).HasColumnType("decimal(18, 3)");
            entity.Property(e => e.MaCtspSize)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaCTSP_Size");
            entity.Property(e => e.MaDh)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaDH");
            entity.Property(e => e.SoLuong).HasColumnType("int"); // Thay đổi kiểu dữ liệu thành int
            entity.Property(e => e.TongTien).HasColumnType("decimal(18, 3)");

            entity.HasOne(d => d.MaCtspSizeNavigation).WithMany()
                .HasForeignKey(d => d.MaCtspSize)
                .HasConstraintName("FK__CTDH__MaCTSP_Siz__395884C4");

            entity.HasOne(d => d.MaDhNavigation).WithMany()
                .HasForeignKey(d => d.MaDh)
                .HasConstraintName("FK__CTDH__MaDH__3864608B");
        });

        modelBuilder.Entity<GioHang>(entity =>
        {
            entity
                .ToTable("GioHang"); // Chỉ định tên bảng là GioHang

            entity.HasKey(e => e.MaGH).HasName("PK__GioHang");

            // Định nghĩa các thuộc tính
            entity.Property(e => e.MaKH)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaKH");
            // Thiết lập các quan hệ khóa ngoại
            entity.HasOne(d => d.MaKhNavigation)
                .WithMany()
                .HasForeignKey(d => d.MaKH)
                .HasConstraintName("FK_GioHang_KhachHang");
        });

        modelBuilder.Entity<Ctgh>(entity =>
        {
            entity
                .ToTable("CTGH"); // Set the table name

            // Composite primary key
            entity.HasKey(g => new { g.MaGH, g.MaCTSP_Size });

            entity.Property(e => e.SoLuong)
               .IsRequired()
               .HasColumnName("SoLuong");

            entity.Property(e => e.MaCTSP_Size)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaCTSP_Size");

            // Foreign key relation to GioHang
            entity.HasOne(d => d.GioHang) // Navigation to GioHang
                .WithMany(g => g.Ctgh) // Assuming GioHang has a collection of Ctgh
                .HasForeignKey(d => d.MaGH) // Use MaGH as the foreign key
                .HasConstraintName("FK_Ctgh_GioHang");

            // Foreign key relation to CTSP_Size
            entity.HasOne(d => d.MaCtspSizeNavigation)
                .WithMany()
                .HasForeignKey(d => d.MaCTSP_Size)
                .HasConstraintName("FK_Ctgh_CTSP_Size");
        });


        modelBuilder.Entity<Ctkm>(entity =>
        {
            entity
                .ToTable("CTKM");
            entity.HasKey(g => new { g.MaDh, g.MaKm});
            entity.Property(e => e.Khac)
                .HasMaxLength(255)
                .IsUnicode(true)
                .HasColumnName("Khac");

            entity.Property(e => e.MaDh)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaDH");
            entity.Property(e => e.MaKm)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaKM");
            entity.Property(e => e.NgaySd).HasColumnName("NgaySD");
            entity.Property(e => e.TienGiam).HasColumnType("decimal(18, 3)");

            entity.HasOne(d => d.MaDhNavigation).WithMany()
                .HasForeignKey(d => d.MaDh)
                .HasConstraintName("FK__CTKM__MaDH__42E1EEFE");

            entity.HasOne(d => d.MaKmNavigation).WithMany()
                .HasForeignKey(d => d.MaKm)
                .HasConstraintName("FK__CTKM__MaKM__43D61337");
        });

        modelBuilder.Entity<Ctsp>(entity =>
        {
            entity.HasKey(e => e.MaCtsp).HasName("PK__CTSP__1E4FCECDA407E716");

            entity.ToTable("CTSP");

            entity.Property(e => e.MaCtsp)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaCTSP");
            entity.Property(e => e.HinhAnh)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.MaMs)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaMS");
            entity.Property(e => e.MaSp)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaSP");

            entity.HasOne(d => d.MaMsNavigation).WithMany(p => p.Ctsps)
                .HasForeignKey(d => d.MaMs)
                .HasConstraintName("FK__CTSP__MaMS__46E78A0C");

            entity.HasOne(d => d.MaSpNavigation).WithMany(p => p.Ctsps)
                .HasForeignKey(d => d.MaSp)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__CTSP__MaSP__45F365D3");
        });

        modelBuilder.Entity<CtspSize>(entity =>
        {
            entity.HasKey(e => e.MaCtspSize).HasName("PK__CTSP_Siz__107AFFD0E19D9076");

            entity.ToTable("CTSP_Size");

            entity.Property(e => e.MaCtspSize)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaCTSP_Size");
            entity.Property(e => e.Gia).HasColumnType("decimal(18, 3)");
            entity.Property(e => e.MaCtsp)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaCTSP");
            entity.Property(e => e.MaSize)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength();

            entity.HasOne(d => d.MaCtspNavigation).WithMany(p => p.CtspSizes)
                .HasForeignKey(d => d.MaCtsp)
                .HasConstraintName("FK__CTSP_Size__MaCTS__2180FB33");

            entity.HasOne(d => d.MaSizeNavigation).WithMany(p => p.CtspSizes)
                .HasForeignKey(d => d.MaSize)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__CTSP_Size__MaSiz__22751F6C");
        });

        modelBuilder.Entity<DanhGia>(entity =>
        {
            entity.HasKey(e => e.MaDg).HasName("PK__DanhGia__27258660DE321D88");

            entity.Property(e => e.MaDg)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaDG");
            entity.Property(e => e.DiemSao)
                .HasColumnType("int");
            entity.Property(e => e.MaCtspSize)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaCTSP_Size");
            entity.Property(e => e.MaDh)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaDH");
            entity.Property(e => e.NoiDung)
                .HasMaxLength(1000)
                .IsUnicode(true)
                .IsFixedLength()
                .HasColumnName("NoiDung");
            entity.Property(e => e.NgayDg).HasColumnName("NgayDG");
            entity.HasOne(d => d.MaCtspSizeNavigation).WithMany(p => p.DanhGia)
                .HasForeignKey(d => d.MaCtspSize)
                .HasConstraintName("FK__DanhGia__MaCTSP___58D1301D");

            entity.HasOne(d => d.MaDhNavigation).WithMany(p => p.DanhGia)
                .HasForeignKey(d => d.MaDh)
                .HasConstraintName("FK__DanhGia__MaDH__57DD0BE4");
        });

        modelBuilder.Entity<DanhMuc>(entity =>
        {
            entity.HasKey(e => e.MaDm).HasName("PK__DanhMuc__2725866E3DAF8211");

            entity.ToTable("DanhMuc");

            entity.Property(e => e.MaDm)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaDM");
            entity.Property(e => e.TenDm)
                .HasMaxLength(50)
                .IsUnicode(true)
                .HasColumnName("TenDM");
        });

        modelBuilder.Entity<DoiTra>(entity =>
        {
            entity.HasKey(e => e.MaDt).HasName("PK__DoiTra__27258655356BA630");

            entity.ToTable("DoiTra");

            entity.Property(e => e.MaDt)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaDT");
            entity.Property(e => e.HinhThuc)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.LyDo).HasColumnType("text");
            entity.Property(e => e.MaCtsps)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaCTSPS");
            entity.Property(e => e.MaDh)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaDH");
            entity.Property(e => e.PthucHoan)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("PThucHoan");
            entity.Property(e => e.TienBu).HasColumnType("decimal(18, 3)");
            entity.Property(e => e.TienHoan).HasColumnType("decimal(18, 3)");
            entity.Property(e => e.TrangThai)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.VideoMinhChung)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("Video_MinhChung");

            entity.HasOne(d => d.MaCtspsNavigation).WithMany(p => p.DoiTras)
                .HasForeignKey(d => d.MaCtsps)
                .HasConstraintName("FK__DoiTra__MaCTSPS__47A6A41B");

            entity.HasOne(d => d.MaDhNavigation).WithMany(p => p.DoiTras)
                .HasForeignKey(d => d.MaDh)
                .HasConstraintName("FK__DoiTra__MaDH__46B27FE2");
        });

        modelBuilder.Entity<DonHang>(entity =>
        {
            entity.HasKey(e => e.MaDh).HasName("PK__DonHang__27258661A77645A8");

            entity.ToTable("DonHang");

            entity.Property(e => e.MaDh)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaDH");
            entity.Property(e => e.Dcgh)
                .HasMaxLength(255)
                .IsUnicode(true)
                .HasColumnName("DCGH");
            entity.Property(e => e.MaKh)
                .HasMaxLength(10)
                .IsUnicode(true)
                .IsFixedLength()
                .HasColumnName("MaKH");
            entity.Property(e => e.MaCode)
                .HasMaxLength(10)
                .IsUnicode(true)
                .IsFixedLength()
                .HasColumnName("MaCode");
            entity.Property(e => e.TenNguoiNhan)
                .HasMaxLength(100)
                .IsUnicode(true)
                .IsFixedLength()
                .HasColumnName("TenNguoiNhan");
            entity.Property(e => e.SoDienThoai)
                .HasMaxLength(15)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("SoDienThoai");
            entity.Property(e => e.NgayDh).HasColumnName("NgayDH");
            entity.Property(e => e.Ptgh)
                .HasMaxLength(50)
                .IsUnicode(true)
                .HasColumnName("PTGH");
            entity.Property(e => e.Pttt)
                .HasMaxLength(50)
                .IsUnicode(true)
                .HasColumnName("PTTT");
            entity.Property(e => e.TienGiam)
                .HasColumnType("decimal(18, 3)")
                .HasColumnName("Tien_Giam");
            entity.Property(e => e.TienShip)
                .HasColumnType("decimal(18, 3)")
                .HasColumnName("Tien_Ship");
            entity.Property(e => e.TienThu).HasColumnType("decimal(18, 3)");
            entity.Property(e => e.TongTien).HasColumnType("decimal(18, 3)");
            entity.Property(e => e.TrangThai)
                .HasMaxLength(50)
                .IsUnicode(true);

            entity.HasOne(d => d.MaKhNavigation).WithMany(p => p.DonHangs)
                .HasForeignKey(d => d.MaKh)
                .HasConstraintName("FK__DonHang__MaKH__52593CB8");
        });

        modelBuilder.Entity<HinhAnhDanhGium>(entity =>
        {
            entity.HasKey(e => e.MaHinhAnh).HasName("PK__HinhAnh___A9C37A9B6DE0202D");

            entity.ToTable("HinhAnh_DanhGia");

            entity.Property(e => e.MaHinhAnh)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.DuongDan)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.MaDg)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaDG");
            entity.HasOne(d => d.MaDgNavigation).WithMany(p => p.HinhAnhDanhGia)
                .HasForeignKey(d => d.MaDg)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__HinhAnh_Da__MaDG__5CA1C101");
        });

        modelBuilder.Entity<KhachHang>(entity =>
        {
            entity.HasKey(e => e.MaKh).HasName("PK__KhachHan__2725CF1EE29AE1AB");

            entity.ToTable("KhachHang");

            entity.HasIndex(e => e.Username, "UQ__KhachHan__536C85E460B3FC70").IsUnique();

            entity.HasIndex(e => e.Email, "UQ__KhachHan__A9D10534E5D09D8E").IsUnique();

            entity.HasIndex(e => e.Sdt, "UQ__KhachHan__CA1930A5A31BDF28").IsUnique();

            entity.Property(e => e.MaKh)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaKH");
            entity.Property(e => e.DiaChi)
                .HasMaxLength(255)
                .IsUnicode(true);
            entity.Property(e => e.Email)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.GioiTinh)
                .HasMaxLength(1)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.HovaTen)
                .HasMaxLength(50)
                .IsUnicode(true);
            entity.Property(e => e.Password)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.Sdt)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasColumnName("SDT");
            entity.Property(e => e.Username)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<KhuyenMai>(entity =>
        {
            entity.HasKey(e => e.MaKm).HasName("PK__KhuyenMa__2725CF1565A0E280");

            entity.ToTable("KhuyenMai");

            entity.Property(e => e.MaKm)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaKM");
            entity.Property(e => e.LoaiKm)
                .HasMaxLength(50)
                .IsUnicode(true)
                .HasColumnName("Loai_KM");
            entity.Property(e => e.MaDm)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaDM");
            entity.Property(e => e.MaSp)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaSP");
            entity.Property(e => e.MoTa)
                .IsUnicode(true)
                .HasColumnType("nvarchar(max)");
            entity.Property(e => e.NgayBd).HasColumnName("NgayBD");
            entity.Property(e => e.NgayKt).HasColumnName("NgayKT");
            entity.Property(e => e.SoTienPhanTram).HasColumnName("SoTien_PhanTram");
            entity.Property(e => e.TienToiThieu).HasColumnType("decimal(18, 3)");

            entity.HasOne(d => d.MaSpNavigation).WithMany(p => p.KhuyenMais)
                .HasForeignKey(d => d.MaSp)
                .HasConstraintName("FK__KhuyenMai__MaSP__3F115E1A");
        });

        modelBuilder.Entity<MauSac>(entity =>
        {
            entity.HasKey(e => e.MaMs).HasName("PK__MauSac__2725DFD62B1BE43C");

            entity.ToTable("MauSac");

            entity.Property(e => e.MaMs)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaMS");
            entity.Property(e => e.TenMs)
                .HasMaxLength(50)
                .IsUnicode(true)
                .HasColumnName("TenMS");
        });

        modelBuilder.Entity<SanPham>(entity =>
        {
            entity.HasKey(e => e.MaSp).HasName("PK__SanPham__2725081CBA6803B9");

            entity.ToTable("SanPham");

            entity.Property(e => e.MaSp)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaSP");
            entity.Property(e => e.HinhAnhDd)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("HinhAnhDD");
            entity.Property(e => e.MaDm)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaDM");
            entity.Property(e => e.MoTa)
             .HasMaxLength(1000)
                .IsUnicode(true)
                .IsFixedLength()
                .HasColumnName("MoTa"); ;
            entity.Property(e => e.TenSp)
                 .HasMaxLength(255)
                .IsUnicode(true)
                .IsFixedLength()
                .HasColumnName("TenSP");
            // Cấu hình cho MinGia và MaxGia
            entity.Property(e => e.MinGia)  // Giả sử bạn đã thêm thuộc tính này vào lớp SanPham
                .HasColumnType("decimal(18,3)")
                .HasColumnName("MinGia");  // Nếu bạn có tên cột cụ thể, hãy sử dụng nó

            entity.Property(e => e.MaxGia)  // Giả sử bạn đã thêm thuộc tính này vào lớp SanPham
                .HasColumnType("decimal(18,3)")
                .HasColumnName("MaxGia");  // Nếu bạn có tên cột cụ thể, hãy sử dụng nó

            entity.HasOne(d => d.MaDmNavigation).WithMany(p => p.SanPhams)
                .HasForeignKey(d => d.MaDm)
                .HasConstraintName("FK__SanPham__MaDM__3F466844");
        });

        modelBuilder.Entity<Size>(entity =>
        {
            entity.HasKey(e => e.MaSize).HasName("PK__Size__A787E7ED7871C885");

            entity.ToTable("Size");

            entity.Property(e => e.MaSize)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.TenSize)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength();
        });

        modelBuilder.Entity<VideoDanhGium>(entity =>
        {
            entity.HasKey(e => e.MaVideo).HasName("PK__Video_Da__BCAAF261DE3CC194");

            entity.ToTable("Video_DanhGia");

            entity.Property(e => e.MaVideo)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.DuongDan)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.MaDg)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("MaDG");

            entity.HasOne(d => d.MaDgNavigation).WithMany(p => p.VideoDanhGia)
                .HasForeignKey(d => d.MaDg)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Video_Danh__MaDG__5F7E2DAC");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
