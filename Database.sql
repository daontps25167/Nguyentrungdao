USE [master]
GO
CREATE DATABASE [Giay]

GO
ALTER DATABASE [Giay] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Giay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Giay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Giay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Giay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Giay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Giay] SET ARITHABORT OFF 
GO
ALTER DATABASE [Giay] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Giay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Giay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Giay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Giay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Giay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Giay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Giay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Giay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Giay] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Giay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Giay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Giay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Giay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Giay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Giay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Giay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Giay] SET RECOVERY FULL 
GO
ALTER DATABASE [Giay] SET  MULTI_USER 
GO
ALTER DATABASE [Giay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Giay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Giay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Giay] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Giay] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Giay] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Giay', N'ON'
GO
ALTER DATABASE [Giay] SET QUERY_STORE = OFF
GO
USE [Giay]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idDonHang] [bigint] NOT NULL,
	[idSP] [bigint] NOT NULL,
	[SL] [int] NOT NULL,
	[Gia] [float] NOT NULL,
	[ThanhTien] [float] NOT NULL,
 CONSTRAINT [PK_CTDonHang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[idDonHang] [bigint] IDENTITY(1,1) NOT NULL,
	[NgayMua] [date] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[TrangThai] [nvarchar](50) NOT NULL,
	[TongTien] [float] NULL,
 CONSTRAINT [PK_QLDonHang] PRIMARY KEY CLUSTERED 
(
	[idDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[idGioHang] [bigint] IDENTITY(1,1) NOT NULL,
	[idSP] [bigint] NOT NULL,
	[SL] [int] NOT NULL,
	[ThanhTien] [float] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[ngayADD] [date] NULL,
 CONSTRAINT [PK_GioHang] PRIMARY KEY CLUSTERED 
(
	[idGioHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[idSP] [bigint] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NOT NULL,
	[HinhSP] [nvarchar](max) NOT NULL,
	[ThuongHieu] [nvarchar](50) NOT NULL,
	[SL] [int] NOT NULL,
	[Gia] [float] NOT NULL,
	[NgayTao] [date] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
	[Loai] [bit] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[idSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserName] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Sdt] [nvarchar](10) NOT NULL,
	[Email] [nvarchar](500) NOT NULL,
	[DiaChi] [nvarchar](max) NOT NULL,
	[VaiTro] [bit] NOT NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] ON 
GO
INSERT [dbo].[ChiTietDonHang] ([id], [idDonHang], [idSP], [SL], [Gia], [ThanhTien]) VALUES (44, 44, 5, 2, 520000, 1040000)
GO
INSERT [dbo].[ChiTietDonHang] ([id], [idDonHang], [idSP], [SL], [Gia], [ThanhTien]) VALUES (45, 45, 5, 1, 520000, 520000)
GO
INSERT [dbo].[ChiTietDonHang] ([id], [idDonHang], [idSP], [SL], [Gia], [ThanhTien]) VALUES (46, 45, 10040, 1, 130000, 130000)
GO
INSERT [dbo].[ChiTietDonHang] ([id], [idDonHang], [idSP], [SL], [Gia], [ThanhTien]) VALUES (47, 46, 6, 1, 230000, 230000)
GO
INSERT [dbo].[ChiTietDonHang] ([id], [idDonHang], [idSP], [SL], [Gia], [ThanhTien]) VALUES (48, 46, 7, 1, 120000, 120000)
GO
INSERT [dbo].[ChiTietDonHang] ([id], [idDonHang], [idSP], [SL], [Gia], [ThanhTien]) VALUES (49, 47, 6, 1, 230000, 230000)
GO
INSERT [dbo].[ChiTietDonHang] ([id], [idDonHang], [idSP], [SL], [Gia], [ThanhTien]) VALUES (50, 48, 5, 1, 520000, 520000)
GO
INSERT [dbo].[ChiTietDonHang] ([id], [idDonHang], [idSP], [SL], [Gia], [ThanhTien]) VALUES (51, 49, 11, 3, 120000, 360000)
GO
INSERT [dbo].[ChiTietDonHang] ([id], [idDonHang], [idSP], [SL], [Gia], [ThanhTien]) VALUES (52, 49, 7, 1, 120000, 120000)
GO
INSERT [dbo].[ChiTietDonHang] ([id], [idDonHang], [idSP], [SL], [Gia], [ThanhTien]) VALUES (53, 49, 5, 2, 520000, 1040000)
GO
INSERT [dbo].[ChiTietDonHang] ([id], [idDonHang], [idSP], [SL], [Gia], [ThanhTien]) VALUES (54, 49, 6, 1, 230000, 230000)
GO
INSERT [dbo].[ChiTietDonHang] ([id], [idDonHang], [idSP], [SL], [Gia], [ThanhTien]) VALUES (55, 49, 10031, 1, 140000, 140000)
GO
INSERT [dbo].[ChiTietDonHang] ([id], [idDonHang], [idSP], [SL], [Gia], [ThanhTien]) VALUES (56, 50, 7, 2, 120000, 240000)
GO
INSERT [dbo].[ChiTietDonHang] ([id], [idDonHang], [idSP], [SL], [Gia], [ThanhTien]) VALUES (57, 50, 12, 1, 120000, 120000)
GO
INSERT [dbo].[ChiTietDonHang] ([id], [idDonHang], [idSP], [SL], [Gia], [ThanhTien]) VALUES (58, 50, 6, 5, 230000, 1150000)
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 
GO
INSERT [dbo].[DonHang] ([idDonHang], [NgayMua], [UserName], [TrangThai], [TongTien]) VALUES (44, CAST(N'2022-06-15' AS Date), N'linhtc', N'Đang giao', 1040000)
GO
INSERT [dbo].[DonHang] ([idDonHang], [NgayMua], [UserName], [TrangThai], [TongTien]) VALUES (45, CAST(N'2022-06-15' AS Date), N'linhtc', N'Đã hủy', 650000)
GO
INSERT [dbo].[DonHang] ([idDonHang], [NgayMua], [UserName], [TrangThai], [TongTien]) VALUES (46, CAST(N'2022-06-15' AS Date), N'linhtc', N'Đã đặt', 350000)
GO
INSERT [dbo].[DonHang] ([idDonHang], [NgayMua], [UserName], [TrangThai], [TongTien]) VALUES (47, CAST(N'2022-06-15' AS Date), N'linhtc', N'Đã đặt', 230000)
GO
INSERT [dbo].[DonHang] ([idDonHang], [NgayMua], [UserName], [TrangThai], [TongTien]) VALUES (48, CAST(N'2022-06-16' AS Date), N'linhtc', N'Đã đặt', 520000)
GO
INSERT [dbo].[DonHang] ([idDonHang], [NgayMua], [UserName], [TrangThai], [TongTien]) VALUES (49, CAST(N'2022-06-16' AS Date), N'linhtc', N'Đã đặt', 1890000)
GO
INSERT [dbo].[DonHang] ([idDonHang], [NgayMua], [UserName], [TrangThai], [TongTien]) VALUES (50, CAST(N'2022-06-16' AS Date), N'12345', N'Đã đặt', 1510000)
GO
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[GioHang] ON 
GO
INSERT [dbo].[GioHang] ([idGioHang], [idSP], [SL], [ThanhTien], [UserName], [ngayADD]) VALUES (10046, 4, 1, 500000, N'admin', CAST(N'2022-06-11' AS Date))
GO
INSERT [dbo].[GioHang] ([idGioHang], [idSP], [SL], [ThanhTien], [UserName], [ngayADD]) VALUES (10047, 7, 1, 120000, N'admin', CAST(N'2022-02-11' AS Date))
GO
INSERT [dbo].[GioHang] ([idGioHang], [idSP], [SL], [ThanhTien], [UserName], [ngayADD]) VALUES (10048, 7, 1, 120000, N'admin', CAST(N'2022-05-11' AS Date))
GO
SET IDENTITY_INSERT [dbo].[GioHang] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (4, N'Giày Nike Air Jordan 1 ', N'1.jpg', N'Jordan', 46, 500000, CAST(N'2021-03-02' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (5, N'Giày Nike Air Jordan 2 ', N'2.jpg', N'Jordan', 40, 520000, CAST(N'2021-03-02' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (6, N'Giày Nike Air Jordan 3', N'3.jpg', N'Jordan', 33, 230000, CAST(N'2021-03-02' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (7, N'Giày Nike Air Jordan 4', N'4.jpg', N'Jordan', 44, 120000, CAST(N'2021-03-02' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (11, N'Giày Nike Air Jordan 5', N'5.jpg', N'Jordan', 47, 120000, CAST(N'2021-03-02' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (12, N'Giày Nike Air Jordan 6', N'6.jpg', N'Jordan', 49, 120000, CAST(N'2022-04-10' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (13, N'Giày Nike Air Jordan 7', N'4.jpg', N'Jordan', 49, 120000, CAST(N'2022-04-11' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (16, N'Giày Nike Air Jordan 8', N'5.jpg', N'Jordan', 50, 120000, CAST(N'2022-05-15' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (17, N'Giày Nike Air Jordan 9', N'6.jpg', N'Jordan', 50, 150000, CAST(N'2022-06-20' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (19, N'Giày Nike Air Jordan 10', N'7.jpg', N'Jordan', 50, 150000, CAST(N'2022-06-20' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (21, N'Giày Nike Air Jordan 11', N'7.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-21' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (22, N'Giày Nike Air Jordan 12', N'8.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (23, N'Giày Nike Air Jordan 13', N'19.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (24, N'Giày Nike Air Jordan 14', N'2.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (25, N'Giày Nike Air Jordan 15', N'20.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (26, N'Giày Nike Air Jordan 16', N'4.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (27, N'Giày Nike Air Jordan 17', N'4.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (28, N'Giày Nike Air Jordan 18', N'4.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (29, N'Giày Nike Air Jordan 19', N'4.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (30, N'Giày Nike Air Jordan 20', N'4.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (31, N'Giày Nike Air Jordan 21', N'4.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (32, N'Giày Nike Air Jordan 22', N'4.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (33, N'Giày Nike Air Jordan 23', N'4.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (34, N'Giày Nike Air Jordan 24', N'4.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (35, N'Giày Nike Air Jordan 25', N'4.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (36, N'Giày Nike Air Jordan 26', N'4.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (37, N'Giày Nike Air Jordan 27', N'4.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (38, N'Giày Nike Air Jordan 28', N'4.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (39, N'Giày Nike Air Jordan 29', N'4.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (40, N'Giày Nike Air Jordan 30', N'4.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (41, N'Giày Nike Air Jordan 31', N'4.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (42, N'Giày Nike Air Jordan 32', N'4.jpg', N'Jordan', 50, 150000, CAST(N'2021-06-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10020, N'Giày Nike Air Jordan 33', N'1.jpg', N'Jordan', 50, 123500, CAST(N'2022-06-12' AS Date), NULL, 0)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10023, N'Giày Nike Air Jordan 34', N'3.jpg', N'Jordan', 47, 123500, CAST(N'2020-06-13' AS Date), NULL, 0)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10024, N'Giày Nike Air Jordan 35', N'4.jpg', N'Jordan', 50, 123500, CAST(N'2020-06-13' AS Date), NULL, 0)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10025, N'Giày Nike Air Jordan 36', N'5.jpg', N'Jordan', 50, 123500, CAST(N'2020-06-13' AS Date), NULL, 0)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10026, N'Giày Nike Air Jordan 37', N'2.jpg', N'Jordan', 50, 123500, CAST(N'2020-06-13' AS Date), NULL, 0)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10027, N'Giày Nike Air Jordan 38', N'5.jpg', N'Jordan', 50, 123500, CAST(N'2020-06-13' AS Date), NULL, 0)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10028, N'Giày Nike Air Jordan 39', N'3.jpg', N'Jordan', 50, 123500, CAST(N'2020-06-13' AS Date), NULL, 0)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10029, N'Giày Nike Air Jordan 40', N'2.jpg', N'Jordan', 50, 123500, CAST(N'2020-06-13' AS Date), NULL, 0)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10030, N'Giày Sneaker mã 1', N'11.jpg', N'Sneaker', 50, 140000, CAST(N'2021-01-26' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10031, N'Giày Sneaker mã 2 ', N'12.jpg', N'Sneaker', 48, 140000, CAST(N'2021-01-26' AS Date), NULL, 0)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10032, N'Giày Sneaker mã 3', N'13.jpg', N'Sneaker', 50, 140000, CAST(N'2021-01-26' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10033, N'Giày Sneaker mã 4', N'14.jpg', N'Sneaker', 50, 140000, CAST(N'2021-01-26' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10034, N'Giày Sneaker mã 5', N'15.jpg', N'Sneaker', 50, 140000, CAST(N'2021-01-26' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10035, N'Giày Sneaker mã 6', N'16.jpg', N'Sneaker', 45, 140000, CAST(N'2021-01-26' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10036, N'Giày Sneaker mã 7', N'17.jpg', N'Sneaker', 50, 140000, CAST(N'2021-01-26' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10037, N'Giày Sneaker mã 8', N'18.jpg', N'Sneaker', 50, 140000, CAST(N'2021-01-26' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10038, N'Giày Nike mã 1', N'19.jpg', N'Nike', 50, 130000, CAST(N'2022-12-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10039, N'Giày Nike mã 2', N'20.jpg', N'Nike', 50, 130000, CAST(N'2022-12-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10040, N'Giày Nike mã 3 ', N'21.jpg', N'Nike', 48, 130000, CAST(N'2022-12-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10041, N'Giày Nike mã 4', N'22.jpg', N'Nike', 50, 130000, CAST(N'2022-12-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10042, N'Giày Nike mã 5', N'23.jpg', N'Nike', 50, 130000, CAST(N'2022-12-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10043, N'Giày Nike mã 6', N'24.jpg', N'Nike', 50, 130000, CAST(N'2022-12-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10044, N'Giày Nike mã 7', N'24.png', N'Nike', 50, 130000, CAST(N'2022-12-12' AS Date), NULL, 1)
GO
INSERT [dbo].[SanPham] ([idSP], [TenSP], [HinhSP], [ThuongHieu], [SL], [Gia], [NgayTao], [GhiChu], [Loai]) VALUES (10045, N'Giày Nike mã 8', N'25.png', N'Nike', 50, 130000, CAST(N'2022-12-12' AS Date), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
INSERT [dbo].[ThuongHieu] ([id], [name]) VALUES (N'Jordan', N'Giày Jordan')
GO
INSERT [dbo].[ThuongHieu] ([id], [name]) VALUES (N'Sneaker', N'Giày Sneaker')
GO
INSERT [dbo].[ThuongHieu] ([id], [name]) VALUES (N'Nike', N'Giày Nike')
GO
INSERT [dbo].[Users] ([UserName], [FullName], [Password], [Sdt], [Email], [DiaChi], [VaiTro], [TrangThai]) VALUES (N'12345', N'linh', N'123', N'037625899', N'tranlinhks@gmail.com', N'Sóc Trăng', 0, 1)
GO
INSERT [dbo].[Users] ([UserName], [FullName], [Password], [Sdt], [Email], [DiaChi], [VaiTro], [TrangThai]) VALUES (N'admin', N'admin', N'123', N'037625899', N'tranlinh@gmail.com', N'ST', 0, 0)
GO
INSERT [dbo].[Users] ([UserName], [FullName], [Password], [Sdt], [Email], [DiaChi], [VaiTro], [TrangThai]) VALUES (N'anvlt', N'An', N'123', N'0354873839', N'an@gmail.com', N'12', 0, 1)
GO
INSERT [dbo].[Users] ([UserName], [FullName], [Password], [Sdt], [Email], [DiaChi], [VaiTro], [TrangThai]) VALUES (N'tri', N'Nguyễn Minh Trí', N'123', N'0382628282', N'tri@fpt.edu.vn', N'xã Ba Trinh,Kế Sách,Sóc Trăng', 0, 0)
GO
INSERT [dbo].[Users] ([UserName], [FullName], [Password], [Sdt], [Email], [DiaChi], [VaiTro], [TrangThai]) VALUES (N'linhtc', N'Trần Chế Linh', N'123', N'037625899', N'tranlinh2002ks@gmail.com', N'ấp An Thới, An Lạc Thôn,Kế Sách-Sóc Trăng', 1, 1)
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonHang_DonHang] FOREIGN KEY([idDonHang])
REFERENCES [dbo].[DonHang] ([idDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_CTDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonHang_SanPham] FOREIGN KEY([idSP])
REFERENCES [dbo].[SanPham] ([idSP])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_CTDonHang_SanPham]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_User] FOREIGN KEY([UserName])
REFERENCES [dbo].[Users] ([UserName])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_User]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_User1] FOREIGN KEY([UserName])
REFERENCES [dbo].[Users] ([UserName])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_User1]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Loai] FOREIGN KEY([ThuongHieu])
REFERENCES [dbo].[ThuongHieu] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Loai]
GO
USE [master]
GO
ALTER DATABASE [Giay] SET  READ_WRITE 
GO
