USE [master]
GO
/****** Object:  Database [QuanLyShopOnline]    Script Date: 2/17/2025 12:18:50 PM ******/
CREATE DATABASE [QuanLyShopOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyShopOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\QuanLyShopOnline.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyShopOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\QuanLyShopOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QuanLyShopOnline] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyShopOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyShopOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyShopOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyShopOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyShopOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyShopOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyShopOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyShopOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyShopOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyShopOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyShopOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyShopOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyShopOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyShopOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyShopOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyShopOnline] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyShopOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyShopOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyShopOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyShopOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyShopOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyShopOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyShopOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyShopOnline] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyShopOnline] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyShopOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyShopOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyShopOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyShopOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyShopOnline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyShopOnline] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyShopOnline', N'ON'
GO
ALTER DATABASE [QuanLyShopOnline] SET QUERY_STORE = ON
GO
ALTER DATABASE [QuanLyShopOnline] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QuanLyShopOnline]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/17/2025 12:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTDH]    Script Date: 2/17/2025 12:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDH](
	[MaDH] [char](10) NULL,
	[MaCTSP_Size] [char](10) NULL,
	[SoLuong] [int] NULL,
	[GiaBan] [decimal](18, 3) NULL,
	[TongTien] [decimal](18, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTGH]    Script Date: 2/17/2025 12:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTGH](
	[MaGH] [char](10) NOT NULL,
	[MaCTSP_Size] [char](10) NOT NULL,
	[SoLuong] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGH] ASC,
	[MaCTSP_Size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTKM]    Script Date: 2/17/2025 12:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTKM](
	[MaDH] [char](10) NULL,
	[MaKM] [char](10) NULL,
	[NgaySD] [date] NOT NULL,
	[TienGiam] [decimal](18, 3) NULL,
	[Khac] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTSP]    Script Date: 2/17/2025 12:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTSP](
	[MaCTSP] [char](10) NOT NULL,
	[MaSP] [char](10) NOT NULL,
	[MaMS] [char](10) NULL,
	[HinhAnh] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCTSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTSP_Size]    Script Date: 2/17/2025 12:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTSP_Size](
	[MaCTSP_Size] [char](10) NOT NULL,
	[MaCTSP] [char](10) NULL,
	[MaSize] [char](10) NOT NULL,
	[Gia] [decimal](18, 3) NULL,
	[SoLuongTon] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCTSP_Size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 2/17/2025 12:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[MaDG] [char](10) NOT NULL,
	[MaDH] [char](10) NULL,
	[MaCTSP_Size] [char](10) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[DiemSao] [int] NULL,
	[NgayDG] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 2/17/2025 12:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDM] [char](10) NOT NULL,
	[TenDM] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 2/17/2025 12:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [char](10) NOT NULL,
	[MaKH] [char](10) NULL,
	[NgayDH] [date] NOT NULL,
	[TrangThai] [nvarchar](50) NOT NULL,
	[PTTT] [nvarchar](50) NOT NULL,
	[Tien_Giam] [decimal](18, 3) NULL,
	[Tien_Ship] [decimal](18, 3) NULL,
	[TongTien] [decimal](18, 3) NULL,
	[TienThu] [decimal](18, 3) NULL,
	[DCGH] [nvarchar](255) NOT NULL,
	[PTGH] [nvarchar](50) NOT NULL,
	[TenNguoiNhan] [nvarchar](100) NOT NULL,
	[SoDienThoai] [nvarchar](15) NOT NULL,
	[MaCode] [nvarchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 2/17/2025 12:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[MaGH] [char](10) NOT NULL,
	[MaKH] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HinhAnh_DanhGia]    Script Date: 2/17/2025 12:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhAnh_DanhGia](
	[MaHinhAnh] [char](10) NOT NULL,
	[MaDG] [char](10) NULL,
	[DuongDan] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHinhAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 2/17/2025 12:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [char](10) NOT NULL,
	[HovaTen] [nvarchar](50) NULL,
	[GioiTinh] [char](1) NULL,
	[NgaySinh] [date] NULL,
	[SDT] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 2/17/2025 12:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[MaKM] [char](10) NOT NULL,
	[MaSP] [char](10) NULL,
	[MaDM] [char](10) NULL,
	[MoTa] [nvarchar](max) NULL,
	[Loai_KM] [nvarchar](50) NOT NULL,
	[SoTien_PhanTram] [int] NULL,
	[NgayBD] [date] NOT NULL,
	[NgayKT] [date] NOT NULL,
	[TienToiThieu] [decimal](18, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MauSac]    Script Date: 2/17/2025 12:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MauSac](
	[MaMS] [char](10) NOT NULL,
	[TenMS] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 2/17/2025 12:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [char](10) NOT NULL,
	[MaDM] [char](10) NULL,
	[TenSP] [nvarchar](max) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[HinhAnhDD] [nvarchar](255) NOT NULL,
	[MinGia] [decimal](18, 3) NULL,
	[MaxGia] [decimal](18, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 2/17/2025 12:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[MaSize] [char](10) NOT NULL,
	[TenSize] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video_DanhGia]    Script Date: 2/17/2025 12:18:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video_DanhGia](
	[MaVideo] [char](10) NOT NULL,
	[MaDG] [char](10) NULL,
	[DuongDan] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaVideo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH001     ', N'CTSPS0013 ', 1, CAST(99.000 AS Decimal(18, 3)), CAST(99.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH001     ', N'CTSPS0043 ', 5, CAST(59.900 AS Decimal(18, 3)), CAST(299.500 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH001     ', N'CTSPS0404 ', 2, CAST(116.100 AS Decimal(18, 3)), CAST(232.200 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH003     ', N'CTSPS0102 ', 1, CAST(119.000 AS Decimal(18, 3)), CAST(119.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH003     ', N'CTSPS0126 ', 2, CAST(139.000 AS Decimal(18, 3)), CAST(278.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH003     ', N'CTSPS0788 ', 1, CAST(169.000 AS Decimal(18, 3)), CAST(169.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH004     ', N'CTSPS0097 ', 1, CAST(59.000 AS Decimal(18, 3)), CAST(59.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH005     ', N'CTSPS0099 ', 1, CAST(59.000 AS Decimal(18, 3)), CAST(59.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH006     ', N'CTSPS0001 ', 1, CAST(119.000 AS Decimal(18, 3)), CAST(119.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH006     ', N'CTSPS0308 ', 1, CAST(89.000 AS Decimal(18, 3)), CAST(89.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH006     ', N'CTSPS0673 ', 1, CAST(470.000 AS Decimal(18, 3)), CAST(470.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH007     ', N'CTSPS0001 ', 2, CAST(119.000 AS Decimal(18, 3)), CAST(238.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH008     ', N'CTSPS0001 ', 1, CAST(119.000 AS Decimal(18, 3)), CAST(119.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH010     ', N'CTSPS0043 ', 1, CAST(59.900 AS Decimal(18, 3)), CAST(59.900 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH010     ', N'CTSPS0743 ', 1, CAST(348.000 AS Decimal(18, 3)), CAST(348.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH010     ', N'CTSPS0760 ', 1, CAST(259.000 AS Decimal(18, 3)), CAST(259.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH011     ', N'CTSPS0145 ', 1, CAST(48.400 AS Decimal(18, 3)), CAST(48.400 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH011     ', N'CTSPS0277 ', 1, CAST(37.500 AS Decimal(18, 3)), CAST(37.500 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH011     ', N'CTSPS0278 ', 1, CAST(37.500 AS Decimal(18, 3)), CAST(37.500 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH011     ', N'CTSPS0302 ', 1, CAST(103.000 AS Decimal(18, 3)), CAST(103.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH011     ', N'CTSPS0303 ', 1, CAST(103.000 AS Decimal(18, 3)), CAST(103.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH011     ', N'CTSPS0666 ', 2, CAST(145.000 AS Decimal(18, 3)), CAST(290.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH011     ', N'CTSPS0710 ', 1, CAST(159.000 AS Decimal(18, 3)), CAST(159.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH009     ', N'CTSPS0142 ', 1, CAST(49.000 AS Decimal(18, 3)), CAST(49.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH009     ', N'CTSPS0183 ', 2, CAST(199.000 AS Decimal(18, 3)), CAST(398.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH009     ', N'CTSPS0262 ', 1, CAST(180.000 AS Decimal(18, 3)), CAST(180.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH009     ', N'CTSPS0279 ', 1, CAST(89.000 AS Decimal(18, 3)), CAST(89.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH009     ', N'CTSPS0673 ', 1, CAST(470.000 AS Decimal(18, 3)), CAST(470.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH002     ', N'CTSPS0102 ', 1, CAST(119.000 AS Decimal(18, 3)), CAST(119.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH002     ', N'CTSPS0107 ', 1, CAST(114.940 AS Decimal(18, 3)), CAST(114.940 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH002     ', N'CTSPS0443 ', 1, CAST(141.000 AS Decimal(18, 3)), CAST(141.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH002     ', N'CTSPS0449 ', 1, CAST(89.000 AS Decimal(18, 3)), CAST(89.000 AS Decimal(18, 3)))
INSERT [dbo].[CTDH] ([MaDH], [MaCTSP_Size], [SoLuong], [GiaBan], [TongTien]) VALUES (N'DH002     ', N'CTSPS0603 ', 1, CAST(657.000 AS Decimal(18, 3)), CAST(657.000 AS Decimal(18, 3)))
GO
INSERT [dbo].[CTGH] ([MaGH], [MaCTSP_Size], [SoLuong]) VALUES (N'GH001     ', N'CTSPS0777 ', 3)
GO
INSERT [dbo].[CTKM] ([MaDH], [MaKM], [NgaySD], [TienGiam], [Khac]) VALUES (N'DH001     ', N'KM002     ', CAST(N'2024-10-16' AS Date), CAST(0.000 AS Decimal(18, 3)), N'Tặng dây cột tóc')
INSERT [dbo].[CTKM] ([MaDH], [MaKM], [NgaySD], [TienGiam], [Khac]) VALUES (N'DH001     ', N'KM003     ', CAST(N'2024-10-16' AS Date), CAST(0.000 AS Decimal(18, 3)), N'')
INSERT [dbo].[CTKM] ([MaDH], [MaKM], [NgaySD], [TienGiam], [Khac]) VALUES (N'DH001     ', N'KM005     ', CAST(N'2024-10-16' AS Date), CAST(0.000 AS Decimal(18, 3)), N'Tặng túi sách')
INSERT [dbo].[CTKM] ([MaDH], [MaKM], [NgaySD], [TienGiam], [Khac]) VALUES (N'DH001     ', N'KM006     ', CAST(N'2024-10-16' AS Date), CAST(19.925 AS Decimal(18, 3)), N'Tặng dây cột tóc')
INSERT [dbo].[CTKM] ([MaDH], [MaKM], [NgaySD], [TienGiam], [Khac]) VALUES (N'DH009     ', N'KM009     ', CAST(N'2024-10-29' AS Date), CAST(47.000 AS Decimal(18, 3)), NULL)
INSERT [dbo].[CTKM] ([MaDH], [MaKM], [NgaySD], [TienGiam], [Khac]) VALUES (N'DH009     ', N'KM010     ', CAST(N'2024-10-29' AS Date), CAST(0.000 AS Decimal(18, 3)), N'Tặng dây buộc tóc')
INSERT [dbo].[CTKM] ([MaDH], [MaKM], [NgaySD], [TienGiam], [Khac]) VALUES (N'DH009     ', N'KM011     ', CAST(N'2024-10-29' AS Date), CAST(0.000 AS Decimal(18, 3)), N'Tặng túi sách cho đơn hàng tối thiểu 500.000')
INSERT [dbo].[CTKM] ([MaDH], [MaKM], [NgaySD], [TienGiam], [Khac]) VALUES (N'DH010     ', N'KM009     ', CAST(N'2024-10-29' AS Date), CAST(60.700 AS Decimal(18, 3)), NULL)
INSERT [dbo].[CTKM] ([MaDH], [MaKM], [NgaySD], [TienGiam], [Khac]) VALUES (N'DH010     ', N'KM010     ', CAST(N'2024-10-29' AS Date), CAST(0.000 AS Decimal(18, 3)), N'Tặng dây buộc tóc')
INSERT [dbo].[CTKM] ([MaDH], [MaKM], [NgaySD], [TienGiam], [Khac]) VALUES (N'DH010     ', N'KM011     ', CAST(N'2024-10-29' AS Date), CAST(0.000 AS Decimal(18, 3)), N'Tặng túi sách cho đơn hàng tối thiểu 500.000')
INSERT [dbo].[CTKM] ([MaDH], [MaKM], [NgaySD], [TienGiam], [Khac]) VALUES (N'DH011     ', N'KM009     ', CAST(N'2024-10-29' AS Date), CAST(44.900 AS Decimal(18, 3)), NULL)
INSERT [dbo].[CTKM] ([MaDH], [MaKM], [NgaySD], [TienGiam], [Khac]) VALUES (N'DH011     ', N'KM010     ', CAST(N'2024-10-29' AS Date), CAST(0.000 AS Decimal(18, 3)), N'Tặng dây buộc tóc')
INSERT [dbo].[CTKM] ([MaDH], [MaKM], [NgaySD], [TienGiam], [Khac]) VALUES (N'DH011     ', N'KM011     ', CAST(N'2024-10-29' AS Date), CAST(0.000 AS Decimal(18, 3)), N'Tặng túi sách cho đơn hàng tối thiểu 500.000')
INSERT [dbo].[CTKM] ([MaDH], [MaKM], [NgaySD], [TienGiam], [Khac]) VALUES (N'DH002     ', N'KM003     ', CAST(N'2024-10-16' AS Date), CAST(0.000 AS Decimal(18, 3)), N'')
INSERT [dbo].[CTKM] ([MaDH], [MaKM], [NgaySD], [TienGiam], [Khac]) VALUES (N'DH002     ', N'KM004     ', CAST(N'2024-10-16' AS Date), CAST(112.094 AS Decimal(18, 3)), N'')
INSERT [dbo].[CTKM] ([MaDH], [MaKM], [NgaySD], [TienGiam], [Khac]) VALUES (N'DH002     ', N'KM005     ', CAST(N'2024-10-16' AS Date), CAST(0.000 AS Decimal(18, 3)), N'Tặng túi sách')
INSERT [dbo].[CTKM] ([MaDH], [MaKM], [NgaySD], [TienGiam], [Khac]) VALUES (N'DH002     ', N'KM006     ', CAST(N'2024-10-16' AS Date), CAST(11.697 AS Decimal(18, 3)), NULL)
INSERT [dbo].[CTKM] ([MaDH], [MaKM], [NgaySD], [TienGiam], [Khac]) VALUES (N'DH002     ', N'KM007     ', CAST(N'2024-10-16' AS Date), CAST(6.900 AS Decimal(18, 3)), NULL)
GO
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0001  ', N'SP001     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lnfr2562qtmi63@resize_w900_nl.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0002  ', N'SP001     ', N'MS06      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lnfr2562pf2247.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0003  ', N'SP001     ', N'MS10      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lu9ncu5jgu1r18@resize_w900_nl.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0004  ', N'SP001     ', N'MS04      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lu9ncu5ji8m796@resize_w900_nl.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0005  ', N'SP002     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lum6ohugt0k257@resize_w900_nl.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0006  ', N'SP002     ', N'MS10      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lv93is2ukj5l40@resize_w900_nl.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0007  ', N'SP002     ', N'MS06      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lum6ohuguf4i8c@resize_w900_nl.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0008  ', N'SP003     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz7fytyaordte9@resize_w900_nl.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0009  ', N'SP003     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz7fyrvxpkjxb5@resize_w900_nl.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0010  ', N'SP003     ', N'MS07      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz7kku3jbln14d.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0011  ', N'SP003     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz7g2xxm4v9p46@resize_w900_nl.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0012  ', N'SP003     ', N'MS05      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz7g1k9wsyfhbd@resize_w900_nl.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0013  ', N'SP004     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-luho90ngw8pe7a@resize_w900_nl.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0014  ', N'SP004     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-luho90ngxn9u73.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0015  ', N'SP005     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rblf-lpp7uvyvsi4l7b.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0016  ', N'SP005     ', N'MS07      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rbna-lpp7uv8srv0l23.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0017  ', N'SP006     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lm4sg1cifd9b59@resize_w900_nl.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0018  ', N'SP006     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lm4sg1cidyov39.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0019  ', N'SP006     ', N'MS10      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lm4sg1cigrtra5.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0020  ', N'SP006     ', N'MS17      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lm4sg1cii6e7c2.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0021  ', N'SP006     ', N'MS19      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lm4sg1cijkyn11.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0022  ', N'SP006     ', N'MS14      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lm4si7hpsqn3b4.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0023  ', N'SP006     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lm4si7hpu57jc0.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0024  ', N'SP006     ', N'MS12      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lm4sg1cick4ffb.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0025  ', N'SP006     ', N'MS08      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lm4si7hpwycfa4.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0026  ', N'SP006     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lm4sg1cib5jzb8.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0027  ', N'SP007     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lslsqm2rf9hg38.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0028  ', N'SP007     ', N'MS09      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwkm6oj7ivh5d3.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0029  ', N'SP007     ', N'MS13      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltwl3maaeayyf6.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0030  ', N'SP007     ', N'MS20      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lv8nvuww6owq0d.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0031  ', N'SP007     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ln7mi46z0k4825.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0032  ', N'SP008     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwzeown75fx5fa.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0033  ', N'SP008     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxtxfq4nucijb5.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0034  ', N'SP008     ', N'MS06      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwzeown78921bb@resize_w900_nl.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0035  ', N'SP009     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxv6otu210bf15.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0036  ', N'SP009     ', N'MS06      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxy0l4pzu66z2f.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0037  ', N'SP009     ', N'MS17      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxv6l3fmpgij89.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0038  ', N'SP009     ', N'MS21      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxv6p25zu3898a.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0039  ', N'SP010     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lts0ykupd34d2d.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0040  ', N'SP010     ', N'MS06      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvpdogsngb8a9c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0041  ', N'SP010     ', N'MS22      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lts0ykupehot71.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0042  ', N'SP010     ', N'MS09      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lts0ykupipe5be.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0043  ', N'SP010     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lts0ykupa9zhc3.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0044  ', N'SP011     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzrjhjfji9u548.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0045  ', N'SP011     ', N'MS06      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzt4oqs34zt998.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0046  ', N'SP011     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzrjhjfjfgp99c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0047  ', N'SP011     ', N'MS09      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzrjhjfjfgyp82.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0048  ', N'SP012     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rdvf-lyouql5xr0vcc1.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0049  ', N'SP013     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lric3hmjjves5f.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0050  ', N'SP014     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdx4-lyz05udv5p2k32.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0051  ', N'SP014     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdxq-lyz06dqaujgn99.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0052  ', N'SP015     ', N'MS23      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz8nfs74hkm98f.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0053  ', N'SP015     ', N'MS24      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz8nfs74iz6pd4.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0054  ', N'SP015     ', N'MS25      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz8nfzlrnd5930.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0055  ', N'SP015     ', N'MS26      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz8nfzlrorpp1a.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0056  ', N'SP015     ', N'MS27      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz8ng5ez57z566.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0057  ', N'SP015     ', N'MS28      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz8ng5ez6mjl7d.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0058  ', N'SP015     ', N'MS29      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz8ngee82zz5ad.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0059  ', N'SP015     ', N'MS30      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz8ngee84ejl59.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0060  ', N'SP015     ', N'MS31      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz8ngn4v7qkt0b.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0061  ', N'SP015     ', N'MS32      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz8ngv0forz5ba.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0062  ', N'SP015     ', N'MS33      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-m04fakc2pq0d1f.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0063  ', N'SP015     ', N'MS34      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-m04fakc2r4kt4d.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0064  ', N'SP016     ', N'MS06      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxttodwxs0k91a.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0065  ', N'SP016     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxtuq2zrwa1n43.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0066  ', N'SP016     ', N'MS22      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz7tjdwguqoxa1.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0067  ', N'SP016     ', N'MS09      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz4bncj81u3l7e.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0068  ', N'SP016     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxtvcfsc3mxla0.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0069  ', N'SP017     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdy5-lyueycj8zvuu1d.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0070  ', N'SP018     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lylmbhxt3ya577.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0071  ', N'SP018     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxaz1asvngezf0.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0072  ', N'SP018     ', N'MS22      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyhe7fk39axt5b.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0073  ', N'SP018     ', N'MS09      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyku0l9utky502.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0074  ', N'SP018     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ly4udf9z8hhs64.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0075  ', N'SP019     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rd5u-lvogxefc58rg7c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0076  ', N'SP019     ', N'MS09      ', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rd4y-lvogxggb6g6b04.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0077  ', N'SP019     ', N'MS07      ', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rd4w-lvogxj7n5336d6.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0078  ', N'SP019     ', N'MS35      ', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rd3r-lvogxmsnwa5f20.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0079  ', N'SP019     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rd6q-lvogxqdongxx8d.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0080  ', N'SP020     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lx0wgvjkwr8b6b.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0081  ', N'SP020     ', N'MS17      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lx0wgvhwwdzt02.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0082  ', N'SP020     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzbimistzej100.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0083  ', N'SP020     ', N'MS06      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lx0wgvhwz74p50.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0084  ', N'SP021     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rdvt-lyouqukzw1brd6.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0085  ', N'SP021     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rdw4-lyouqur3n3u032.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0086  ', N'SP021     ', N'MS17      ', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rdvz-lyouqv452lty1d.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0087  ', N'SP021     ', N'MS22      ', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rdxz-lyouqut1iuy014.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0088  ', N'SP022     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lo4tlcmsha7re8.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0089  ', N'SP022     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lo4tk9pbq0ejdf.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0090  ', N'SP022     ', N'MS10      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lo4tk9pbke4r41.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0091  ', N'SP022     ', N'MS20      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lo4tlcmsk3cn2a.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0092  ', N'SP023     ', N'MS07      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvmoqmltkahp08.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0093  ', N'SP024     ', N'MS11      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lh25medrboky6c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0094  ', N'SP024     ', N'MS07      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lh25medrd35e70.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0095  ', N'SP024     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lh25medrehpuc7.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0096  ', N'SP024     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lihleq5n8qmq5c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0097  ', N'SP024     ', N'MS17      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsb1yzi6ux09f5.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0098  ', N'SP025     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-lz7k1o9ctfa939.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0099  ', N'SP025     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-lz7k1n9u9e19ae.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0100  ', N'SP026     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvfr73igkcbo35.webp')
GO
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0101  ', N'SP026     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvfr73igzskk0e.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0102  ', N'SP026     ', N'MS10      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lv69mjrlce7t33.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0103  ', N'SP027     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lydj9pznk3ohf5.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0104  ', N'SP027     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lydj9toa8tr581.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0105  ', N'SP027     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lydj9rdbkthp2e.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0106  ', N'SP028     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lo0mdhtm1svu1b.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0107  ', N'SP028     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rbkc-lns56f3ivcq92a.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0108  ', N'SP028     ', N'MS10      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lo0mdhtlp5v11c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0109  ', N'SP029     ', N'MS13      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz7dehojctcx7f.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0110  ', N'SP029     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz7dehojh0stf0.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0111  ', N'SP029     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz7dehoje7nx3a.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0112  ', N'SP029     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzsrzzohmh597c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0113  ', N'SP030     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-lx2x2lazqdp53a.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0114  ', N'SP030     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-lx2x2lbjpk9n73.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0115  ', N'SP031     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdyx-ly1ten9xlu3jf3.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0116  ', N'SP032     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdve-lyuf1i6qraivbe.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0117  ', N'SP033     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lv70kmb4tlvd7c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0118  ', N'SP033     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lve6agguae04a9.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0119  ', N'SP033     ', N'MS17      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lve6aggug09w36.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0120  ', N'SP033     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lve6aggud750f0.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0121  ', N'SP034     ', N'MS10      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-liqsmdrrhgb638.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0122  ', N'SP034     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-liqsmdrrhfrg03.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0123  ', N'SP034     ', N'MS22      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-liqsmdrsrt1u1c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0124  ', N'SP034     ', N'MS05      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-liqsmdrrwwk2ed.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0125  ', N'SP034     ', N'MS04      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-liqsmds1h1oy5c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0126  ', N'SP034     ', N'MS13      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-liqsmdtze6toed.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0127  ', N'SP035     ', N'MS36      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rd4i-lw8e6dg4xlv92c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0128  ', N'SP036     ', N'MS37      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdvc-lzivevb28syy87.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0129  ', N'SP036     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdyc-lziverxtag8ndb.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0130  ', N'SP037     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lskmuyxmk890df.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0131  ', N'SP037     ', N'MS07      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lskmuyxmsnnodf.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0132  ', N'SP037     ', N'MS17      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lskmuyxmhf2x36.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0133  ', N'SP037     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lskmuyxnax1ge3.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0134  ', N'SP038     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmscz2ngbppb98.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0135  ', N'SP038     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lkhy14w3ctk8bb.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0136  ', N'SP039     ', N'MS39      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-m01btazhuxcdac.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0137  ', N'SP039     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxdih78p6a57be.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0138  ', N'SP039     ', N'MS17      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxgf4vxktzob6b.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0139  ', N'SP039     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxgfdgaxlwpnf3.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0140  ', N'SP040     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyotly4im4kh2d.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0141  ', N'SP040     ', N'MS06      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyotso88bqg168.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0142  ', N'SP040     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyotsiza08jx49.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0143  ', N'SP040     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxoxr8b9mjmj88.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0144  ', N'SP040     ', N'MS38      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyotsgljhpk1b5.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0145  ', N'SP041     ', N'MS39      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lw2akt9evs2j92.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0146  ', N'SP041     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lw2akt9ex6u1be.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0147  ', N'SP041     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lw2akt9f5m8pe3.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0148  ', N'SP042     ', N'MS40      ', N'https://down-vn.img.susercontent.com/file/9afdbf7fde0b16a3cc02ebcb41e9ce9f.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0149  ', N'SP043     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdxc-lxqdkpshxgme2d.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0150  ', N'SP043     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdyc-lxqdkr4810lof8.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0151  ', N'SP044     ', N'MS17      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdvp-lxmab0fyef6od0.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0152  ', N'SP044     ', N'MS36      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdxb-lxmab3htxmruf4.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0153  ', N'SP045     ', N'MS41      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lw2phlsrsu6x6c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0154  ', N'SP045     ', N'MS42      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxanzb9o3t2345.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0155  ', N'SP045     ', N'MS43      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxallqv66biz65.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0156  ', N'SP045     ', N'MS44      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxdkaejvp8ezaf.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0157  ', N'SP045     ', N'MS45      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxallqv67q3f51.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0158  ', N'SP046     ', N'MS42      ', N'https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-lxgdjcoluswpbf.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0159  ', N'SP046     ', N'MS45      ', N'https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-lxgdjdiancux97.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0160  ', N'SP047     ', N'MS37      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdvq-lzahf7n6zju4df.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0161  ', N'SP048     ', N'MS46      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ly7fadt9ah7l55.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0162  ', N'SP048     ', N'MS47      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ly7fadt9dach36.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0163  ', N'SP049     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsdqurhm1j2c79.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0164  ', N'SP049     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsdqurhm4c78f0.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0165  ', N'SP050     ', N'MS05      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdyh-lziraps98x9wdd.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0166  ', N'SP050     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdvf-lyuex79pdssm4d.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0167  ', N'SP051     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyx44lw4x9al15.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0168  ', N'SP051     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyx44lw4x9k18c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0169  ', N'SP052     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-23020-5p09d6wumhnv33.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0170  ', N'SP052     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lheocibl9b5t21.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0171  ', N'SP052     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-m02rw091gbkfc5.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0172  ', N'SP053     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lrqqx3w6wptw06.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0173  ', N'SP053     ', N'MS07      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lrqqx3w5z061d2.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0174  ', N'SP053     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lrqqx3w6y4eccd.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0175  ', N'SP053     ', N'MS05      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lrqqx3w6ziys49.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0176  ', N'SP053     ', N'MS17      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lrqqx3w6vb9gf2.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0177  ', N'SP054     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyq9msd8d7dtd0.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0178  ', N'SP054     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxt3zdc552orb5.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0179  ', N'SP054     ', N'MS20      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxmsl7xkx5nd6f.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0180  ', N'SP054     ', N'MS09      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxt3zdc5kj4pfb.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0181  ', N'SP054     ', N'MS11      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxt3zdc552vt94.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0182  ', N'SP055     ', N'MS37      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rcez-lt6l2nlvpgbu9a.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0183  ', N'SP056     ', N'MS37      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rd4g-lv03b4spzlfz20.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0184  ', N'SP056     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rd3s-lv03b5ar97jd65.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0185  ', N'SP057     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lw19bcblwo2h64.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0186  ', N'SP058     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdvf-lzira3cu2gw64c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0187  ', N'SP058     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rdw8-lz64ww64549l71.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0188  ', N'SP059     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lrzj7dww5cwpef.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0189  ', N'SP059     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lrzj7dww6rh5dc.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0190  ', N'SP060     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lm06bmuhuva74e.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0191  ', N'SP060     ', N'MS17      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lm06bmuhw9une3.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0192  ', N'SP060     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lm06bmuhp90f1a.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0193  ', N'SP061     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rd66-lxalyvt7sx9cb2.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0194  ', N'SP061     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyhkl8j4rhhpbf.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0195  ', N'SP062     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxy7hes02qjd2c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0196  ', N'SP062     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxy7vry59byz75.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0198  ', N'SP063     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyt9gu13rjj5a0.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0199  ', N'SP063     ', N'MS11      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyt9ffvd7f4dbd.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0200  ', N'SP063     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyt9fo5d3cf51b.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0201  ', N'SP063     ', N'MS48      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyt9ffvd60td7f.webp')
GO
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0202  ', N'SP063     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyt9fo5d4qq5a5.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0203  ', N'SP064     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-luu4g7v8aryq72.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0204  ', N'SP064     ', N'MS07      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-luu4g7v89dea26.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0205  ', N'SP064     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-luu4g7v855oy93.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0206  ', N'SP064     ', N'MS04      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lufvgwr8c6xxfe.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0207  ', N'SP065     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lypy0safd8dde4.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0208  ', N'SP065     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lypy0x08gqld94.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0209  ', N'SP065     ', N'MS17      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lypy0uqxrp71f5.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0210  ', N'SP066     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rcfa-lsco9c2ceatb09.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0211  ', N'SP067     ', N'MS36      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rbkd-llev7yc8yagle1.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0212  ', N'SP067     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rd52-lvlihbo87yfa43.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0213  ', N'SP068     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz0cydbqlhe5fa.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0214  ', N'SP069     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lx6vrmr8c0kb68.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0215  ', N'SP069     ', N'MS10      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lx6vrmr8etp7f5.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0216  ', N'SP069     ', N'MS21      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lx6vrmr826l7b9.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0217  ', N'SP070     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lt4r40vz06o407.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0218  ', N'SP070     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lt4r40vz2zt06d.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0219  ', N'SP071     ', N'MS45      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lqx72p9sq2tg17.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0220  ', N'SP071     ', N'MS49      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsjfl8672tg938.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0221  ', N'SP072     ', N'MS10      ', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rd3u-lwfgcj8vfq1r25.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0222  ', N'SP073     ', N'MS43      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdxm-lzzq5z3hmf7837.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0223  ', N'SP074     ', N'MS09      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxb1noqd1azdc5.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0224  ', N'SP074     ', N'MS48      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxb1noq4dgpn1a.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0225  ', N'SP074     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxb1noq3tsrfd2.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0226  ', N'SP074     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxb1noq4khjv09.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0227  ', N'SP075     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdx4-lylojtxp0t42ee.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0228  ', N'SP076     ', N'MS20      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lx98hcho5nmhd3.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0229  ', N'SP077     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lv1pq9z0g73t72.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0230  ', N'SP078     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyhge7qkw2w173.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0231  ', N'SP079     ', N'MS07      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwfucgltsjbvff.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0232  ', N'SP079     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwfucgltwr1735.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0233  ', N'SP079     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwfucglty5lnb6.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0234  ', N'SP080     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rd6c-lu09kdsq2o5wd6.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0235  ', N'SP081     ', N'MS20      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdyk-lzfpvbyyg0efe4.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0236  ', N'SP081     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdxa-lzir9f8nbjt308.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0237  ', N'SP082     ', N'MS50      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lw3qvt8ndujd4a.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0238  ', N'SP082     ', N'MS51      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lw3qvt8nf93tb9.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0239  ', N'SP082     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxqrxbiog2qj42.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0240  ', N'SP083     ', N'MS50      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxsmyzaysu6z33.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0241  ', N'SP084     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwxzd2b7zdgba7.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0242  ', N'SP085     ', N'MS52      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxngjtam33kp92.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0243  ', N'SP085     ', N'MS53      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxs034lypj2x74.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0244  ', N'SP085     ', N'MS06      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxs0383nll97de.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0245  ', N'SP085     ', N'MS54      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxs030egv7x769.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0246  ', N'SP086     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lveul70horqc38.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0247  ', N'SP086     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lv68z976ivw9f0.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0248  ', N'SP087     ', N'MS07      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyuv7472ftsxaa.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0249  ', N'SP087     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyuv52heb5i9d0.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0250  ', N'SP087     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyukc9gp93fl2b.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0251  ', N'SP088     ', N'MS55      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lx2l1hrc9mmxc6.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0252  ', N'SP088     ', N'MS56      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lx2l1hrcywux2b.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0253  ', N'SP089     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ly4shz8xdm8319.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0254  ', N'SP090     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzfzdn471wo1c2.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0255  ', N'SP091     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-ljeep2phdxqka8.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0256  ', N'SP092     ', N'MS10      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsm870z6jqu159.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0257  ', N'SP093     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rbnc-lm0sfu807dxnbb.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0258  ', N'SP094     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lynwc3bjqg0xa6.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0259  ', N'SP095     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyf2ujex99hp6f.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0260  ', N'SP096     ', N'MS06      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzn1dcwp13tt98.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0261  ', N'SP097     ', N'MS06      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lnvhqewnge7hd6.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0262  ', N'SP097     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lnvhqewnc6i57f.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0263  ', N'SP098     ', N'MS20      ', N'https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-lo12k5r1ysq5e8.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0264  ', N'SP099     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lprm18rqq4sye1.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0265  ', N'SP099     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lprm18rqlx3m52.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0266  ', N'SP099     ', N'MS09      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lprm18rqkij639.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0267  ', N'SP100     ', NULL, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyn5vjw731r57c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0268  ', N'SP101     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzsn26kex19dca.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0269  ', N'SP101     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzsn26kex0zx1b.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0270  ', N'SP102     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lywgcz7wwll93d.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0271  ', N'SP102     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lqmbf82v8e6qce.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0272  ', N'SP102     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lza7klwu39l913.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0273  ', N'SP103     ', N'MS14      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvantak8h9pg4f.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0274  ', N'SP103     ', N'MS17      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvantak8r3okd9.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0275  ', N'SP103     ', N'MS07      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvantak8io9w95.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0276  ', N'SP103     ', N'MS11      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvantak8pp44cd.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0277  ', N'SP103     ', N'MS35      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvantak8k2uc44.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0278  ', N'SP103     ', N'MS04      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvantak8mvz89a.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0279  ', N'SP103     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxgu5zf2ypcpbe.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0280  ', N'SP104     ', N'MS57      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lre8fiz4pjusa7.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0281  ', N'SP104     ', N'MS38      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lre8fiz4qyf845.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0282  ', N'SP104     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lre8fiz4sczod8.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0283  ', N'SP104     ', N'MS58      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lre8fizf1sbdeb.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0284  ', N'SP104     ', N'MS11      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lre8fiz4v64kcd.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0285  ', N'SP104     ', N'MS59      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lre8fiz4wkp036.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0286  ', N'SP105     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyw6h0t38uch45.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0287  ', N'SP105     ', N'MS48      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyw6h2b71nppba.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0288  ', N'SP105     ', N'MS09      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyw6h4ntltpd8e.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0289  ', N'SP105     ', N'MS07      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyw6h6kd4ril0c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0290  ', N'SP106     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/5e3bab37629ae34fbf98e0e82a8c02f8.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0291  ', N'SP106     ', N'MS52      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lhek57c8aoat3f.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0292  ', N'SP106     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lfp3hekmikxw7e.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0293  ', N'SP106     ', N'MS17      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lfp3hekmfrt0f4.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0294  ', N'SP107     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzbj04nd3zv152.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0295  ', N'SP107     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzbj04nd404he9.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0296  ', N'SP108     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lkwlw5nx1p0d32.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0297  ', N'SP108     ', N'MS07      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lkwlw5nxbizhba.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0298  ', N'SP108     ', N'MS14      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lt3wko296emx9c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0299  ', N'SP109     ', N'MS17      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lypzikupfw3x15.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0300  ', N'SP109     ', N'MS06      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ln6rb850yhg818.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0301  ', N'SP109     ', N'MS09      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ln6rb8512p5ke2.webp')
GO
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0302  ', N'SP110     ', N'MS07      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lygd6rre107h99.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0303  ', N'SP110     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lygcoiezyz4dab.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0304  ', N'SP111     ', N'MS04      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdw3-lyc2gex1mzl611.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0305  ', N'SP112     ', N'MS17      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyxg5esm5rnx87.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0306  ', N'SP112     ', N'MS06      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwdvdltq0q8p81.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0307  ', N'SP112     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwdvdltpwijd66.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0308  ', N'SP112     ', N'MS09      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ly4mq9puuzkg79.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0309  ', N'SP113     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lkjg0yzcgqdsfe.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0310  ', N'SP113     ', N'MS07      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lkjg6cljlkveb1.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0311  ', N'SP113     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmemsgv8h0wvb4.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0312  ', N'SP114     ', N'MS17      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyegr8jr0uh9ec.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0313  ', N'SP114     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyegr8jr3nm5a1.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0314  ', N'SP114     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyegr8jr29b59e.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0315  ', N'SP115     ', N'MS60      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwmj5k7nc0rf7e.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0316  ', N'SP116     ', N'MS61      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyxcizgf7wwd7b.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0317  ', N'SP117     ', N'MS62      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz99v1xo5k5p6c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0318  ', N'SP117     ', N'MS63      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz99v4jgcbs12e.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0319  ', N'SP118     ', N'MS64      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxim9rrczftl75.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0320  ', N'SP119     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lshvtlnu2kzo43.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0321  ', N'SP119     ', N'MS65      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsib5w0ejlaxb2.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0322  ', N'SP120     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz1ygmqhpoi5e9.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0323  ', N'SP120     ', N'MS65      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-m02v1vmui299d5.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0324  ', N'SP121     ', N'MS66      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lw5j253te3mh9c@resize_w450_nl.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0325  ', N'SP121     ', N'MS67      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lpk0e8nxrf3pcd.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0326  ', N'SP121     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lpk0e8nxq0j913.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0327  ', N'SP121     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lpk0e8nxsto5df.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0328  ', N'SP122     ', N'MS03      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyv1heblly6l50.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0329  ', N'SP122     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyv1heblkjm5bd.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0330  ', N'SP122     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyv1heedghpd89.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0331  ', N'SP123     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwkvjxw65ihlba.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0332  ', N'SP123     ', N'MS07      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwkvjxw68bmhd3.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0333  ', N'SP123     ', N'MS65      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyqe1ursgthp6d.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0334  ', N'SP123     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwkvjxw69q6x64.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0335  ', N'SP124     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rccq-lsm5dg7ls6l1a5.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0336  ', N'SP124     ', N'MS67      ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rces-lsm5dhaq6xucd3.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0337  ', N'SP125     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lu9asdfaha1r81.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0338  ', N'SP125     ', N'MS67      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lu85g2qxvkm744.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0339  ', N'SP126     ', N'MS14      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzp1cccvnz9p75.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0340  ', N'SP127     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyk4t9eza4p94b.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0341  ', N'SP128     ', N'MS14      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltnmzhe6agp63c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0342  ', N'SP129     ', N'MS20      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ln45c93ftmb735.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0343  ', N'SP130     ', N'MS02      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lnfjx9sbbptmd9.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0344  ', N'SP130     ', N'MS17      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lnfjx9sbd4e236.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0345  ', N'SP130     ', N'MS09      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lnfkt33sxrsd3c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0346  ', N'SP130     ', N'MS06      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lnfkt33sz6ct95.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0347  ', N'SP130     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lnfkt33t0kx984.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0348  ', N'SP130     ', N'MS14      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lnfkt33t7lrh83.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0349  ', N'SP131     ', N'MS68      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxqndzzggzbt5d.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0350  ', N'SP131     ', N'MS65      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxxv6dw9bzrt06.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0351  ', N'SP132     ', N'MS67      ', N'https://down-vn.img.susercontent.com/file/80d1f92002d0c431c98aff7614b4e35d.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0352  ', N'SP132     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyyvyul3si19d3.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0353  ', N'SP132     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyyw65n8u3s137.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0354  ', N'SP133     ', N'MS67      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltb1u88cvd7da6.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0355  ', N'SP133     ', N'MS69      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyf16c14x5cdc2.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0356  ', N'SP133     ', N'MS70      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lu22juverpcv7c.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0357  ', N'SP134     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzss3c2hg7fl68.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0358  ', N'SP134     ', N'MS69      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzss3c2hhlqlda.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0359  ', N'SP134     ', N'MS70      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzss2p9gv2jld3.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0360  ', N'SP135     ', N'MS01      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lw8h6s2u3o49b6.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0361  ', N'SP135     ', N'MS18      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwrz2u45kyqjb3.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0362  ', N'SP135     ', N'MS67      ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-m06xwrwa4yvj11.webp')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0363  ', N'SP136     ', N'MS01      ', N'/LayoutShop/img/a4c493bf-89b8-4e43-a977-9b38f083d425.png')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0364  ', N'SP136     ', N'MS71      ', N'/LayoutShop/img/6adf6e39-520f-4379-9d09-6e8fd2dced42.png')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0365  ', N'SP136     ', N'MS72      ', N'/LayoutShop/img/a1469a08-9c94-4f11-911a-d46caf3eeabe.png')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0366  ', N'SP136     ', N'MS73      ', N'/LayoutShop/img/4dc70c15-db93-4692-9f79-f4693ba19008.png')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0367  ', N'SP137     ', N'MS74      ', N'/LayoutShop/img/77e4aa6d-95e5-47a5-9a52-3f175295cb94.png')
INSERT [dbo].[CTSP] ([MaCTSP], [MaSP], [MaMS], [HinhAnh]) VALUES (N'CTSP0368  ', N'SP137     ', N'MS75      ', N'/LayoutShop/img/f68ce12f-d7a3-4be5-98ca-5351e1e192cd.png')
GO
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0001 ', N'CTSP0001  ', N'S03       ', CAST(119.000 AS Decimal(18, 3)), 46)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0002 ', N'CTSP0001  ', N'S04       ', CAST(119.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0003 ', N'CTSP0001  ', N'S05       ', CAST(119.000 AS Decimal(18, 3)), 20)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0004 ', N'CTSP0002  ', N'S03       ', CAST(119.000 AS Decimal(18, 3)), 20)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0005 ', N'CTSP0002  ', N'S04       ', CAST(119.000 AS Decimal(18, 3)), 15)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0006 ', N'CTSP0002  ', N'S05       ', CAST(119.000 AS Decimal(18, 3)), 35)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0007 ', N'CTSP0003  ', N'S03       ', CAST(119.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0008 ', N'CTSP0003  ', N'S04       ', CAST(119.000 AS Decimal(18, 3)), 25)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0009 ', N'CTSP0003  ', N'S05       ', CAST(119.000 AS Decimal(18, 3)), 49)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0010 ', N'CTSP0004  ', N'S03       ', CAST(119.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0011 ', N'CTSP0004  ', N'S04       ', CAST(119.000 AS Decimal(18, 3)), 50)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0012 ', N'CTSP0004  ', N'S05       ', CAST(119.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0013 ', N'CTSP0005  ', N'S03       ', CAST(99.000 AS Decimal(18, 3)), 63)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0014 ', N'CTSP0005  ', N'S04       ', CAST(99.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0015 ', N'CTSP0005  ', N'S05       ', CAST(99.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0016 ', N'CTSP0006  ', N'S03       ', CAST(99.000 AS Decimal(18, 3)), 25)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0017 ', N'CTSP0006  ', N'S04       ', CAST(99.000 AS Decimal(18, 3)), 74)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0018 ', N'CTSP0006  ', N'S05       ', CAST(99.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0019 ', N'CTSP0007  ', N'S03       ', CAST(99.000 AS Decimal(18, 3)), 24)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0020 ', N'CTSP0007  ', N'S04       ', CAST(99.000 AS Decimal(18, 3)), 24)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0021 ', N'CTSP0007  ', N'S05       ', CAST(99.000 AS Decimal(18, 3)), 84)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0022 ', N'CTSP0008  ', N'S03       ', CAST(119.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0023 ', N'CTSP0008  ', N'S04       ', CAST(119.000 AS Decimal(18, 3)), 53)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0024 ', N'CTSP0008  ', N'S05       ', CAST(119.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0025 ', N'CTSP0009  ', N'S03       ', CAST(119.000 AS Decimal(18, 3)), 74)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0026 ', N'CTSP0009  ', N'S04       ', CAST(119.000 AS Decimal(18, 3)), 35)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0027 ', N'CTSP0009  ', N'S05       ', CAST(119.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0028 ', N'CTSP0010  ', N'S03       ', CAST(119.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0029 ', N'CTSP0010  ', N'S04       ', CAST(119.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0030 ', N'CTSP0010  ', N'S05       ', CAST(119.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0031 ', N'CTSP0011  ', N'S03       ', CAST(139.000 AS Decimal(18, 3)), 11)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0032 ', N'CTSP0011  ', N'S04       ', CAST(139.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0033 ', N'CTSP0011  ', N'S05       ', CAST(139.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0034 ', N'CTSP0012  ', N'S03       ', CAST(89.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0035 ', N'CTSP0012  ', N'S04       ', CAST(89.000 AS Decimal(18, 3)), 34)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0036 ', N'CTSP0012  ', N'S05       ', CAST(89.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0037 ', N'CTSP0013  ', N'S02       ', CAST(59.900 AS Decimal(18, 3)), 124)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0038 ', N'CTSP0013  ', N'S03       ', CAST(59.900 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0039 ', N'CTSP0013  ', N'S04       ', CAST(59.900 AS Decimal(18, 3)), 42)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0040 ', N'CTSP0013  ', N'S05       ', CAST(59.900 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0041 ', N'CTSP0013  ', N'S06       ', CAST(59.900 AS Decimal(18, 3)), 24)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0042 ', N'CTSP0014  ', N'S02       ', CAST(59.900 AS Decimal(18, 3)), 53)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0043 ', N'CTSP0014  ', N'S03       ', CAST(59.900 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0044 ', N'CTSP0014  ', N'S04       ', CAST(37.900 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0045 ', N'CTSP0014  ', N'S05       ', CAST(37.900 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0046 ', N'CTSP0014  ', N'S06       ', CAST(37.900 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0047 ', N'CTSP0015  ', N'S02       ', CAST(49.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0048 ', N'CTSP0015  ', N'S03       ', CAST(49.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0049 ', N'CTSP0015  ', N'S04       ', CAST(49.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0050 ', N'CTSP0015  ', N'S05       ', CAST(49.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0051 ', N'CTSP0015  ', N'S06       ', CAST(49.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0052 ', N'CTSP0016  ', N'S02       ', CAST(49.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0053 ', N'CTSP0016  ', N'S03       ', CAST(49.000 AS Decimal(18, 3)), 33)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0054 ', N'CTSP0016  ', N'S04       ', CAST(49.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0055 ', N'CTSP0016  ', N'S05       ', CAST(49.000 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0056 ', N'CTSP0016  ', N'S06       ', CAST(49.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0057 ', N'CTSP0017  ', N'S02       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0058 ', N'CTSP0017  ', N'S03       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0059 ', N'CTSP0017  ', N'S04       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0060 ', N'CTSP0017  ', N'S05       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0061 ', N'CTSP0018  ', N'S02       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0062 ', N'CTSP0018  ', N'S03       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0063 ', N'CTSP0018  ', N'S04       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0064 ', N'CTSP0018  ', N'S05       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0065 ', N'CTSP0019  ', N'S02       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0066 ', N'CTSP0019  ', N'S03       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0067 ', N'CTSP0019  ', N'S04       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0068 ', N'CTSP0019  ', N'S05       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0069 ', N'CTSP0020  ', N'S02       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0070 ', N'CTSP0020  ', N'S03       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0071 ', N'CTSP0020  ', N'S04       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0072 ', N'CTSP0020  ', N'S05       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0073 ', N'CTSP0021  ', N'S02       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0074 ', N'CTSP0021  ', N'S03       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0075 ', N'CTSP0021  ', N'S04       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0076 ', N'CTSP0021  ', N'S05       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0077 ', N'CTSP0022  ', N'S02       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0078 ', N'CTSP0022  ', N'S03       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0079 ', N'CTSP0022  ', N'S04       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0080 ', N'CTSP0022  ', N'S05       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0081 ', N'CTSP0023  ', N'S02       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0082 ', N'CTSP0023  ', N'S03       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0083 ', N'CTSP0023  ', N'S04       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0084 ', N'CTSP0023  ', N'S05       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0085 ', N'CTSP0024  ', N'S02       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0086 ', N'CTSP0024  ', N'S03       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0087 ', N'CTSP0024  ', N'S04       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0088 ', N'CTSP0024  ', N'S05       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0089 ', N'CTSP0025  ', N'S02       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0090 ', N'CTSP0025  ', N'S03       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0091 ', N'CTSP0025  ', N'S04       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0092 ', N'CTSP0025  ', N'S05       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0093 ', N'CTSP0026  ', N'S02       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0094 ', N'CTSP0026  ', N'S03       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0095 ', N'CTSP0026  ', N'S04       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0096 ', N'CTSP0026  ', N'S05       ', CAST(59.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0097 ', N'CTSP0027  ', N'S10       ', CAST(59.000 AS Decimal(18, 3)), 10)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0098 ', N'CTSP0028  ', N'S10       ', CAST(59.000 AS Decimal(18, 3)), 79)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0099 ', N'CTSP0029  ', N'S10       ', CAST(59.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0100 ', N'CTSP0030  ', N'S10       ', CAST(59.000 AS Decimal(18, 3)), 34)
GO
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0101 ', N'CTSP0031  ', N'S10       ', CAST(59.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0102 ', N'CTSP0032  ', N'S02       ', CAST(119.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0103 ', N'CTSP0032  ', N'S03       ', CAST(114.940 AS Decimal(18, 3)), 98)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0104 ', N'CTSP0032  ', N'S04       ', CAST(119.000 AS Decimal(18, 3)), 65)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0105 ', N'CTSP0032  ', N'S05       ', CAST(114.940 AS Decimal(18, 3)), 67)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0106 ', N'CTSP0033  ', N'S02       ', CAST(119.000 AS Decimal(18, 3)), 8)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0107 ', N'CTSP0033  ', N'S03       ', CAST(114.940 AS Decimal(18, 3)), 97)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0108 ', N'CTSP0033  ', N'S04       ', CAST(119.000 AS Decimal(18, 3)), 98)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0109 ', N'CTSP0033  ', N'S05       ', CAST(114.940 AS Decimal(18, 3)), 65)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0110 ', N'CTSP0034  ', N'S02       ', CAST(119.000 AS Decimal(18, 3)), 86)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0111 ', N'CTSP0034  ', N'S03       ', CAST(114.940 AS Decimal(18, 3)), 8)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0112 ', N'CTSP0034  ', N'S04       ', CAST(119.000 AS Decimal(18, 3)), 46)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0113 ', N'CTSP0034  ', N'S05       ', CAST(114.940 AS Decimal(18, 3)), 76)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0114 ', N'CTSP0035  ', N'S03       ', CAST(119.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0115 ', N'CTSP0035  ', N'S04       ', CAST(119.000 AS Decimal(18, 3)), 52)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0116 ', N'CTSP0035  ', N'S05       ', CAST(119.000 AS Decimal(18, 3)), 13)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0117 ', N'CTSP0036  ', N'S03       ', CAST(119.000 AS Decimal(18, 3)), 45)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0118 ', N'CTSP0036  ', N'S04       ', CAST(119.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0119 ', N'CTSP0036  ', N'S05       ', CAST(119.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0120 ', N'CTSP0037  ', N'S03       ', CAST(119.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0121 ', N'CTSP0037  ', N'S04       ', CAST(119.000 AS Decimal(18, 3)), 13)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0122 ', N'CTSP0037  ', N'S05       ', CAST(119.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0123 ', N'CTSP0038  ', N'S03       ', CAST(119.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0124 ', N'CTSP0038  ', N'S04       ', CAST(119.000 AS Decimal(18, 3)), 94)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0125 ', N'CTSP0038  ', N'S05       ', CAST(119.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0126 ', N'CTSP0039  ', N'S03       ', CAST(139.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0127 ', N'CTSP0039  ', N'S04       ', CAST(139.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0128 ', N'CTSP0039  ', N'S05       ', CAST(139.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0129 ', N'CTSP0040  ', N'S03       ', CAST(139.000 AS Decimal(18, 3)), 47)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0130 ', N'CTSP0040  ', N'S04       ', CAST(139.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0131 ', N'CTSP0040  ', N'S05       ', CAST(139.000 AS Decimal(18, 3)), 34)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0132 ', N'CTSP0041  ', N'S03       ', CAST(139.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0133 ', N'CTSP0041  ', N'S04       ', CAST(139.000 AS Decimal(18, 3)), 74)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0134 ', N'CTSP0041  ', N'S05       ', CAST(139.000 AS Decimal(18, 3)), 68)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0135 ', N'CTSP0042  ', N'S03       ', CAST(139.000 AS Decimal(18, 3)), 13)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0136 ', N'CTSP0042  ', N'S04       ', CAST(139.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0137 ', N'CTSP0042  ', N'S05       ', CAST(139.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0138 ', N'CTSP0043  ', N'S03       ', CAST(139.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0139 ', N'CTSP0043  ', N'S04       ', CAST(139.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0140 ', N'CTSP0043  ', N'S05       ', CAST(139.000 AS Decimal(18, 3)), 11)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0141 ', N'CTSP0044  ', N'S10       ', CAST(49.000 AS Decimal(18, 3)), 67)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0142 ', N'CTSP0045  ', N'S10       ', CAST(49.000 AS Decimal(18, 3)), 53)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0143 ', N'CTSP0046  ', N'S10       ', CAST(49.000 AS Decimal(18, 3)), 54)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0144 ', N'CTSP0047  ', N'S10       ', CAST(49.000 AS Decimal(18, 3)), 33)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0145 ', N'CTSP0048  ', N'S02       ', CAST(48.400 AS Decimal(18, 3)), 42)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0146 ', N'CTSP0048  ', N'S03       ', CAST(48.400 AS Decimal(18, 3)), 45)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0147 ', N'CTSP0048  ', N'S04       ', CAST(48.400 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0148 ', N'CTSP0049  ', N'S03       ', CAST(99.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0149 ', N'CTSP0049  ', N'S04       ', CAST(77.400 AS Decimal(18, 3)), 44)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0150 ', N'CTSP0049  ', N'S05       ', CAST(77.400 AS Decimal(18, 3)), 65)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0151 ', N'CTSP0050  ', N'S02       ', CAST(73.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0152 ', N'CTSP0050  ', N'S03       ', CAST(73.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0153 ', N'CTSP0050  ', N'S04       ', CAST(73.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0154 ', N'CTSP0050  ', N'S05       ', CAST(73.000 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0155 ', N'CTSP0051  ', N'S02       ', CAST(73.000 AS Decimal(18, 3)), 76)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0156 ', N'CTSP0051  ', N'S03       ', CAST(73.000 AS Decimal(18, 3)), 65)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0157 ', N'CTSP0051  ', N'S04       ', CAST(73.000 AS Decimal(18, 3)), 42)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0158 ', N'CTSP0051  ', N'S05       ', CAST(73.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0159 ', N'CTSP0052  ', N'S02       ', CAST(199.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0160 ', N'CTSP0052  ', N'S03       ', CAST(199.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0161 ', N'CTSP0052  ', N'S04       ', CAST(199.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0162 ', N'CTSP0053  ', N'S02       ', CAST(199.000 AS Decimal(18, 3)), 7)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0163 ', N'CTSP0053  ', N'S03       ', CAST(199.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0164 ', N'CTSP0053  ', N'S04       ', CAST(199.000 AS Decimal(18, 3)), 7)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0165 ', N'CTSP0054  ', N'S02       ', CAST(199.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0166 ', N'CTSP0054  ', N'S03       ', CAST(199.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0167 ', N'CTSP0054  ', N'S04       ', CAST(199.000 AS Decimal(18, 3)), 8)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0168 ', N'CTSP0055  ', N'S02       ', CAST(199.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0169 ', N'CTSP0055  ', N'S03       ', CAST(199.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0170 ', N'CTSP0055  ', N'S04       ', CAST(199.000 AS Decimal(18, 3)), 9)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0171 ', N'CTSP0056  ', N'S02       ', CAST(199.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0172 ', N'CTSP0056  ', N'S03       ', CAST(199.000 AS Decimal(18, 3)), 24)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0173 ', N'CTSP0056  ', N'S04       ', CAST(199.000 AS Decimal(18, 3)), 8)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0174 ', N'CTSP0057  ', N'S02       ', CAST(199.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0175 ', N'CTSP0057  ', N'S03       ', CAST(199.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0176 ', N'CTSP0057  ', N'S04       ', CAST(199.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0177 ', N'CTSP0058  ', N'S02       ', CAST(199.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0178 ', N'CTSP0058  ', N'S03       ', CAST(199.000 AS Decimal(18, 3)), 10)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0179 ', N'CTSP0058  ', N'S04       ', CAST(199.000 AS Decimal(18, 3)), 8)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0180 ', N'CTSP0059  ', N'S02       ', CAST(199.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0181 ', N'CTSP0059  ', N'S03       ', CAST(199.000 AS Decimal(18, 3)), 7)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0182 ', N'CTSP0059  ', N'S04       ', CAST(199.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0183 ', N'CTSP0060  ', N'S02       ', CAST(199.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0184 ', N'CTSP0060  ', N'S03       ', CAST(199.000 AS Decimal(18, 3)), 16)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0185 ', N'CTSP0060  ', N'S04       ', CAST(199.000 AS Decimal(18, 3)), 9)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0186 ', N'CTSP0061  ', N'S02       ', CAST(199.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0187 ', N'CTSP0061  ', N'S03       ', CAST(199.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0188 ', N'CTSP0061  ', N'S04       ', CAST(199.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0189 ', N'CTSP0062  ', N'S02       ', CAST(139.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0190 ', N'CTSP0062  ', N'S03       ', CAST(139.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0191 ', N'CTSP0062  ', N'S04       ', CAST(139.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0192 ', N'CTSP0063  ', N'S02       ', CAST(139.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0193 ', N'CTSP0063  ', N'S03       ', CAST(139.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0194 ', N'CTSP0063  ', N'S04       ', CAST(139.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0195 ', N'CTSP0064  ', N'S03       ', CAST(139.000 AS Decimal(18, 3)), 129)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0196 ', N'CTSP0064  ', N'S04       ', CAST(139.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0197 ', N'CTSP0064  ', N'S05       ', CAST(139.000 AS Decimal(18, 3)), 54)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0198 ', N'CTSP0065  ', N'S03       ', CAST(139.000 AS Decimal(18, 3)), 56)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0199 ', N'CTSP0065  ', N'S04       ', CAST(139.000 AS Decimal(18, 3)), 67)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0200 ', N'CTSP0065  ', N'S05       ', CAST(139.000 AS Decimal(18, 3)), 43)
GO
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0201 ', N'CTSP0066  ', N'S03       ', CAST(139.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0202 ', N'CTSP0066  ', N'S04       ', CAST(139.000 AS Decimal(18, 3)), 44)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0203 ', N'CTSP0066  ', N'S05       ', CAST(139.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0204 ', N'CTSP0067  ', N'S03       ', CAST(139.000 AS Decimal(18, 3)), 66)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0205 ', N'CTSP0067  ', N'S04       ', CAST(139.000 AS Decimal(18, 3)), 75)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0206 ', N'CTSP0067  ', N'S05       ', CAST(139.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0207 ', N'CTSP0068  ', N'S03       ', CAST(139.000 AS Decimal(18, 3)), 7)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0208 ', N'CTSP0068  ', N'S04       ', CAST(139.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0209 ', N'CTSP0068  ', N'S05       ', CAST(139.000 AS Decimal(18, 3)), 33)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0210 ', N'CTSP0069  ', N'S02       ', CAST(69.000 AS Decimal(18, 3)), 71)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0211 ', N'CTSP0069  ', N'S03       ', CAST(69.000 AS Decimal(18, 3)), 70)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0212 ', N'CTSP0069  ', N'S04       ', CAST(69.000 AS Decimal(18, 3)), 33)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0213 ', N'CTSP0069  ', N'S05       ', CAST(69.000 AS Decimal(18, 3)), 50)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0214 ', N'CTSP0070  ', N'S10       ', CAST(45.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0215 ', N'CTSP0071  ', N'S10       ', CAST(45.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0216 ', N'CTSP0072  ', N'S10       ', CAST(45.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0217 ', N'CTSP0073  ', N'S10       ', CAST(45.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0218 ', N'CTSP0074  ', N'S10       ', CAST(45.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0219 ', N'CTSP0075  ', N'S02       ', CAST(23.700 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0220 ', N'CTSP0075  ', N'S03       ', CAST(23.700 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0221 ', N'CTSP0076  ', N'S02       ', CAST(23.700 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0222 ', N'CTSP0076  ', N'S03       ', CAST(23.700 AS Decimal(18, 3)), 11)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0223 ', N'CTSP0077  ', N'S02       ', CAST(23.700 AS Decimal(18, 3)), 18)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0224 ', N'CTSP0077  ', N'S03       ', CAST(23.700 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0225 ', N'CTSP0078  ', N'S02       ', CAST(23.700 AS Decimal(18, 3)), 13)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0226 ', N'CTSP0078  ', N'S03       ', CAST(23.700 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0227 ', N'CTSP0079  ', N'S02       ', CAST(23.700 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0228 ', N'CTSP0079  ', N'S03       ', CAST(23.700 AS Decimal(18, 3)), 16)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0229 ', N'CTSP0080  ', N'S10       ', CAST(55.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0230 ', N'CTSP0081  ', N'S10       ', CAST(55.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0231 ', N'CTSP0082  ', N'S10       ', CAST(55.000 AS Decimal(18, 3)), 231)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0232 ', N'CTSP0083  ', N'S10       ', CAST(55.000 AS Decimal(18, 3)), 121)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0233 ', N'CTSP0084  ', N'S02       ', CAST(58.100 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0234 ', N'CTSP0084  ', N'S03       ', CAST(58.100 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0235 ', N'CTSP0085  ', N'S02       ', CAST(58.100 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0236 ', N'CTSP0085  ', N'S03       ', CAST(58.100 AS Decimal(18, 3)), 38)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0237 ', N'CTSP0086  ', N'S02       ', CAST(58.100 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0238 ', N'CTSP0086  ', N'S03       ', CAST(58.100 AS Decimal(18, 3)), 7)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0239 ', N'CTSP0087  ', N'S02       ', CAST(58.100 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0240 ', N'CTSP0087  ', N'S03       ', CAST(58.100 AS Decimal(18, 3)), 9)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0241 ', N'CTSP0088  ', N'S02       ', CAST(99.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0242 ', N'CTSP0088  ', N'S03       ', CAST(99.000 AS Decimal(18, 3)), 13)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0243 ', N'CTSP0088  ', N'S04       ', CAST(99.000 AS Decimal(18, 3)), 14)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0244 ', N'CTSP0088  ', N'S05       ', CAST(99.000 AS Decimal(18, 3)), 15)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0245 ', N'CTSP0089  ', N'S02       ', CAST(99.000 AS Decimal(18, 3)), 16)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0246 ', N'CTSP0089  ', N'S03       ', CAST(99.000 AS Decimal(18, 3)), 17)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0247 ', N'CTSP0089  ', N'S04       ', CAST(99.000 AS Decimal(18, 3)), 18)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0248 ', N'CTSP0089  ', N'S05       ', CAST(99.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0249 ', N'CTSP0090  ', N'S02       ', CAST(99.000 AS Decimal(18, 3)), 20)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0250 ', N'CTSP0090  ', N'S03       ', CAST(99.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0251 ', N'CTSP0090  ', N'S04       ', CAST(99.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0252 ', N'CTSP0090  ', N'S05       ', CAST(99.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0253 ', N'CTSP0091  ', N'S02       ', CAST(99.000 AS Decimal(18, 3)), 24)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0254 ', N'CTSP0091  ', N'S03       ', CAST(99.000 AS Decimal(18, 3)), 25)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0255 ', N'CTSP0091  ', N'S04       ', CAST(99.000 AS Decimal(18, 3)), 26)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0256 ', N'CTSP0091  ', N'S05       ', CAST(99.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0257 ', N'CTSP0092  ', N'S02       ', CAST(135.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0258 ', N'CTSP0092  ', N'S03       ', CAST(135.000 AS Decimal(18, 3)), 97)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0259 ', N'CTSP0092  ', N'S04       ', CAST(135.000 AS Decimal(18, 3)), 65)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0260 ', N'CTSP0092  ', N'S05       ', CAST(135.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0261 ', N'CTSP0092  ', N'S06       ', CAST(135.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0262 ', N'CTSP0093  ', N'S02       ', CAST(180.000 AS Decimal(18, 3)), 31)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0263 ', N'CTSP0093  ', N'S03       ', CAST(180.000 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0264 ', N'CTSP0093  ', N'S04       ', CAST(180.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0265 ', N'CTSP0094  ', N'S02       ', CAST(180.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0266 ', N'CTSP0094  ', N'S03       ', CAST(180.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0267 ', N'CTSP0094  ', N'S04       ', CAST(180.000 AS Decimal(18, 3)), 33)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0268 ', N'CTSP0095  ', N'S02       ', CAST(180.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0269 ', N'CTSP0095  ', N'S03       ', CAST(180.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0270 ', N'CTSP0095  ', N'S04       ', CAST(180.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0271 ', N'CTSP0096  ', N'S02       ', CAST(180.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0272 ', N'CTSP0096  ', N'S03       ', CAST(180.000 AS Decimal(18, 3)), 45)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0273 ', N'CTSP0096  ', N'S04       ', CAST(180.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0274 ', N'CTSP0097  ', N'S02       ', CAST(180.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0275 ', N'CTSP0097  ', N'S03       ', CAST(180.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0276 ', N'CTSP0097  ', N'S04       ', CAST(180.000 AS Decimal(18, 3)), 8)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0277 ', N'CTSP0098  ', N'S10       ', CAST(37.500 AS Decimal(18, 3)), 11)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0278 ', N'CTSP0099  ', N'S10       ', CAST(37.500 AS Decimal(18, 3)), 42)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0279 ', N'CTSP0100  ', N'S10       ', CAST(89.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0280 ', N'CTSP0101  ', N'S10       ', CAST(87.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0281 ', N'CTSP0102  ', N'S10       ', CAST(95.000 AS Decimal(18, 3)), 17)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0282 ', N'CTSP0103  ', N'S02       ', CAST(76.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0283 ', N'CTSP0103  ', N'S03       ', CAST(76.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0284 ', N'CTSP0103  ', N'S04       ', CAST(76.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0285 ', N'CTSP0104  ', N'S02       ', CAST(76.000 AS Decimal(18, 3)), 35)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0286 ', N'CTSP0104  ', N'S03       ', CAST(76.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0287 ', N'CTSP0104  ', N'S04       ', CAST(76.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0288 ', N'CTSP0105  ', N'S02       ', CAST(76.000 AS Decimal(18, 3)), 9)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0289 ', N'CTSP0105  ', N'S03       ', CAST(76.000 AS Decimal(18, 3)), 9)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0290 ', N'CTSP0105  ', N'S04       ', CAST(76.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0291 ', N'CTSP0106  ', N'S10       ', CAST(45.000 AS Decimal(18, 3)), 10)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0292 ', N'CTSP0107  ', N'S10       ', CAST(45.000 AS Decimal(18, 3)), 34)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0293 ', N'CTSP0108  ', N'S10       ', CAST(45.000 AS Decimal(18, 3)), 13)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0294 ', N'CTSP0109  ', N'S10       ', CAST(78.000 AS Decimal(18, 3)), 9)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0295 ', N'CTSP0110  ', N'S10       ', CAST(78.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0296 ', N'CTSP0111  ', N'S10       ', CAST(78.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0297 ', N'CTSP0112  ', N'S10       ', CAST(78.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0298 ', N'CTSP0113  ', N'S02       ', CAST(65.000 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0299 ', N'CTSP0113  ', N'S03       ', CAST(65.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0300 ', N'CTSP0114  ', N'S02       ', CAST(65.000 AS Decimal(18, 3)), 0)
GO
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0301 ', N'CTSP0114  ', N'S03       ', CAST(65.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0302 ', N'CTSP0115  ', N'S04       ', CAST(103.000 AS Decimal(18, 3)), 11)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0303 ', N'CTSP0115  ', N'S05       ', CAST(103.000 AS Decimal(18, 3)), 31)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0304 ', N'CTSP0116  ', N'S02       ', CAST(87.000 AS Decimal(18, 3)), 19)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0305 ', N'CTSP0116  ', N'S03       ', CAST(87.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0306 ', N'CTSP0116  ', N'S04       ', CAST(87.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0307 ', N'CTSP0116  ', N'S05       ', CAST(87.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0308 ', N'CTSP0117  ', N'S10       ', CAST(89.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0309 ', N'CTSP0118  ', N'S10       ', CAST(89.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0310 ', N'CTSP0119  ', N'S10       ', CAST(89.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0311 ', N'CTSP0120  ', N'S10       ', CAST(89.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0312 ', N'CTSP0121  ', N'S10       ', CAST(52.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0313 ', N'CTSP0122  ', N'S10       ', CAST(52.000 AS Decimal(18, 3)), 49)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0314 ', N'CTSP0123  ', N'S10       ', CAST(52.000 AS Decimal(18, 3)), 19)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0315 ', N'CTSP0124  ', N'S10       ', CAST(52.000 AS Decimal(18, 3)), 17)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0316 ', N'CTSP0125  ', N'S10       ', CAST(52.000 AS Decimal(18, 3)), 29)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0317 ', N'CTSP0126  ', N'S10       ', CAST(52.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0318 ', N'CTSP0127  ', N'S02       ', CAST(64.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0319 ', N'CTSP0127  ', N'S03       ', CAST(64.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0320 ', N'CTSP0127  ', N'S04       ', CAST(64.000 AS Decimal(18, 3)), 8)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0321 ', N'CTSP0127  ', N'S05       ', CAST(64.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0322 ', N'CTSP0128  ', N'S10       ', CAST(73.000 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0323 ', N'CTSP0129  ', N'S10       ', CAST(73.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0324 ', N'CTSP0130  ', N'S02       ', CAST(125.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0325 ', N'CTSP0130  ', N'S03       ', CAST(125.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0326 ', N'CTSP0130  ', N'S04       ', CAST(125.000 AS Decimal(18, 3)), 42)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0327 ', N'CTSP0130  ', N'S05       ', CAST(125.000 AS Decimal(18, 3)), 24)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0328 ', N'CTSP0131  ', N'S02       ', CAST(125.000 AS Decimal(18, 3)), 7)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0329 ', N'CTSP0131  ', N'S03       ', CAST(125.000 AS Decimal(18, 3)), 41)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0330 ', N'CTSP0131  ', N'S04       ', CAST(125.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0331 ', N'CTSP0131  ', N'S05       ', CAST(125.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0332 ', N'CTSP0132  ', N'S02       ', CAST(125.000 AS Decimal(18, 3)), 7)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0333 ', N'CTSP0132  ', N'S03       ', CAST(125.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0334 ', N'CTSP0132  ', N'S04       ', CAST(125.000 AS Decimal(18, 3)), 11)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0335 ', N'CTSP0132  ', N'S05       ', CAST(125.000 AS Decimal(18, 3)), 14)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0336 ', N'CTSP0133  ', N'S02       ', CAST(125.000 AS Decimal(18, 3)), 15)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0337 ', N'CTSP0133  ', N'S03       ', CAST(125.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0338 ', N'CTSP0133  ', N'S04       ', CAST(125.000 AS Decimal(18, 3)), 7)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0339 ', N'CTSP0133  ', N'S05       ', CAST(125.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0340 ', N'CTSP0134  ', N'S10       ', CAST(59.000 AS Decimal(18, 3)), 34)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0341 ', N'CTSP0135  ', N'S10       ', CAST(56.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0342 ', N'CTSP0136  ', N'S02       ', CAST(159.300 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0343 ', N'CTSP0136  ', N'S03       ', CAST(159.300 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0344 ', N'CTSP0136  ', N'S04       ', CAST(159.300 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0345 ', N'CTSP0136  ', N'S05       ', CAST(159.300 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0346 ', N'CTSP0136  ', N'S06       ', CAST(159.300 AS Decimal(18, 3)), 42)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0347 ', N'CTSP0137  ', N'S02       ', CAST(159.300 AS Decimal(18, 3)), 1)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0348 ', N'CTSP0137  ', N'S03       ', CAST(159.300 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0349 ', N'CTSP0137  ', N'S04       ', CAST(159.300 AS Decimal(18, 3)), 11)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0350 ', N'CTSP0137  ', N'S05       ', CAST(159.300 AS Decimal(18, 3)), 19)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0351 ', N'CTSP0137  ', N'S06       ', CAST(159.300 AS Decimal(18, 3)), 1)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0352 ', N'CTSP0138  ', N'S02       ', CAST(159.300 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0353 ', N'CTSP0138  ', N'S03       ', CAST(159.300 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0354 ', N'CTSP0138  ', N'S04       ', CAST(159.300 AS Decimal(18, 3)), 9)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0355 ', N'CTSP0138  ', N'S05       ', CAST(159.300 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0356 ', N'CTSP0138  ', N'S06       ', CAST(159.300 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0357 ', N'CTSP0139  ', N'S02       ', CAST(159.300 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0358 ', N'CTSP0139  ', N'S03       ', CAST(159.300 AS Decimal(18, 3)), 8)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0359 ', N'CTSP0139  ', N'S04       ', CAST(159.300 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0360 ', N'CTSP0139  ', N'S05       ', CAST(159.300 AS Decimal(18, 3)), 34)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0361 ', N'CTSP0139  ', N'S06       ', CAST(159.300 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0362 ', N'CTSP0140  ', N'S11       ', CAST(154.500 AS Decimal(18, 3)), 14)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0363 ', N'CTSP0140  ', N'S12       ', CAST(154.500 AS Decimal(18, 3)), 54)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0364 ', N'CTSP0140  ', N'S13       ', CAST(154.500 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0365 ', N'CTSP0141  ', N'S11       ', CAST(154.500 AS Decimal(18, 3)), 1)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0366 ', N'CTSP0141  ', N'S12       ', CAST(154.500 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0367 ', N'CTSP0141  ', N'S13       ', CAST(154.500 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0368 ', N'CTSP0142  ', N'S11       ', CAST(154.500 AS Decimal(18, 3)), 52)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0369 ', N'CTSP0142  ', N'S12       ', CAST(154.500 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0370 ', N'CTSP0142  ', N'S13       ', CAST(154.500 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0371 ', N'CTSP0143  ', N'S11       ', CAST(154.500 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0372 ', N'CTSP0143  ', N'S12       ', CAST(154.500 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0373 ', N'CTSP0143  ', N'S13       ', CAST(154.500 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0374 ', N'CTSP0144  ', N'S11       ', CAST(154.500 AS Decimal(18, 3)), 40)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0375 ', N'CTSP0144  ', N'S12       ', CAST(154.500 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0376 ', N'CTSP0144  ', N'S13       ', CAST(154.500 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0377 ', N'CTSP0145  ', N'S10       ', CAST(85.000 AS Decimal(18, 3)), 208)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0378 ', N'CTSP0146  ', N'S10       ', CAST(85.000 AS Decimal(18, 3)), 113)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0379 ', N'CTSP0147  ', N'S10       ', CAST(85.000 AS Decimal(18, 3)), 83)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0380 ', N'CTSP0148  ', N'S03       ', CAST(129.000 AS Decimal(18, 3)), 112)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0381 ', N'CTSP0148  ', N'S04       ', CAST(129.000 AS Decimal(18, 3)), 42)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0382 ', N'CTSP0148  ', N'S05       ', CAST(129.000 AS Decimal(18, 3)), 232)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0383 ', N'CTSP0148  ', N'S06       ', CAST(129.000 AS Decimal(18, 3)), 11)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0384 ', N'CTSP0148  ', N'S07       ', CAST(129.000 AS Decimal(18, 3)), 53)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0385 ', N'CTSP0149  ', N'S10       ', CAST(81.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0386 ', N'CTSP0150  ', N'S10       ', CAST(81.000 AS Decimal(18, 3)), 11)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0387 ', N'CTSP0151  ', N'S10       ', CAST(68.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0388 ', N'CTSP0152  ', N'S10       ', CAST(68.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0389 ', N'CTSP0153  ', N'S10       ', CAST(115.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0390 ', N'CTSP0154  ', N'S10       ', CAST(115.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0391 ', N'CTSP0155  ', N'S10       ', CAST(115.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0392 ', N'CTSP0156  ', N'S10       ', CAST(115.000 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0393 ', N'CTSP0157  ', N'S10       ', CAST(115.000 AS Decimal(18, 3)), 42)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0394 ', N'CTSP0158  ', N'S03       ', CAST(85.000 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0395 ', N'CTSP0158  ', N'S04       ', CAST(85.000 AS Decimal(18, 3)), 24)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0396 ', N'CTSP0158  ', N'S05       ', CAST(85.000 AS Decimal(18, 3)), 34)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0397 ', N'CTSP0158  ', N'S06       ', CAST(85.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0398 ', N'CTSP0159  ', N'S03       ', CAST(85.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0399 ', N'CTSP0159  ', N'S04       ', CAST(85.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0400 ', N'CTSP0159  ', N'S05       ', CAST(85.000 AS Decimal(18, 3)), 0)
GO
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0401 ', N'CTSP0159  ', N'S06       ', CAST(85.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0402 ', N'CTSP0160  ', N'S04       ', CAST(102.000 AS Decimal(18, 3)), 120)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0403 ', N'CTSP0161  ', N'S02       ', CAST(116.100 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0404 ', N'CTSP0161  ', N'S03       ', CAST(116.100 AS Decimal(18, 3)), 1)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0405 ', N'CTSP0161  ', N'S04       ', CAST(116.100 AS Decimal(18, 3)), 35)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0406 ', N'CTSP0162  ', N'S02       ', CAST(90.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0407 ', N'CTSP0162  ', N'S03       ', CAST(90.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0408 ', N'CTSP0162  ', N'S04       ', CAST(90.000 AS Decimal(18, 3)), 30)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0409 ', N'CTSP0163  ', N'S11       ', CAST(83.000 AS Decimal(18, 3)), 63)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0410 ', N'CTSP0163  ', N'S12       ', CAST(83.000 AS Decimal(18, 3)), 26)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0411 ', N'CTSP0164  ', N'S11       ', CAST(83.000 AS Decimal(18, 3)), 92)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0412 ', N'CTSP0164  ', N'S12       ', CAST(83.000 AS Decimal(18, 3)), 67)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0413 ', N'CTSP0165  ', N'S02       ', CAST(124.000 AS Decimal(18, 3)), 44)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0414 ', N'CTSP0165  ', N'S03       ', CAST(124.000 AS Decimal(18, 3)), 181)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0415 ', N'CTSP0165  ', N'S04       ', CAST(124.000 AS Decimal(18, 3)), 52)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0416 ', N'CTSP0165  ', N'S05       ', CAST(124.000 AS Decimal(18, 3)), 104)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0417 ', N'CTSP0166  ', N'S02       ', CAST(124.000 AS Decimal(18, 3)), 16)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0418 ', N'CTSP0166  ', N'S03       ', CAST(124.000 AS Decimal(18, 3)), 29)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0419 ', N'CTSP0166  ', N'S04       ', CAST(124.000 AS Decimal(18, 3)), 27)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0420 ', N'CTSP0166  ', N'S05       ', CAST(124.000 AS Decimal(18, 3)), 18)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0421 ', N'CTSP0167  ', N'S10       ', CAST(114.000 AS Decimal(18, 3)), 29)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0422 ', N'CTSP0168  ', N'S10       ', CAST(114.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0423 ', N'CTSP0169  ', N'S03       ', CAST(75.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0424 ', N'CTSP0169  ', N'S04       ', CAST(75.000 AS Decimal(18, 3)), 34)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0425 ', N'CTSP0169  ', N'S05       ', CAST(75.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0426 ', N'CTSP0169  ', N'S06       ', CAST(75.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0427 ', N'CTSP0169  ', N'S07       ', CAST(75.000 AS Decimal(18, 3)), 63)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0428 ', N'CTSP0170  ', N'S03       ', CAST(75.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0429 ', N'CTSP0170  ', N'S04       ', CAST(75.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0430 ', N'CTSP0170  ', N'S05       ', CAST(75.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0431 ', N'CTSP0170  ', N'S06       ', CAST(75.000 AS Decimal(18, 3)), 75)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0432 ', N'CTSP0170  ', N'S07       ', CAST(75.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0433 ', N'CTSP0171  ', N'S03       ', CAST(69.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0434 ', N'CTSP0171  ', N'S04       ', CAST(69.000 AS Decimal(18, 3)), 18)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0435 ', N'CTSP0171  ', N'S05       ', CAST(69.000 AS Decimal(18, 3)), 9)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0436 ', N'CTSP0171  ', N'S06       ', CAST(69.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0437 ', N'CTSP0171  ', N'S07       ', CAST(69.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0438 ', N'CTSP0172  ', N'S10       ', CAST(89.000 AS Decimal(18, 3)), 151)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0439 ', N'CTSP0173  ', N'S10       ', CAST(89.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0440 ', N'CTSP0174  ', N'S10       ', CAST(89.000 AS Decimal(18, 3)), 138)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0441 ', N'CTSP0175  ', N'S10       ', CAST(89.000 AS Decimal(18, 3)), 96)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0442 ', N'CTSP0176  ', N'S10       ', CAST(89.000 AS Decimal(18, 3)), 111)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0443 ', N'CTSP0177  ', N'S10       ', CAST(141.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0444 ', N'CTSP0178  ', N'S10       ', CAST(141.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0445 ', N'CTSP0179  ', N'S10       ', CAST(141.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0446 ', N'CTSP0180  ', N'S10       ', CAST(141.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0447 ', N'CTSP0181  ', N'S10       ', CAST(141.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0448 ', N'CTSP0182  ', N'S02       ', CAST(89.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0449 ', N'CTSP0182  ', N'S03       ', CAST(89.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0450 ', N'CTSP0182  ', N'S04       ', CAST(89.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0451 ', N'CTSP0182  ', N'S05       ', CAST(89.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0452 ', N'CTSP0182  ', N'S06       ', CAST(89.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0453 ', N'CTSP0182  ', N'S07       ', CAST(89.000 AS Decimal(18, 3)), 44)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0454 ', N'CTSP0183  ', N'S02       ', CAST(103.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0455 ', N'CTSP0183  ', N'S03       ', CAST(103.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0456 ', N'CTSP0183  ', N'S04       ', CAST(103.000 AS Decimal(18, 3)), 14)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0457 ', N'CTSP0183  ', N'S05       ', CAST(103.000 AS Decimal(18, 3)), 42)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0458 ', N'CTSP0184  ', N'S02       ', CAST(103.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0459 ', N'CTSP0184  ', N'S03       ', CAST(103.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0460 ', N'CTSP0184  ', N'S04       ', CAST(103.000 AS Decimal(18, 3)), 54)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0461 ', N'CTSP0184  ', N'S05       ', CAST(103.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0462 ', N'CTSP0185  ', N'S02       ', CAST(155.000 AS Decimal(18, 3)), 76)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0463 ', N'CTSP0185  ', N'S03       ', CAST(155.000 AS Decimal(18, 3)), 42)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0464 ', N'CTSP0185  ', N'S04       ', CAST(155.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0465 ', N'CTSP0186  ', N'S10       ', CAST(109.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0466 ', N'CTSP0187  ', N'S10       ', CAST(109.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0467 ', N'CTSP0188  ', N'S02       ', CAST(95.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0468 ', N'CTSP0188  ', N'S03       ', CAST(95.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0469 ', N'CTSP0189  ', N'S02       ', CAST(95.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0470 ', N'CTSP0189  ', N'S03       ', CAST(95.000 AS Decimal(18, 3)), 34)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0471 ', N'CTSP0190  ', N'S03       ', CAST(138.000 AS Decimal(18, 3)), 24)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0472 ', N'CTSP0190  ', N'S04       ', CAST(138.000 AS Decimal(18, 3)), 53)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0473 ', N'CTSP0190  ', N'S05       ', CAST(138.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0474 ', N'CTSP0191  ', N'S03       ', CAST(138.000 AS Decimal(18, 3)), 11)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0475 ', N'CTSP0191  ', N'S04       ', CAST(138.000 AS Decimal(18, 3)), 10)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0476 ', N'CTSP0191  ', N'S05       ', CAST(138.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0477 ', N'CTSP0192  ', N'S03       ', CAST(138.000 AS Decimal(18, 3)), 7)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0478 ', N'CTSP0192  ', N'S04       ', CAST(138.000 AS Decimal(18, 3)), 9)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0479 ', N'CTSP0192  ', N'S05       ', CAST(138.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0480 ', N'CTSP0193  ', N'S02       ', CAST(27.200 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0481 ', N'CTSP0193  ', N'S03       ', CAST(27.200 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0482 ', N'CTSP0193  ', N'S04       ', CAST(27.200 AS Decimal(18, 3)), 24)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0483 ', N'CTSP0193  ', N'S05       ', CAST(27.200 AS Decimal(18, 3)), 75)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0484 ', N'CTSP0194  ', N'S02       ', CAST(27.200 AS Decimal(18, 3)), 89)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0485 ', N'CTSP0194  ', N'S03       ', CAST(27.200 AS Decimal(18, 3)), 79)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0486 ', N'CTSP0194  ', N'S04       ', CAST(27.200 AS Decimal(18, 3)), 8)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0487 ', N'CTSP0194  ', N'S05       ', CAST(27.200 AS Decimal(18, 3)), 66)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0488 ', N'CTSP0195  ', N'S10       ', CAST(96.100 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0489 ', N'CTSP0196  ', N'S10       ', CAST(96.100 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0491 ', N'CTSP0198  ', N'S10       ', CAST(92.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0492 ', N'CTSP0199  ', N'S10       ', CAST(92.000 AS Decimal(18, 3)), 33)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0493 ', N'CTSP0200  ', N'S10       ', CAST(92.000 AS Decimal(18, 3)), 53)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0494 ', N'CTSP0201  ', N'S10       ', CAST(92.000 AS Decimal(18, 3)), 34)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0495 ', N'CTSP0202  ', N'S10       ', CAST(92.000 AS Decimal(18, 3)), 34)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0496 ', N'CTSP0203  ', N'S10       ', CAST(99.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0497 ', N'CTSP0204  ', N'S10       ', CAST(99.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0498 ', N'CTSP0205  ', N'S10       ', CAST(99.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0499 ', N'CTSP0206  ', N'S10       ', CAST(99.000 AS Decimal(18, 3)), 55)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0500 ', N'CTSP0207  ', N'S10       ', CAST(108.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0501 ', N'CTSP0208  ', N'S10       ', CAST(108.000 AS Decimal(18, 3)), 33)
GO
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0502 ', N'CTSP0209  ', N'S10       ', CAST(108.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0503 ', N'CTSP0210  ', N'S02       ', CAST(74.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0504 ', N'CTSP0210  ', N'S03       ', CAST(79.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0505 ', N'CTSP0210  ', N'S04       ', CAST(79.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0506 ', N'CTSP0210  ', N'S05       ', CAST(79.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0507 ', N'CTSP0210  ', N'S06       ', CAST(79.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0508 ', N'CTSP0211  ', N'S10       ', CAST(118.000 AS Decimal(18, 3)), 156)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0509 ', N'CTSP0212  ', N'S10       ', CAST(118.000 AS Decimal(18, 3)), 112)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0510 ', N'CTSP0213  ', N'S02       ', CAST(125.000 AS Decimal(18, 3)), 56)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0511 ', N'CTSP0213  ', N'S03       ', CAST(125.000 AS Decimal(18, 3)), 112)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0512 ', N'CTSP0214  ', N'S10       ', CAST(87.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0513 ', N'CTSP0215  ', N'S10       ', CAST(87.000 AS Decimal(18, 3)), 45)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0514 ', N'CTSP0216  ', N'S10       ', CAST(87.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0515 ', N'CTSP0217  ', N'S10       ', CAST(129.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0516 ', N'CTSP0218  ', N'S10       ', CAST(129.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0517 ', N'CTSP0219  ', N'S10       ', CAST(137.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0518 ', N'CTSP0220  ', N'S10       ', CAST(137.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0519 ', N'CTSP0221  ', N'S02       ', CAST(78.700 AS Decimal(18, 3)), 45)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0520 ', N'CTSP0221  ', N'S03       ', CAST(78.700 AS Decimal(18, 3)), 34)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0521 ', N'CTSP0221  ', N'S04       ', CAST(78.700 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0522 ', N'CTSP0221  ', N'S05       ', CAST(78.700 AS Decimal(18, 3)), 44)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0523 ', N'CTSP0222  ', N'S02       ', CAST(126.000 AS Decimal(18, 3)), 66)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0524 ', N'CTSP0222  ', N'S03       ', CAST(126.000 AS Decimal(18, 3)), 34)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0525 ', N'CTSP0222  ', N'S04       ', CAST(126.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0526 ', N'CTSP0223  ', N'S10       ', CAST(133.000 AS Decimal(18, 3)), 45)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0527 ', N'CTSP0224  ', N'S10       ', CAST(133.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0528 ', N'CTSP0225  ', N'S10       ', CAST(133.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0529 ', N'CTSP0226  ', N'S10       ', CAST(133.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0530 ', N'CTSP0227  ', N'S02       ', CAST(126.000 AS Decimal(18, 3)), 124)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0531 ', N'CTSP0227  ', N'S02       ', CAST(126.000 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0532 ', N'CTSP0227  ', N'S02       ', CAST(126.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0533 ', N'CTSP0227  ', N'S02       ', CAST(126.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0534 ', N'CTSP0228  ', N'S02       ', CAST(149.000 AS Decimal(18, 3)), 34)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0535 ', N'CTSP0228  ', N'S03       ', CAST(149.000 AS Decimal(18, 3)), 13)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0536 ', N'CTSP0229  ', N'S02       ', CAST(154.000 AS Decimal(18, 3)), 54)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0537 ', N'CTSP0229  ', N'S03       ', CAST(154.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0538 ', N'CTSP0229  ', N'S04       ', CAST(154.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0539 ', N'CTSP0230  ', N'S02       ', CAST(211.000 AS Decimal(18, 3)), 86)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0540 ', N'CTSP0230  ', N'S03       ', CAST(211.000 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0541 ', N'CTSP0230  ', N'S04       ', CAST(211.000 AS Decimal(18, 3)), 33)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0542 ', N'CTSP0231  ', N'S02       ', CAST(139.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0543 ', N'CTSP0231  ', N'S03       ', CAST(139.000 AS Decimal(18, 3)), 78)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0544 ', N'CTSP0232  ', N'S02       ', CAST(139.000 AS Decimal(18, 3)), 67)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0545 ', N'CTSP0232  ', N'S03       ', CAST(139.000 AS Decimal(18, 3)), 45)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0546 ', N'CTSP0233  ', N'S02       ', CAST(139.000 AS Decimal(18, 3)), 63)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0547 ', N'CTSP0233  ', N'S03       ', CAST(139.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0548 ', N'CTSP0234  ', N'S02       ', CAST(103.000 AS Decimal(18, 3)), 44)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0549 ', N'CTSP0234  ', N'S03       ', CAST(103.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0550 ', N'CTSP0235  ', N'S01       ', CAST(115.000 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0551 ', N'CTSP0235  ', N'S02       ', CAST(115.000 AS Decimal(18, 3)), 34)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0552 ', N'CTSP0235  ', N'S03       ', CAST(115.000 AS Decimal(18, 3)), 56)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0553 ', N'CTSP0235  ', N'S04       ', CAST(115.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0554 ', N'CTSP0235  ', N'S05       ', CAST(115.000 AS Decimal(18, 3)), 76)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0555 ', N'CTSP0236  ', N'S01       ', CAST(115.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0556 ', N'CTSP0236  ', N'S02       ', CAST(115.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0557 ', N'CTSP0236  ', N'S03       ', CAST(115.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0558 ', N'CTSP0236  ', N'S04       ', CAST(115.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0559 ', N'CTSP0236  ', N'S05       ', CAST(115.000 AS Decimal(18, 3)), 34)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0560 ', N'CTSP0237  ', N'S02       ', CAST(53.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0561 ', N'CTSP0237  ', N'S03       ', CAST(53.000 AS Decimal(18, 3)), 45)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0562 ', N'CTSP0237  ', N'S04       ', CAST(53.000 AS Decimal(18, 3)), 86)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0563 ', N'CTSP0237  ', N'S05       ', CAST(53.000 AS Decimal(18, 3)), 33)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0564 ', N'CTSP0238  ', N'S02       ', CAST(53.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0565 ', N'CTSP0238  ', N'S03       ', CAST(53.000 AS Decimal(18, 3)), 7)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0566 ', N'CTSP0238  ', N'S04       ', CAST(53.000 AS Decimal(18, 3)), 76)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0567 ', N'CTSP0238  ', N'S05       ', CAST(53.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0568 ', N'CTSP0239  ', N'S02       ', CAST(67.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0569 ', N'CTSP0239  ', N'S03       ', CAST(67.000 AS Decimal(18, 3)), 45)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0570 ', N'CTSP0239  ', N'S04       ', CAST(67.000 AS Decimal(18, 3)), 67)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0571 ', N'CTSP0239  ', N'S05       ', CAST(67.000 AS Decimal(18, 3)), 54)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0572 ', N'CTSP0240  ', N'S02       ', CAST(247.500 AS Decimal(18, 3)), 87)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0573 ', N'CTSP0240  ', N'S03       ', CAST(247.500 AS Decimal(18, 3)), 26)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0574 ', N'CTSP0240  ', N'S04       ', CAST(247.500 AS Decimal(18, 3)), 44)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0575 ', N'CTSP0240  ', N'S05       ', CAST(247.500 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0576 ', N'CTSP0241  ', N'S02       ', CAST(209.000 AS Decimal(18, 3)), 149)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0577 ', N'CTSP0241  ', N'S03       ', CAST(209.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0578 ', N'CTSP0242  ', N'S10       ', CAST(125.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0579 ', N'CTSP0243  ', N'S10       ', CAST(125.000 AS Decimal(18, 3)), 42)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0580 ', N'CTSP0244  ', N'S10       ', CAST(125.000 AS Decimal(18, 3)), 64)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0581 ', N'CTSP0245  ', N'S10       ', CAST(125.000 AS Decimal(18, 3)), 55)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0582 ', N'CTSP0246  ', N'S02       ', CAST(179.000 AS Decimal(18, 3)), 133)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0583 ', N'CTSP0246  ', N'S03       ', CAST(179.000 AS Decimal(18, 3)), 24)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0584 ', N'CTSP0246  ', N'S04       ', CAST(179.000 AS Decimal(18, 3)), 84)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0585 ', N'CTSP0247  ', N'S02       ', CAST(129.000 AS Decimal(18, 3)), 56)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0586 ', N'CTSP0247  ', N'S03       ', CAST(129.000 AS Decimal(18, 3)), 45)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0587 ', N'CTSP0247  ', N'S04       ', CAST(129.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0588 ', N'CTSP0248  ', N'S02       ', CAST(179.000 AS Decimal(18, 3)), 178)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0589 ', N'CTSP0248  ', N'S03       ', CAST(179.000 AS Decimal(18, 3)), 123)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0590 ', N'CTSP0249  ', N'S02       ', CAST(179.000 AS Decimal(18, 3)), 55)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0591 ', N'CTSP0249  ', N'S03       ', CAST(179.000 AS Decimal(18, 3)), 67)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0592 ', N'CTSP0250  ', N'S02       ', CAST(169.000 AS Decimal(18, 3)), 44)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0593 ', N'CTSP0250  ', N'S03       ', CAST(169.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0594 ', N'CTSP0251  ', N'S02       ', CAST(185.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0595 ', N'CTSP0251  ', N'S03       ', CAST(185.000 AS Decimal(18, 3)), 200)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0596 ', N'CTSP0252  ', N'S02       ', CAST(185.000 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0597 ', N'CTSP0252  ', N'S03       ', CAST(185.000 AS Decimal(18, 3)), 14)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0598 ', N'CTSP0253  ', N'S02       ', CAST(149.000 AS Decimal(18, 3)), 222)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0599 ', N'CTSP0253  ', N'S03       ', CAST(149.000 AS Decimal(18, 3)), 122)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0600 ', N'CTSP0254  ', N'S02       ', CAST(179.000 AS Decimal(18, 3)), 121)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0601 ', N'CTSP0254  ', N'S03       ', CAST(179.000 AS Decimal(18, 3)), 190)
GO
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0602 ', N'CTSP0255  ', N'S10       ', CAST(185.000 AS Decimal(18, 3)), 111)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0603 ', N'CTSP0256  ', N'S02       ', CAST(657.000 AS Decimal(18, 3)), 54)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0604 ', N'CTSP0256  ', N'S03       ', CAST(657.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0605 ', N'CTSP0256  ', N'S04       ', CAST(657.000 AS Decimal(18, 3)), 53)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0606 ', N'CTSP0256  ', N'S05       ', CAST(657.000 AS Decimal(18, 3)), 34)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0607 ', N'CTSP0257  ', N'S02       ', CAST(500.000 AS Decimal(18, 3)), 64)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0608 ', N'CTSP0257  ', N'S03       ', CAST(500.000 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0609 ', N'CTSP0257  ', N'S04       ', CAST(500.000 AS Decimal(18, 3)), 34)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0610 ', N'CTSP0257  ', N'S05       ', CAST(500.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0611 ', N'CTSP0258  ', N'S02       ', CAST(149.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0612 ', N'CTSP0258  ', N'S03       ', CAST(149.000 AS Decimal(18, 3)), 233)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0613 ', N'CTSP0259  ', N'S02       ', CAST(380.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0614 ', N'CTSP0259  ', N'S03       ', CAST(380.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0615 ', N'CTSP0259  ', N'S04       ', CAST(380.000 AS Decimal(18, 3)), 45)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0616 ', N'CTSP0259  ', N'S05       ', CAST(380.000 AS Decimal(18, 3)), 133)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0617 ', N'CTSP0259  ', N'S06       ', CAST(380.000 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0618 ', N'CTSP0260  ', N'S02       ', CAST(318.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0619 ', N'CTSP0260  ', N'S03       ', CAST(318.000 AS Decimal(18, 3)), 155)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0620 ', N'CTSP0260  ', N'S04       ', CAST(318.000 AS Decimal(18, 3)), 233)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0621 ', N'CTSP0261  ', N'S01       ', CAST(330.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0622 ', N'CTSP0261  ', N'S02       ', CAST(330.000 AS Decimal(18, 3)), 45)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0623 ', N'CTSP0261  ', N'S03       ', CAST(330.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0624 ', N'CTSP0261  ', N'S04       ', CAST(330.000 AS Decimal(18, 3)), 67)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0625 ', N'CTSP0261  ', N'S05       ', CAST(330.000 AS Decimal(18, 3)), 45)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0626 ', N'CTSP0261  ', N'S06       ', CAST(330.000 AS Decimal(18, 3)), 78)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0627 ', N'CTSP0261  ', N'S07       ', CAST(330.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0628 ', N'CTSP0262  ', N'S01       ', CAST(320.000 AS Decimal(18, 3)), 54)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0629 ', N'CTSP0262  ', N'S02       ', CAST(320.000 AS Decimal(18, 3)), 56)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0630 ', N'CTSP0262  ', N'S03       ', CAST(320.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0631 ', N'CTSP0262  ', N'S04       ', CAST(320.000 AS Decimal(18, 3)), 254)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0632 ', N'CTSP0262  ', N'S05       ', CAST(320.000 AS Decimal(18, 3)), 45)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0633 ', N'CTSP0262  ', N'S06       ', CAST(320.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0634 ', N'CTSP0262  ', N'S07       ', CAST(320.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0635 ', N'CTSP0263  ', N'S02       ', CAST(295.000 AS Decimal(18, 3)), 33)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0636 ', N'CTSP0263  ', N'S03       ', CAST(295.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0637 ', N'CTSP0263  ', N'S04       ', CAST(295.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0638 ', N'CTSP0264  ', N'S02       ', CAST(169.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0639 ', N'CTSP0264  ', N'S03       ', CAST(169.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0640 ', N'CTSP0264  ', N'S04       ', CAST(169.000 AS Decimal(18, 3)), 42)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0641 ', N'CTSP0265  ', N'S02       ', CAST(169.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0642 ', N'CTSP0265  ', N'S03       ', CAST(169.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0643 ', N'CTSP0265  ', N'S04       ', CAST(169.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0644 ', N'CTSP0266  ', N'S02       ', CAST(169.000 AS Decimal(18, 3)), 65)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0645 ', N'CTSP0266  ', N'S03       ', CAST(169.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0646 ', N'CTSP0266  ', N'S04       ', CAST(169.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0647 ', N'CTSP0267  ', N'S02       ', CAST(535.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0648 ', N'CTSP0267  ', N'S03       ', CAST(535.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0649 ', N'CTSP0267  ', N'S04       ', CAST(535.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0650 ', N'CTSP0267  ', N'S05       ', CAST(535.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0651 ', N'CTSP0268  ', N'S02       ', CAST(179.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0652 ', N'CTSP0268  ', N'S03       ', CAST(179.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0653 ', N'CTSP0268  ', N'S04       ', CAST(179.000 AS Decimal(18, 3)), 66)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0654 ', N'CTSP0269  ', N'S02       ', CAST(179.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0655 ', N'CTSP0269  ', N'S03       ', CAST(179.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0656 ', N'CTSP0269  ', N'S04       ', CAST(179.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0657 ', N'CTSP0270  ', N'S03       ', CAST(154.000 AS Decimal(18, 3)), 28)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0658 ', N'CTSP0270  ', N'S04       ', CAST(154.000 AS Decimal(18, 3)), 57)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0659 ', N'CTSP0270  ', N'S05       ', CAST(154.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0660 ', N'CTSP0271  ', N'S03       ', CAST(154.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0661 ', N'CTSP0271  ', N'S04       ', CAST(154.000 AS Decimal(18, 3)), 76)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0662 ', N'CTSP0271  ', N'S05       ', CAST(154.000 AS Decimal(18, 3)), 54)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0663 ', N'CTSP0272  ', N'S03       ', CAST(294.000 AS Decimal(18, 3)), 34)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0664 ', N'CTSP0272  ', N'S04       ', CAST(294.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0665 ', N'CTSP0272  ', N'S05       ', CAST(294.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0666 ', N'CTSP0273  ', N'S10       ', CAST(145.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0667 ', N'CTSP0274  ', N'S10       ', CAST(145.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0668 ', N'CTSP0275  ', N'S10       ', CAST(145.000 AS Decimal(18, 3)), 65)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0669 ', N'CTSP0276  ', N'S10       ', CAST(145.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0670 ', N'CTSP0277  ', N'S10       ', CAST(145.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0671 ', N'CTSP0278  ', N'S10       ', CAST(145.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0672 ', N'CTSP0279  ', N'S10       ', CAST(145.000 AS Decimal(18, 3)), 54)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0673 ', N'CTSP0280  ', N'S02       ', CAST(470.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0674 ', N'CTSP0280  ', N'S03       ', CAST(470.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0675 ', N'CTSP0280  ', N'S04       ', CAST(470.000 AS Decimal(18, 3)), 65)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0676 ', N'CTSP0280  ', N'S05       ', CAST(470.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0677 ', N'CTSP0280  ', N'S06       ', CAST(470.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0678 ', N'CTSP0281  ', N'S02       ', CAST(470.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0679 ', N'CTSP0281  ', N'S03       ', CAST(470.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0680 ', N'CTSP0281  ', N'S04       ', CAST(470.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0681 ', N'CTSP0281  ', N'S05       ', CAST(470.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0682 ', N'CTSP0281  ', N'S06       ', CAST(470.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0683 ', N'CTSP0282  ', N'S02       ', CAST(470.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0684 ', N'CTSP0282  ', N'S03       ', CAST(470.000 AS Decimal(18, 3)), 66)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0685 ', N'CTSP0282  ', N'S04       ', CAST(470.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0686 ', N'CTSP0282  ', N'S05       ', CAST(470.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0687 ', N'CTSP0282  ', N'S06       ', CAST(470.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0688 ', N'CTSP0283  ', N'S02       ', CAST(470.000 AS Decimal(18, 3)), 28)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0689 ', N'CTSP0283  ', N'S03       ', CAST(470.000 AS Decimal(18, 3)), 57)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0690 ', N'CTSP0283  ', N'S04       ', CAST(470.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0691 ', N'CTSP0283  ', N'S05       ', CAST(470.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0692 ', N'CTSP0283  ', N'S06       ', CAST(470.000 AS Decimal(18, 3)), 76)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0693 ', N'CTSP0284  ', N'S02       ', CAST(470.000 AS Decimal(18, 3)), 54)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0694 ', N'CTSP0284  ', N'S03       ', CAST(470.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0695 ', N'CTSP0284  ', N'S04       ', CAST(470.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0696 ', N'CTSP0284  ', N'S05       ', CAST(470.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0697 ', N'CTSP0284  ', N'S06       ', CAST(470.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0698 ', N'CTSP0285  ', N'S02       ', CAST(470.000 AS Decimal(18, 3)), 66)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0699 ', N'CTSP0285  ', N'S03       ', CAST(470.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0700 ', N'CTSP0285  ', N'S04       ', CAST(470.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0701 ', N'CTSP0285  ', N'S05       ', CAST(470.000 AS Decimal(18, 3)), 2)
GO
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0702 ', N'CTSP0285  ', N'S06       ', CAST(470.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0703 ', N'CTSP0286  ', N'S03       ', CAST(159.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0704 ', N'CTSP0286  ', N'S04       ', CAST(159.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0705 ', N'CTSP0286  ', N'S05       ', CAST(159.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0706 ', N'CTSP0286  ', N'S06       ', CAST(159.000 AS Decimal(18, 3)), 66)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0707 ', N'CTSP0287  ', N'S03       ', CAST(159.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0708 ', N'CTSP0287  ', N'S04       ', CAST(159.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0709 ', N'CTSP0287  ', N'S05       ', CAST(159.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0710 ', N'CTSP0287  ', N'S06       ', CAST(159.000 AS Decimal(18, 3)), 27)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0711 ', N'CTSP0288  ', N'S03       ', CAST(159.000 AS Decimal(18, 3)), 57)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0712 ', N'CTSP0288  ', N'S04       ', CAST(159.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0713 ', N'CTSP0288  ', N'S05       ', CAST(159.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0714 ', N'CTSP0288  ', N'S06       ', CAST(159.000 AS Decimal(18, 3)), 34)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0715 ', N'CTSP0289  ', N'S04       ', CAST(129.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0716 ', N'CTSP0289  ', N'S05       ', CAST(129.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0717 ', N'CTSP0290  ', N'S04       ', CAST(129.000 AS Decimal(18, 3)), 63)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0718 ', N'CTSP0290  ', N'S05       ', CAST(129.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0719 ', N'CTSP0291  ', N'S04       ', CAST(129.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0720 ', N'CTSP0291  ', N'S05       ', CAST(129.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0721 ', N'CTSP0292  ', N'S04       ', CAST(129.000 AS Decimal(18, 3)), 75)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0722 ', N'CTSP0292  ', N'S05       ', CAST(129.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0723 ', N'CTSP0293  ', N'S04       ', CAST(129.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0724 ', N'CTSP0293  ', N'S05       ', CAST(129.000 AS Decimal(18, 3)), 18)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0725 ', N'CTSP0294  ', N'S03       ', CAST(179.000 AS Decimal(18, 3)), 9)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0726 ', N'CTSP0294  ', N'S04       ', CAST(179.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0727 ', N'CTSP0294  ', N'S05       ', CAST(179.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0728 ', N'CTSP0295  ', N'S03       ', CAST(179.000 AS Decimal(18, 3)), 151)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0729 ', N'CTSP0295  ', N'S04       ', CAST(179.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0730 ', N'CTSP0295  ', N'S05       ', CAST(179.000 AS Decimal(18, 3)), 138)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0731 ', N'CTSP0296  ', N'S03       ', CAST(165.000 AS Decimal(18, 3)), 96)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0732 ', N'CTSP0296  ', N'S04       ', CAST(165.000 AS Decimal(18, 3)), 111)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0733 ', N'CTSP0296  ', N'S05       ', CAST(165.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0734 ', N'CTSP0297  ', N'S03       ', CAST(165.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0735 ', N'CTSP0297  ', N'S04       ', CAST(165.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0736 ', N'CTSP0297  ', N'S05       ', CAST(165.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0737 ', N'CTSP0298  ', N'S03       ', CAST(165.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0738 ', N'CTSP0298  ', N'S04       ', CAST(165.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0739 ', N'CTSP0298  ', N'S05       ', CAST(165.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0740 ', N'CTSP0299  ', N'S03       ', CAST(348.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0741 ', N'CTSP0299  ', N'S04       ', CAST(348.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0742 ', N'CTSP0299  ', N'S05       ', CAST(348.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0743 ', N'CTSP0300  ', N'S03       ', CAST(348.000 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0744 ', N'CTSP0300  ', N'S04       ', CAST(348.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0745 ', N'CTSP0300  ', N'S05       ', CAST(348.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0746 ', N'CTSP0301  ', N'S03       ', CAST(348.000 AS Decimal(18, 3)), 14)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0747 ', N'CTSP0301  ', N'S04       ', CAST(348.000 AS Decimal(18, 3)), 42)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0748 ', N'CTSP0301  ', N'S05       ', CAST(348.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0749 ', N'CTSP0302  ', N'S03       ', CAST(169.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0750 ', N'CTSP0302  ', N'S04       ', CAST(169.000 AS Decimal(18, 3)), 54)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0751 ', N'CTSP0302  ', N'S05       ', CAST(169.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0752 ', N'CTSP0303  ', N'S03       ', CAST(169.000 AS Decimal(18, 3)), 76)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0753 ', N'CTSP0303  ', N'S04       ', CAST(169.000 AS Decimal(18, 3)), 42)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0754 ', N'CTSP0303  ', N'S05       ', CAST(169.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0755 ', N'CTSP0304  ', N'S02       ', CAST(300.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0756 ', N'CTSP0304  ', N'S03       ', CAST(300.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0757 ', N'CTSP0304  ', N'S04       ', CAST(300.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0758 ', N'CTSP0304  ', N'S05       ', CAST(300.000 AS Decimal(18, 3)), 178)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0759 ', N'CTSP0304  ', N'S06       ', CAST(300.000 AS Decimal(18, 3)), 123)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0760 ', N'CTSP0305  ', N'S10       ', CAST(259.000 AS Decimal(18, 3)), 20)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0761 ', N'CTSP0306  ', N'S10       ', CAST(259.000 AS Decimal(18, 3)), 44)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0762 ', N'CTSP0307  ', N'S10       ', CAST(259.000 AS Decimal(18, 3)), 65)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0763 ', N'CTSP0308  ', N'S10       ', CAST(259.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0764 ', N'CTSP0309  ', N'S03       ', CAST(254.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0765 ', N'CTSP0309  ', N'S04       ', CAST(254.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0766 ', N'CTSP0310  ', N'S03       ', CAST(254.000 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0767 ', N'CTSP0310  ', N'S04       ', CAST(254.000 AS Decimal(18, 3)), 76)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0768 ', N'CTSP0311  ', N'S03       ', CAST(254.000 AS Decimal(18, 3)), 65)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0769 ', N'CTSP0311  ', N'S04       ', CAST(254.000 AS Decimal(18, 3)), 42)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0770 ', N'CTSP0312  ', N'S02       ', CAST(280.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0771 ', N'CTSP0312  ', N'S03       ', CAST(280.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0772 ', N'CTSP0312  ', N'S04       ', CAST(280.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0773 ', N'CTSP0312  ', N'S05       ', CAST(280.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0774 ', N'CTSP0312  ', N'S06       ', CAST(280.000 AS Decimal(18, 3)), 7)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0775 ', N'CTSP0312  ', N'S07       ', CAST(280.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0776 ', N'CTSP0313  ', N'S02       ', CAST(280.000 AS Decimal(18, 3)), 7)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0777 ', N'CTSP0313  ', N'S03       ', CAST(280.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0778 ', N'CTSP0313  ', N'S04       ', CAST(280.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0779 ', N'CTSP0313  ', N'S05       ', CAST(280.000 AS Decimal(18, 3)), 8)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0780 ', N'CTSP0313  ', N'S06       ', CAST(280.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0781 ', N'CTSP0313  ', N'S07       ', CAST(280.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0782 ', N'CTSP0314  ', N'S02       ', CAST(280.000 AS Decimal(18, 3)), 9)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0783 ', N'CTSP0314  ', N'S03       ', CAST(280.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0784 ', N'CTSP0314  ', N'S04       ', CAST(280.000 AS Decimal(18, 3)), 24)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0785 ', N'CTSP0314  ', N'S05       ', CAST(280.000 AS Decimal(18, 3)), 8)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0786 ', N'CTSP0314  ', N'S06       ', CAST(280.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0787 ', N'CTSP0314  ', N'S07       ', CAST(280.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0788 ', N'CTSP0315  ', N'S02       ', CAST(169.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0789 ', N'CTSP0315  ', N'S03       ', CAST(169.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0790 ', N'CTSP0315  ', N'S04       ', CAST(169.000 AS Decimal(18, 3)), 10)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0791 ', N'CTSP0315  ', N'S05       ', CAST(169.000 AS Decimal(18, 3)), 8)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0792 ', N'CTSP0316  ', N'S02       ', CAST(139.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0793 ', N'CTSP0316  ', N'S03       ', CAST(139.000 AS Decimal(18, 3)), 7)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0794 ', N'CTSP0316  ', N'S04       ', CAST(139.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0795 ', N'CTSP0316  ', N'S05       ', CAST(139.000 AS Decimal(18, 3)), 7)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0796 ', N'CTSP0317  ', N'S02       ', CAST(179.000 AS Decimal(18, 3)), 16)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0797 ', N'CTSP0317  ', N'S03       ', CAST(179.000 AS Decimal(18, 3)), 9)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0798 ', N'CTSP0317  ', N'S04       ', CAST(179.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0799 ', N'CTSP0317  ', N'S05       ', CAST(179.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0800 ', N'CTSP0318  ', N'S02       ', CAST(179.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0801 ', N'CTSP0318  ', N'S03       ', CAST(179.000 AS Decimal(18, 3)), 0)
GO
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0802 ', N'CTSP0318  ', N'S04       ', CAST(179.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0803 ', N'CTSP0318  ', N'S05       ', CAST(179.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0804 ', N'CTSP0319  ', N'S02       ', CAST(125.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0805 ', N'CTSP0319  ', N'S03       ', CAST(125.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0806 ', N'CTSP0319  ', N'S04       ', CAST(125.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0807 ', N'CTSP0319  ', N'S05       ', CAST(125.000 AS Decimal(18, 3)), 129)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0808 ', N'CTSP0320  ', N'S03       ', CAST(159.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0809 ', N'CTSP0320  ', N'S04       ', CAST(159.000 AS Decimal(18, 3)), 54)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0810 ', N'CTSP0320  ', N'S05       ', CAST(159.000 AS Decimal(18, 3)), 56)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0811 ', N'CTSP0321  ', N'S03       ', CAST(159.000 AS Decimal(18, 3)), 67)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0812 ', N'CTSP0321  ', N'S04       ', CAST(159.000 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0813 ', N'CTSP0321  ', N'S05       ', CAST(159.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0814 ', N'CTSP0322  ', N'S01       ', CAST(185.000 AS Decimal(18, 3)), 44)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0815 ', N'CTSP0322  ', N'S02       ', CAST(185.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0816 ', N'CTSP0322  ', N'S03       ', CAST(185.000 AS Decimal(18, 3)), 66)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0817 ', N'CTSP0322  ', N'S04       ', CAST(185.000 AS Decimal(18, 3)), 75)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0818 ', N'CTSP0322  ', N'S05       ', CAST(185.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0819 ', N'CTSP0323  ', N'S01       ', CAST(146.000 AS Decimal(18, 3)), 7)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0820 ', N'CTSP0323  ', N'S02       ', CAST(146.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0821 ', N'CTSP0323  ', N'S03       ', CAST(146.000 AS Decimal(18, 3)), 33)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0822 ', N'CTSP0323  ', N'S04       ', CAST(146.000 AS Decimal(18, 3)), 71)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0823 ', N'CTSP0323  ', N'S05       ', CAST(146.000 AS Decimal(18, 3)), 70)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0824 ', N'CTSP0324  ', N'S02       ', CAST(165.000 AS Decimal(18, 3)), 33)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0825 ', N'CTSP0324  ', N'S03       ', CAST(165.000 AS Decimal(18, 3)), 50)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0826 ', N'CTSP0324  ', N'S04       ', CAST(165.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0827 ', N'CTSP0325  ', N'S02       ', CAST(165.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0828 ', N'CTSP0325  ', N'S03       ', CAST(165.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0829 ', N'CTSP0325  ', N'S04       ', CAST(165.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0830 ', N'CTSP0326  ', N'S02       ', CAST(165.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0831 ', N'CTSP0326  ', N'S03       ', CAST(165.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0832 ', N'CTSP0326  ', N'S04       ', CAST(165.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0833 ', N'CTSP0327  ', N'S02       ', CAST(165.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0834 ', N'CTSP0327  ', N'S03       ', CAST(165.000 AS Decimal(18, 3)), 11)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0835 ', N'CTSP0327  ', N'S04       ', CAST(165.000 AS Decimal(18, 3)), 18)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0836 ', N'CTSP0328  ', N'S02       ', CAST(149.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0837 ', N'CTSP0328  ', N'S03       ', CAST(149.000 AS Decimal(18, 3)), 13)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0838 ', N'CTSP0328  ', N'S04       ', CAST(149.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0839 ', N'CTSP0328  ', N'S05       ', CAST(149.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0840 ', N'CTSP0328  ', N'S06       ', CAST(149.000 AS Decimal(18, 3)), 16)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0841 ', N'CTSP0328  ', N'S07       ', CAST(149.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0842 ', N'CTSP0329  ', N'S02       ', CAST(149.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0843 ', N'CTSP0329  ', N'S03       ', CAST(149.000 AS Decimal(18, 3)), 231)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0844 ', N'CTSP0329  ', N'S04       ', CAST(149.000 AS Decimal(18, 3)), 121)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0845 ', N'CTSP0329  ', N'S05       ', CAST(149.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0846 ', N'CTSP0329  ', N'S06       ', CAST(149.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0847 ', N'CTSP0329  ', N'S07       ', CAST(149.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0848 ', N'CTSP0330  ', N'S02       ', CAST(149.000 AS Decimal(18, 3)), 38)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0849 ', N'CTSP0330  ', N'S03       ', CAST(149.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0850 ', N'CTSP0330  ', N'S04       ', CAST(149.000 AS Decimal(18, 3)), 7)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0851 ', N'CTSP0330  ', N'S05       ', CAST(149.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0852 ', N'CTSP0330  ', N'S06       ', CAST(149.000 AS Decimal(18, 3)), 9)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0853 ', N'CTSP0330  ', N'S07       ', CAST(149.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0854 ', N'CTSP0331  ', N'S02       ', CAST(188.000 AS Decimal(18, 3)), 13)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0855 ', N'CTSP0331  ', N'S03       ', CAST(188.000 AS Decimal(18, 3)), 14)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0856 ', N'CTSP0331  ', N'S04       ', CAST(188.000 AS Decimal(18, 3)), 15)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0857 ', N'CTSP0331  ', N'S05       ', CAST(188.000 AS Decimal(18, 3)), 16)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0858 ', N'CTSP0332  ', N'S02       ', CAST(188.000 AS Decimal(18, 3)), 17)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0859 ', N'CTSP0332  ', N'S03       ', CAST(188.000 AS Decimal(18, 3)), 18)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0860 ', N'CTSP0332  ', N'S04       ', CAST(188.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0861 ', N'CTSP0332  ', N'S05       ', CAST(188.000 AS Decimal(18, 3)), 20)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0862 ', N'CTSP0333  ', N'S02       ', CAST(175.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0863 ', N'CTSP0333  ', N'S03       ', CAST(175.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0864 ', N'CTSP0333  ', N'S04       ', CAST(175.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0865 ', N'CTSP0333  ', N'S05       ', CAST(175.000 AS Decimal(18, 3)), 24)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0866 ', N'CTSP0334  ', N'S02       ', CAST(157.000 AS Decimal(18, 3)), 25)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0867 ', N'CTSP0334  ', N'S03       ', CAST(157.000 AS Decimal(18, 3)), 26)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0868 ', N'CTSP0334  ', N'S04       ', CAST(157.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0869 ', N'CTSP0334  ', N'S05       ', CAST(157.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0870 ', N'CTSP0335  ', N'S01       ', CAST(154.600 AS Decimal(18, 3)), 97)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0871 ', N'CTSP0335  ', N'S02       ', CAST(154.600 AS Decimal(18, 3)), 65)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0872 ', N'CTSP0335  ', N'S03       ', CAST(154.600 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0873 ', N'CTSP0335  ', N'S04       ', CAST(154.600 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0874 ', N'CTSP0335  ', N'S05       ', CAST(154.600 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0875 ', N'CTSP0336  ', N'S01       ', CAST(154.600 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0876 ', N'CTSP0336  ', N'S02       ', CAST(154.600 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0877 ', N'CTSP0336  ', N'S03       ', CAST(154.600 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0878 ', N'CTSP0336  ', N'S04       ', CAST(154.600 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0879 ', N'CTSP0336  ', N'S05       ', CAST(154.600 AS Decimal(18, 3)), 33)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0880 ', N'CTSP0337  ', N'S02       ', CAST(185.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0881 ', N'CTSP0337  ', N'S03       ', CAST(185.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0882 ', N'CTSP0337  ', N'S04       ', CAST(185.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0883 ', N'CTSP0338  ', N'S02       ', CAST(185.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0884 ', N'CTSP0338  ', N'S03       ', CAST(185.000 AS Decimal(18, 3)), 45)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0885 ', N'CTSP0338  ', N'S04       ', CAST(185.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0886 ', N'CTSP0339  ', N'S02       ', CAST(200.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0887 ', N'CTSP0339  ', N'S03       ', CAST(200.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0888 ', N'CTSP0339  ', N'S04       ', CAST(200.000 AS Decimal(18, 3)), 8)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0889 ', N'CTSP0340  ', N'S02       ', CAST(167.500 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0890 ', N'CTSP0340  ', N'S03       ', CAST(167.500 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0891 ', N'CTSP0340  ', N'S04       ', CAST(167.500 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0892 ', N'CTSP0340  ', N'S05       ', CAST(167.500 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0893 ', N'CTSP0340  ', N'S06       ', CAST(167.500 AS Decimal(18, 3)), 17)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0894 ', N'CTSP0341  ', N'S01       ', CAST(112.000 AS Decimal(18, 3)), 178)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0895 ', N'CTSP0341  ', N'S02       ', CAST(155.000 AS Decimal(18, 3)), 123)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0896 ', N'CTSP0341  ', N'S03       ', CAST(155.000 AS Decimal(18, 3)), 55)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0897 ', N'CTSP0341  ', N'S04       ', CAST(155.000 AS Decimal(18, 3)), 67)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0898 ', N'CTSP0341  ', N'S05       ', CAST(155.000 AS Decimal(18, 3)), 44)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0899 ', N'CTSP0341  ', N'S06       ', CAST(155.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0900 ', N'CTSP0342  ', N'S02       ', CAST(169.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0901 ', N'CTSP0342  ', N'S03       ', CAST(169.000 AS Decimal(18, 3)), 200)
GO
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0902 ', N'CTSP0342  ', N'S04       ', CAST(169.000 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0903 ', N'CTSP0343  ', N'S02       ', CAST(195.000 AS Decimal(18, 3)), 14)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0904 ', N'CTSP0343  ', N'S03       ', CAST(195.000 AS Decimal(18, 3)), 222)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0905 ', N'CTSP0343  ', N'S04       ', CAST(195.000 AS Decimal(18, 3)), 122)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0906 ', N'CTSP0344  ', N'S02       ', CAST(195.000 AS Decimal(18, 3)), 121)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0907 ', N'CTSP0344  ', N'S03       ', CAST(195.000 AS Decimal(18, 3)), 190)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0908 ', N'CTSP0344  ', N'S04       ', CAST(195.000 AS Decimal(18, 3)), 50)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0909 ', N'CTSP0345  ', N'S02       ', CAST(195.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0910 ', N'CTSP0345  ', N'S03       ', CAST(195.000 AS Decimal(18, 3)), 20)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0911 ', N'CTSP0345  ', N'S04       ', CAST(195.000 AS Decimal(18, 3)), 20)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0912 ', N'CTSP0346  ', N'S02       ', CAST(195.000 AS Decimal(18, 3)), 15)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0913 ', N'CTSP0346  ', N'S03       ', CAST(195.000 AS Decimal(18, 3)), 35)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0914 ', N'CTSP0346  ', N'S04       ', CAST(195.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0915 ', N'CTSP0347  ', N'S02       ', CAST(195.000 AS Decimal(18, 3)), 25)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0916 ', N'CTSP0347  ', N'S03       ', CAST(195.000 AS Decimal(18, 3)), 49)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0917 ', N'CTSP0347  ', N'S04       ', CAST(195.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0918 ', N'CTSP0348  ', N'S02       ', CAST(195.000 AS Decimal(18, 3)), 50)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0919 ', N'CTSP0348  ', N'S03       ', CAST(195.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0920 ', N'CTSP0348  ', N'S04       ', CAST(195.000 AS Decimal(18, 3)), 63)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0921 ', N'CTSP0349  ', N'S02       ', CAST(168.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0922 ', N'CTSP0349  ', N'S03       ', CAST(168.000 AS Decimal(18, 3)), 3)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0923 ', N'CTSP0349  ', N'S04       ', CAST(168.000 AS Decimal(18, 3)), 25)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0924 ', N'CTSP0349  ', N'S05       ', CAST(168.000 AS Decimal(18, 3)), 74)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0925 ', N'CTSP0350  ', N'S02       ', CAST(128.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0926 ', N'CTSP0350  ', N'S03       ', CAST(128.000 AS Decimal(18, 3)), 24)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0927 ', N'CTSP0350  ', N'S04       ', CAST(128.000 AS Decimal(18, 3)), 24)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0928 ', N'CTSP0350  ', N'S05       ', CAST(128.000 AS Decimal(18, 3)), 84)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0929 ', N'CTSP0351  ', N'S02       ', CAST(215.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0930 ', N'CTSP0351  ', N'S03       ', CAST(215.000 AS Decimal(18, 3)), 53)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0931 ', N'CTSP0351  ', N'S04       ', CAST(215.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0932 ', N'CTSP0351  ', N'S05       ', CAST(215.000 AS Decimal(18, 3)), 74)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0933 ', N'CTSP0351  ', N'S06       ', CAST(215.000 AS Decimal(18, 3)), 35)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0934 ', N'CTSP0352  ', N'S02       ', CAST(195.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0935 ', N'CTSP0352  ', N'S03       ', CAST(195.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0936 ', N'CTSP0352  ', N'S04       ', CAST(195.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0937 ', N'CTSP0352  ', N'S05       ', CAST(195.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0938 ', N'CTSP0352  ', N'S06       ', CAST(195.000 AS Decimal(18, 3)), 11)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0939 ', N'CTSP0353  ', N'S02       ', CAST(185.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0940 ', N'CTSP0353  ', N'S03       ', CAST(185.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0941 ', N'CTSP0353  ', N'S04       ', CAST(185.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0942 ', N'CTSP0353  ', N'S05       ', CAST(185.000 AS Decimal(18, 3)), 34)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0943 ', N'CTSP0353  ', N'S06       ', CAST(185.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0944 ', N'CTSP0354  ', N'S02       ', CAST(165.000 AS Decimal(18, 3)), 124)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0945 ', N'CTSP0354  ', N'S03       ', CAST(165.000 AS Decimal(18, 3)), 2)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0946 ', N'CTSP0354  ', N'S04       ', CAST(165.000 AS Decimal(18, 3)), 42)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0947 ', N'CTSP0354  ', N'S05       ', CAST(165.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0948 ', N'CTSP0354  ', N'S06       ', CAST(165.000 AS Decimal(18, 3)), 24)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0949 ', N'CTSP0355  ', N'S02       ', CAST(165.000 AS Decimal(18, 3)), 53)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0950 ', N'CTSP0355  ', N'S03       ', CAST(165.000 AS Decimal(18, 3)), 24)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0951 ', N'CTSP0355  ', N'S04       ', CAST(165.000 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0952 ', N'CTSP0355  ', N'S05       ', CAST(165.000 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0953 ', N'CTSP0355  ', N'S06       ', CAST(165.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0954 ', N'CTSP0356  ', N'S02       ', CAST(165.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0955 ', N'CTSP0356  ', N'S03       ', CAST(165.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0956 ', N'CTSP0356  ', N'S04       ', CAST(165.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0957 ', N'CTSP0356  ', N'S05       ', CAST(165.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0958 ', N'CTSP0356  ', N'S06       ', CAST(165.000 AS Decimal(18, 3)), 12)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0959 ', N'CTSP0357  ', N'S02       ', CAST(89.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0960 ', N'CTSP0357  ', N'S03       ', CAST(89.000 AS Decimal(18, 3)), 33)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0961 ', N'CTSP0357  ', N'S04       ', CAST(89.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0962 ', N'CTSP0357  ', N'S05       ', CAST(89.000 AS Decimal(18, 3)), 43)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0963 ', N'CTSP0357  ', N'S06       ', CAST(89.000 AS Decimal(18, 3)), 32)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0964 ', N'CTSP0358  ', N'S02       ', CAST(89.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0965 ', N'CTSP0358  ', N'S03       ', CAST(89.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0966 ', N'CTSP0358  ', N'S04       ', CAST(89.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0967 ', N'CTSP0358  ', N'S05       ', CAST(89.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0968 ', N'CTSP0358  ', N'S06       ', CAST(89.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0969 ', N'CTSP0359  ', N'S02       ', CAST(89.000 AS Decimal(18, 3)), 100)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0970 ', N'CTSP0359  ', N'S03       ', CAST(89.000 AS Decimal(18, 3)), 18)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0971 ', N'CTSP0359  ', N'S04       ', CAST(89.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0972 ', N'CTSP0359  ', N'S05       ', CAST(89.000 AS Decimal(18, 3)), 20)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0973 ', N'CTSP0359  ', N'S06       ', CAST(89.000 AS Decimal(18, 3)), 21)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0974 ', N'CTSP0360  ', N'S02       ', CAST(168.000 AS Decimal(18, 3)), 22)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0975 ', N'CTSP0360  ', N'S03       ', CAST(168.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0976 ', N'CTSP0360  ', N'S04       ', CAST(168.000 AS Decimal(18, 3)), 24)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0977 ', N'CTSP0360  ', N'S05       ', CAST(168.000 AS Decimal(18, 3)), 25)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0978 ', N'CTSP0361  ', N'S02       ', CAST(168.000 AS Decimal(18, 3)), 26)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0979 ', N'CTSP0361  ', N'S03       ', CAST(168.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0980 ', N'CTSP0361  ', N'S04       ', CAST(168.000 AS Decimal(18, 3)), 23)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0981 ', N'CTSP0361  ', N'S05       ', CAST(168.000 AS Decimal(18, 3)), 97)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0982 ', N'CTSP0362  ', N'S02       ', CAST(168.000 AS Decimal(18, 3)), 65)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0983 ', N'CTSP0362  ', N'S03       ', CAST(168.000 AS Decimal(18, 3)), 4)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0984 ', N'CTSP0362  ', N'S04       ', CAST(168.000 AS Decimal(18, 3)), 6)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0985 ', N'CTSP0362  ', N'S05       ', CAST(168.000 AS Decimal(18, 3)), 5)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0986 ', N'CTSP0363  ', N'S14       ', CAST(149.000 AS Decimal(18, 3)), 20)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0987 ', N'CTSP0364  ', N'S14       ', CAST(149.000 AS Decimal(18, 3)), 20)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0988 ', N'CTSP0365  ', N'S14       ', CAST(169.000 AS Decimal(18, 3)), 10)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0989 ', N'CTSP0366  ', N'S14       ', CAST(169.000 AS Decimal(18, 3)), 10)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0990 ', N'CTSP0367  ', N'S14       ', CAST(149.000 AS Decimal(18, 3)), 10)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0991 ', N'CTSP0367  ', N'S15       ', CAST(149.000 AS Decimal(18, 3)), 10)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0992 ', N'CTSP0368  ', N'S14       ', CAST(149.000 AS Decimal(18, 3)), 10)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0993 ', N'CTSP0368  ', N'S15       ', CAST(149.000 AS Decimal(18, 3)), 10)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0994 ', N'CTSP0367  ', N'S16       ', CAST(149.000 AS Decimal(18, 3)), 10)
INSERT [dbo].[CTSP_Size] ([MaCTSP_Size], [MaCTSP], [MaSize], [Gia], [SoLuongTon]) VALUES (N'CTSPS0995 ', N'CTSP0367  ', N'S17       ', CAST(149.000 AS Decimal(18, 3)), 10)
GO
INSERT [dbo].[DanhGia] ([MaDG], [MaDH], [MaCTSP_Size], [NoiDung], [DiemSao], [NgayDG]) VALUES (N'DG001     ', N'DH002     ', N'CTSPS0603 ', N'Sản phẩm chất lượng. Shipper nhiệt tình
', 5, CAST(N'2024-10-21' AS Date))
INSERT [dbo].[DanhGia] ([MaDG], [MaDH], [MaCTSP_Size], [NoiDung], [DiemSao], [NgayDG]) VALUES (N'DG002     ', N'DH002     ', N'CTSPS0102 ', N'Sản phẩm tốt tuy nhiên giao hàng hơi chậm trễ', 4, CAST(N'2024-10-21' AS Date))
INSERT [dbo].[DanhGia] ([MaDG], [MaDH], [MaCTSP_Size], [NoiDung], [DiemSao], [NgayDG]) VALUES (N'DG003     ', N'DH002     ', N'CTSPS0443 ', N'Sản phẩm chất lượng', 5, CAST(N'2024-10-29' AS Date))
INSERT [dbo].[DanhGia] ([MaDG], [MaDH], [MaCTSP_Size], [NoiDung], [DiemSao], [NgayDG]) VALUES (N'DG004     ', N'DH002     ', N'CTSPS0107 ', N'jbfwwq', 5, CAST(N'2024-10-25' AS Date))
INSERT [dbo].[DanhGia] ([MaDG], [MaDH], [MaCTSP_Size], [NoiDung], [DiemSao], [NgayDG]) VALUES (N'DG005     ', N'DH005     ', N'CTSPS0099 ', N'Giao hàng chậm trễ, sản phẩm còn chỉ thừa', 3, CAST(N'2024-10-29' AS Date))
INSERT [dbo].[DanhGia] ([MaDG], [MaDH], [MaCTSP_Size], [NoiDung], [DiemSao], [NgayDG]) VALUES (N'DG006     ', N'DH003     ', N'CTSPS0126 ', N'Tốt', 5, CAST(N'2024-10-30' AS Date))
INSERT [dbo].[DanhGia] ([MaDG], [MaDH], [MaCTSP_Size], [NoiDung], [DiemSao], [NgayDG]) VALUES (N'DG007     ', N'DH002     ', N'CTSPS0449 ', NULL, 5, CAST(N'2024-10-30' AS Date))
GO
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'DM01      ', N'Áo Thun')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'DM02      ', N'Áo Sơ Mi')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'DM03      ', N'Váy')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'DM04      ', N'Áo Khoác')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'DM05      ', N'Quần Jean')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'DM06      ', N'Quần Short')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'DM07      ', N'Áo Len')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'DM08      ', N'Áo Hoodie')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'DM09      ', N'Phụ Kiện')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'DM11      ', N'Túi sách')
GO
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayDH], [TrangThai], [PTTT], [Tien_Giam], [Tien_Ship], [TongTien], [TienThu], [DCGH], [PTGH], [TenNguoiNhan], [SoDienThoai], [MaCode]) VALUES (N'DH001     ', N'KH002     ', CAST(N'2024-10-16' AS Date), N'Đã giao hàng', N'Thanh toán khi nhận hàng', CAST(19.925 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(630.700 AS Decimal(18, 3)), CAST(610.775 AS Decimal(18, 3)), N'356 Nguyễn Thái Sơn, Phường 04, Quận Gò Vấp, Thành phố Hồ Chí Minh', N'Giao hàng tận nơi', N'Nguyễn Hoàn Sinh', N'0373289392', N'F634FAA1')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayDH], [TrangThai], [PTTT], [Tien_Giam], [Tien_Ship], [TongTien], [TienThu], [DCGH], [PTGH], [TenNguoiNhan], [SoDienThoai], [MaCode]) VALUES (N'DH002     ', N'KH001     ', CAST(N'2024-10-16' AS Date), N'Đã giao hàng', N'Thanh toán khi nhận hàng', CAST(130.691 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(1120.940 AS Decimal(18, 3)), CAST(990.249 AS Decimal(18, 3)), N'Thôn Bắc Thuận, Xã Nhơn Hậu, Thị xã An Nhơn, Tỉnh Bình Định', N'Giao hàng tận nơi', N'Nguyễn Ngọc Hậu', N'0359691322', N'250DAAF4')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayDH], [TrangThai], [PTTT], [Tien_Giam], [Tien_Ship], [TongTien], [TienThu], [DCGH], [PTGH], [TenNguoiNhan], [SoDienThoai], [MaCode]) VALUES (N'DH003     ', N'KH001     ', CAST(N'2024-10-21' AS Date), N'Đã giao hàng', N'Thanh toán khi nhận hàng', CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(566.000 AS Decimal(18, 3)), CAST(566.000 AS Decimal(18, 3)), N'Thôn Cát Lái, Xã Bản Lầu, Huyện Mường Khương, Tỉnh Lào Cai', N'Giao hàng tận nơi', N'Nguyễn Thị Thu Thương', N'0359691322', N'A4F4132A')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayDH], [TrangThai], [PTTT], [Tien_Giam], [Tien_Ship], [TongTien], [TienThu], [DCGH], [PTGH], [TenNguoiNhan], [SoDienThoai], [MaCode]) VALUES (N'DH004     ', N'KH001     ', CAST(N'2024-10-23' AS Date), N'Đã giao hàng', N'Thanh toán khi nhận hàng', CAST(0.000 AS Decimal(18, 3)), CAST(20.000 AS Decimal(18, 3)), CAST(59.000 AS Decimal(18, 3)), CAST(79.000 AS Decimal(18, 3)), N'122/22/2 Lê Lợi, Phường Quang Trung, Thành phố Hà Giang, Tỉnh Hà Giang', N'Giao hàng tận nơi', N'Nguyễn Ngọc Hậu', N'0359691322', N'FD2A67A1')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayDH], [TrangThai], [PTTT], [Tien_Giam], [Tien_Ship], [TongTien], [TienThu], [DCGH], [PTGH], [TenNguoiNhan], [SoDienThoai], [MaCode]) VALUES (N'DH005     ', N'KH001     ', CAST(N'2024-10-23' AS Date), N'Đã giao hàng', N'Thanh toán khi nhận hàng', CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(59.000 AS Decimal(18, 3)), CAST(59.000 AS Decimal(18, 3)), N'192 Nguyễn Oanh, Phường 17, Quận Gò Vấp, Thành phố Hồ Chí Minh', N'Nhận hàng tại cửa hàng', N'Nguyễn Ngọc Hậu', N'0372842939', N'290F5CE6')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayDH], [TrangThai], [PTTT], [Tien_Giam], [Tien_Ship], [TongTien], [TienThu], [DCGH], [PTGH], [TenNguoiNhan], [SoDienThoai], [MaCode]) VALUES (N'DH006     ', N'KH001     ', CAST(N'2024-10-28' AS Date), N'Hủy', N'Thanh toán khi nhận hàng', CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(678.000 AS Decimal(18, 3)), CAST(678.000 AS Decimal(18, 3)), N'192 Nguyễn Oanh, Phường 17, Quận Gò Vấp, Thành phố Hồ Chí Minh', N'Nhận hàng tại cửa hàng', N'Nguyễn Ngọc Hậu', N'0359691322', N'F5278057')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayDH], [TrangThai], [PTTT], [Tien_Giam], [Tien_Ship], [TongTien], [TienThu], [DCGH], [PTGH], [TenNguoiNhan], [SoDienThoai], [MaCode]) VALUES (N'DH007     ', N'KH001     ', CAST(N'2024-10-28' AS Date), N'Hủy', N'Thanh toán khi nhận hàng', CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(238.000 AS Decimal(18, 3)), CAST(238.000 AS Decimal(18, 3)), N'192 Nguyễn Oanh, Phường 17, Quận Gò Vấp, Thành phố Hồ Chí Minh', N'Nhận hàng tại cửa hàng', N'Nguyễn Ngọc Hậu', N'0359691322', N'A9021BED')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayDH], [TrangThai], [PTTT], [Tien_Giam], [Tien_Ship], [TongTien], [TienThu], [DCGH], [PTGH], [TenNguoiNhan], [SoDienThoai], [MaCode]) VALUES (N'DH008     ', N'KH001     ', CAST(N'2024-10-28' AS Date), N'Đang xử lý', N'Thanh toán khi nhận hàng', CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(119.000 AS Decimal(18, 3)), CAST(119.000 AS Decimal(18, 3)), N'192 Nguyễn Oanh, Phường 17, Quận Gò Vấp, Thành phố Hồ Chí Minh', N'Nhận hàng tại cửa hàng', N'Nguyễn Ngọc Hậu', N'0359691322', N'41800960')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayDH], [TrangThai], [PTTT], [Tien_Giam], [Tien_Ship], [TongTien], [TienThu], [DCGH], [PTGH], [TenNguoiNhan], [SoDienThoai], [MaCode]) VALUES (N'DH009     ', N'KH001     ', CAST(N'2024-10-29' AS Date), N'Đang xử lý', N'Thanh toán khi nhận hàng', CAST(47.000 AS Decimal(18, 3)), CAST(20.000 AS Decimal(18, 3)), CAST(1186.000 AS Decimal(18, 3)), CAST(1159.000 AS Decimal(18, 3)), N'192 Nguyễn Oanh, Phường Mông Dương, Thành phố Cẩm Phả, Tỉnh Quảng Ninh', N'Giao hàng tận nơi', N'Lê Thị Na', N'0328223713', N'BE2AF54B')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayDH], [TrangThai], [PTTT], [Tien_Giam], [Tien_Ship], [TongTien], [TienThu], [DCGH], [PTGH], [TenNguoiNhan], [SoDienThoai], [MaCode]) VALUES (N'DH010     ', N'KH001     ', CAST(N'2024-10-29' AS Date), N'Đang xử lý', N'Thanh toán khi nhận hàng', CAST(60.700 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(666.900 AS Decimal(18, 3)), CAST(606.200 AS Decimal(18, 3)), N'192 Nguyễn Oanh, Phường 17, Quận Gò Vấp, Thành phố Hồ Chí Minh', N'Nhận hàng tại cửa hàng', N'Nguyễn Ngọc Hậu', N'0359691322', N'53EE39D5')
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayDH], [TrangThai], [PTTT], [Tien_Giam], [Tien_Ship], [TongTien], [TienThu], [DCGH], [PTGH], [TenNguoiNhan], [SoDienThoai], [MaCode]) VALUES (N'DH011     ', N'KH001     ', CAST(N'2024-10-29' AS Date), N'Đang xử lý', N'Thanh toán khi nhận hàng', CAST(44.900 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(778.400 AS Decimal(18, 3)), CAST(733.500 AS Decimal(18, 3)), N'192 Nguyễn Oanh, Phường 17, Quận Gò Vấp, Thành phố Hồ Chí Minh', N'Nhận hàng tại cửa hàng', N'Nguyễn Ngọc Hậu', N'0359691322', N'209F992F')
GO
INSERT [dbo].[GioHang] ([MaGH], [MaKH]) VALUES (N'GH001     ', N'KH001     ')
INSERT [dbo].[GioHang] ([MaGH], [MaKH]) VALUES (N'GH002     ', N'KH002     ')
GO
INSERT [dbo].[HinhAnh_DanhGia] ([MaHinhAnh], [MaDG], [DuongDan]) VALUES (N'HA001     ', N'DG001     ', N'/LayoutShop/img/Screenshot 2024-07-28 231324.png')
INSERT [dbo].[HinhAnh_DanhGia] ([MaHinhAnh], [MaDG], [DuongDan]) VALUES (N'HA002     ', N'DG001     ', N'/LayoutShop/img/Screenshot 2024-07-28 231459.png')
INSERT [dbo].[HinhAnh_DanhGia] ([MaHinhAnh], [MaDG], [DuongDan]) VALUES (N'HA003     ', N'DG001     ', N'/LayoutShop/img/Screenshot 2024-07-30 224428.png')
INSERT [dbo].[HinhAnh_DanhGia] ([MaHinhAnh], [MaDG], [DuongDan]) VALUES (N'HA004     ', N'DG002     ', N'/LayoutShop/img/LogoShop.png')
INSERT [dbo].[HinhAnh_DanhGia] ([MaHinhAnh], [MaDG], [DuongDan]) VALUES (N'HA005     ', N'DG002     ', N'/LayoutShop/img/Screenshot 2024-07-28 231459.png')
INSERT [dbo].[HinhAnh_DanhGia] ([MaHinhAnh], [MaDG], [DuongDan]) VALUES (N'HA006     ', N'DG002     ', N'/LayoutShop/img/Screenshot 2024-07-30 224428.png')
INSERT [dbo].[HinhAnh_DanhGia] ([MaHinhAnh], [MaDG], [DuongDan]) VALUES (N'HA007     ', N'DG003     ', N'/LayoutShop/img/Screenshot 2024-08-13 115305.png')
INSERT [dbo].[HinhAnh_DanhGia] ([MaHinhAnh], [MaDG], [DuongDan]) VALUES (N'HA008     ', N'DG004     ', N'/LayoutShop/img/QS1_XanhNhatBuiReu.png')
INSERT [dbo].[HinhAnh_DanhGia] ([MaHinhAnh], [MaDG], [DuongDan]) VALUES (N'HA009     ', N'DG005     ', N'/LayoutShop/img/QS1_XanhNhatRach.png')
INSERT [dbo].[HinhAnh_DanhGia] ([MaHinhAnh], [MaDG], [DuongDan]) VALUES (N'HA010     ', N'DG006     ', N'/LayoutShop/img/QS1_Ðen.png')
INSERT [dbo].[HinhAnh_DanhGia] ([MaHinhAnh], [MaDG], [DuongDan]) VALUES (N'HA011     ', N'DG006     ', N'/LayoutShop/img/QS1_XanhDamBuiReu.png')
GO
INSERT [dbo].[KhachHang] ([MaKH], [HovaTen], [GioiTinh], [NgaySinh], [SDT], [Email], [DiaChi], [Username], [Password]) VALUES (N'KH001     ', N'Nguyễn Ngọc Hậu', N'F', CAST(N'2003-09-23' AS Date), N'0359691322', N'nguyenngochau2309@gmail.com', N'129/10 Nguyễn Oanh, Phường 17, Gò Vấp, TPHCM', N'hau2309', N'111')
INSERT [dbo].[KhachHang] ([MaKH], [HovaTen], [GioiTinh], [NgaySinh], [SDT], [Email], [DiaChi], [Username], [Password]) VALUES (N'KH002     ', N'Nguyễn Hoàn Sinh', N'F', CAST(N'2003-09-19' AS Date), N'0976728517', N'nguyenhoansinh2309@gmail.com', N'356 Nguyễn Thái Sơn, Phường 4, Gò Vấp, TPHCM', N'Sinh1909', N'111')
GO
INSERT [dbo].[KhuyenMai] ([MaKM], [MaSP], [MaDM], [MoTa], [Loai_KM], [SoTien_PhanTram], [NgayBD], [NgayKT], [TienToiThieu]) VALUES (N'KM002     ', N'SP002     ', NULL, N'Tặng dây cột tóc', N'Quà tặng', 0, CAST(N'2024-10-16' AS Date), CAST(N'2024-10-16' AS Date), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[KhuyenMai] ([MaKM], [MaSP], [MaDM], [MoTa], [Loai_KM], [SoTien_PhanTram], [NgayBD], [NgayKT], [TienToiThieu]) VALUES (N'KM003     ', NULL, NULL, N'Miễn phí vẫn chuyển cho tất cả đơn hàng trên 300.000', N'Free ship', 0, CAST(N'2024-10-15' AS Date), CAST(N'2024-10-16' AS Date), CAST(300.000 AS Decimal(18, 3)))
INSERT [dbo].[KhuyenMai] ([MaKM], [MaSP], [MaDM], [MoTa], [Loai_KM], [SoTien_PhanTram], [NgayBD], [NgayKT], [TienToiThieu]) VALUES (N'KM004     ', NULL, NULL, N'Giảm 10% cho hóa đơn trên 1 triệu', N'%', 10, CAST(N'2024-10-15' AS Date), CAST(N'2024-10-16' AS Date), CAST(1000.000 AS Decimal(18, 3)))
INSERT [dbo].[KhuyenMai] ([MaKM], [MaSP], [MaDM], [MoTa], [Loai_KM], [SoTien_PhanTram], [NgayBD], [NgayKT], [TienToiThieu]) VALUES (N'KM005     ', NULL, NULL, N'Tặng túi sách', N'Quà tặng', 0, CAST(N'2024-10-15' AS Date), CAST(N'2024-10-16' AS Date), CAST(500.000 AS Decimal(18, 3)))
INSERT [dbo].[KhuyenMai] ([MaKM], [MaSP], [MaDM], [MoTa], [Loai_KM], [SoTien_PhanTram], [NgayBD], [NgayKT], [TienToiThieu]) VALUES (N'KM006     ', NULL, N'DM01      ', N'Giảm 5% cho sản phẩm thuộc danh mục đó', N'%', 5, CAST(N'2024-10-16' AS Date), CAST(N'2024-10-16' AS Date), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[KhuyenMai] ([MaKM], [MaSP], [MaDM], [MoTa], [Loai_KM], [SoTien_PhanTram], [NgayBD], [NgayKT], [TienToiThieu]) VALUES (N'KM007     ', NULL, N'DM02      ', N'Giảm 3% cho tất cả mặt hàng thuộc danh mục này', N'%', 3, CAST(N'2024-10-16' AS Date), CAST(N'2024-10-16' AS Date), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[KhuyenMai] ([MaKM], [MaSP], [MaDM], [MoTa], [Loai_KM], [SoTien_PhanTram], [NgayBD], [NgayKT], [TienToiThieu]) VALUES (N'KM008     ', NULL, NULL, N'Miễn phí vẫn chuyển', N'Free ship', 0, CAST(N'2024-10-25' AS Date), CAST(N'2024-10-25' AS Date), CAST(100.000 AS Decimal(18, 3)))
INSERT [dbo].[KhuyenMai] ([MaKM], [MaSP], [MaDM], [MoTa], [Loai_KM], [SoTien_PhanTram], [NgayBD], [NgayKT], [TienToiThieu]) VALUES (N'KM009     ', NULL, N'DM04      ', N'Giảm 10% cho tất cả sản phẩm thuộc danh mục này', N'%', 10, CAST(N'2024-10-29' AS Date), CAST(N'2024-10-29' AS Date), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[KhuyenMai] ([MaKM], [MaSP], [MaDM], [MoTa], [Loai_KM], [SoTien_PhanTram], [NgayBD], [NgayKT], [TienToiThieu]) VALUES (N'KM010     ', NULL, N'DM01      ', N'Tặng dây buộc tóc', N'Quà tặng', 0, CAST(N'2024-10-29' AS Date), CAST(N'2024-10-29' AS Date), CAST(0.000 AS Decimal(18, 3)))
INSERT [dbo].[KhuyenMai] ([MaKM], [MaSP], [MaDM], [MoTa], [Loai_KM], [SoTien_PhanTram], [NgayBD], [NgayKT], [TienToiThieu]) VALUES (N'KM011     ', NULL, NULL, N'Tặng túi sách cho đơn hàng tối thiểu 500.000', N'Quà tặng', 0, CAST(N'2024-10-29' AS Date), CAST(N'2024-10-29' AS Date), CAST(500.000 AS Decimal(18, 3)))
GO
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS01      ', N'Đen')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS02      ', N'Trắng')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS03      ', N'Xám')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS04      ', N'Xanh Dương')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS05      ', N'Xanh Lá')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS06      ', N'Kem')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS07      ', N'Be')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS08      ', N'Vàng')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS09      ', N'Nâu')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS10      ', N'Hồng')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS11      ', N'Tím')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS12      ', N'Cam')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS13      ', N'Đỏ')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS14      ', N'Xanh Rêu')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS15      ', N'Xanh Navy')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS16      ', N'Xanh Ngọc')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS17      ', N'Hồng Pastel')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS18      ', N'Xanh Nhạt')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS19      ', N'Xanh Bích')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS20      ', N'Xanh Đen')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS21      ', N'Xanh Mint')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS22      ', N'Xám Chì')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS23      ', N'Hoa xanh')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS24      ', N'Hoa hồng')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS25      ', N'Thỏ nhỏ')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS26      ', N'Gấu nhỏ')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS27      ', N'Nơ hồng')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS28      ', N'Nơ trắng')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS29      ', N'Nơ thỏ trắng')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS30      ', N'Nơ nền trắng')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS31      ', N'Nơ nền hồng')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS32      ', N'Mini cherry')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS33      ', N'Nơ xanh')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS34      ', N'Thỏ ruy băng')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS35      ', N'Ghi')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS36      ', N'Quả mơ')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS37      ', N'Xanh lam nhạt')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS38      ', N'Nauy')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS39      ', N'Nâu rêu')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS40      ', N'Cà phê')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS41      ', N'Dài tay + Cà vạt')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS42      ', N'Kẻ đen')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS43      ', N'Kẻ hồng')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS44      ', N'Kẻ xanh lá')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS45      ', N'Kẻ xanh dương')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS46      ', N'Set áo + khăn')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS47      ', N'Áo sơ mi')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS48      ', N'Xanh than')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS49      ', N'Kẻ be')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS50      ', N'Đen phối trắng')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS51      ', N'Trắng phối đen')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS52      ', N'Xanh than')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS53      ', N'Xanh bơ')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS54      ', N'Ghi')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS55      ', N'Hoa to')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS56      ', N'Hoa bé')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS57      ', N'Đỏ anh đào')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS58      ', N'Hồng đỏ')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS59      ', N'Nâu gỗ')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS60      ', N'Thêu nơ hồng')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS61      ', N'Xanh basic ')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS62      ', N'Xanh thường')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS63      ', N'Xanh bestquality')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS64      ', N'Xanh Retro')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS65      ', N'Xanh')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS66      ', N'Bụi')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS67      ', N'Xanh đậm')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS68      ', N'Xanh quan')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS69      ', N'Đen nhạt')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS70      ', N'Đen đậm')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS71      ', N'Xám Khói')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS72      ', N'Xanh Đậm Bụi Rêu')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS73      ', N'Xanh Nhạt Bụi Rêu')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS74      ', N'Xanh đậm rách')
INSERT [dbo].[MauSac] ([MaMS], [TenMS]) VALUES (N'MS75      ', N'Xanh nhạt rách')
GO
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP001     ', N'DM01      ', N'Áo Thun Thêu 8YO SUMMER PARTY Tee Cotton Mềm Mịn Mát - Áo Phông Local Brand Unisex Nam Nữ Form Rộng', N'Chất liệu: PREMIUM COTTON - Càng mặc càng sướng
Mềm - Mịn - Mát - Không đổ lông - Chống co rút
Cổ áo dày bản hơn, bo cổ dày 3cm, nhưng mặc vẫn thoải mái và không bị thô. Lên form đẹp hơn, không bị dão cổ
Màu sắc: Đen / Kem / Hồng / Xanh 
Họa tiết: Thêu icon toàn thân
Xuất xứ: Việt Nam.', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwlnk5kryzfd9f.webp', CAST(119.000 AS Decimal(18, 3)), CAST(119.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP002     ', N'DM01      ', N'Áo Thun 8YO MINI ZOO Tee Cotton Mềm Mịn Mát - Áo Phông Local Brand Unisex Nam Nữ Form Rộng', N'Chất liệu: PREMIUM COTTON - Càng mặc càng sướng
Mềm - Mịn - Mát - Không đổ lông - Chống co rút
Cổ áo dày bản hơn, bo cổ dày 3cm, nhưng mặc vẫn thoải mái và không bị thô. Lên form đẹp hơn, không bị dão cổ
Màu sắc: Đen / Kem / Hồng
Họa tiết: In kéo lụa cao cấp, bền bỉ
Xuất xứ: Việt Nam.', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzlv2pbqzvz530.webp', CAST(99.000 AS Decimal(18, 3)), CAST(99.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP003     ', N'DM01      ', N'Áo phông nữ nam unisex tay lỡ thun localbrand form rộng cổ tròn oversize cotton CLOUDZY TH ÁO THUN', N'Phong cách: Thể thao, Cơ bản, Hàn Quốc, Đường phố
Chiều dài áo: Dài
Xuất xứ:Việt Nam
Chiều dài tay áo:Dài 3/4
Dáng kiểu áo:Oversized
Cổ áo:Cổ tròn
Chất liệu:Cotton', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz8kx9efcci597.webp', CAST(89.000 AS Decimal(18, 3)), CAST(139.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP004     ', N'DM01      ', N'Áo Thun Form Rộng Nam Nữ 1969STUDIO Áo Phông Cổ Tim Hot Trend -TL-01', N'Tên sản phẩm: Áo Thun Form Rộng Nam Nữ 1969STUDIO Cổ Tim Hot Trend Top Cổ Tim-TL-01
Áo Thun, Áo Phông Unisex tay lỡ là item không thể thiếu trong tủ đồ vì sự thoải mái, dễ chịu, lại rất dễ phối đồ.
Áo tay lỡ được làm bằng chất liệu co giãn, cực kì đẹp, vải rất mát, sờ mịn tay.
Áo thun tay lỡ unisex thích hợp với cả nam và nữ. Mặc làm áo thun cặp, áo nhóm rất phù hợp.
Áo thun tay lỡ form rộng dễ dàng phối đồ, thời trang phong cách Hàn Quốc.
Hàng sản xuất tại xưởng, đảm bảo chất lượng.
Chất liệu: thun co giãn, vải mềm, vải mịn, thoáng mát.
Đường may chuẩn chỉnh, tỉ mỉ, chắc chắn.
Phù hợp phối nhiều màu.
Thiết kế trẻ trung, năng động.', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-luho90ngw8pe7a@resize_w900_nl.webp', CAST(37.900 AS Decimal(18, 3)), CAST(59.900 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP005     ', N'DM01      ', N'CHUJIE Áo Thun áo phông Cotton Tay Ngắn Họa Tiết Sọc Đơn Giản Thời Trang Mùa Hè Mới Cho Nữ TXS104 A29J0WB', N'Thương hiệu:CHUJIE
Cổ áo:Cổ tròn
Chiều dài tay áo:Tay ngắn
Chất liệu:Cotton
Rất lớn:Không
Mẫu:Sọc
Cropped Top:Không', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rbkl-lpp7utygp33keb.webp', CAST(49.000 AS Decimal(18, 3)), CAST(49.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP006     ', N'DM01      ', N'Áo thun trơn nam nữ Nekosg, Áo phông trơn Unisex form rộng nhiều màu tay lỡ cổ tròn ATL0', N'Xuất xứ:Việt Nam Cổ áo:Cổ tròn
Chiều dài tay áo:Dài 3/4
Chất liệu:Cotton
Mẫu:Trơn
Dịp:Hằng Ngày
Phong cách:Cơ bản, Tối giản, Đường phố
Cropped Top:Không', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lj9otid7gq8i4e.webp', CAST(59.000 AS Decimal(18, 3)), CAST(59.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP007     ', N'DM01      ', N'Áo thun baby BASIC TRƠN ôm body chất tăm cotton', N'Áo thun baby BASIC TRƠN ôm body chất tăm cotton
ÁO FREESIZE DƯỚI 50KG ( trắng , xanh ngọc : cân nặng đến 58 kí )
TRẮNG & BE KEM mỏng dễ lộ , mn mặc bra cẩn thận nha >> VẢI NÀY MN PHẢI GIẶT TAY ĐỂ TĂNG ĐỘ BỀN Ạ.
Chất tăm cotton mỏng nhẹ siêu mát 
( LƯU Ý : MÀU TRẮNG HƠI LỘ , CHỈ MẶC BRA MÀU KEM HOẶC TRẮNG HOẶC MÀU DA ) 
Màu : Trắng Đen Xám ...', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lv3mgk0jw1rtba.webp', CAST(59.000 AS Decimal(18, 3)), CAST(59.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP008     ', N'DM01      ', N'Áo Thun Local Brand Dehood gắn Hoa form rộng cổ tròn Unisex chất Cotton - HOABS', N'Đóng gói: Full tag Form Unisex cho cả nam và nữ Chất liệu: Cotton Size THUN: S | M | L | XL (Thông số như bảng size) Size BABYTEE: S | M (Size S < 47kg, Size M < 55kg)', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwzeown6pzo998.webp', CAST(114.940 AS Decimal(18, 3)), CAST(119.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP009     ', N'DM01      ', N'Áo Thun Thêu 8YO UNIVERSE JERSEY Tee Cotton Mềm Mịn Mát - Áo Phông Local Brand Unisex Nam Nữ', N'Chất liệu: PREMIUM COTTON - Càng mặc càng sướng
Mềm - Mịn - Mát - Không đổ lông - Chống co rút
Cổ áo dày bản hơn, bo cổ dày 3cm, nhưng mặc vẫn thoải mái và không bị thô. Lên form đẹp hơn, không bị dão cổ
Màu sắc: Đen / Kem / Hồng / Xanh
Họa tiết: Thêu vi tính cao cấp, sắc nét và bền bỉ
Xuất xứ: Việt Nam.', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxy5sa4egvrt6d.webp', CAST(119.000 AS Decimal(18, 3)), CAST(119.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP010     ', N'DM01      ', N'Áo thun oversize cotton 260GSM Local Brand Circus Unisex nam nữ form rộng - MÃ BASIC S18 CIRCUS', N'Thương hiệu:Circus
Phong cách:Thể thao, Cơ bản, Hàn Quốc, Retro, Đường phố
Xuất xứ:Việt Nam
Chiều dài tay áo:Tay ngắn
Dáng kiểu áo:Oversized
Cổ áo:Cổ tròn
Chất liệu:Cotton', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzu7vknsc68x8c.webp', CAST(139.000 AS Decimal(18, 3)), CAST(139.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP011     ', N'DM01      ', N'Áo thun baby tee nữ cổ tròn tay ngắn thêu hình black fearl A142 SUTANO', N'Tên sản phẩm : Áo thun baby tee nữ cổ tròn tay ngắn thêu hình black fearl A142 SUTANO
Chất liệu: cotton khô
Màu sắc: đen/trắng/kem
Kiểu dáng : baby tee
Form : Free size <58kg', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-m00hdcg2re75b5.webp', CAST(49.000 AS Decimal(18, 3)), CAST(49.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP012     ', N'DM01      ', N'Áo thun tay ngắn cổ vuông Choice Việt Nam HT53 dáng ôm thời trang hè gợi cảm cho nữ', N'Tên sản phẩm: Áo thun tay ngắn cổ vuông Choice Việt Nam HT53 dáng ôm thời trang hè gợi cảm cho nữ
- Chất liệu: Xốp nhăn
- Màu sắc: Đen, Trắng
- Size: S, M, L', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rdvi-lyouqkua3vckbc.webp', CAST(48.400 AS Decimal(18, 3)), CAST(48.400 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP013     ', N'DM01      ', N'Áo Thun 8YO BUTTERFLY ART Tee Cotton Mềm Mịn Mát - Áo Phông Local Brand Unisex Nam Nữ Form Rộng', N'Chất liệu: PREMIUM COTTON - Càng mặc càng sướng
+ Mềm - Mịn - Mát - Không đổ lông - Chống co rút
+ Cổ áo dày bản hơn, bo cổ dày 3cm, nhưng mặc vẫn thoải mái và không bị thô. Lên form đẹp hơn, không bị dão cổ
+ Màu sắc: Đen
+ Họa tiết: In charm kéo lụa
+ Xuất xứ: Việt Nam.', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwlnrxn03geze6.webp', CAST(77.400 AS Decimal(18, 3)), CAST(99.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP014     ', N'DM01      ', N'Lovito Áo thun trơn cơ bản thông thường cho nữ LNM67139', N'Mô hình: Đồng bằng
Phong cách: Giản dị
Cộng với kích thước: Không
Chất liệu: Bông
Thành phần: 95% Cotton + 5% Spandex
Loại phù hợp: Slim Fit
Trong suốt: Không
Căng: Căng nhẹ
Xuất xứ: Trung Quốc đại lục ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdwp-lyz0540xqc0y3c.webp', CAST(73.000 AS Decimal(18, 3)), CAST(73.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP015     ', N'DM01      ', N'Áo thun Mie in hình hoạ tiết form ôm Buddies.25', N'Chất liệu : Thun gân
Hình in : Công nghệ DECAL, PET, đảm bảo hình in sắc nét và chắc chắn
Kích cỡ : S/ M
Áo 
+ SIZE S: chiều dài: 51cm - chiều ngang: 42cm - tay áo: 15cm - cửa tay: 15cm
+  SIZE M : chiều dài: 53cm - chiều ngang: 42cm - tay áo: 17cm - cửa tay: 16cm
+ SIZE L: chiều dài 55cm - chiều ngang: 45cm - tay áo 17cm - cửa tay: 16cm', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz7lborypeapfd.webp', CAST(139.000 AS Decimal(18, 3)), CAST(199.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP016     ', N'DM01      ', N'Áo Thun Nữ Form Vừa SUNTEE FV001 Phong Cách Basic In Hình Nhỏ Vải Cotton 250GSM Cao Cấp Thoáng Mát', N'Tên sản phẩm: Áo Thun Nữ Form Vừa SUNTEE FV001 Phong Cách Basic In Hình Nhỏ Vải Cotton 250GSM Cao Cấp Thoáng Mát
Mã sản phẩm: FV001
Chất liệu: Cotton 100% cao cấp, co giãn 2 chiều
Kiểu dáng: Áo thun form vừa
Nơi sản xuất: Việt Nam
Thương hiệu: SUNTEE
Họa tiết: In trên ngực áo
Công nghệ in sắc nét, không bong tróc', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxttodwxuti31b.webp', CAST(139.000 AS Decimal(18, 3)), CAST(139.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP017     ', N'DM01      ', N'Lovito Áo thun trơn họa tiết tinh tế mềm mại và thoải mái cho nữ L86ED112', N'Mô hình: trơn
Phong cách: Giản dị
Cộng với kích thước: Không
Chất liệu: Polyester
Thành phần: 95% Polyester + 5% Spandex
Loại phù hợp: Phù hợp thường xuyên
Trong suốt: Không
Căng: căng trung bình
Xuất xứ: Trung Quốc đại lục ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdvj-lyuey6jnrdhie1.webp', CAST(69.000 AS Decimal(18, 3)), CAST(69.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP018     ', N'DM01      ', N'BARE_Áo thun dáng dài trơn form ôm đủ màu basic chất liệu thun con giãn 4 chiều fit dáng siêu đẹp- AT011, AT014', N'Xuất xứ:Việt Nam
Cổ áo:Cổ tròn
Chất liệu:Cotton
Mẫu:Trơn
Cropped Top:Không', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxmbbqhftxp5b6.webp', CAST(45.000 AS Decimal(18, 3)), CAST(45.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP019     ', N'DM01      ', N'Áo hai dây thun tăm mềm mịn thoáng mát Choice Việt Nam HT11', N'Chất liệu: Vải thun tăm được cấu tạo từ những sợi vải dẫn chéo vào nhau, co dãn tốt, thoáng mát, thoáng khí hơn thông qua các khe hở trên bền mặt vải. Mặt vải luôn mềm mại, hoàn toàn không gây kích ứng đối với người mặc. Kích thước: S M .
Form dáng: Slimfit.
Xuất xứ: Việt Nam', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rd57-lvytdf2tr49496.webp', CAST(23.700 AS Decimal(18, 3)), CAST(23.700 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP020     ', N'DM01      ', N'Áo thun nữ đính 5 nơ xinh xắn áo thun nữ baby tee co giãn dáng ôm body siêu xinh A415 PANOSI', N'Tên sản phẩm: Áo thun nữ đính 5 nơ xinh xắn áo thun nữ baby tee co giãn dáng ôm body siêu xinh A415 PANOSI
+ Chất liệu: thun tăm co giãn
+ Màu sắc: đen/trắng/hồng
+ Kiểu dáng: baby tee/gắn nơ/rúm eo
+ Form: <58kg', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lx0wgvjkr4yj15.webp', CAST(55.000 AS Decimal(18, 3)), CAST(55.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP021     ', N'DM01      ', N'Áo thun đính nơ Choice Việt Nam AH30 dáng ôm body cho nữ chất cotton co giãn thoải mái', N'Tên sản phẩm: Áo thun đính nơ Choice Việt Nam AH30 dáng ôm body cho nữ, baby tee đủ màu chất cotton co giãn thoải mái
- Chất liệu: borip
- Màu sắc: Đen, Trắng, Hồng
- Size: S, M', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rdxc-lyouqufq3qsi2d.webp', CAST(58.100 AS Decimal(18, 3)), CAST(58.100 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP022     ', N'DM01      ', N'Áo thun nữ form vừa regular ARD530 Miucho cotton cổ tròn in typography', N'Kích thước: S, M, L, XL
Màu sắc: Áo thun Miucho có sẵn hai gam màu cơ bản là trắng và đen, ngoài ra còn đa dạng màu sắc tùy vào mẫu áo. Giúp bạn dễ dàng kết hợp với nhiều trang phục khác nhau.
Kiểu dáng: Form vừa regular 
Nơi sản xuất: Việt Nam', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvlhglajskd84d.webp', CAST(99.000 AS Decimal(18, 3)), CAST(99.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP023     ', N'DM01      ', N'Áo Thun Bo Viền Tay, Áo Phông Nam Nữ Unisex Tay Lỡ By JOLI BST01 In Hình Basic Chất Cotton Form Rộng Phong Cách Ulzzang', N' Màu sắc: Be Viền Nâu
Chất liệu: Cotton, đứng form, thoáng mát, không xù lông, đường may chuẩn chỉnh. tỉ mỉ, chắc chắn. 
Thiết kế: Trẻ trung, năng động, dễ phối đồ.  Phù hợp: Áo dành cho cả nam và nữ, ở nhà, đi học, di du lịch, dạo phố, hẹn hò,...', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvlc28l4fic1b4.webp', CAST(135.000 AS Decimal(18, 3)), CAST(135.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP024     ', N'DM01      ', N'Áo thun kiểu, áo thun trơn nữ chất tăm Hàn ATK01 thương hiệu Vamivo, may kỹ', N'Áo thun kiểu, áo thun trơn nữ chất tăm Hàn ATK01 thương hiệu Vamivo, may kỹ
Áo mã ATK01 - sản phẩm gắn thương hiệu Vamivo , do nhà Vamivo tự thiết kế, chất vải tăm hàn, 100% cotton điểm nhấn là phần cổ tròn, vạt áo khoét chữ V và hình khuy giả gỗ siêu xinh , vạt áo và viền áo basic dễ mix với các sản phẩm khác nhau như quần jean, quần short, chân váy chữ A, váy điệu, váy voan….', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lh0evimpsj0251.webp', CAST(180.000 AS Decimal(18, 3)), CAST(180.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP025     ', N'DM01      ', N'Áo Thun nữ Babytee, áo cộc tay fom ôm phối Ren Ngực Chất Tăm Gân Dày Chun Hông Siêu Hot gumashop', N'Thông tin vật phẩm và cam đoan mua sắm tại shop
️ nguồn gốc: Hàng Quảng Châu Trung Quốc và sx thi công riêng
️ Size :  40-57kg
Size dựa vào cả độ cao và khối lượng 
Chứ ngoài ra mỗi cân nặng
Khách đặt mua Note chọn size theo số đo, hoạc nhắn tin để shop tham vấn size cho chuẩn nhất ạ.', N'https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-lz7k1qctqz4df3.webp', CAST(37.500 AS Decimal(18, 3)), CAST(37.500 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP026     ', N'DM01      ', N'Áo thun phông logo tay nam nữ PINK tay lỡ form rộng CEERSHAW Unisex', N'Chất liệu : thun cotton dày dặn, hình in lụa sắc nét 
Đặc biệt :  ở phiên bản này đã có full tag / logo phần Cổ & bên Hông đầy đủ ạ
Form : 3 Size ( Áo đã được cải tiến về Số Đo , Form Dáng & Mẫu Mã đẹp hơn ạ )
M : < 45kg , Cao < 1.6m 
L : 46kg _ 65kg , Cao 1.6m _ 1.7m 
XL : 66kg _ 75kg , Cao 1.7m _ 1.75m', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lv69mjrlce56e5.webp', CAST(87.000 AS Decimal(18, 3)), CAST(95.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP027     ', N'DM01      ', N'Áo Thun Nữ Basic Kiểu Trễ Vai - Tharo Clothing [AO00208]', N'Áo Thun Nữ Basic Kiểu Trễ Vai - Tharo Clothing [AO00208]
Thông tin sản phẩm 
- Kích thước: Bảng size chỉ mang tính chất tham khảo, tùy thuộc vào số đo cơ thể và chất liệu khác nhau nên sẽ có sự chênh lệch nhẹ +-2cm
Size S: dài 62, ngực 59
Size M:  dài 63, ngực 60
Size L: dài 64, ngực 61', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lydj4ywrwv9p35.webp', CAST(76.000 AS Decimal(18, 3)), CAST(76.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP028     ', N'DM01      ', N'Áo thun form Baby Tee DaaLaa Store in hình icon xinh xắn Spartacks A5932', N'Áo thun baby tee, in hình icon dễ thương Spartacks 
Chất liệu thun dày dặn, thoáng mát, co giãn tốt
Áo baby tee nữ có thể kết hợp với chân váy, quần short hoặc quần jean để đi dạo phố, cafe hoặc các buổi party,…
', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lo0mdhtmk29m35.webp', CAST(45.000 AS Decimal(18, 3)), CAST(45.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP029     ', N'DM01      ', N'Áo thun nữ trễ vai, áo kiểu nữ thu đông dài tay dáng ôm body phong cách Hàn Quốc AOT154', N'Miễn Phí đổi trả trong 30 ngày Bất Kể Lí Do
Mô tả về Áo thun nữ trễ vai, áo kiểu nữ thu đông dài tay dáng ôm body chất thun tăm co dãn 4 chiều phong cách Hàn Quốc AOT154
-Màu sắc: đen, kem, xám, đỏ
-Chất liệu: Vải tăm hàn
+ Áo thun nữ trễ vai, áo kiểu nữ thu đông dài tay có đường may chuẩn chỉnh, tỉ mỉ, chắc chắn.
+ Thiết kế áo hiện đại, trẻ trung, năng động. Dễ phối đồ
+ Áo thun nữ trễ vai, áo kiểu nữ thu đông dài tay được sản xuất tại xưởng, cam kết Chất lượng tốt giá cả hợp lí phù hợp với khách Hàng', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzsrq8jrgnmp3f.webp', CAST(78.000 AS Decimal(18, 3)), CAST(78.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP030     ', N'DM01      ', N'Áo thun tay ngắn phối ren thắt nơ NANEE.CLOTHING Gonz.brand', N'Áo thun tay ngắn phối ren thắt nơ là một sản phẩm thời trang đơn giản nhưng không kém phần tinh tế. Với 2 lớp ren ngay phần ngực, sản phẩm tạo điểm nhấn cho trang phục, giúp người mặc trông thêm phong cách và nổi bật. 
Áo thun tay ngắn phối ren thắt nơ NANEE.CLOTHING Gonz.brand
Sản phẩm có 2 size để khách dễ dàng lựa chọn, bao gồm size S và M, phù hợp với nhiều kích cỡ người mặc. Ngoài ra, sản phẩm còn có 2 màu cơ bản là kem phối đỏ và đen phối đen, giúp khách hàng dễ dàng lựa chọn theo sở thích và phong cách của mình.', N'https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-lx2x2l5fzwez11.webp', CAST(65.000 AS Decimal(18, 3)), CAST(65.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP031     ', N'DM01      ', N'Lovito Áo thun trơn Colorblock cho nữ LNA70383', N'Mô hình: trơn
Phong cách: Giản dị
Cộng với kích thước: Không
Chất liệu: Polyester
Thành phần: 100% Polyester
Loại phù hợp: Phù hợp thường xuyên
Trong suốt: Không
Căng: Căng trung bình
Xuất xứ: Trung Quốc đại lục ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdy2-ly1tekepswcqcd.webp', CAST(103.000 AS Decimal(18, 3)), CAST(103.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP032     ', N'DM01      ', N'Lovito Áo thun thêu trơn thông thường cho nữ LNM73284', N'Mô hình: trơn
Phong cách: Giản dị
Cộng với kích thước: Không
Chất liệu: Bông
Thành phần: 95% Cotton + 5% Spandex
Loại phù hợp: Slim Fit
Trong suốt: Không
Căng: Căng trung bình
Xuất xứ: Trung Quốc đại lục ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdyh-lyuf1fvs1w0y6b.webp', CAST(87.000 AS Decimal(18, 3)), CAST(87.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP033     ', N'DM01      ', N'Áo trễ vai tay ngắn Style Are You thiết kế buộc dây tinh tế, áo kiểu nữ chất liệu thun cotton mềm mịn co giãn tốt', N'Thông tin sản phẩm:
- Thương hiệu: Style Are You
- Chất liệu: tăm cotton mềm mịn, siêu co giãn, không cộm, không nhăn
- Form áo: freesize <62kg
- Màu sắc: Đen | Trắng | Xanh | Hồng
- Có thể giặt máy', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lve6aggubskk57.webp', CAST(89.000 AS Decimal(18, 3)), CAST(89.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP034     ', N'DM01      ', N'Áo thun nữ , áo form vừa đẹp kiểu dáng trẻ trung chất liệu cotton co giãn bốn chiều mềm mại thoải mái khi mặc mỗi ngày', N'Chất liệu vải : 70%cotton và 30%polly
+ Chất liệu : Thun cotton co giản 4 chiều , mềm mại ,thoáng mát thấm hút mồ hôi
+ Đường chỉ may kỹ lưỡng ,tinh tế
+ form áo form vừa thoả mái khi mặt hằng ngày
+Màu sắc : 
- Có các size : S , M , L , XL
- Sản xuất : sản xuất trực tiếp tại xưởng – hàng Việt Nam xuất khẩu', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-liqsmdrrhgb638.webp', CAST(52.000 AS Decimal(18, 3)), CAST(52.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP035     ', N'DM01      ', N'Lovito Áo thun trơn có nơ phía trước đơn giản dành cho nữ L89MD079', N'Mô hình: trơn
Phong cách: Giản dị
Cộng với kích thước: Không
Chất liệu: Polyester
Thành phần: 95% Polyester + 5% Spandex
Loại phù hợp: Phù hợp thường xuyên
Trong suốt: Không
Căng: Căng nhẹ
Xuất xứ: Trung Quốc đại lục ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdyj-lza06k6dy1ju97.webp', CAST(64.000 AS Decimal(18, 3)), CAST(64.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP036     ', N'DM01      ', N'Lovito Áo thun nơ trơn thông thường dành cho nữ LNE68269', N'Mô hình: Đồng bằng
Phong cách: Giản dị
Cộng với kích thước: Không
Chất liệu: Polyester
Thành phần: 95% Polyester + 5% Spandex
Loại phù hợp: Phù hợp thường xuyên
Trong suốt: Không
Căng: Căng trung bình
Xuất xứ: Trung Quốc đại lục ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdvv-lziveq7xosj821.webp', CAST(73.000 AS Decimal(18, 3)), CAST(73.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP037     ', N'DM01      ', N'Áo brandy nữ dáng ngắn phối bèo DELIZ chất thun mềm mịn kiểu dáng coquetee BUNNY', N'Tên: Áo croptop nữ dáng ngắn cổ bèo đính nơ cổ nhẹ nhàng DELIZ form ôm hàng hè hottrend BUNNY
- Màu sắc: đen/hồng
- Size: S/M
- Địa chỉ: Gia Lâm - Hà Nội', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lskmuyxmg0jo0a.webp', CAST(125.000 AS Decimal(18, 3)), CAST(125.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP038     ', N'DM01      ', N'Áo Croptop Thun Xước Lệch Vai Dài tay Nữ [FREESHIP] Áo phông giấy mỏng dáng suông ôm bánh bèo tiểu thư sexy hot - ACR024', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmscz2ngd49re1.webp', CAST(56.000 AS Decimal(18, 3)), CAST(59.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP039     ', N'DM01      ', N'Áo Thun Tee Cartoon Nhiều Mẫu Hot Trend 2024 Unisex Nam Nữ - 100% cotton Sản Phẩm Full Tem tag Túi Zip', N'Chất liệu : 100% cotton thấm hút tốt, không bị xù lông, mát mẻ, thoải mái. 
   Định Lượng vải : 250gsm
   Công nghệ in : Kỹ Thuật số 
   Đường chỉ may chắc chắn, tỉ mỉ  ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxhoa90i3opn4b.webp', CAST(159.300 AS Decimal(18, 3)), CAST(159.300 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP040     ', N'DM01      ', N'Áo Thun Unisex SAIGONESE Vải Cotton Phối Jean Denim Hoạ Tiết Shuriken Form Rộng Unisex Nam Nữ 3 Màu', N'Áo Thun Unisex SAIGONESE Vải Cotton Phối Jean Denim Hoạ Tiết Shuriken Form Rộng Unisex Nam Nữ 3 Màu
Chất liệu: Thun cotton co giản 2 chiều', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwgspwd9ul0953.webp', CAST(154.500 AS Decimal(18, 3)), CAST(154.500 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP041     ', N'DM01      ', N'Áo thun trơn xoắn hai bên vai phong cách HAVANA HE233', N'Áo thun trơn xoắn hai bên vai phong cách HE233
Màu: nâu rêu, đen, trắng 
Freesize dưới 52kg mang vừa', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-ljnkg50q8wxg51.webp', CAST(85.000 AS Decimal(18, 3)), CAST(85.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP042     ', N'DM01      ', N'SUXI Áo thun tay ngắn cổ tròn màu sắc đơn giản phong cách mùa hè thời trang cho nữ', N'1. Nếu không rõ ràng cho kích thước Trung Quốc, xin vui lòng liên hệ với chúng tôi.
2. Không chấp nhận các đơn đặt hàng khẩn cấp, 3-5 ngày để gửi, nói chung, khoảng 7-15 ngày có thể nhận được;
3. Tất cả các sản phẩm denim mới không có lỗ, vui lòng tự cắt nó;
4. Màu sắc hình ảnh sẽ khác nhau do ánh sáng màn hình điện thoại hoặc máy tính;
5. Nếu bạn có vấn đề sau khi chọn, bỏ lỡ sản phẩm hoặc bị hư hỏng, xin vui lòng liên hệ với chúng tôi;
6. Nếu màu sắc và kích thước chính xác và sản phẩm trong tình trạng tốt, việc đổi trả không được hỗ trợ. Cảm ơn BẠN ĐÃ HIỂU.', N'https://down-vn.img.susercontent.com/file/10295598f98733f2a36ad101f2e40c31.webp', CAST(129.000 AS Decimal(18, 3)), CAST(129.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP043     ', N'DM01      ', N'Lovito Áo thun nơ bướm thông thường cho nữ LNE69121', N'Mô hình: Bướm
Phong cách: Giản dị
Cộng với kích thước: Không
Chất liệu: Polyester
Thành phần: 95% Polyester + 5% Spandex
Loại phù hợp: Phù hợp thường xuyên
Trong suốt: Không
Căng: Căng nhẹ
Xuất xứ: Trung Quốc đại lục ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdy8-lxqdkopdipnq77.webp', CAST(81.000 AS Decimal(18, 3)), CAST(81.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP044     ', N'DM01      ', N'Lovito Áo thun nơ trơn thông thường dành cho nữ LNE66011', N'Mô hình: trơn
Phong cách: Giản dị
Cộng với kích thước: Không
Chất liệu: Polyester
Thành phần: 100% Polyester
Loại phù hợp: Slim Fit
Trong suốt: Không
Căng: Căng nhẹ
Xuất xứ: Trung Quốc đại lục ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdxx-lxmab55rkqbw37.webp', CAST(68.000 AS Decimal(18, 3)), CAST(68.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP045     ', N'DM02      ', N'Áo Sơ Mi Dài Tay Nữ CECI Kẻ Sọc Kèm Cà Vạt Cổ Bẻ Chất Liệu Thô Kẻ Mềm Mát - Sơ Mi Phong Cách Hàn Quốc [A381]', N'THÔNG TIN SẢN PHẨM
- Tên sản phẩm: Áo Sơ Mi Dài Tay Nữ CECI Kẻ Sọc Kèm Cà Vạt Cổ Bẻ Chất Liệu Thô Kẻ Mềm Mát Thời Trang Kiểu Cách [A381]
- Thương hiệu: Ceci.studio
- Xuất sứ: Việt Nam', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lvwq2kozi2u36f.webp', CAST(115.000 AS Decimal(18, 3)), CAST(115.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP046     ', N'DM02      ', N'Sơ mi kẻ dài tay thêu tim PLAY /Shyncloset', N'Khi nhận hàng xong từ ship: bạn vui lòng quay lại clip khi bóc hàng, nếu thiếu sản phẩm, sản phẩm hỏng lỗi, bạn gửi clip shop sẽ có trách nhiệm. Nếu không có clip shop không xử lý. Vì sự hài lòng của bạn là mục tiêu của shop, shop mong bạn hợp tác để đảm bảo quyềjn lợi của bạn và shop ạ!', N'https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-lxgdj5gweuop22.webp', CAST(85.000 AS Decimal(18, 3)), CAST(85.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP047     ', N'DM02      ', N'Lovito Áo Sơ Mi Sọc Bất Đối Xứng Thanh Lịch Cho Nữ LNL67114', N'Mô hình: Sọc
Phong cách: Thanh lịch
Cộng với kích thước: Không
Chất liệu: Polyester
Thành phần: 100% Polyester
Loại phù hợp: Phù hợp thường xuyên
Trong suốt: Không
Kéo dài: Không căng
Xuất xứ: Trung Quốc đại lục ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdx0-lzahexrhhhyg6c.webp', CAST(102.000 AS Decimal(18, 3)), CAST(102.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP048     ', N'DM02      ', N'[Kèm Khăn Choàng Cổ] Set Áo Sơ Mi Tay Dài Kẻ Sọc, Phong Cách Retro Hot Trend Năng Động - Yuumiee', N'Xuất xứ: Quảng Châu
Màu sắc: Xanh
Size: S (40-47,5kg), M (47,5-57,5kg), L (57,5-62,5kg)
Chất liệu: Polyeste', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz7gdno5nlfx8d.webp', CAST(90.000 AS Decimal(18, 3)), CAST(116.100 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP049     ', N'DM02      ', N'Bigsize 45-100KG Áo Polo Tay Ngắn Giả 2 Lớp Tay Ngắn Dáng Rộng Cho Nữ', N'THÔNG TIN SẢN PHẨM
- Thương hiệu: Sói Store
- Xuất xứ: Việt Nam
- Chất liệu: Thân áo thun gân lụa lạnh. Tay áo + cổ áo lụa chéo
- Màu sắc: Đen, Xanh', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzc63uoikmu979.webp', CAST(83.000 AS Decimal(18, 3)), CAST(83.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP050     ', N'DM02      ', N'Lovito Áo sơ mi sọc colorblock thông thường dành cho nữ LNE43407(Nhiều màu)', N'Hoa văn: Sọc
Phong cách: Ngày thường
Kích thước lớn: Không
Chất liệu: Polyester
Thành phần: 100% Polyester
Độ vừa vặn: Vừa vặn thông thường
Vải xuyên thấu: Không
Độ co giãn: Không co giãn
Xuất xứ: Trung Quốc đại lục ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdy1-lz9yq3llq77rb0.webp', CAST(124.000 AS Decimal(18, 3)), CAST(124.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP051     ', N'DM02      ', N'Áo sơ mi ngắn tay bồng vạt tôm - 247store - Smtho856/P4K12', N'', N'https://down-vn.img.susercontent.com/file/vn-11134201-7qukw-leuzsu0uo8yf3e.webp', CAST(114.000 AS Decimal(18, 3)), CAST(114.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP052     ', N'DM02      ', N'Áo Sơ Mi Nữ Form Rộng Dài Tay Cotton Lụa Hàn Unisex Màu Trắng Đen Đi Học, Đi Làm, Văn Phòng, Công sở Cực Xinh 539', N'Áo Sơ Mi Nữ Form Rộng Dài Tay Cotton Lụa Hàn Unisex Màu Trắng Đen Đi Học, Đi Làm, Văn Phòng, Công sở Cực Xinh 539
- Vải Cotton  mềm mại, mặt vải mịn nhẵn. Không xù lông, thấm hút mồ hôi
- Đường kim mũi chỉ cẩn thận, chắc chắn
- Sản phẩm cắt chỉ rất tỉ mỉ, gần như không có chỉ thừa', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lkq5qg46h3nk7a.webp', CAST(69.000 AS Decimal(18, 3)), CAST(75.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP053     ', N'DM02      ', N'Áo sơ mi tay ngắn form rộng freesize nhiều màu HAVANA, áo sơ mi lụa ullzang tay ngắn AO126', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lrqqx3w6vb9gf2.webp', CAST(89.000 AS Decimal(18, 3)), CAST(89.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP054     ', N'DM02      ', N'Set áo sơ mi đũi phối dây ', N'Hướng dẫn bảo quản:
+ Không dùng nước nóng hoăc xà phòng có tính kiềm quá cao để giặt áo loại này.
+ Đối với việc ủi vải lụa, khi ủi nên có một lớp khăn hoặc vải mỏng phía dưới', N'/LayoutShop/img/453a2009-c208-4c07-aaea-40294731e0d2.webp', CAST(141.000 AS Decimal(18, 3)), CAST(141.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP055     ', N'DM02      ', N'SHIHANROU Áo Sơ Mi áo sơ mi nữ áo kiểu hàn quốc may đo độc đáo trendy chic WCS2430MA0 12Z240322', N'', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rce5-lt6l2n26i9s25b.webp', CAST(89.000 AS Decimal(18, 3)), CAST(89.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP056     ', N'DM02      ', N'Du YAN Áo khoác sơ mi phong cách Trung Quốc mới phong cách Trung Quốc dành cho nữ niche sang trọng đơn giản hàng đầu để mặc bên', N'Hướng dẫn giặt là.
Sản phẩm nên được giặt bằng tay và không được cho vào máy giặt.
Màu sắc của sản phẩm bị phai sau khi giặt, vui lòng giặt riêng.
Tránh bạc và phai màu, vui lòng không tiếp xúc với nắng nóng.', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rd4f-lv03b352ew86fd.webp', CAST(103.000 AS Decimal(18, 3)), CAST(103.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP057     ', N'DM02      ', N'Áo Sơ Mi Trắng Nữ MICHIO Dáng Suông Tay Bèo Sang Trong, Thanh Lịch', N'THÔNG TIN SẢN PHẨM ÁO SƠ MI TAY BÈO
Màu sắc: Trắng
Chất Liệu: Cotton Mềm Mịn, chất vải đanh, mặc đứng dáng, chống nhăn, có độ thoáng khi mặc, thấm hút mồ hôi
Áo may 3 nút ngay ngực và có nẹp che nên đảm bảo không bị lộ hở bên trong.
Thiết kế basic đơn giản dễ mặc và sử dụng, dễ phối với các trang phục khác
Size: S, M, L', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxw2ryhqi40pa9.webp', CAST(155.000 AS Decimal(18, 3)), CAST(155.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP058     ', N'DM02      ', N'Lovito Áo sơ mi sọc màu có nút phía trước thông thường dành cho nữ LNE58290(Nhiều màu)', N'Mẫu: Sọc
Phong cách: Thường ngày
Plus Kích thước: Không
Chất liệu: Polyester
Thành phần: 100% Polyester
Loại vừa vặn: Vừa vặn thông thường
Sheer: Không
Căng: Không căng
Khu vực xuất xứ: Trung Quốc đại lục ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdxe-lzfpr7fnt57u0e.webp', CAST(109.000 AS Decimal(18, 3)), CAST(109.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP059     ', N'DM02      ', N'Áo Sơ Mi Kiểu Cộc Tay Cổ Bèo, Áo Somi Cổ Trụ Phối Cổ Sen Điệu Đà Tiểu Thư Sang Chảnh Miho House', N'Toàn bộ ảnh sản phẩm là do Miho tự chụp, màu ảnh có thể chênh lệch đậm nhạt một chút do ánh sáng và góc chụp ạ.
- Khi đặt hàng, khách hàng lưu ý đọc kỹ mô tả, phân loại màu sắc để đặt hàng, Miho sẽ gửi đơn theo đúng trong đơn hàng, không nhặt hàng theo ghi chú ạ
- Nếu gặp bất kỳ vấn đề gì với sản phẩm, các bạn hãy nhắn tin để Miho xử lý ngay cho bạn nhé ạ.', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lrtweo43svd04b.webp', CAST(95.000 AS Decimal(18, 3)), CAST(95.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP060     ', N'DM02      ', N'Áo Sơ Mi Kẻ Sọc Ngắn Tay Dukeen Local Brand Unisex Oxford Shirt SM033', N'Thông tin sản phẩm:Áo Sơ Mi Kẻ Sọc Ngắn Tay Dukeen Local Brand Unisex Oxford Shirt SM033
- Chất liệu: Vải  Oxford
- Form: Oversize
- Màu sắc: Xanh/Hồng/Xám
- Thiết kế: Kẻ Sọc
 SIZE GỢI Ý:
- SIZE M: 1m55 - 1m65 Nặng 45-60kg
- SIZE L: 1m65 - 1m75 Nặng 65-75kg
- SIZE XL: >1m70 Nặng >70kg', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmfsh33xi40v93.webp', CAST(138.000 AS Decimal(18, 3)), CAST(138.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP061     ', N'DM02      ', N'Áo sơ mi coquette cho nữ kiểuu dáng xinh yêu form baby tee Choice Việt Nam HT42 vải xốp nhăn co dãn 4 chiều', N' Tên sản phẩm: Áo sơ mi coquette cho nữ kiểu dáng xinh form baby tee Choice Việt Nam HT42 vải xốp nhăn co dãn 4 
- Loại sản phẩm: Áo baby tee thun cotton ngắn tay cổ tròn mỏng vừa vặn màu trắng phong cách mới mùa hè Mophus Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.
- Chât liệu: vải xốp nhăn co dãn 4 chiều
- Màu sắc: Đen, trắng
- Kích thước: M (<52kg), L (53-65kg)', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rd3w-lxalyvr9ud6wdd.webp', CAST(27.200 AS Decimal(18, 3)), CAST(27.200 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP062     ', N'DM02      ', N'Áo sơ mi cộc tay cổ V phối dây buộc eo phong cách thanh lịch Vintagevibes.', N'Áo sơ mi cộc tay cổ V phối dây buộc eo phong cách thanh lịch Vintagevibes. Freesize < 58kg mặc thoải mái
Hướng dẫn bảo quản Áo sơ mi cộc tay cổ V phối dây buộc eo phong cách thanh lịch Vintagevibes.
                   Không dùng nước nóng hoăc xà phòng có tính kiềm quá cao để giặt áo loại này.
                   Đối với việc ủi vải lụa, khi ủi nên có một lớp khăn hoặc vải mỏng phía dưới', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxy7h9pfhwij4e.webp', CAST(96.100 AS Decimal(18, 3)), CAST(96.100 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP063     ', N'DM02      ', N'[KO KÈM QUẦN] Áo sơ mi nữ A.640, Áo nữ dáng vừa tay ngắn cổ tàu phối nơ eo cách điệu - Shop Chấm Bi', N'[KO KÈM QUẦN] Áo sơ mi nữ A.640, Áo nữ dáng vừa tay ngắn cổ tàu phối nơ eo cách điệu - Shop Chấm Bi✪ Kích thước: Freesize dưới 60kg và 1m7 mặc được
- Chiều dài 65cm
- Dài tay 16cm
- V1 < 100cm
- V2 < 100cm
- Vai 53cm
- Bắp tay < 40cm
Lưu ý kích thước trên có thể chênh lệch (+/-)2cm ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyt9g48pxky569.webp', CAST(92.000 AS Decimal(18, 3)), CAST(92.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP064     ', N'DM02      ', N'Áo sơ mi kiểu babydoll HACHI Top phối khuy màu pastel dễ thương - Vintagevibes.', N'Áo sơ mi kiểu babydoll HACHI Top phối khuy màu pastel dễ thương chất vải linen bột QC dày dặn, thoáng mát, lên form cực kỳ xinh, dễ mặc, dễ phối đồ
Áo sơ mi kiểu babydoll HACHI Top phối khuy màu pastel dễ thương Gồm 4 màu y hình: Trắng/ Be/ Hồng/ Xanh dương
Kích thước Áo sơ mi kiểu babydoll HACHI Top phối khuy màu pastel dễ thương', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lufvgwr8563p27.webp', CAST(99.000 AS Decimal(18, 3)), CAST(99.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP065     ', N'DM02      ', N'Áo sơ mi kẻ sọc tay hến phong cách vintage Hàn Quốc Red Shop 304055', N'Sản phẩm Việt Nam
Chất liệu: Vải thô mát, mặc mát mẻ, thoáng mát, độ nhăn không đáng kể, so với các chất liệu sơ mi khác thì độ nhăn này ít
Màu sắc: Kẻ Xanh, Kẻ Hồng, Kẻ Đen.
Họa tiết: Tay hến kẻ sọc
Kích cỡ: 3 size S M L
  + S <50kg
  + M <55kg
  + L <60kg', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyowa992w78h1b.webp', CAST(108.000 AS Decimal(18, 3)), CAST(108.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP066     ', N'DM02      ', N'PlusUltra Áo Sơ Mi Nữ Kẻ Sọc Phong Cách retro Đại Học Mỹ Kèm Cà Vạt hàn quốc lãng mạn', N'Nhật Bản ngọt ngào màu xanh và trắng sọc xù ren cổ chữ V Áo sơ mi chống nắng Áo sơ mi rộng rãi hàng đầu của phụ nữ mùa thu', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rcef-lsco9clrlvlr43.webp', CAST(74.000 AS Decimal(18, 3)), CAST(79.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP067     ', N'DM02      ', N'Áo sơ mi Lovito kiểu tay phồng cột dây phối viền tương phản màu trơn thường ngày cho nữ LNE24175 (Nhiều màu)', N'', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdyu-lz9ycm4o2rsccf.webp', CAST(118.000 AS Decimal(18, 3)), CAST(118.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP068     ', N'DM02      ', N'Áo Sơ Mi Kiểu Nữ Trắng Phối Ren Tay Ngắn Cộc MA375 Kimee', N'Áo Sơ Mi Kiểu  vừa vặn màu trắng phong cách mới mùa hè Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải  cực kỳ thân thiện với làn da.
- Áo Sơ Mi Kiểu  form rộng cổ tròn thoải mái
- Áo Sơ Mi Kiểu  thun nữ dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz0cydbqlhnl27.webp', CAST(125.000 AS Decimal(18, 3)), CAST(125.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP069     ', N'DM02      ', N'Áo sơ mi bâu ren cột nơ tay phồng dài Mypstore', N'Kích cỡ: S,M,L (40kg - 65kg)
+Dài áo : 58cm
+Size S : vòng 1 dưới 86cm, cân nặng 40-48 kg
+Size M : vòng 1 từ 86cm - dưới 94cm, cân nặng 48-58kg
+Size L : vòng 1 từ 94cm -  dưới 100cm, cân nặng 58-65kg', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lx6ttmmga5ej32.webp', CAST(87.000 AS Decimal(18, 3)), CAST(87.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP070     ', N'DM02      ', N'[ẢNH HAVANA CHỤP] Áo sơ mi kẻ sọc basic tay bồng thêu logo trái tim AO284', N'Sản phẩm của Havana đã được chọn lọc và kiểm tra sản phẩm vô cùng tỉ mỉ, nói không với hàng kém chất lượng và không giống hình nên bạn iu yên tâm mua hàng nhen', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lt4r40vyxdj828.webp', CAST(129.000 AS Decimal(18, 3)), CAST(129.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP071     ', N'DM02      ', N'XẢ HÀNG Áo Sơ Mi Dài Tay Kẻ Sọc Cổ Sen, Áo Somi Nữ Form Rộng Thoáng Mát, Sơmi Kiểu Tay Bồng Điệu Đà Tiểu Thư Miho House', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lu1z8wjzi0prd1.webp', CAST(137.000 AS Decimal(18, 3)), CAST(137.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP072     ', N'DM03      ', N'Váy caro hai dây dáng xòe Choice Việt Nam V-21 kèm 2 nơ xinh xắn ', N'Chất liệu : Vải thô mềm - thấm hút mồ hôi
- Họa tiết : hồng caro', N'https://down-vn.img.susercontent.com/file/sg-11134301-7rd4p-lwfgcjdb98671e.webp', CAST(78.700 AS Decimal(18, 3)), CAST(78.700 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP073     ', N'DM03      ', N'Lovito Váy hình học Gingham thông thường cho nữ LNE69503', N'', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdxx-lzzq5xsvimwk78.webp', CAST(126.000 AS Decimal(18, 3)), CAST(126.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP074     ', N'DM03      ', N'Váy nữ đi chơi V.189, Váy nữ dáng ngắn cổ tròn pha ren phối nơ ngực form bí ngô phong cách dễ thương - Shop Chấm Bi', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxb1noq47umxaf.webp', CAST(133.000 AS Decimal(18, 3)), CAST(133.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP075     ', N'DM03      ', N'Lovito Váy cơ bản trơn đơn giản cho nữ L85AD112', N'Mô hình: trơn
Phong cách: Giản dị
Cộng với kích thước: Không
Chất liệu: Polyester
Thành phần: 100% Polyester
Loại phù hợp: Slim Fit
Trong suốt: Không
Kéo dài: Không căng
Xuất xứ: Trung Quốc đại lục ', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdwv-lylojsrsq4xg2b.webp', CAST(126.000 AS Decimal(18, 3)), CAST(126.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP076     ', N'DM03      ', N' Váy body form A ôm eo màu xanh trắng da mặc hè đi tiệc đi chơi dễ thương', N'THÔNG TIN SẢN PHẨM 
Chất liệu:  thun mịn
Kích thước:  freesize co giãn 52kg đổ lại', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxuxna10l23f65.webp', CAST(149.000 AS Decimal(18, 3)), CAST(149.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP077     ', N'DM03      ', N'Váy Kaki Trắng 2 Dây Nhúm Ngực Ly Eo Chun Lưng Dễ Mặc 2 Form Ngắn Dài Cá Tính (Ảnh Thật Trải Sàn) Lollaye V2D.501', N'Chất liệu: Kaki
Màu: Trắng
Size: S, M, L
bảng size tham khảo :
Size S dưới 47kg 
Size M từ 48-54kg
Size L từ  55-58kg(Tùy Chiều Cao Nhé)', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lv1pq9yztq0p0f.webp', CAST(154.000 AS Decimal(18, 3)), CAST(154.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP078     ', N'DM03      ', N'Đầm thiết kế cổ chữ V xẻ ngực đính nơ hoa chiết ly eo vạt váy xòe tôn dáng Hb.clodet D170', N'Đầm thiết kế cổ chữ V xẻ ngực đính nơ hoa chiết ly eo vạt váy xòe tôn dáng Hb.clodet D170 với chất cotton ý dày dặn 2 lớp là một lựa chọn hoàn hảo cho những buổi tiệc đơn giản hay hẹn hò cùng bạn bè vào ngày cuối tuần.
Chất liệu: Chất Cotton Ý
Size: S - M - L
Màu sắc: Trắng', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyhge7qkxh7176.webp', CAST(211.000 AS Decimal(18, 3)), CAST(211.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP079     ', N'DM03      ', N'VÁY BÍ CHUN EO TAY PHỒNG ĐÍNH NƠ BẢN TO SIÊU XINH V12', N'Một em váy xinh siêu dễ thương tôn dáng lém luôn, chất liệu thô đũi mặc mát, các nàng cũng có thể tách rời phối với các items khác cũng xinh nha

Size: S, M', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwfucglu0yqjc4.webp', CAST(139.000 AS Decimal(18, 3)), CAST(139.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP080     ', N'DM03      ', N'Lovito Váy ren màu trơn dễ thương cho nữ LBA79186', N'Mẫu: Trơn
Phong cách: Dễ thương
Loại váy: Một dòng
Plus Kích thước: Không
Chất liệu: PolYester
Thành phần: 100% PolYester
Loại vừa vặn: Slim Fit
Sheer: Không
Căng: Không căng', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rd5x-lu09kcwtddll5b.webp', CAST(103.000 AS Decimal(18, 3)), CAST(103.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP081     ', N'DM03      ', N'Lovito Váy thêu cúc trơn đơn giản cho nữ L79AD199(Nhiều màu)', N'Mẫu: Trơn
Phong cách: Thường ngày
Plus Kích thước: Không
Chất liệu: Polyester
Thành phần: 100% Polyester
Loại vừa vặn: Vừa vặn thông thường
Sheer: Không
Căng: Không căng', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdxl-lzfpvaqkadsy2e.webp', CAST(115.000 AS Decimal(18, 3)), CAST(115.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP082     ', N'DM03      ', N'Váy polo nữ, đầm body Choice Việt Nam NH11 dáng ôm tay ngắn cổ bẻ thanh lịch', N'Thông tin Váy polo nữ, đầm body dáng ôm tay ngắn cổ bẻ, váy body xòe basic sexy mặc đi chơi, dự tiệc siêu xinh
Màu sắc: Đen/ Đen phối trắng/ Trắng phối đen
Chất liệu: vải Bozip cao cấp Loại 1
Size của sản phẩm: S/M/L/XL', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxqrxbiog2qj42.webp', CAST(53.000 AS Decimal(18, 3)), CAST(67.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP083     ', N'DM03      ', N'Đầm đen trễ vai phối xếp ly trắng co giãn ôm body nữ, Phong cách tiểu thư - QuynhTrangBasic', N'MÔ TẢ SẢN PHẦM:
Chất liệu: Polyester Co giãn mix vải thô phối trắng
Màu Săc: Đen Phối trắng
Form váy nhỏ ôm eo và chiều dài ngắnSize:XS S/M/L', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ly0wwo260mvve7.webp', CAST(247.500 AS Decimal(18, 3)), CAST(247.500 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP084     ', N'DM03      ', N'Đầm Maxi Lệch Vai Khoét Eo Xếp Ly Lạ Mắt TIBU Váy Nữ Dáng Dài Hở Lưng Ôm Body Cực Tôn Dáng Sang Chảnh Đi Biển Tiệc Xinh', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwxzcgrpjnbvfa.webp', CAST(209.000 AS Decimal(18, 3)), CAST(209.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP085     ', N'DM03      ', N'Váy Dáng Ngắn Cổ Tròn Khoá Giọt Lệ Trước Cách Điệu Tay Bồng Nhún Sườn Nữ Tính, Đầm Tiểu Thư Ngắn - 29feb.closet - V223', N'THÔNG TIN SẢN PHẨM:
- Thương hiệu: 29feb.closet
- Mã hàng: V223
- Đặc điểm: Váy Dáng Ngắn Cổ Tròn Khoá Giọt Lệ Trước Cách Điệu Tay Bồng Nhún Sườn Nữ Tính
- Chất liệu: Kaki hai da
- Kiểu dáng: Váy nữ dáng ngắn
- Size: Freesize dưới 56kg
- Màu sắc: Xanh than, Xanh bơ, Kem, Ghi - đây là tone màu dễ mặc, che khuyết điểm tốt. Phù hợp mặc đi chơi, du lịch, chụp ảnh, ....', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxxe030mi8rd3c.webp', CAST(125.000 AS Decimal(18, 3)), CAST(125.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP086     ', N'DM03      ', N'Đầm họa tiết cổ xếp nếp KBI BOUTIQUE Váy Dự Tiệc thông thường fashion thời trang nữ VD1', N'Hoa văn: Màu trơn 
Phong cách: Ngày thường
Kích thước lớn: Không
Chất liệu: Thun gân co giãn mềm mại
Độ vừa vặn: Ôm vừa vặn
Vải xuyên thấu: Không
Độ co giãn: Không co giãn
Xuất xứ: Trung Quốc đại lục', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lv68z9764u7tdf.webp', CAST(129.000 AS Decimal(18, 3)), CAST(179.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP087     ', N'DM03      ', N'VÁY TƠ TRỄ VAI ĐÍNH NƠ LAMY TIỂU THƯ SIÊU XINH V16', N'VÁY TƠ TRỄ VAI ĐÍNH NƠ LAMY TIỂU THƯ SIÊU XINH V16
Váy trễ vai nơ to tiểu thư siu đẹp siu xinhhh cập bến nhà 2monday rùi đâyyyy. Dáng váy ngắn bồng xòe hack dáng, chân váy bồng xòe che khuyết điểm bụng dưới. Mặc ẻm đi cafe sang chảnh lém luôn mà giá hời only 1xx thuiiii!!!
Màu sắc: trắng, đen, be
Size: S, M', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyukc9gfcax9ca.webp', CAST(169.000 AS Decimal(18, 3)), CAST(179.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP088     ', N'DM03      ', N'Đầm Váy Xô Thêu Hoa Trễ Vai Viền Ren Thiết Kế bèo xinh xắn', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lx2l1hrdbjyx61.webp', CAST(185.000 AS Decimal(18, 3)), CAST(185.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP089     ', N'DM03      ', N'Váy kẻ xanh tiểu thư thiết kế lệch vai sang chảnh Nancy dress AGUJA', N'[Tặng quần] Váy kẻ xanh tiểu thư thiết kế lệch vai sang chảnh Nancy dress AGUJA
Size S< 48kg
Size M < 55kg', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ly4shz8wehsgf8.webp', CAST(149.000 AS Decimal(18, 3)), CAST(149.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP090     ', N'DM03      ', N'Đầm body cúp ngực form dài đính bông hoa TABISHOP Váy maxi trắng thiết kế tôn dáng đi dự tiệc đi biển đi chơi hottrend', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lydmwwjup8i594.webp', CAST(179.000 AS Decimal(18, 3)), CAST(179.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP091     ', N'DM03      ', N'Đầm Body Cổ Yếm Thắt Nơ Dáng Xoè TIBU Váy Nữ Ôm Dáng Hai Màu Đen Trắng Phong Cách Ulzzang', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lje8wxmin8b6e6.webp', CAST(185.000 AS Decimal(18, 3)), CAST(185.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP092     ', N'DM03      ', N'TIELA Đầm váy hoa bèo hồng -Calantha Dress', N'Calantha Dress được may bằng chất liệu tơ ánh kim. Váy có mút ngực
Dài váy 120cm
Sản phẩm được thiết kế và may tại Tiela.
Bảng size:
Size S: Ngực: 82-84 , Eo: 64-66, Mông: 88-92
Size M: Ngực: 88-90, Eo: 68-70, Mông: 92-96
Size L: Ngực: 92-94, Eo: 72-74, Mông: 96-100
Size XL: Ngực 96-98, Eo 76-78, Mông: 100-104', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsm870z89jus9e.webp', CAST(657.000 AS Decimal(18, 3)), CAST(657.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP093     ', N'DM03      ', N'Váy BabyDoll Đầm dự tiệc Charm Đầm Hai Dây Một Tầng Hở Vai Màu Trơn Phong Cách Nhẹ Nhàng retro Mùa Hè', N'Thông tin sản phẩm và cam kết mua tại cửa hàng
Nguồn gốc:
Vị trí thiết kế: Hàn Quốc
Xuất xứ: Quảng Châu, Trung Quốc
Kích thước:
Vui lòng tham khảo ý kiến dịch vụ khách hàng, theo chiều cao và cân nặng của bạn, đề xuất kích thước phù hợp cho bạn', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rbkj-lm0sfsdewu2z16.webp', CAST(500.000 AS Decimal(18, 3)), CAST(500.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP094     ', N'DM03      ', N'Váy dư tiệc cổ yếm trễ vai hở lưng khoét ngực Đầm ngắn trên gối đen nơ trắng dáng xòe chữ A sang trọng T425G MONOKA', N'THÔNG TIN CHI TIẾT :
+Chất liệu : Tuyết mưa
+size: S(<49kg), M(<56kg)', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lynwc3bjnmmlf9.webp', CAST(149.000 AS Decimal(18, 3)), CAST(149.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP095     ', N'DM03      ', N'Dami Dress Váy hai dây kẻ trễ vai dáng bí chiết eo chun lưng tay bồng rời thiết kế có bigsize thắt lưng Clay Clothing', N'Váy có quần bảo hộ - bo chun lưng
Full size: S / M / L / XL / XXL', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyf2ujf7mwtdc6.webp', CAST(380.000 AS Decimal(18, 3)), CAST(380.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP096     ', N'DM03      ', N'( Hàng L1 Chuẩn Ảnh ) Đầm Váy 2 Dây Ren Lỗ Chất Tơ Xoè Bồng Dáng Corset Tiểu Thư Dự Tiệc Màu Kem', N'Em đầm này đang hot đây ạ !!! Xinh Yêu lắm luônnnn Đi ăn tiệc buổi tối là hết bài Sang chảnh quáaa
• HÌNH MANOCANH + ẢNH SÀN + ẢNH TRÊN GHẾ LÀ ẢNH SHOP CHỤP 100%
• CAM KẾT HÀNG CHẤT LƯỢNG 
• HÀNG CÓ SẴN 
• 1 màu như hình
• Size: S M L 
• Only 319kk ( sale trong 3 ngày )', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lygajqye1h29c5.webp', CAST(318.000 AS Decimal(18, 3)), CAST(318.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP097     ', N'DM03      ', N'Đầm Váy Ren Trễ Vai Co GIÃN ÍT Tay Loe Nhún Eo UnihomeClothing CQ058', N'Màu: Đen, Kem
▫️Chất Vải: Ren (May 2 Lớp - Có Mút Ngực - Có Lót Quần)
▫️Chiều Dài: 80cm
▫️Size: S(eo 66cm) M(eo 70cm) L eo(74cm) XL(eo 78cm) 2XL (eo 82cm)', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lnvhqewnarxp6f.webp', CAST(320.000 AS Decimal(18, 3)), CAST(330.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP098     ', N'DM03      ', N'( Hàng Đẹp + Ảnh Thật ) Đầm Váy Nữ Cổ Thuỷ Thủ Cột Nơ Xanh Đen Mix Viền Trắng Kem Nhật Bản Tay Ngắn Dáng Xoè Xếp Li', N'Set vìa set tiểu thư diện thu quá chuẩnnn 😍😍Set này ce diện sống ảo chắc chắn có ảnh đẹp mang về 🥹🥹 Set gồm áo len phối ren lên form xịnn cực mix cvay umi co giãn 100 điểm ko có nhưng lunnn 💓💓💓
• CAM KẾT HÀNG CHẤT LƯỢNG
• HÌNH MANOCANH + ẢNH THẬT SHOP CHỤP 100%
• HÀNG CÓ SẴN
• 1 màu như hình
• Size : S M L 
• Chất liệu: carolan', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lnct6ogz6o6ld0.webp', CAST(295.000 AS Decimal(18, 3)), CAST(295.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP099     ', N'DM03      ', N'Váy thun Rớt Vai 2 Dây Đang Ngắn Nhún Ngực 2 Lớp Mặc Đi Tiệc Đi Chơi DH STUDIO', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lqu8te4ib8as1e.webp', CAST(169.000 AS Decimal(18, 3)), CAST(169.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP100     ', N'DM03      ', N'Đầm maxi cúp ngực vạt chéo Emili váy quây cúp ngực kiểu nữ phong cách đi tiệc kiểu xinh [V338]', N'Đầm maxi cúp ngực vạt chéo Emili váy quây cúp ngực kiểu nữ phong cách đi tiệc kiểu xinh [V338]
➤ Mã sản phẩm: V338 
➤ Chất liệu: Nhuyễn, Chéo Hàn 
➤ Size: S | M | L | XL
➤ Màu sắc: Nâu đen 
➤ Phong cách: Quyến rũ, Sang chảnh', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyn5vjw6yu1tac.webp', CAST(535.000 AS Decimal(18, 3)), CAST(535.000 AS Decimal(18, 3)))
GO
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP101     ', N'DM03      ', N'Váy tơ xốp sát nách nhún viền bèo DH STUDIO đính dây 3 bông eo kiểu tay ngắn có kèm lót quần cực xinh', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzsn26keyftt4c.webp', CAST(179.000 AS Decimal(18, 3)), CAST(179.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP102     ', N'DM04      ', N'Áo hoodie PLEASURE form rộng mũ 2 lớp tay phồng chất nỉ bông 100%cotton premium Local Brand PL06', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-m011s98cgj7x2c.webp', CAST(154.000 AS Decimal(18, 3)), CAST(294.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP103     ', N'DM04      ', N' Áo Khoác Nắng Chống Tia UV Freesize Từ 40-65Kg', N'Áo Chống Nắng Nữ Thun Lạnh HANABI Chống Tia UV , Áo Khoác Nắng Chống Tia UV Freesize Từ 40-65Kg 
Em áo chống nắng được mệnh danh là em áo quốc dân chống tia UV cực đỉnh với review quá nét của chị em nhận được
Cực kỳ co giãn và chống nắng cực tốt. Chất thì mát lịm luôn
Bảng màu : Rêu, Trắng, Ghi, Hồng, Vỏ Đỗ
Freesize từ 40-65kg', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltudj10br2tpbf.webp', CAST(145.000 AS Decimal(18, 3)), CAST(145.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP104     ', N'DM04      ', N'Áo Khoác chống nắng nữ CARDINA 2 lớp gấu suông mũ liền chất liệu Icetext chống tia UV tia cực tím hiệu quả 4NHF02', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lre8fizfh8k989.webp', CAST(470.000 AS Decimal(18, 3)), CAST(470.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP105     ', N'DM04      ', N'Áo khoác gió cặp đôi nam nữ có mũ chống nước 2 lớp lót lưới cao cấp mẫu mới 2024 AVGT-AV AVANCO', N'Áo khoác gió AVGT độc đáo với khóa kéo 2 đầu kết hợp được nhiều phong cách và khả năng chống nước nhẹ là mẫu mới nhất trong bộ sưu tập mùa thu đông năm nay.
Với thiết kế đơn giản mà vẫn tinh tế qua các đường cắt may chỉnh chu và form dáng hiện đại. Logo thêu đồng màu mang thêm sự sang trọng.
Phù hợp cho cả nam và nữ cùng những cặp đôi khi sở hữu mẫu áo khoác thanh lịch này.
Ngoài màu cơ bản năm nay áo còn có thêm những màu mới lạ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyw69tnwwf9pa8.webp', CAST(129.000 AS Decimal(18, 3)), CAST(159.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP106     ', N'DM04      ', N'ÁO CHỐNG NẮNG NỮ GU 2 LỚP Thoáng Mát, Chống Nắng, Chống Tia UV hiệu quả, bảo vệ làn da tối đa', N'GIỚI THIỆU SẢN PHẨM:
- Áo chống nắng có chỉ số UPF50+ chống được đến 99% tia UV gây hại cho da
- Áo chống nắng với thiết kế 2 lớp dày dặn, đường may tỉ mỉ chắc chắn, mặc lên thoáng mát, đảm bảo sẽ khác xa các 
   loại áo chống nắng thông thường có trên thị trường
- Áo chống nắng tráng Nano 2023 đặc tính vượt trội
- Mặt trong tráng nano diệt khuẩn đặc biệt khu vực che miệng. Diệt tối đa vi khuẩn, bảo vệ sức khoẻ
- Túi 2 bên rộng rãi, khóa kéo hình giọt lệ tinh tế, sang xịn
- TÚI TRONG tiện lợi, có thể để vừa điện thoại, vi cầm tay 1 cách thoải mái
- Lớp mũ vành rộng. Chắn nắng siêu tốt
- Chất vải  mát, mềm mịn, siêu nhẹ, chuẩn từng đường kim mũi chỉ
- Đa dạng màu Sắc cho các bạn chọn nhé: Hồng Phấn, Hồng Đỗ, Xanh Than, Xám Ghi, Xanh Dương, Xanh Ngọc, 
  Xanh Dương Đậm
- Có 2 Size : 
+ Size L: Dài 58 cm(tính từ vai), ngang 48cm 
+ Size XL: Dài 60 cm(tính từ vai), ngang 50cm 
Dáng áo ôm, các bạn thích mặc rộng thì nhỉnh lên một Size nhé!!!', N'https://down-vn.img.susercontent.com/file/56a59d31891cc66bb5eb6bc2cb0b840d.webp', CAST(129.000 AS Decimal(18, 3)), CAST(129.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP107     ', N'DM04      ', N'Áo Khoác Gió Nam Nữ Mũ Cao Cấp 2 Lớp By TEEDARK Kháng Nước Chống Nắng Form Rộng Kiểu Dáng Unisex', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzbocj8ovr1d67.webp', CAST(179.000 AS Decimal(18, 3)), CAST(179.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP108     ', N'DM04      ', N'Áo Khoác Gió Nam Nữ Viền Tay in Chữ Áo Dù 2 Lớp Chống Nước Chống Nắng -PROTEX UNISEX', N'THÔNG TIN SẢN PHẨM
-    chất liệu bên ngoài là lớp dù tráng bạc chống nước và chống tia UV
+   bên trong là lớp lót lưới vô cùng chắc chắn và tạo cảm giác khô thoáng
-    màu sắc  :  có 3 màu cơ bản  ; Đen - Be  - Xanh RÊU
-    phong cách Hàn Quốc đơn giản
-    xuất sứ   :  Việt Nam
-    kiểu khóa  : khoa kéo và dây rút ở mũ
-    mẫu    : viền tay và chữ UENO-VOGUE
-    tay dài và có bo chun', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lkwlw5o6lu5901.webp', CAST(165.000 AS Decimal(18, 3)), CAST(165.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP109     ', N'DM04      ', N'Áo Khoác Dù Nhiều Màu Có Mũ Dây Rút Chắn Gió Chống Nắng Hàn Quốc', N'MÔ TẢ SẢN PHẨM: Áo Khoác Dù Nhiều Màu Kèm Mũ Có Dây Rút Chắn Gió Chống Nắng Hàn Quốc 𝑩𝒚𝒄𝒂𝒎𝒄𝒂𝒎
- Chất liệu: Gió kẻ ô nhăn
- Màu sắc: Hồng - Đen - Kem - Nâu
- Phong cách: Cơ bản, Năng động', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz755ix5zlwhb7.webp', CAST(348.000 AS Decimal(18, 3)), CAST(348.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP110     ', N'DM04      ', N'Áo Khoác Gió Nam Nữ Chống Nước Chống Nắng Cao Cấp 2 Lớp Kèm Mũ CARADLA BST01 Form Rộng Kiểu Dáng Unisex', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lygcocaexs4h08.webp', CAST(169.000 AS Decimal(18, 3)), CAST(169.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP111     ', N'DM04      ', N'Áo khoác hoodie zip Bigsize70kg áo hoodie nữ Phong cách preppy 2024 Mới', N' Đối tượng áp dụng: Nữ
 Vải / chất liệu: Polyester / Polyester (Sợi Polyester)
 Nội dung thành phần: 81% (Bao gồm) -90% (Bao gồm)
 Phiên bản phiên bản: Loose
 Chức năng chức năng: Thoáng khí
 Loại cổ áo: Trùm đầu
 Cách mặc: Áo nịt
 Chiều dài / chiều dài tay áo / Chiều dài tay áo: Thường / Dài tay
 Phong cách: Lady', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdyw-lyc2gez9ibsc83.webp', CAST(300.000 AS Decimal(18, 3)), CAST(300.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP112     ', N'DM04      ', N'Áo Khoác Gió Nhăn Nữ Form Lửng Nhiều Màu Có Mũ Dây Rút Chắn Gió Chống Nắng Hàn Quốc Hàng 2 Lớp Mẫu Mới Nhất 2024', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyxg5x4zbesh39.webp', CAST(259.000 AS Decimal(18, 3)), CAST(259.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP113     ', N'DM04      ', N'Áo khoác Crop Jacket Cropped Logo DEROSE Kim loại Khoá kéo 2 đầu (3 MÀU)', N' THÔNG TIN SẢN PHẨM:
- Màu sắc: xám, be sáng, đen
- Kích thước: M và L
- Thiết kế: Khoá kéo 2 chiều
- Chất liệu: chất vải Hàn quốc kết hợp lót dù mát bên trong áo', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lkjfz3qraftcca.webp', CAST(254.000 AS Decimal(18, 3)), CAST(254.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP114     ', N'DM04      ', N'Áo gió nữ cao cấp S69 có 3 màu siêu hót full size tù 40-95kg ạ', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyegr8jr291p57.webp', CAST(280.000 AS Decimal(18, 3)), CAST(280.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP115     ', N'DM05      ', N'Quần jean ống suông thêu nơ hồng hottrend 2024 , quần jean ống rộng cá tính basic đơn giản - Huyền Diệu Boutique', N'THÔNG TIN SẢN PHẨM
Kiểu dáng: ống suông
Xuất xứ : Việt Nam
Thương hiệu: Huyền Diệu BoutiquePhong cách: lưng cao, thiết kế cá tính
Chất liệu: JEANS 
Màu wass : không phai màu, bong tróc', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwmj5k7p1tqzb8.webp', CAST(169.000 AS Decimal(18, 3)), CAST(169.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP116     ', N'DM05      ', N'Quần Jean nữ ống rộng lưng cao from rộng LIMISU quần bò nữ ống rộng dáng suông màu basic JS1', N'THÔNG TIN SẢN PHẨM
Xuất xứ: Việt Nam
Thương hiệu: LIMISU
Chất liệu: Jean denim mềm mại thoải mái
Kiểu dáng:  quần bò jean ống rộng lưng cao
Phong cách: basic
Chất liệu: Chất Vải DENIM
Thành phần: 85% Cotton + 15% Polyester
Màu sắc: Xanh Nhạt ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyxcj4fnz0p94f.webp', CAST(139.000 AS Decimal(18, 3)), CAST(139.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP117     ', N'DM05      ', N'Quần jean ống rộng nữ, quần jean nữ màu retro thời trang cá tính lilastore', N'Mô tả sản phẩm: Quần jean ống rộng nữ, quần jean nữ màu retro thời trang cá tính lilastore
Thể hiện phong cách thời trang cá tính với **Quần Jean Ống Rộng Nữ Màu Retro** từ Lilastore. Chiếc quần jean này được thiết kế theo xu hướng vintage với màu sắc retro độc đáo, mang đến vẻ ngoài thời thượng và sành điệu. Kiểu dáng ống rộng giúp bạn thoải mái trong mọi hoạt động, đồng thời tôn lên phong cách riêng biệt, phóng khoáng. Chất liệu jean cao cấp, bền bỉ, đảm bảo độ co giãn vừa phải, tạo cảm giác dễ chịu khi mặc mà vẫn giữ được phom dáng chuẩn.', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lypgpas9n89tc4.webp', CAST(179.000 AS Decimal(18, 3)), CAST(179.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP118     ', N'DM05      ', N'Quần bò jean nữ ống suông LIMISU form rộng cạp cao phong cách trẻ trung năng động cao cấp TT2', N'THÔNG TIN SẢN PHẨM
Xuất xứ: Việt Nam
Thương hiệu: LIMISU
Chất liệu: Jean mềm mại thoải mái
Kiểu dáng: Quần Jean Nữ Ống Suông Form Rộng LIMISU Chi tiết : chất liệu co giãn nhẹ, ống rộng che khuyết điểm và lưng cao tôn dáng
Thành phần: 85% Cotton + 15% Polyester
Màu sắc: Xanh Nhạt - Xanh Đậm', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxt50ficp9zt84.webp', CAST(125.000 AS Decimal(18, 3)), CAST(125.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP119     ', N'DM05      ', N'Quần Jean Nam Suông Ống Rộng, Quần Cạp Chun, Dây Rút Bản To Phong Cách Hàn Quốc', N'MÔ TẢ SẢN PHẨM
Chất liệu: chất jean mềm
Thiết kế: hiện đại, trẻ trung, dễ phối
Đủ size: M - L - XL (các bạn tham khảo tại bảng size nhé) 
Bảng Size:
Size M: từ 40 - 50kg, Cao 1m50 - 1m59 / dài 94cm, đùi 58cm
Size L: từ 51 - 63kg , Cao 1m60 - 1m70 / dài 96cm, đùi 62cm
Size XL: từ 64 - 80kg, Cao 1m71 – 1m80 / dài 99 cm, đùi 64cm', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsib5w0ekzvd4f.webp', CAST(159.000 AS Decimal(18, 3)), CAST(159.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP120     ', N'DM05      ', N'Quần Jean Nữ Ống Suông Màu Đậm Túi Thêu Chữ M Q288', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzu6swmnd9y97e.webp', CAST(146.000 AS Decimal(18, 3)), CAST(185.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP121     ', N'DM05      ', N'Quần jean ống loe cạp cao co giãn dài 90 cm cho người 1m45 -1m55 màu bụi retro siêu hot', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lotlwi24cr2j94.webp', CAST(165.000 AS Decimal(18, 3)), CAST(165.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP122     ', N'DM05      ', N'Quần Jean Nữ Ống Suông Rộng Wash RETRO Bụi Màu Đen Và Xanh Lưng Cao Phong Cách Vitager Ulzzang Hàn Quốc 2023', N'THÔNG TIN SẢN PHẨM
Tên sản phẩm:Quần jean nữ retro baggy CẠP CAO ống suông rộng MIAA, quần bò nữ đen loang chất jeans cao cấp top xu hướng 2023
Quần jean nữ baggy Basic cạp  cá tính dáng  suông  rộng tôn dáng 
Sản phẩm lọt top sản phẩm bán chạy và được yêu thích nhất năm 2023 với phong cách trẻ trung, năng động
Chất vải dầy dặn, coton 100% mịn mát  với những dường cắt rách tỉ mỉ rất đẹp và thời trang tại MIaa', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyv1heedghpd89.webp', CAST(149.000 AS Decimal(18, 3)), CAST(149.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP123     ', N'DM05      ', N'Quần jeans form loe dáng rộng phối túi thêu hình nơ siêu xinh - 247store', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxaoml36bxztf7.webp', CAST(157.000 AS Decimal(18, 3)), CAST(188.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP124     ', N'DM05      ', N'Quần short nữ jean cạp cao denim Lovito có túi màu trơn thường ngày cho nữ LNA19020 (Nhiều màu)', N'', N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdya-lz9yxg0urxfrea.webp', CAST(154.600 AS Decimal(18, 3)), CAST(154.600 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP125     ', N'DM05      ', N'Quần jean suông nữ thêu trái tim vải QC mềm', N'Quần jean suông nữ thêu trái tim vải QC mềm dày dặn
Dài quần: 98cm
Chất jean QC cao cấp mềm dày dặn tôn dáng
Màu sắc: xanh nhạt- xanh đậm', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lu9asdf9z0nzdd.webp', CAST(185.000 AS Decimal(18, 3)), CAST(185.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP126     ', N'DM05      ', N'Quần jean nữ ống suông lưng cao phối rách phong cách Retro Hàn Quốc QU12', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzp1cccvs78had.webp', CAST(200.000 AS Decimal(18, 3)), CAST(200.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP127     ', N'DM05      ', N'HHCHOU- Quần Jeans Suông Rách Màu Bụi Dơ Vải QC mềm 053', N'Thông tin sản phẩm
Quần có  dài 103 và 95cm
Quần Có 5 size S M L Xl  2Xl', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyk4t9eyw3a994.webp', CAST(167.500 AS Decimal(18, 3)), CAST(167.500 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP128     ', N'DM05      ', N'Quần jean nữ màu rêu phủ vàng phong cách retro, ống suông rộng basic, vải mềm không co giãn', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ltnmzhe5v0ga83.webp', CAST(112.000 AS Decimal(18, 3)), CAST(155.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP129     ', N'DM05      ', N'Quần ống rộng xếp eo nhún mùa Đông', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ln45c93fwfg39d.webp', CAST(169.000 AS Decimal(18, 3)), CAST(169.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP130     ', N'DM05      ', N'Quần Dài Kaki Túi Hộp Ống Rộng Cotton Cạp Cao, Quần Túi Hộp Nữ Ống Suông Nhiều Màu Quynh Trendy TH07', N'THÔNG TIN SẢN PHẨM:Quần Dài Kaki Túi Hộp Ống Rộng Cotton Cạp Cao, Quần Túi Hộp Nữ Ống Suông Nhiều Màu  Quynh Trendy TH0
Chất Liệu : Kaki Jean Cotton Loại 1 
Size: S M L ( bảng size đúng với 80-90% khách hàng) Màu: Trắng/ Hồng/ Nâu/ Kem', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lv5so4y6h5h5e2.webp', CAST(195.000 AS Decimal(18, 3)), CAST(195.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP131     ', N'DM05      ', N'Quần jeans xanh bạc ánh rêu ống rộng - 247store', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lx47t4klg53tce.webp', CAST(128.000 AS Decimal(18, 3)), CAST(168.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP132     ', N'DM05      ', N'Quần jean ống loe vừa KYUBI, quần bò ống loe lưng cao co giãn 4 chiều chất vải cao cấp dày dặn - BJR68', N'Quần jean ống loe vừa Kyubi, quần bò ống loe lưng cao co giãn 4 chiều chất vải cao cấp dày dặn - BJR68
 Chất liệu Jeans cotton mềm mịn co dãn 4 chiều và dày dặn đảm bảo đem lại cảm giác thoải mái nhất khi mặc thường xuyên.
Size: S M L XL (Form quần ôm co dãn, ống loe vừa dễ mặc, cạp lưng cao giúp tôn dáng vòng 2, vòng 3 và tôn chiều cao)
Mẫu: Quần jean ống loe nhiều mẫu dài ngắn, lưng cao, lai cuốn và lai tua, 
Nhiều màu: Đen / xanh nhạt/ xanh đậm/ trắng', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyyvy7pv97ila2.webp', CAST(185.000 AS Decimal(18, 3)), CAST(215.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP133     ', N'DM05      ', N'Quần Short Jeans NIGA Lửng Ống Rộng Wash Nam Nữ Unisex', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxl2h7th8i556a.webp', CAST(165.000 AS Decimal(18, 3)), CAST(165.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP134     ', N'DM05      ', N'Quần Jean Nữ Wash RETRO Ống Rộng Dáng Suông Chất Vải Dày Dặn Màu Đen Trầm GRIND SMOKE V.1 Ulzzang Hàn Quốc 2023', N'', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzss1qhtpajl50.webp', CAST(89.000 AS Decimal(18, 3)), CAST(89.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP135     ', N'DM05      ', N'Quần Bò Ống Loe nữ Cạp Cao Đứng Co Giãn MIAA Màu RETRO, quần loe nữ ôm eo cạp cao cực tôn dáng', N'NULL ', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lw8h6s2twna1d2.webp', CAST(168.000 AS Decimal(18, 3)), CAST(168.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP136     ', N'DM06      ', N'Quần short ngố jean cho nữ bigsize từ 55-85kg, quần lửng trơn lưng cao đi biển, đi chơi MS47 2KJean', N'HÀNG LUÔN CÓ SẴN SỐ LƯỢNG TẠI XƯỞNG (SHOP TUYỂN SỈ VÀ CTV)

THÔNG TIN SẢN PHẨM

- Tên sản phẩm: Quần short ngố jean cho nữ bigsize từ 55-85kg, quần lửng trơn lưng cao đi biển, đi chơi MS47 2KJean

- Chất liệu: Chất cotton co dãn, vải Jean mềm mịn

- Màu sắc: Xanh đậm bụi rêu, xanh nhạt bụi rêu

- Xuất xứ: Việt Nam, hàng VNXK

Do màn hình và điều kiện ánh sáng khác nhau, màu sắc thực tế của sản phẩm có thể chênh lệch khoảng 3-5%', N'/LayoutShop/img/f51c6e85-4664-49be-96a8-52873fdc6aca.png', CAST(149.000 AS Decimal(18, 3)), CAST(169.000 AS Decimal(18, 3)))
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [MoTa], [HinhAnhDD], [MinGia], [MaxGia]) VALUES (N'SP137     ', N'DM06      ', N'Quần short jean rách ngố dành cho nữ', N'HÀNG LUÔN CÓ SẴN SỐ LƯỢNG TẠI XƯỞNG (SHOP TUYỂN SỈ VÀ CTV) THÔNG TIN SẢN PHẨM - Tên sản phẩm: Quần short jean rách ngố dành cho nữ - Chất liệu: Chất cotton co dãn, vải Jean mềm mịn - Màu sắc: Xanh đậm rách, xanh nhạt rách - Xuất xứ: Việt Nam, hàng VNXK Do màn hình và điều kiện ánh sáng khác nhau, màu sắc thực tế của sản phẩm có thể chênh lệch khoảng 3-5%', N'/LayoutShop/img/944ccd39-5c62-4266-bc74-ef2a5e8028a6.png', CAST(149.000 AS Decimal(18, 3)), CAST(149.000 AS Decimal(18, 3)))
GO
INSERT [dbo].[Size] ([MaSize], [TenSize]) VALUES (N'S01       ', N'XS        ')
INSERT [dbo].[Size] ([MaSize], [TenSize]) VALUES (N'S02       ', N'S         ')
INSERT [dbo].[Size] ([MaSize], [TenSize]) VALUES (N'S03       ', N'M         ')
INSERT [dbo].[Size] ([MaSize], [TenSize]) VALUES (N'S04       ', N'L         ')
INSERT [dbo].[Size] ([MaSize], [TenSize]) VALUES (N'S05       ', N'XL        ')
INSERT [dbo].[Size] ([MaSize], [TenSize]) VALUES (N'S06       ', N'XXL       ')
INSERT [dbo].[Size] ([MaSize], [TenSize]) VALUES (N'S07       ', N'XXXL      ')
INSERT [dbo].[Size] ([MaSize], [TenSize]) VALUES (N'S08       ', N'4XL       ')
INSERT [dbo].[Size] ([MaSize], [TenSize]) VALUES (N'S09       ', N'5XL       ')
INSERT [dbo].[Size] ([MaSize], [TenSize]) VALUES (N'S10       ', N'FreeSize  ')
INSERT [dbo].[Size] ([MaSize], [TenSize]) VALUES (N'S11       ', N'1         ')
INSERT [dbo].[Size] ([MaSize], [TenSize]) VALUES (N'S12       ', N'2         ')
INSERT [dbo].[Size] ([MaSize], [TenSize]) VALUES (N'S13       ', N'3         ')
INSERT [dbo].[Size] ([MaSize], [TenSize]) VALUES (N'S14       ', N'Size 30 (55-60kg)')
INSERT [dbo].[Size] ([MaSize], [TenSize]) VALUES (N'S15       ', N'Size 31 (61-65Kg)')
INSERT [dbo].[Size] ([MaSize], [TenSize]) VALUES (N'S16       ', N'Size 32 (66-69Kg)')
INSERT [dbo].[Size] ([MaSize], [TenSize]) VALUES (N'S17       ', N'Size 33 (70-75Kg)')
GO
INSERT [dbo].[Video_DanhGia] ([MaVideo], [MaDG], [DuongDan]) VALUES (N'VD001     ', N'DG002     ', N'/LayoutShop/img/video1.mp4')
INSERT [dbo].[Video_DanhGia] ([MaVideo], [MaDG], [DuongDan]) VALUES (N'VD002     ', N'DG001     ', N'/LayoutShop/img/video1.mp4')
INSERT [dbo].[Video_DanhGia] ([MaVideo], [MaDG], [DuongDan]) VALUES (N'VD003     ', N'DG003     ', N'/LayoutShop/img/video1.mp4')
INSERT [dbo].[Video_DanhGia] ([MaVideo], [MaDG], [DuongDan]) VALUES (N'VD004     ', N'DG005     ', N'/LayoutShop/img/video1.mp4')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__536C85E424FB3580]    Script Date: 2/17/2025 12:18:50 PM ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__A9D105342CF23CA5]    Script Date: 2/17/2025 12:18:50 PM ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__CA1930A5663ACBD0]    Script Date: 2/17/2025 12:18:50 PM ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CTDH]  WITH CHECK ADD FOREIGN KEY([MaCTSP_Size])
REFERENCES [dbo].[CTSP_Size] ([MaCTSP_Size])
GO
ALTER TABLE [dbo].[CTDH]  WITH CHECK ADD FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[CTGH]  WITH CHECK ADD FOREIGN KEY([MaCTSP_Size])
REFERENCES [dbo].[CTSP_Size] ([MaCTSP_Size])
GO
ALTER TABLE [dbo].[CTGH]  WITH CHECK ADD FOREIGN KEY([MaGH])
REFERENCES [dbo].[GioHang] ([MaGH])
GO
ALTER TABLE [dbo].[CTKM]  WITH CHECK ADD FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[CTKM]  WITH CHECK ADD FOREIGN KEY([MaKM])
REFERENCES [dbo].[KhuyenMai] ([MaKM])
GO
ALTER TABLE [dbo].[CTSP]  WITH CHECK ADD FOREIGN KEY([MaMS])
REFERENCES [dbo].[MauSac] ([MaMS])
GO
ALTER TABLE [dbo].[CTSP]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTSP_Size]  WITH CHECK ADD FOREIGN KEY([MaCTSP])
REFERENCES [dbo].[CTSP] ([MaCTSP])
GO
ALTER TABLE [dbo].[CTSP_Size]  WITH CHECK ADD FOREIGN KEY([MaSize])
REFERENCES [dbo].[Size] ([MaSize])
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD FOREIGN KEY([MaCTSP_Size])
REFERENCES [dbo].[CTSP_Size] ([MaCTSP_Size])
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HinhAnh_DanhGia]  WITH CHECK ADD FOREIGN KEY([MaDG])
REFERENCES [dbo].[DanhGia] ([MaDG])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KhuyenMai]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMuc] ([MaDM])
GO
ALTER TABLE [dbo].[Video_DanhGia]  WITH CHECK ADD FOREIGN KEY([MaDG])
REFERENCES [dbo].[DanhGia] ([MaDG])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTDH]  WITH CHECK ADD CHECK  (([GiaBan]>=(0)))
GO
ALTER TABLE [dbo].[CTDH]  WITH CHECK ADD  CONSTRAINT [CK__CTDH__SoLuong__7EF6D905] CHECK  (([SoLuong]>(0)))
GO
ALTER TABLE [dbo].[CTDH] CHECK CONSTRAINT [CK__CTDH__SoLuong__7EF6D905]
GO
ALTER TABLE [dbo].[CTDH]  WITH CHECK ADD CHECK  (([TongTien]>=(0)))
GO
ALTER TABLE [dbo].[CTKM]  WITH CHECK ADD CHECK  (([TienGiam]>=(0)))
GO
ALTER TABLE [dbo].[CTSP_Size]  WITH CHECK ADD CHECK  (([Gia]>=(0)))
GO
ALTER TABLE [dbo].[CTSP_Size]  WITH CHECK ADD CHECK  (([SoLuongTon]>=(0)))
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [CK_DiemSao] CHECK  (([DiemSao]>=(0) AND [DiemSao]<=(5)))
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [CK_DiemSao]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD CHECK  (([Tien_Giam]>=(0)))
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD CHECK  (([Tien_Ship]>=(0)))
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD CHECK  (([TongTien]>=(0)))
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD CHECK  (([GioiTinh]=NULL OR [GioiTinh]='F' OR [GioiTinh]='M'))
GO
ALTER TABLE [dbo].[KhuyenMai]  WITH CHECK ADD  CONSTRAINT [CK__KhuyenMai__Loai_KM] CHECK  (([Loai_KM]='Free ship' OR [Loai_KM]=N'Quà tặng' OR [Loai_KM]='%' OR [Loai_KM]=N'Tiền'))
GO
ALTER TABLE [dbo].[KhuyenMai] CHECK CONSTRAINT [CK__KhuyenMai__Loai_KM]
GO
ALTER TABLE [dbo].[KhuyenMai]  WITH CHECK ADD CHECK  (([SoTien_PhanTram]>=(0)))
GO
ALTER TABLE [dbo].[KhuyenMai]  WITH CHECK ADD CHECK  (([TienToiThieu]>=(0)))
GO
ALTER TABLE [dbo].[KhuyenMai]  WITH CHECK ADD  CONSTRAINT [CK_MaSP_MaDM] CHECK  (([MaSP] IS NOT NULL AND [MaDM] IS NULL OR [MaSP] IS NULL AND [MaDM] IS NOT NULL OR [MaSP] IS NULL AND [MaDM] IS NULL))
GO
ALTER TABLE [dbo].[KhuyenMai] CHECK CONSTRAINT [CK_MaSP_MaDM]
GO
USE [master]
GO
ALTER DATABASE [QuanLyShopOnline] SET  READ_WRITE 
GO
