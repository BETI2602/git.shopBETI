create database ShopTrangSuc
-----------------------------

create table KhachHang(
makhachhang int identity(1,1) primary key,
email nvarchar(100) not null,
[password] nvarchar(32) not null,
hoten nvarchar(100),
gioitinh nvarchar(3),
ngaysinh date,
diachi nvarchar(500),
dienthoai nvarchar(10),
);

create table QuanLyVien(
maadmin int primary key not null,
hoten nvarchar(100) not null,
email nvarchar(100) not null,
[password] nvarchar(32) not null,
gioitinh nvarchar(3) not null,
ngaysinh date,
diachi nvarchar(500),
dienthoai nvarchar(10) not null,
);

create table SanPham(
masanpham int identity(1,1) primary key,
tensanpham nvarchar(500),
giatien money,
soluong int,
hinhanh nvarchar(500),
chatlieu nvarchar(200),
loai nvarchar(200),
);


create table GioHang(
magiohang int identity(1,1) primary key,
makhachhang int,
masanpham int,
tensanpham nvarchar(500),
giatien money,
soluong int,
hinhanh nvarchar(500),
foreign key (masanpham) references SanPham(masanpham),
foreign key (makhachhang) references KhachHang(makhachhang),
);

CREATE TABLE HoaDon (
  mahoadon INT identity(1,1) PRIMARY KEY,
  makhachhang INT,
  masanpham nvarchar(100),
  hoten NVARCHAR(500),
  tongtien money,
  ngaydamua DATE,
  FOREIGN KEY (makhachhang) REFERENCES khachhang(makhachhang),
);


INSERT INTO SanPham
VALUES (N'nhẫn hạt bự',950000,10,'/img/pro1.jpg',N'bạc',N'nhẫn');

INSERT INTO SanPham
VALUES (N'vòng vàng',1000000,10,'/img/pro2.png',N'vàng',N'vòng' );

INSERT INTO SanPham
VALUES (N'nhẫn tình nhân',365000,10,'/img/pro3.jpg',N'bạc',N'nhẫn đôi' );


INSERT INTO SanPham
VALUES (N'nhẫn cặp',200000,10,'/img/pro4.jpg',N'bạc',N'nhẫn đôi' );

INSERT INTO SanPham
VALUES (N'khuyên tai',250000,10,'/img/pro5.jpg','titan',N'bông tai' );

INSERT INTO SanPham
VALUES (N'nhẫn hột vàng',250000,10,'/img/pro6.jpg',N'bạc',N'nhẫn' );

INSERT INTO SanPham
VALUES (N'bông tai ngôi sao',250000,10,'/img/pro7.jpg','titan',N'bông tai' );

INSERT INTO SanPham
VALUES (N'dây chuyền tròn',500000,10,'/img/pro8.jpg','titan',N'dây chuyền' );

INSERT INTO SanPham
VALUES (N'dây chuyền vàng',5600000,10,'/img/pro9.jpg',N'vàng',N'dây chuyền' );

INSERT INTO SanPham
VALUES (N'dây vàng cặp',5000000,10,'/img/pro10.jpg',N'vàng',N'dây chuyền' );

INSERT INTO SanPham
VALUES (N'nhẫn bạc',1600000,10,'/img/pro11.jpg',N'bạc',N'nhẫn');

INSERT INTO SanPham
VALUES (N'vòng tay chuỗi',1000000,10,'/img/pro12.png',N'vàng',N'vòng');

INSERT INTO SanPham
VALUES (N'dây vàng mặt ong',5000000,10,'/img/pro13.jpg',N'vàng',N'dây chuyền' );

INSERT INTO SanPham
VALUES (N'vòng love forever',500000,10,'/img/pro14.png',N'bạc',N'vòng' );

INSERT INTO SanPham
VALUES (N'nhẫn vương miệng',6000000,10,'/img/pro15.jpg',N'kim cương',N'nhẫn' );

INSERT INTO SanPham
VALUES (N'đeo bông hoa',5000000,10,'/img/pro16.jpg',N'kim cương',N'bông tai' );

INSERT INTO SanPham
VALUES (N'đeo bông nhỏ',4500000,10,'/img/pro17.jpg',N'kim cương',N'bông tai' );

INSERT INTO SanPham
VALUES (N'vòng tay đơn',6000000,10,'/img/pro18.jpg',N'kim cương, bạc',N'vòng' );

INSERT INTO SanPham
VALUES (N'dây chuyền ong',6000000,10,'/img/pro19.jpg',N'vàng',N'dây chuyền' );

INSERT INTO SanPham
VALUES (N'dây chuyền xích',3000000,10,'/img/pro20.jpg',N'vàng',N'dây chuyền' );

