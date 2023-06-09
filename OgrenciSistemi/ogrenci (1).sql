USE [master]
GO
/****** Object:  Database [OgrenciSistem]    Script Date: 10.03.2023 15:58:25 ******/
CREATE DATABASE [OgrenciSistem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OgrenciSistem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSQL\MSSQL16.MSSQLSERVER13\MSSQL\DATA\OgrenciSistem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OgrenciSistem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSQL\MSSQL16.MSSQLSERVER13\MSSQL\DATA\OgrenciSistem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OgrenciSistem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OgrenciSistem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OgrenciSistem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OgrenciSistem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OgrenciSistem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OgrenciSistem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OgrenciSistem] SET ARITHABORT OFF 
GO
ALTER DATABASE [OgrenciSistem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OgrenciSistem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OgrenciSistem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OgrenciSistem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OgrenciSistem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OgrenciSistem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OgrenciSistem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OgrenciSistem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OgrenciSistem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OgrenciSistem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OgrenciSistem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OgrenciSistem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OgrenciSistem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OgrenciSistem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OgrenciSistem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OgrenciSistem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OgrenciSistem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OgrenciSistem] SET RECOVERY FULL 
GO
ALTER DATABASE [OgrenciSistem] SET  MULTI_USER 
GO
ALTER DATABASE [OgrenciSistem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OgrenciSistem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OgrenciSistem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OgrenciSistem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OgrenciSistem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OgrenciSistem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'OgrenciSistem', N'ON'
GO
ALTER DATABASE [OgrenciSistem] SET QUERY_STORE = ON
GO
ALTER DATABASE [OgrenciSistem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OgrenciSistem]
GO
/****** Object:  Table [dbo].[Dersler]    Script Date: 10.03.2023 15:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dersler](
	[DersNo] [int] IDENTITY(1,1) NOT NULL,
	[DersAdi] [varchar](50) NULL,
	[AKTS] [varchar](50) NULL,
	[Donem] [varchar](50) NULL,
 CONSTRAINT [PK_Dersler] PRIMARY KEY CLUSTERED 
(
	[DersNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KullaniciGiris]    Script Date: 10.03.2023 15:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullaniciGiris](
	[KullaniciNo] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [varchar](50) NULL,
	[KullaniciSifre] [varchar](50) NULL,
 CONSTRAINT [PK_KullaniciGiris] PRIMARY KEY CLUSTERED 
(
	[KullaniciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notlar]    Script Date: 10.03.2023 15:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notlar](
	[NotNo] [int] IDENTITY(1,1) NOT NULL,
	[Vize] [int] NULL,
	[Final] [int] NULL,
	[Durum] [varchar](50) NULL,
	[DersNo] [int] NULL,
 CONSTRAINT [PK_Notlar] PRIMARY KEY CLUSTERED 
(
	[NotNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ogrenciler]    Script Date: 10.03.2023 15:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ogrenciler](
	[OgrenciNo] [int] IDENTITY(1,1) NOT NULL,
	[OgrenciAdi] [varchar](50) NULL,
	[OgrenciSoyadi] [varchar](50) NULL,
	[Fakulte] [varchar](50) NULL,
	[Bolum] [varchar](50) NULL,
	[Sinif] [int] NULL,
	[DanismanHoca] [varchar](50) NULL,
	[DersNo] [int] NULL,
 CONSTRAINT [PK_Ogrenciler] PRIMARY KEY CLUSTERED 
(
	[OgrenciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ogretmenler]    Script Date: 10.03.2023 15:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ogretmenler](
	[OgretmenNo] [int] IDENTITY(1,1) NOT NULL,
	[OgretmenAdi] [varchar](50) NULL,
	[OgretmenSoyadi] [varchar](50) NULL,
	[Bolum] [varchar](50) NULL,
	[Unvan] [varchar](50) NULL,
	[DersNo] [int] NULL,
 CONSTRAINT [PK_Ogretmenler] PRIMARY KEY CLUSTERED 
(
	[OgretmenNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Dersler] ON 

INSERT [dbo].[Dersler] ([DersNo], [DersAdi], [AKTS], [Donem]) VALUES (1, N'Medeni Hukuk', N'6', N'2')
INSERT [dbo].[Dersler] ([DersNo], [DersAdi], [AKTS], [Donem]) VALUES (2, N'Ceza Hukuk', N'5', N'6')
INSERT [dbo].[Dersler] ([DersNo], [DersAdi], [AKTS], [Donem]) VALUES (3, N'İcra', N'5', N'4')
INSERT [dbo].[Dersler] ([DersNo], [DersAdi], [AKTS], [Donem]) VALUES (4, N'Aile', N'6', N'2')
INSERT [dbo].[Dersler] ([DersNo], [DersAdi], [AKTS], [Donem]) VALUES (5, N'Miras', N'6', N'2')
INSERT [dbo].[Dersler] ([DersNo], [DersAdi], [AKTS], [Donem]) VALUES (6, N'Usul', N'5', N'4')
INSERT [dbo].[Dersler] ([DersNo], [DersAdi], [AKTS], [Donem]) VALUES (7, N'Eşya', N'5', N'2')
INSERT [dbo].[Dersler] ([DersNo], [DersAdi], [AKTS], [Donem]) VALUES (8, N'Borçlar', N'6', N'4')
INSERT [dbo].[Dersler] ([DersNo], [DersAdi], [AKTS], [Donem]) VALUES (9, N'Roma', N'4', N'2')
INSERT [dbo].[Dersler] ([DersNo], [DersAdi], [AKTS], [Donem]) VALUES (10, N'Felsefe', N'5', N'2')
INSERT [dbo].[Dersler] ([DersNo], [DersAdi], [AKTS], [Donem]) VALUES (11, N'Tarih', N'5', N'2')
INSERT [dbo].[Dersler] ([DersNo], [DersAdi], [AKTS], [Donem]) VALUES (12, N'İngilizce', N'6', N'4')
INSERT [dbo].[Dersler] ([DersNo], [DersAdi], [AKTS], [Donem]) VALUES (13, N'Almanca', N'5', N'2')
INSERT [dbo].[Dersler] ([DersNo], [DersAdi], [AKTS], [Donem]) VALUES (14, N'Türkçe', N'6', N'2')
INSERT [dbo].[Dersler] ([DersNo], [DersAdi], [AKTS], [Donem]) VALUES (15, N'Anayasa', N'6', N'6')
INSERT [dbo].[Dersler] ([DersNo], [DersAdi], [AKTS], [Donem]) VALUES (16, N'Anatomi', N'6', N'6')
INSERT [dbo].[Dersler] ([DersNo], [DersAdi], [AKTS], [Donem]) VALUES (17, N'Fizyoloji', N'4', N'4')
INSERT [dbo].[Dersler] ([DersNo], [DersAdi], [AKTS], [Donem]) VALUES (18, N'Fizik', N'6', N'4')
INSERT [dbo].[Dersler] ([DersNo], [DersAdi], [AKTS], [Donem]) VALUES (19, N'Kimya', N'5', N'4')
INSERT [dbo].[Dersler] ([DersNo], [DersAdi], [AKTS], [Donem]) VALUES (20, N'Biyoloji', N'5', N'4')
SET IDENTITY_INSERT [dbo].[Dersler] OFF
GO
SET IDENTITY_INSERT [dbo].[KullaniciGiris] ON 

INSERT [dbo].[KullaniciGiris] ([KullaniciNo], [KullaniciAdi], [KullaniciSifre]) VALUES (1, N'hilal', N'123')
SET IDENTITY_INSERT [dbo].[KullaniciGiris] OFF
GO
SET IDENTITY_INSERT [dbo].[Notlar] ON 

INSERT [dbo].[Notlar] ([NotNo], [Vize], [Final], [Durum], [DersNo]) VALUES (1, 50, 75, N'Kaldı', 20)
INSERT [dbo].[Notlar] ([NotNo], [Vize], [Final], [Durum], [DersNo]) VALUES (2, 45, 50, N'Kaldı', 19)
INSERT [dbo].[Notlar] ([NotNo], [Vize], [Final], [Durum], [DersNo]) VALUES (3, 80, 85, N'Geçti', 18)
INSERT [dbo].[Notlar] ([NotNo], [Vize], [Final], [Durum], [DersNo]) VALUES (4, 45, 65, N'Kaldı', 16)
INSERT [dbo].[Notlar] ([NotNo], [Vize], [Final], [Durum], [DersNo]) VALUES (5, 25, 45, N'Kaldı', 13)
INSERT [dbo].[Notlar] ([NotNo], [Vize], [Final], [Durum], [DersNo]) VALUES (6, 35, 75, N'Kaldı', 12)
INSERT [dbo].[Notlar] ([NotNo], [Vize], [Final], [Durum], [DersNo]) VALUES (7, 65, 75, N'Geçti', 11)
INSERT [dbo].[Notlar] ([NotNo], [Vize], [Final], [Durum], [DersNo]) VALUES (8, 60, 80, N'Geçti', 10)
INSERT [dbo].[Notlar] ([NotNo], [Vize], [Final], [Durum], [DersNo]) VALUES (9, 90, 65, N'Geçti', 8)
INSERT [dbo].[Notlar] ([NotNo], [Vize], [Final], [Durum], [DersNo]) VALUES (10, 65, 75, N'Geçti', 7)
INSERT [dbo].[Notlar] ([NotNo], [Vize], [Final], [Durum], [DersNo]) VALUES (11, 15, 45, N'Kaldı', 6)
INSERT [dbo].[Notlar] ([NotNo], [Vize], [Final], [Durum], [DersNo]) VALUES (12, 25, 35, N'Kaldı', 5)
INSERT [dbo].[Notlar] ([NotNo], [Vize], [Final], [Durum], [DersNo]) VALUES (13, 75, 75, N'Geçti', 4)
INSERT [dbo].[Notlar] ([NotNo], [Vize], [Final], [Durum], [DersNo]) VALUES (14, 60, 25, N'Kaldı', 3)
INSERT [dbo].[Notlar] ([NotNo], [Vize], [Final], [Durum], [DersNo]) VALUES (15, 35, 45, N'Kaldı', 2)
INSERT [dbo].[Notlar] ([NotNo], [Vize], [Final], [Durum], [DersNo]) VALUES (16, 65, 85, N'Geçti', 1)
SET IDENTITY_INSERT [dbo].[Notlar] OFF
GO
SET IDENTITY_INSERT [dbo].[Ogrenciler] ON 

INSERT [dbo].[Ogrenciler] ([OgrenciNo], [OgrenciAdi], [OgrenciSoyadi], [Fakulte], [Bolum], [Sinif], [DanismanHoca], [DersNo]) VALUES (1, N'Figen', N'Bozkuş', N'Hukuk', N'Hukuk', 1, N'Servet ', 1)
INSERT [dbo].[Ogrenciler] ([OgrenciNo], [OgrenciAdi], [OgrenciSoyadi], [Fakulte], [Bolum], [Sinif], [DanismanHoca], [DersNo]) VALUES (2, N'Eda', N'Güner', N'Hukuk', N'Hukuk', 2, N'Nadire', 2)
INSERT [dbo].[Ogrenciler] ([OgrenciNo], [OgrenciAdi], [OgrenciSoyadi], [Fakulte], [Bolum], [Sinif], [DanismanHoca], [DersNo]) VALUES (3, N'Zeynep ', N'Arslan', N'Hukuk', N'Hukuk', 3, N'Ülkü', 3)
INSERT [dbo].[Ogrenciler] ([OgrenciNo], [OgrenciAdi], [OgrenciSoyadi], [Fakulte], [Bolum], [Sinif], [DanismanHoca], [DersNo]) VALUES (4, N'Eda', N'Güner', N'Hukuk', N'Hukuk', 2, N'Sena', 4)
INSERT [dbo].[Ogrenciler] ([OgrenciNo], [OgrenciAdi], [OgrenciSoyadi], [Fakulte], [Bolum], [Sinif], [DanismanHoca], [DersNo]) VALUES (5, N'Işık', N'Öztaş', N'Hukuk', N'Hukuk', 1, N'Halime', 5)
INSERT [dbo].[Ogrenciler] ([OgrenciNo], [OgrenciAdi], [OgrenciSoyadi], [Fakulte], [Bolum], [Sinif], [DanismanHoca], [DersNo]) VALUES (6, N'Figen ', N'Bozkuş', N'Hukuk', N'Hukuk', 1, N'Sümeyye', 6)
INSERT [dbo].[Ogrenciler] ([OgrenciNo], [OgrenciAdi], [OgrenciSoyadi], [Fakulte], [Bolum], [Sinif], [DanismanHoca], [DersNo]) VALUES (7, N'Zeynep', N'Arslan', N'Hukuk', N'Hukuk', 3, N'Asude', 7)
INSERT [dbo].[Ogrenciler] ([OgrenciNo], [OgrenciAdi], [OgrenciSoyadi], [Fakulte], [Bolum], [Sinif], [DanismanHoca], [DersNo]) VALUES (8, N'Figen ', N'Bozkuş', N'Hukuk', N'Hukuk', 1, N'Ferah', 8)
INSERT [dbo].[Ogrenciler] ([OgrenciNo], [OgrenciAdi], [OgrenciSoyadi], [Fakulte], [Bolum], [Sinif], [DanismanHoca], [DersNo]) VALUES (9, N'Cansu', N'Kaygısız', N'Eğitim', N'Felsefe', 3, N'İlker', 10)
INSERT [dbo].[Ogrenciler] ([OgrenciNo], [OgrenciAdi], [OgrenciSoyadi], [Fakulte], [Bolum], [Sinif], [DanismanHoca], [DersNo]) VALUES (10, N'Zeynep ', N'Çelik', N'Eğitim', N'Tarih', 4, N'Metin', 11)
INSERT [dbo].[Ogrenciler] ([OgrenciNo], [OgrenciAdi], [OgrenciSoyadi], [Fakulte], [Bolum], [Sinif], [DanismanHoca], [DersNo]) VALUES (11, N'Zeynep ', N'Çelik', N'Yabancı Dil', N'İngilizce', 4, N'Yelda', 12)
INSERT [dbo].[Ogrenciler] ([OgrenciNo], [OgrenciAdi], [OgrenciSoyadi], [Fakulte], [Bolum], [Sinif], [DanismanHoca], [DersNo]) VALUES (12, N'Cansu ', N'Kaygısız', N'Yabancı Dil', N'Almanca', 1, N'Aynur', 13)
INSERT [dbo].[Ogrenciler] ([OgrenciNo], [OgrenciAdi], [OgrenciSoyadi], [Fakulte], [Bolum], [Sinif], [DanismanHoca], [DersNo]) VALUES (13, N'Selin ', N'Arslan', N'Sağlık', N'Protez', 2, N'Cemil', 16)
INSERT [dbo].[Ogrenciler] ([OgrenciNo], [OgrenciAdi], [OgrenciSoyadi], [Fakulte], [Bolum], [Sinif], [DanismanHoca], [DersNo]) VALUES (14, N'Selin ', N'Arslan', N'Eğitim', N'Fizik', 1, N'Pınar', 18)
INSERT [dbo].[Ogrenciler] ([OgrenciNo], [OgrenciAdi], [OgrenciSoyadi], [Fakulte], [Bolum], [Sinif], [DanismanHoca], [DersNo]) VALUES (15, N'Cansu ', N'Kaygısız', N'Eğitim', N'Kimya', 2, N'Beyza', 19)
INSERT [dbo].[Ogrenciler] ([OgrenciNo], [OgrenciAdi], [OgrenciSoyadi], [Fakulte], [Bolum], [Sinif], [DanismanHoca], [DersNo]) VALUES (16, N'Selin', N'Arslan', N'Eğitim', N'Biyoloji', 2, N'Esra', 20)
SET IDENTITY_INSERT [dbo].[Ogrenciler] OFF
GO
SET IDENTITY_INSERT [dbo].[Ogretmenler] ON 

INSERT [dbo].[Ogretmenler] ([OgretmenNo], [OgretmenAdi], [OgretmenSoyadi], [Bolum], [Unvan], [DersNo]) VALUES (1, N'Servet', N'Bayram', N'Hukuk', N'Profesör', 1)
INSERT [dbo].[Ogretmenler] ([OgretmenNo], [OgretmenAdi], [OgretmenSoyadi], [Bolum], [Unvan], [DersNo]) VALUES (2, N'Nadire', N'Gülçin', N'Hukuk', N'Profesör', 2)
INSERT [dbo].[Ogretmenler] ([OgretmenNo], [OgretmenAdi], [OgretmenSoyadi], [Bolum], [Unvan], [DersNo]) VALUES (3, N'Ülkü', N'Tosun', N'Hukuk', N'Doçent', 3)
INSERT [dbo].[Ogretmenler] ([OgretmenNo], [OgretmenAdi], [OgretmenSoyadi], [Bolum], [Unvan], [DersNo]) VALUES (4, N'Sena', N'Güme', N'Hukuk', N'Doçent', 4)
INSERT [dbo].[Ogretmenler] ([OgretmenNo], [OgretmenAdi], [OgretmenSoyadi], [Bolum], [Unvan], [DersNo]) VALUES (5, N'Halime', N'Eyvaz', N'Hukuk', N'Doçent', 5)
INSERT [dbo].[Ogretmenler] ([OgretmenNo], [OgretmenAdi], [OgretmenSoyadi], [Bolum], [Unvan], [DersNo]) VALUES (6, N'Sümeyye', N'Burhan', N'Hukuk', N'Araştırma Görevlisi', 6)
INSERT [dbo].[Ogretmenler] ([OgretmenNo], [OgretmenAdi], [OgretmenSoyadi], [Bolum], [Unvan], [DersNo]) VALUES (7, N'Asude ', N'Özdemir', N'Hukuk', N'Araştırma Görevlisi', 7)
INSERT [dbo].[Ogretmenler] ([OgretmenNo], [OgretmenAdi], [OgretmenSoyadi], [Bolum], [Unvan], [DersNo]) VALUES (8, N'Ferah ', N'Çekici', N'Hukuk', N'Doçent', 8)
INSERT [dbo].[Ogretmenler] ([OgretmenNo], [OgretmenAdi], [OgretmenSoyadi], [Bolum], [Unvan], [DersNo]) VALUES (9, N'Aslı ', N'Taşören', N'Hukuk', N'Doçent', 9)
INSERT [dbo].[Ogretmenler] ([OgretmenNo], [OgretmenAdi], [OgretmenSoyadi], [Bolum], [Unvan], [DersNo]) VALUES (10, N'İlker', N'Altınbaşak', N'Felsefe', N'Profesör', 10)
INSERT [dbo].[Ogretmenler] ([OgretmenNo], [OgretmenAdi], [OgretmenSoyadi], [Bolum], [Unvan], [DersNo]) VALUES (11, N'Metin ', N'Kaya', N'Tarih', N'Profesör', 11)
INSERT [dbo].[Ogretmenler] ([OgretmenNo], [OgretmenAdi], [OgretmenSoyadi], [Bolum], [Unvan], [DersNo]) VALUES (12, N'Yelda', N'Yönel', N'İngilizce', N'Doçent', 12)
INSERT [dbo].[Ogretmenler] ([OgretmenNo], [OgretmenAdi], [OgretmenSoyadi], [Bolum], [Unvan], [DersNo]) VALUES (13, N'Aynur ', N'Kesen', N'Almanca', N'Profesör', 13)
INSERT [dbo].[Ogretmenler] ([OgretmenNo], [OgretmenAdi], [OgretmenSoyadi], [Bolum], [Unvan], [DersNo]) VALUES (14, N'Mehdi', N'Solvi', N'Türkçe', N'Profesör', 14)
INSERT [dbo].[Ogretmenler] ([OgretmenNo], [OgretmenAdi], [OgretmenSoyadi], [Bolum], [Unvan], [DersNo]) VALUES (15, N'Melike ', N'Şahin', N'Hukuk', N'Doçent', 15)
INSERT [dbo].[Ogretmenler] ([OgretmenNo], [OgretmenAdi], [OgretmenSoyadi], [Bolum], [Unvan], [DersNo]) VALUES (16, N'Cemil', N'Karacan', N'Protez', N'Profesör', 16)
INSERT [dbo].[Ogretmenler] ([OgretmenNo], [OgretmenAdi], [OgretmenSoyadi], [Bolum], [Unvan], [DersNo]) VALUES (17, N'Esra', N'Atılgan', N'Protez', N'Doçent', 17)
INSERT [dbo].[Ogretmenler] ([OgretmenNo], [OgretmenAdi], [OgretmenSoyadi], [Bolum], [Unvan], [DersNo]) VALUES (18, N'Pınar', N'Konyalıoğlu', N'Fizik', N'Profesör', 18)
INSERT [dbo].[Ogretmenler] ([OgretmenNo], [OgretmenAdi], [OgretmenSoyadi], [Bolum], [Unvan], [DersNo]) VALUES (19, N'Beyza ', N'Arslan', N'Kimya', N'Profesör', 19)
INSERT [dbo].[Ogretmenler] ([OgretmenNo], [OgretmenAdi], [OgretmenSoyadi], [Bolum], [Unvan], [DersNo]) VALUES (20, N'Esra', N'Yemenli', N'Biyoloji', N'Profesör', 20)
SET IDENTITY_INSERT [dbo].[Ogretmenler] OFF
GO
ALTER TABLE [dbo].[Notlar]  WITH CHECK ADD  CONSTRAINT [FK_Notlar_Dersler] FOREIGN KEY([DersNo])
REFERENCES [dbo].[Dersler] ([DersNo])
GO
ALTER TABLE [dbo].[Notlar] CHECK CONSTRAINT [FK_Notlar_Dersler]
GO
ALTER TABLE [dbo].[Ogrenciler]  WITH CHECK ADD  CONSTRAINT [FK_Ogrenciler_Dersler] FOREIGN KEY([DersNo])
REFERENCES [dbo].[Dersler] ([DersNo])
GO
ALTER TABLE [dbo].[Ogrenciler] CHECK CONSTRAINT [FK_Ogrenciler_Dersler]
GO
ALTER TABLE [dbo].[Ogretmenler]  WITH CHECK ADD  CONSTRAINT [FK_Ogretmenler_Dersler] FOREIGN KEY([DersNo])
REFERENCES [dbo].[Dersler] ([DersNo])
GO
ALTER TABLE [dbo].[Ogretmenler] CHECK CONSTRAINT [FK_Ogretmenler_Dersler]
GO
USE [master]
GO
ALTER DATABASE [OgrenciSistem] SET  READ_WRITE 
GO
