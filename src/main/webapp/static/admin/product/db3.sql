USE [_Project]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 07/03/2020 7:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Name] [nvarchar](50) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 07/03/2020 7:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Image] [nvarchar](100) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Status] [bit] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 07/03/2020 7:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Amount] [float] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderBy] [nvarchar](50) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 07/03/2020 7:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Image] [nvarchar](100) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreateDate] [date] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 07/03/2020 7:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Thumbnail] [nvarchar](100) NOT NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Status] [bit] NOT NULL,
	[CountViewer] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 07/03/2020 7:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07/03/2020 7:25:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](max) NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Name], [Id]) VALUES (N'Iphone', 1008)
INSERT [dbo].[Categories] ([Name], [Id]) VALUES (N'Samsung', 1009)
INSERT [dbo].[Categories] ([Name], [Id]) VALUES (N'Oppo', 1010)
INSERT [dbo].[Categories] ([Name], [Id]) VALUES (N'Xiao', 1011)
INSERT [dbo].[Categories] ([Name], [Id]) VALUES (N'Vivo', 1012)
INSERT [dbo].[Categories] ([Name], [Id]) VALUES (N'RealMe', 1013)
INSERT [dbo].[Categories] ([Name], [Id]) VALUES (N'Vsmart', 1014)
INSERT [dbo].[Categories] ([Name], [Id]) VALUES (N'Huawei', 1015)
INSERT [dbo].[Categories] ([Name], [Id]) VALUES (N'Nokia', 1016)
INSERT [dbo].[Categories] ([Name], [Id]) VALUES (N'BlackBerry', 1017)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([UnitPrice], [Quantity], [Image], [OrderId], [ProductId], [Status], [Id]) VALUES (3199998, 2, N'iphone-11-red-2-.png', 2, 3015, 0, 1)
INSERT [dbo].[OrderDetails] ([UnitPrice], [Quantity], [Image], [OrderId], [ProductId], [Status], [Id]) VALUES (43980000, 2, N'44-441573.png', 4, 3015, 0, 2)
INSERT [dbo].[OrderDetails] ([UnitPrice], [Quantity], [Image], [OrderId], [ProductId], [Status], [Id]) VALUES (197910000, 9, N'44-441573.png', 5, 3015, 0, 3)
INSERT [dbo].[OrderDetails] ([UnitPrice], [Quantity], [Image], [OrderId], [ProductId], [Status], [Id]) VALUES (43980000, 2, N'44-441573.png', 6, 3015, 0, 4)
INSERT [dbo].[OrderDetails] ([UnitPrice], [Quantity], [Image], [OrderId], [ProductId], [Status], [Id]) VALUES (43980000, 2, N'44-441573.png', 7, 3015, 0, 5)
INSERT [dbo].[OrderDetails] ([UnitPrice], [Quantity], [Image], [OrderId], [ProductId], [Status], [Id]) VALUES (87960000, 4, N'44-441573.png', 8, 3015, 0, 6)
INSERT [dbo].[OrderDetails] ([UnitPrice], [Quantity], [Image], [OrderId], [ProductId], [Status], [Id]) VALUES (21990000, 1, N'44-441573.png', 9, 3015, 0, 7)
INSERT [dbo].[OrderDetails] ([UnitPrice], [Quantity], [Image], [OrderId], [ProductId], [Status], [Id]) VALUES (21990000, 1, N'44-441573.png', 10, 3015, 0, 8)
INSERT [dbo].[OrderDetails] ([UnitPrice], [Quantity], [Image], [OrderId], [ProductId], [Status], [Id]) VALUES (21990000, 1, N'44-441573.png', 11, 3015, 0, 9)
INSERT [dbo].[OrderDetails] ([UnitPrice], [Quantity], [Image], [OrderId], [ProductId], [Status], [Id]) VALUES (65970000, 3, N'44-441573.png', 12, 3015, 0, 10)
INSERT [dbo].[OrderDetails] ([UnitPrice], [Quantity], [Image], [OrderId], [ProductId], [Status], [Id]) VALUES (65970000, 3, N'44-441573.png', 13, 3015, 0, 11)
INSERT [dbo].[OrderDetails] ([UnitPrice], [Quantity], [Image], [OrderId], [ProductId], [Status], [Id]) VALUES (43980000, 2, N'44-441573.png', 14, 3015, 0, 12)
INSERT [dbo].[OrderDetails] ([UnitPrice], [Quantity], [Image], [OrderId], [ProductId], [Status], [Id]) VALUES (236390000, 2, N'44-441573.png', 16, 3015, 0, 13)
INSERT [dbo].[OrderDetails] ([UnitPrice], [Quantity], [Image], [OrderId], [ProductId], [Status], [Id]) VALUES (236390000, 4, N'iphone-11-red-2-.png', 16, 3021, 0, 14)
INSERT [dbo].[OrderDetails] ([UnitPrice], [Quantity], [Image], [OrderId], [ProductId], [Status], [Id]) VALUES (236390000, 4, N'samsung-galaxy-note-10-silver.png', 16, 3023, 0, 15)
INSERT [dbo].[OrderDetails] ([UnitPrice], [Quantity], [Image], [OrderId], [ProductId], [Status], [Id]) VALUES (236390000, 1, N'oppo-reno-2.png', 16, 3024, 0, 16)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Amount], [OrderDate], [OrderBy], [Id]) VALUES (3199998, CAST(N'2020-03-04' AS Date), N'admin', 2)
INSERT [dbo].[Orders] ([Amount], [OrderDate], [OrderBy], [Id]) VALUES (43980000, CAST(N'2020-03-04' AS Date), N'admin', 4)
INSERT [dbo].[Orders] ([Amount], [OrderDate], [OrderBy], [Id]) VALUES (197910000, CAST(N'2020-03-04' AS Date), N'admin', 5)
INSERT [dbo].[Orders] ([Amount], [OrderDate], [OrderBy], [Id]) VALUES (43980000, CAST(N'2020-03-04' AS Date), N'admin', 6)
INSERT [dbo].[Orders] ([Amount], [OrderDate], [OrderBy], [Id]) VALUES (43980000, CAST(N'2020-03-04' AS Date), N'admin', 7)
INSERT [dbo].[Orders] ([Amount], [OrderDate], [OrderBy], [Id]) VALUES (87960000, CAST(N'2020-03-04' AS Date), N'admin', 8)
INSERT [dbo].[Orders] ([Amount], [OrderDate], [OrderBy], [Id]) VALUES (21990000, CAST(N'2020-03-04' AS Date), N'admin', 9)
INSERT [dbo].[Orders] ([Amount], [OrderDate], [OrderBy], [Id]) VALUES (21990000, CAST(N'2020-03-04' AS Date), N'admin', 10)
INSERT [dbo].[Orders] ([Amount], [OrderDate], [OrderBy], [Id]) VALUES (21990000, CAST(N'2020-03-04' AS Date), N'admin', 11)
INSERT [dbo].[Orders] ([Amount], [OrderDate], [OrderBy], [Id]) VALUES (65970000, CAST(N'2020-03-04' AS Date), N'admin', 12)
INSERT [dbo].[Orders] ([Amount], [OrderDate], [OrderBy], [Id]) VALUES (65970000, CAST(N'2020-03-04' AS Date), N'admin', 13)
INSERT [dbo].[Orders] ([Amount], [OrderDate], [OrderBy], [Id]) VALUES (43980000, CAST(N'2020-03-04' AS Date), N'admin', 14)
INSERT [dbo].[Orders] ([Amount], [OrderDate], [OrderBy], [Id]) VALUES (236390000, CAST(N'2020-03-04' AS Date), N'admin', 16)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([UnitPrice], [Quantity], [Image], [CategoryId], [Name], [Id], [Description], [CreateDate]) VALUES (21990000, 3, N'44-441573.png', 1008, N'Điện thoại iPhone 11 64GB', 3015, N'<p><a href="https://youtu.be/d1SGTpH5SNA" target="_blank" title="Chỉa sẻ liên kết">https://youtu.be/d1SGTpH5SNA</a></p>
', CAST(N'2020-03-04' AS Date))
INSERT [dbo].[Products] ([UnitPrice], [Quantity], [Image], [CategoryId], [Name], [Id], [Description], [CreateDate]) VALUES (21990000, 2, N'iphone-11-red-2-.png', 1008, N'Điện thoại iPhone 11 64GB', 3021, N'<h2>Sau bao nhi&ecirc;u chờ đợi cũng như đồn đo&aacute;n th&igrave; cuối c&ugrave;ng Apple đ&atilde; ch&iacute;nh thức giới thiệu bộ 3 si&ecirc;u phẩm iPhone 11 mạnh mẽ nhất của m&igrave;nh v&agrave;o th&aacute;ng 9/2019. C&oacute; mức gi&aacute; rẻ nhất nhưng vẫn được n&acirc;ng cấp mạnh mẽ như chiếc&nbsp;<a href="https://www.thegioididong.com/dtdd/iphone-xr-128gb" target="_blank" title="Tham khảo điện thoại iPhone Xr chính hãng">iPhone Xr</a>&nbsp;năm ngo&aacute;i, đ&oacute; ch&iacute;nh l&agrave; phi&ecirc;n bản&nbsp;<a href="https://www.thegioididong.com/dtdd/iphone-11" target="_blank" title="Tham khảo điện thoại iPhone 11 64GB chính hãng">iPhone 11 64GB</a>.</h2>
', CAST(N'2020-03-04' AS Date))
INSERT [dbo].[Products] ([UnitPrice], [Quantity], [Image], [CategoryId], [Name], [Id], [Description], [CreateDate]) VALUES (50000000, 10, N'samsung-galaxy-fold-.png', 1009, N'Samsung Galaxy Fold', 3022, N'<h2>Sau rất nhiều chờ đợi th&igrave;&nbsp;<a href="https://www.thegioididong.com/dtdd/samsung-galaxy-fold" target="_blank" title="Tham khảo điện thoại Samsung Galaxy Fold chính hãng">Samsung Galaxy Fold</a>&nbsp;- chiếc&nbsp;<a href="https://www.thegioididong.com/dtdd" target="_blank" title="Tham khảo các dòng điện thoại chính hãng">smartphone</a>&nbsp;m&agrave;n h&igrave;nh gập đầu ti&ecirc;n của Samsung cũng đ&atilde; ch&iacute;nh thức tr&igrave;nh l&agrave;ng với thiết kế mới lạ.</h2>
', CAST(N'2020-03-04' AS Date))
INSERT [dbo].[Products] ([UnitPrice], [Quantity], [Image], [CategoryId], [Name], [Id], [Description], [CreateDate]) VALUES (22990000, 2, N'samsung-galaxy-note-10-silver.png', 1009, N' Samsung Galaxy Note 10', 3023, N'<h2>Nếu như từ trước tới nay d&ograve;ng Galaxy Note của&nbsp;<a href="https://www.thegioididong.com/dtdd-samsung" target="_blank" title="Tham khảo giá điện thoại smartphone Samsung chính hãng, giá rẻ" type="Tham khảo giá điện thoại smartphone Samsung chính hãng, giá rẻ">Samsung</a>&nbsp;thường &iacute;t được c&aacute;c bạn nữ sử dụng bởi k&iacute;ch thước m&agrave;n h&igrave;nh kh&aacute; lớn khiến việc cầm nắm trở n&ecirc;n kh&oacute; khăn th&igrave;&nbsp;<a href="https://www.thegioididong.com/dtdd/samsung-galaxy-note-10" target="_blank" title="Tham khảo điện thoại Samsung Galaxy Note 10 chính hãng, giá rẻ" type="Tham khảo điện thoại Samsung Galaxy Note 10 chính hãng, giá rẻ">Samsung Galaxy Note 10</a>&nbsp;sẽ l&agrave; chiếc smartphone nhỏ gọn, ph&ugrave; hợp với cả những bạn c&oacute; b&agrave;n tay nhỏ.</h2>
', CAST(N'2020-03-04' AS Date))
INSERT [dbo].[Products] ([UnitPrice], [Quantity], [Image], [CategoryId], [Name], [Id], [Description], [CreateDate]) VALUES (12490000, 9, N'oppo-reno-2.png', 1010, N'OPPO Reno2', 3024, N'<h2>Sau sự th&agrave;nh c&ocirc;ng của chiếc&nbsp;<a href="https://www.thegioididong.com/dtdd/oppo-reno" target="_blank" title="Tham khảo điện thoại OPPO Reno chính hãng">OPPO Reno</a>&nbsp;với thiết kế mới lạ, camera chất lượng th&igrave; mới đ&acirc;y OPPO tiếp tục giới thiệu phi&ecirc;n bản n&acirc;ng cấp của chiếc smartphone n&agrave;y l&agrave; chiếc&nbsp;<a href="https://www.thegioididong.com/dtdd/oppo-reno2" target="_blank" title="Tham khảo điện thoại OPPO Reno2 chính hãng">OPPO Reno2</a>.</h2>
', CAST(N'2020-03-04' AS Date))
INSERT [dbo].[Products] ([UnitPrice], [Quantity], [Image], [CategoryId], [Name], [Id], [Description], [CreateDate]) VALUES (12990000, 10, N'xiaomi-mi-note-10png.png', 1011, N'Xiaomi Mi Note 10', 3025, N'<h2>2019 c&oacute; lẽ l&agrave; năm của chạy đua số chấm tr&ecirc;n camera&nbsp;<a href="https://www.thegioididong.com/dtdd" target="_blank" title="Tham khảo giá điện thoại smartphone chính hãng" type="Tham khảo giá điện thoại smartphone chính hãng">smartphone</a>,&nbsp;<a href="https://www.thegioididong.com/dtdd-xiaomi" target="_blank" title="Tham khảo giá điện thoại smartphone Xiaomi chính hãng" type="Xiaomi">Xiaomi</a>&nbsp;ra mắt chiếc điện thoại&nbsp;<a href="https://www.thegioididong.com/dtdd/xiaomi-mi-note-10" target="_blank" title="Tham khảo giá điện thoại Xiaomi Mi Note 10 chính hãng" type="Tham khảo giá điện thoại Xiaomi Mi Note 10 chính hãng">Xiaomi Mi Note 10 (Mi CC9 Pro)</a>&nbsp;với camera độ ph&acirc;n giải 108 MP đầu ti&ecirc;n tr&ecirc;n thế giới v&agrave; 5 ống k&iacute;nh camera sau cực độc đ&aacute;o.</h2>
', CAST(N'2020-03-04' AS Date))
INSERT [dbo].[Products] ([UnitPrice], [Quantity], [Image], [CategoryId], [Name], [Id], [Description], [CreateDate]) VALUES (8990000, 10, N'vivo-v17.png', 1012, N'Vivo V17 Pro', 3026, N'<h2>Bắt kịp xu thế smartphone c&oacute; nhiều camera th&igrave; Vivo đ&atilde; nhanh ch&oacute;ng giới thiệu chiếc&nbsp;<a href="https://www.thegioididong.com/dtdd/vivo-v17-pro" target="_blank" title="Tham khảo điện thoại Vivo V17 Pro chính hãng">Vivo V17 Pro</a>&nbsp;với tổng cộng tới 6 camera tr&ecirc;n một chiếc m&aacute;y.</h2>
', CAST(N'2020-03-04' AS Date))
INSERT [dbo].[Products] ([UnitPrice], [Quantity], [Image], [CategoryId], [Name], [Id], [Description], [CreateDate]) VALUES (3590000, 10, N'realme-5-.png', 1013, N'Realme 5', 3027, N'<h2>Những chiếc&nbsp;<a href="https://www.thegioididong.com/dtdd-realme" target="_blank" title="Tham khảo giá điện thoại smartphone Realme chính hãng">smartphone Realme</a>&nbsp;lu&ocirc;n g&acirc;y được sự ch&uacute; &yacute; của người d&ugrave;ng bởi những trang bị tr&ecirc;n m&aacute;y so với tầm gi&aacute; tiền v&agrave; mới đ&acirc;y &quot;si&ecirc;u phẩm gi&aacute; rẻ&quot;&nbsp;<a href="https://www.thegioididong.com/dtdd/realme-5" target="_blank" title="Tham khảo điện thoại Realme 5 chính hãng">Realme 5 3GB/64GB</a>&nbsp;ra mắt lại một lần nữa khiến người d&ugrave;ng kh&ocirc;ng khỏi &quot;trầm trồ&quot;</h2>
', CAST(N'2020-03-04' AS Date))
INSERT [dbo].[Products] ([UnitPrice], [Quantity], [Image], [CategoryId], [Name], [Id], [Description], [CreateDate]) VALUES (4990000, 10, N'nokia-72.png', 1016, N'Nokia 7.2', 3028, N'<h2><a href="https://www.thegioididong.com/dtdd/nokia-72" target="_blank" title="Tham khảo điện thoại Nokia 7.2 chính hãng">Nokia 7.2</a>&nbsp;l&agrave; một chiếc&nbsp;<a href="https://www.thegioididong.com/dtdd" target="_blank" title="Tham khảo giá điện thoại smartphone chính hãng">smartphone</a>&nbsp;rất đ&aacute;ng ch&uacute; &yacute; trong những th&aacute;ng cuối năm 2019 với thiết kế thời thượng, hệ điều h&agrave;nh mượt m&agrave; v&agrave; cụm camera chất lượng.</h2>
', CAST(N'2020-03-04' AS Date))
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([Title], [Description], [Content], [Thumbnail], [CreateBy], [CreateDate], [Status], [CountViewer], [Id]) VALUES (N'bai viet 13', N'bai viet 13', N'MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money on boot camp when you can get the MCSE study materials yourself at a fraction.MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money on boot camp when you can get the MCSE study materials yourself at a fraction.', N'iphone-11.png', N'user123', CAST(N'2020-03-04' AS Date), 0, 0, 2)
INSERT [dbo].[Reviews] ([Title], [Description], [Content], [Thumbnail], [CreateBy], [CreateDate], [Status], [CountViewer], [Id]) VALUES (N'bai viet 13', N'bai viet 13', N'MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money on boot camp when you can get the MCSE study materials yourself at a fraction.', N'thiet ke banner_3.jpg', N'admin', CAST(N'2020-03-04' AS Date), 0, 0, 3)
INSERT [dbo].[Reviews] ([Title], [Description], [Content], [Thumbnail], [CreateBy], [CreateDate], [Status], [CountViewer], [Id]) VALUES (N'Best iPhones 2020: Which Apple phone should you get?', N'Here are the best iPhones for your particular needs', N'MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money on boot camp when you can get the MCSE study materials yourself at a fraction.', N'iphone-11-2.jpg', N'user123', CAST(N'2020-03-07' AS Date), 0, 0, 5)
INSERT [dbo].[Reviews] ([Title], [Description], [Content], [Thumbnail], [CreateBy], [CreateDate], [Status], [CountViewer], [Id]) VALUES (N'SAMSUNG GALAXY A10E (2019) REVIEW', N'Here are the best iPhones for your particular needs', N'MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money on boot camp when you can get the MCSE study materials yourself at a fraction.', N'Samsung-Galaxy-A10e-Device-07312019.png', N'user123', CAST(N'2020-03-07' AS Date), 0, 0, 7)
INSERT [dbo].[Reviews] ([Title], [Description], [Content], [Thumbnail], [CreateBy], [CreateDate], [Status], [CountViewer], [Id]) VALUES (N'Đánh giá hiệu năng và thời lượng pin Galaxy Note10 Lite', N'Là một phiên bản rút gọn cấu hình của bộ đôi Galaxy Note10/Note10+ cao cấp', N'<p>Ng&agrave;y 15/1 vừa qua, Samsung đ&atilde; ch&iacute;nh thức cho ra mắt chiếc Galaxy Note10 Lite tại thị trường Việt Nam. Đ&acirc;y l&agrave; một chiếc smartphone mới thuộc d&ograve;ng Note-series nhưng được Samsung cắt giảm một số chi tiết về phần cứng cũng như hiệu năng m&aacute;y nhằm giảm gi&aacute; th&agrave;nh, gi&uacute;p người d&ugrave;ng c&oacute; thể dễ d&agrave;ng tiếp cận hơn với d&ograve;ng Note-series cao cấp m&agrave; kh&ocirc;ng cần phải bỏ ra một số tiền qu&aacute; lớn.</p>

<p><img alt="" src="https://kenh14cdn.com/2020/2/1/photo-1-1580565164700993246833.jpg" style="height:440px; width:660px" /></p>

<p>Nh&igrave;n chung, l&agrave; một thiết bị thuộc d&ograve;ng Note của Samsung, Galaxy Note10 Lite vẫn giữ lại được những điểm đặc trưng vốn c&oacute; của d&ograve;ng sản phẩm n&agrave;y, c&oacute; thể kể tới như một k&iacute;ch thước m&agrave;n h&igrave;nh lớn, một thời lượng pin khoẻ, một cấu h&igrave;nh flagship v&agrave; đặc biệt kh&ocirc;ng thể kh&ocirc;ng nhắc tới chiếc b&uacute;t S Pen thần th&aacute;nh mang trong m&igrave;nh nhiều t&iacute;nh năng độc đ&aacute;o chỉ xuất hiện tr&ecirc;n d&ograve;ng Note m&agrave; th&ocirc;i.</p>

<p>Tất nhi&ecirc;n, l&agrave; một phi&ecirc;n bản r&uacute;t gọn cấu h&igrave;nh, kh&ocirc;ng c&oacute; nghĩa l&agrave; hiệu năng của Galaxy Note10 Lite bị giảm xuống ở ph&acirc;n kh&uacute;c tầm trung, tr&aacute;i lại, m&aacute;y vẫn được trang bị một con chip flagship với hiệu năng ở thời điểm hiện tại vẫn được coi l&agrave; mạnh mẽ. Trong khu&ocirc;n khổ b&agrave;i viết n&agrave;y, khoan h&atilde;y n&oacute;i về thiết kế m&aacute;y, ch&uacute;ng t&ocirc;i sẽ đi v&agrave;o đ&aacute;nh gi&aacute; chi tiết hiệu năng của Galaxy Note10 Lite c&ugrave;ng thời lượng sử dụng pin, 2 yếu tố quan trọng biến chiếc Note10 Lite n&agrave;y trở th&agrave;nh chiếc smartphone đ&aacute;ng mua trong ph&acirc;n kh&uacute;c cận cao cấp hiện nay.</p>

<p><strong>R&uacute;t kinh nghiệm trong qu&aacute; khứ</strong></p>

<p>Thực chất năm nay kh&ocirc;ng phải l&agrave; năm đầu ti&ecirc;n m&agrave; Samsung tung ra một phi&ecirc;n bản r&uacute;t gọn cấu h&igrave;nh của d&ograve;ng Note với mức gi&aacute; rẻ hơn. Trước đ&oacute; v&agrave;o đầu năm 2014, chỉ 4 th&aacute;ng sau khi chiếc Galaxy Note 3 ch&iacute;nh thức được Samsung cho ra mắt, nh&agrave; sản xuất n&agrave;y đ&atilde; tiếp tục tung ra một biến thể mới c&oacute; t&ecirc;n Galaxy Note 3 Neo với cấu h&igrave;nh được r&uacute;t gọn v&agrave; sở hữu mức gi&aacute; rẻ hơn nhiều lần so với phi&ecirc;n bản ti&ecirc;u chuẩn.</p>

<p><img alt="" src="https://kenh14cdn.com/2020/2/1/photo-1-15805651684411791940492.jpg" style="height:367px; width:660px" /></p>

<p>Tuy nhi&ecirc;n, tr&aacute;i ngược với Galaxy Note 3 Neo l&uacute;c bấy giờ chỉ được trang bị con chip Exynos tầm trung cho hiệu năng kh&ocirc;ng thực sự ấn tượng cho lắm, thậm ch&iacute; c&ograve;n bị nhiều người ch&ecirc; bai, th&igrave; Samsung đ&atilde; r&uacute;t kinh nghiệm với chiếc Galaxy Note10 Lite năm nay khi trang bị một con chip thuộc ph&acirc;n kh&uacute;c flagship cho phi&ecirc;n bản r&uacute;t gọn của m&igrave;nh. Đ&uacute;ng vậy, CPU được Samsung trang bị tr&ecirc;n chiếc Note10 Lite ch&iacute;nh l&agrave; con chip Exynos 9810, con chip từng xuất hiện tr&ecirc;n cả bộ đ&ocirc;i flagship Galaxy S9/S9+ v&agrave; Galaxy Note9 ra mắt v&agrave;o năm 2018.</p>

<p><strong>Cấu h&igrave;nh chi tiết Galaxy Note10 Lite:</strong></p>

<p>- M&agrave;n h&igrave;nh: 6.7 inch, Super AMOLED, Full HD+, c&oacute; v&acirc;n tay quang học</p>

<p>- CPU: Samsung Exynos 9810</p>

<p>- RAM: 8GB (bản ch&iacute;nh h&atilde;ng Việt Nam)</p>

<p>- ROM: 128GB</p>

<p>- Camera: 16MP (g&oacute;c si&ecirc;u rộng) + 12MP (g&oacute;c rộng) + 12MP (tele)</p>

<p>- Camera selfie: 32MP</p>

<p>- Pin: 4500mAh</p>

<p>Dĩ nhi&ecirc;n, ở thời điểm hiện tại, người d&ugrave;ng vẫn ho&agrave;n to&agrave;n c&oacute; được những trải nghiệm mượt m&agrave; đối khi sử dụng con chip n&agrave;y ở năm 2020 bởi con chip n&agrave;y mới chỉ gần 2 năm tuổi v&agrave; vẫn đang &quot;giữ vững phong độ&quot; của một con chip flagship.</p>

<p>Đ&oacute; l&agrave; với c&aacute;c mẫu Galaxy S v&agrave; Note của năm 2018, vậy con chip Exynos 9810 n&agrave;y sẽ thể hiện như thế n&agrave;o tr&ecirc;n một chiếc smartphone mới của năm 2020, m&agrave; cụ thể ở đ&acirc;y l&agrave; Galaxy Note10 Lite?</p>
', N'photo-1-1580565164700993246833.jpg', N'user123', CAST(N'2020-03-07' AS Date), 0, 0, 10)
SET IDENTITY_INSERT [dbo].[Reviews] OFF
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'admin')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'user')
INSERT [dbo].[Users] ([Id], [Email], [PassWord], [Photo], [RoleId]) VALUES (N'admin', N'tranlethanhthinh@gmail.com', N'admin', N'c5.jpg    ', 1)
INSERT [dbo].[Users] ([Id], [Email], [PassWord], [Photo], [RoleId]) VALUES (N'user123', N'tranlethanhthinh@gmail.com', N'123456', N'Mung-Tet-Trung-Thu-BAMBO-khuyen-mai-tang-voucher-200k.jpg', 2)
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([OrderBy])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users1] FOREIGN KEY([OrderBy])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
