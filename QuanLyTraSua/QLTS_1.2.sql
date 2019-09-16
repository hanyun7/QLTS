﻿DROP DATABASE IF EXISTS QLTS;
create database QLTS;
use QLTS;
 

CREATE TABLE ROLE(
	ID SMALLINT PRIMARY KEY NOT NULL IDENTITY(1,1),
    ROLE NVARCHAR(20) NOT NULL);
    
CREATE TABLE TAIKHOAN(
	USERNAME VARCHAR(20) PRIMARY KEY NOT NULL,
    PASSWORD VARCHAR(20) NOT NULL,
	ACTIVE BIT NOT NULL DEFAULT 1)

CREATE TABLE LOAIMATHANG(
	MSLMH INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	TENLMH NVARCHAR(100) NOT NULL,
	ACTIVE BIT NOT NULL DEFAULT 1)

CREATE TABLE MATHANG(
	MSMH INT NOT NULL IDENTITY(1,1),
	TENMH NVARCHAR(100) NOT NULL,
    SIZE CHAR(2) ,
    GIABAN INT NOT NULL,
    MSLMH INT NOT NULL,
	ACTIVE BIT NOT NULL DEFAULT 1,
    PRIMARY KEY (MSMH))
    
CREATE TABLE CALAMVIEC(
	MSCLV VARCHAR(15) PRIMARY KEY NOT NULL CHECK (MSCLV like '[C][1-3]' or MSCLV like 'FULLTIME'),
	TUGIO TIME NOT NULL,
	DENGIO TIME NOT NULL)
    
CREATE TABLE NHANVIEN(
	MSNV INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    USERNAME VARCHAR(20),
    TENNV NVARCHAR(100) NOT NULL,
    GIOITINH NVARCHAR(3) NOT NULL CHECK (GIOITINH = 'Nam' or  GIOITINH = N'Nữ'),
	NGAYSINH DATE NOT NULL, -- yyyy/mm/dd
    CMND NVARCHAR(12) UNIQUE NOT NULL CHECK (CMND like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
											or CMND like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
											or CMND like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
											or CMND like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    DIACHI NVARCHAR(100) NOT NULL,
    SDT CHAR(50) NOT NULL CHECK (SDT like '+84[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' or 
								SDT like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' or
								SDT like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' or
								SDT like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' or
								SDT like '+84[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    EMAIL NVARCHAR(50),
    NGAYVAOLAM DATE NOT NULL,
    CHUCVU NVARCHAR(100) NOT NULL,
    MSCLV VARCHAR(15) NOT NULL,
    TIENLUONG INT,
	ACTIVE BIT NOT NULL DEFAULT 1,
    ROLE SMALLINT NOT NULL)



--DELETE FROM CHITIETHOADON;
--DELETE FROM HOADON;
--DELETE FROM KHACHHANG;
--DROP TABLE IF EXISTS CHITIETHOADON;
--DROP TABLE IF EXISTS HOADON;
--DROP TABLE IF EXISTS KHACHHANG;

CREATE TABLE KHACHHANG(
	SDT VARCHAR(50) PRIMARY KEY NOT NULL CHECK (SDT like '+84[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' or 
												SDT like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' or
												SDT like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' or
												SDT like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' or
												SDT like '+84[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	TENKH NVARCHAR(100) NOT NULL,
	DIEMTT INT NOT NULL DEFAULT 0,
    DIACHI NVARCHAR(100),
	EMAIL NVARCHAR(50),
	ACTIVE BIT DEFAULT 1)
    
CREATE TABLE HOADON(
	MSHD INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	TONGTIEN INT NOT NULL,
    NGAYXUAT DATE NOT NULL,
    MSNV INT NOT NULL,
    SDT VARCHAR(50) DEFAULT '+841213335049',
	GIAMGIA VARCHAR(10) DEFAULT '0',
	NOTE nvarchar(100), 
	ACTIVE BIT NOT NULL DEFAULT 1)  

CREATE TABLE CHITIETHOADON(
	MSHD INT NOT NULL,
    MSMH INT NOT NULL,
    SOLUONG INT NOT NULL,
    DONGIA INT NOT NULL,    
    PRIMARY KEY (MSHD,MSMH))
      
-- NHAP KHO

CREATE TABLE KHO(
	MSKHO INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    TENKHO NVARCHAR(50) NOT NULL,
	ACTIVE BIT NOT NULL DEFAULT 1)

CREATE TABLE NHACUNGCAP(
	MSNCC INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    TENNCC NVARCHAR(100) NOT NULL,
    DIACHI NVARCHAR(100) NOT NULL,
    SDT CHAR(50) NOT NULL CHECK (SDT like '+84[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    EMAIL NVARCHAR(50) NOT NULL,
	ACTIVE BIT NOT NULL DEFAULT 1)
    
CREATE TABLE NGUYENLIEU(
	MSNL INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    TENNL NVARCHAR(100) NOT NULL,
    DVT NVARCHAR(20) NOT NULL,
    GIABAN INT NOT NULL,
    MSNCC INT NOT NULL,
	ACTIVE BIT NOT NULL DEFAULT 1)
    
CREATE TABLE PHIEUNHAP(
	MSPN INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    MSNV INT NOT NULL, -- nhan vien nhap hang
    TONGTIEN INT NOT NULL,
    NGAYNHAP DATETIME NOT NULL,
    TRANGTHAI NVARCHAR(50) NOT NULL,
    NOTE NVARCHAR(200))
    
CREATE TABLE CHITIETPHIEUNHAP(
	MSPN INT NOT NULL,
    MSNL INT NOT NULL,
    SOLUONG INT NOT NULL,
    DONGIA INT NOT NULL,
    MSKHO INT NOT NULL,
    PRIMARY KEY (MSPN,MSNL))
    
    -- cuoi ngay se nhap phieu xuat de tong ket
    
CREATE TABLE PHIEUXUAT(
	MSPX INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    MSNV INT NOT NULL, -- nhan vien xuat hang
    NGAYXUAT DATETIME NOT NULL,
    NOTE NVARCHAR(200))
    
CREATE TABLE CHITIETPHIEUXUAT(
	MSPX INT NOT NULL,
    MSNL INT NOT NULL,
    SOLUONG INT NOT NULL,
    MSKHO INT NOT NULL,
    PRIMARY KEY (MSPX,MSNL))
    
	
CREATE TABLE SUKIEN(
	MASK INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	TENSK NVARCHAR(100) NOT NULL,
	NDSUKIEN NVARCHAR(2000) NOT NULL,
	DIEMTT INT NOT NULL DEFAULT 0,
	GIAMGIA VARCHAR(10) NOT NULL DEFAULT '0',
	ACTIVE BIT NOT NULL DEFAULT 1,
	MLSK INT NOT NULL
)

-- drop table loaisukien;
-- drop table sukien;

CREATE TABLE LOAISUKIEN(
	MLSK INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	TENLSK NVARCHAR(100) NOT NULL,
	ACTIVE BIT NOT NULL DEFAULT 1
)

CREATE TABLE HOADONSUKIEN(
	MSHD INT NOT NULL,
	MASK INT NOT NULL
	PRIMARY KEY(MSHD,MASK),
	GIAMGIA VARCHAR(10) NOT NULL DEFAULT '0',
	MLSK INT NOT NULL
)

CREATE TABLE CHECKINGIOLAMVIEC( 	
	MSNV INT NOT NULL,
	NGAYCHECKIN DATE NOT NULL,
	THOIGIANVAOCA DATETIME NOT NULL,
	THOIGIANKETTHUCCA DATETIME NOT NULL,
	TRANGTHAI INT NOT NULL,
	TRE BIT NOT NULL,
	SOM BIT NOT NULL,
	PRIMARY KEY(NGAYCHECKIN,MSNV)
)

-- THEM KHOA NGOAI

ALTER TABLE MATHANG ADD CONSTRAINT PK_MATHANG_LOAIMATHANG FOREIGN KEY (MSLMH) REFERENCES LOAIMATHANG(MSLMH)
ALTER TABLE NHANVIEN ADD CONSTRAINT PK_NHANVIEN_CALAMVIEC FOREIGN KEY (MSCLV) REFERENCES CALAMVIEC(MSCLV)
ALTER TABLE NHANVIEN ADD CONSTRAINT PK_NHANVIEN_TAIKHOAN FOREIGN KEY (USERNAME) REFERENCES TAIKHOAN(USERNAME)
ALTER TABLE NHANVIEN ADD CONSTRAINT PK_NHANVIEN_ROLE FOREIGN KEY (ROLE) REFERENCES ROLE(ID)
ALTER TABLE HOADON ADD CONSTRAINT PK_HOADON_NHANVIEN FOREIGN KEY (MSNV) REFERENCES NHANVIEN(MSNV)  
ALTER TABLE HOADON ADD CONSTRAINT PK_HOADON_KHACHHANG FOREIGN KEY (SDT) REFERENCES KHACHHANG(SDT) 
ALTER TABLE CHITIETHOADON ADD CONSTRAINT PK_CHITIETHOADON_HOADON FOREIGN KEY (MSHD) REFERENCES HOADON(MSHD)  
ALTER TABLE NGUYENLIEU ADD CONSTRAINT PK_NGUYENLIEU_NHACUNGCAP FOREIGN KEY (MSNCC) REFERENCES NHACUNGCAP(MSNCC)
ALTER TABLE PHIEUNHAP ADD CONSTRAINT PK_PHIEUNHAP_NHANVIEN FOREIGN KEY (MSNV) REFERENCES NHANVIEN(MSNV)
ALTER TABLE CHITIETPHIEUNHAP ADD CONSTRAINT PK_CHITIETPHIEUNHAP_PHIEUNHAP FOREIGN KEY (MSPN) REFERENCES PHIEUNHAP(MSPN)
ALTER TABLE CHITIETPHIEUNHAP ADD CONSTRAINT PK_CHITIETPHIEUNHAP_NGUYENLIEU FOREIGN KEY (MSNL) REFERENCES NGUYENLIEU(MSNL)
ALTER TABLE CHITIETPHIEUNHAP ADD CONSTRAINT PK_CHITIETPHIEUNHAP_KHO FOREIGN KEY (MSKHO) REFERENCES KHO(MSKHO)
ALTER TABLE PHIEUXUAT ADD CONSTRAINT PK_PHIEUXUAT_NHANVIEN FOREIGN KEY (MSNV) REFERENCES NHANVIEN(MSNV)
ALTER TABLE CHITIETPHIEUXUAT ADD CONSTRAINT PK_CHITIETPHIEUXUAT_PHIEUXUAT FOREIGN KEY (MSPX) REFERENCES PHIEUXUAT(MSPX)
ALTER TABLE CHITIETPHIEUXUAT ADD CONSTRAINT PK_CHITIETPHIEUXUAT_NGUYENLIEU FOREIGN KEY (MSNL) REFERENCES NGUYENLIEU(MSNL)
ALTER TABLE CHITIETPHIEUXUAT ADD CONSTRAINT PK_CHITIETPHIEUXUAT_KHO FOREIGN KEY (MSKHO) REFERENCES KHO(MSKHO)
ALTER TABLE SUKIEN ADD CONSTRAINT PK_SUKIEN_LOAISUKIEN FOREIGN KEY (MLSK) REFERENCES LOAISUKIEN(MLSK)
ALTER TABLE HOADONSUKIEN ADD CONSTRAINT PK_SUKIEN_HOADONSUKIEN FOREIGN KEY (MASK) REFERENCES SUKIEN(MASK)
ALTER TABLE HOADONSUKIEN ADD CONSTRAINT PK_HOADON_HOADONSUKIEN FOREIGN KEY (MSHD) REFERENCES HOADON(MSHD)
ALTER TABLE CHECKINGIOLAMVIEC ADD CONSTRAINT PK_NHANVIEN_CHECKINGIOLAMVIEC FOREIGN KEY (MSNV) REFERENCES NHANVIEN(MSNV)


-- NHAP DU LIEU

INSERT INTO LOAISUKIEN(TENLSK) VALUES 
	(N'Tăng Điểm Thân Thiết'),
	(N'Giảm Giá Theo Tiền'),
	(N'Giảm Giá Theo %');

INSERT INTO SUKIEN(TENSK,NDSUKIEN,DIEMTT,GIAMGIA,MLSK) VALUES 
	(N'Ngày Quốc Tế Phụ Nữ 8/3',N'Chúc mừng ngày QTPN',0,'10',3),
	(N'Ngày Giải Phóng 30/4',N'Chúc mừng ngày 30/4 mọi hoá đơn trên 500.000 vnd sẽ được giảm 20.000 vnd',0,'20000',2),
	(N'Tạo tài khoản giảm giá',N'Giảm giá khi tạo tài khoản',0,'10',3),
	(N'Tặng Điểm Thân Thiết, Ai Ai Cũng Biết',N'Được tặng điểm thân thiết khi tạo tài khoản',200,'0',1);

INSERT INTO ROLE(ROLE) VALUES 
	('admin'),
	('user');
    
INSERT INTO TAIKHOAN(USERNAME,PASSWORD) VALUES
	('admin','MTIz'),
	('nv1','MTIz'),
    ('nv2','MTIz'),
    ('nv3','MTIz'),
    ('nv4','MTIz'),
    ('nv5','MTIz'),
    ('nv6','MTIz'),
    ('nv7','MTIz'),
    ('nv8','MTIz'),
    ('nv9','MTIz'),
    ('nv10','MTIz'),
    ('nv11','MTIz'),
    ('nv12','MTIz'),
    ('nv13','MTIz'),
    ('nv14','MTIz'),
	('nv15','MTIz'),
	('nv16','MTIz'),
	('nv17','MTIz');

INSERT INTO LOAIMATHANG(TENLMH) VALUES 
	('Flavored Tea'),
	('Milk Tea'),
    ('Chewy Tea'),
    ('Signature Macchiato'),
    ('Tea Latte'),
    ('Topping');

INSERT INTO MATHANG(TENMH,SIZE,GIABAN,MSLMH) VALUES 
	('Assam Black Tea','S',29000,1),
    ('Assam Black Tea','M',41000,1),
    ('Jasmine Green Tea','S',29000,1),
    ('Jasmine Green Tea','M',41000,1),
    ('Lemon Green Tea','S',37000,1),
    ('Lemon Green Tea','M',52000,1),
    ('Honey Green Tea','S',37000,1),
    ('Honey Green Tea','M',52000,1),
    ('Mango Green Tea','S',37000,1),
    ('Mango Green Tea','M',52000,1),
    ('Peach Green Tea','S',37000,1),
    ('Peach Green Tea','M',52000,1),
    ('Passion Fruit Green Tea','S',37000,1),
    ('Passion Fruit Green Tea','M',52000,1),
    
	('Milk Tea','S',37000,2),
    ('Milk Tea','M',52000,2),
    ('Green Milk Tea','S',37000,2),
    ('Green Milk Tea','M',52000,2),
    ('Honey Green Milk Tea','S',40000,2),
    ('Honey Green Milk Tea','M',56000,2),
    ('Hazelnut Milk Tea','S',40000,2),
    ('Hazelnut Milk Tea','M',56000,2),
    ('Caramel Milk Tea','S',40000,2),
    ('Caramel Milk Tea','M',56000,2),
    ('Chocolate Milk Tea','S',40000,2),
    ('Chocolate Milk Tea','M',56000,2),
    ('Ovaltine','S',40000,2),
    ('Ovaltine','M',56000,2),
    
    ('Bubble Black Tea','S',34000,3),
    ('Bubble Black Tea','M',48000,3),
    ('Bubble Green Tea','S',34000,3),
    ('Bubble Green Tea','M',48000,3),
    ('Golden Bubble Milk Tea','S',42000,3),
    ('Golden Bubble Milk Tea','M',59000,3),
    ('Grass Jelly Milk Tea','S',45000,3),
    ('Grass Jelly Milk Tea','M',63000,3),
    ('Passion Fruit Aloe Vera','S',45000,3),
    ('Passion Fruit Aloe Vera','M',63000,3),
    ('Konjac Jelly Milk Tea','S',48000,3),
    ('Konjac Jelly Milk Tea','M',68000,3),
    
    ('Black Tea Macchiato','S',39000,4),
    ('Black Tea Macchiato','M',55000,4),
    ('Green Tea Macchiato','S',39000,4),
    ('Green Tea Macchiato','M',55000,4),
    ('Passion Fruit Macchiato','S',48000,4),
    ('Passion Fruit Macchiato','M',66000,4),
    ('Mango Macchiato','S',48000,4),
    ('Mango Macchiato','M',66000,4),
    ('Peach Macchiato','S',48000,4),
    ('Peach Macchiato','M',66000,4),
    ('Ovaltine Macchiato','S',50000,4),
    ('Ovaltine Macchiato','M',70000,4),
    ('Matcha Macchiato','S',50000,4),
    ('Matcha Macchiato','M',70000,4),
    
    ('Black Tea Latte','S',42000,5),
    ('Black Tea Latte','M',59000,5),
    ('Green Tea Latte','S',42000,5),
    ('Green Tea Latte','M',59000,5),
    ('Ovaltine Latte','S',48000,5),
    ('Ovaltine Latte','M',66000,5),
    ('Matcha Latte','S',48000,5),
    ('Matcha Latte','M',66000,5),
    
    ('Golden Bubble','',6000,6),
    ('Aloe Vera','',6000,6),
    ('Grass Jelly','',3000,6),
    ('Konjac Jelly','',5000,6);
    
INSERT INTO CALAMVIEC VALUES 
	('C1','07:00','12:00'),
	('C2','12:00','17:00'),
	('C3','17:00','22:00'),
    ('FULLTIME','07:00','22:30');

INSERT INTO NHANVIEN(USERNAME,TENNV,GIOITINH,NGAYSINH,CMND,DIACHI,SDT,EMAIL,NGAYVAOLAM,CHUCVU,MSCLV,TIENLUONG,ROLE) VALUES  
	('nv1',N'Trương Thị Bích Phương',N'Nữ','1997/04/10','454325675','TPHCM','+84385465768','ttbphuong@gmail.com','2017/12/30',N'Pha Chế','FULLTIME',8000000,'2'),
    ('nv2',N'Nguyễn Quốc Bảo',N'Nam','1998/12/30','435345366','TPHCM','+84381029443','nqbao@gmail.com','2018/10/30',N'Pha Chế','C1',2500000,'2'),
    ('nv3',N'Lê Thị Bảo Ngân',N'Nữ','1997/04/23','576674273','HN','+84346568766','ltbngan@gmail.com','2018/04/01',N'Pha Chế','C2',2500000,'2'),
    ('nv4',N'Trần Yến Nhi',N'Nữ','1997/07/01','456576997','HN','+84374667635','tynhi@gmail.com','2017/04/01',N'Pha Chế','C3',2500000,'2'),    
    ('nv5',N'Đinh Thị Anh Thư',N'Nữ','1998/09/01','945832049','HN','+84465445787','dtathu@gmail.com','2017/04/01',N'Phục Vụ','C1',3000000,'2'),
    ('nv6',N'Hoàng Thùy Dương',N'Nữ','1999/08/04','897545865','HN','+84383452241','htduong@gmail.com','2017/11/25',N'Phục Vụ','C1',3000000,'2'),
    ('nv7',N'Hoàng Trọng Bảo Khánh ',N'Nam','1999/04/15','251174953','TPHCM','+84385830495','htbkhanh@gmail.com','2018/12/30',N'Phục Vụ','C2',3000000,'2'),
    ('nv8',N'Trần Thanh Vũ',N'Nam','1998/07/23','235566768','TPHCM','+84384354576','ttvu@gmail.com','2018/12/30',N'Phục Vụ','C2',3000000,'2'),
    ('nv9',N'Trần Phương Thanh',N'Nữ','1997/01/15','356547787','HN','+84386735794','tpthanh@gmail.com','2018/12/30',N'Phục Vụ','C3',3000000,'2'),
    ('nv10',N'Nguyễn Ngọc Ánh',N'Nữ','1997/01/01','454393295','TPHCM','+84347255449','nnanh@gmail.com','2018/12/30',N'Phục Vụ','C3',3000000,'2'),
    ('nv11',N'Trần Huy Hiếu',N'Nam','1997/10/17','876364513','TPHCM','+84386592045','thhieu@gmail.com','2018/10/30',N'Phục Vụ','FULLTIME',7000000,'2'),
    ('nv12',N'Nguyễn Minh Khánh ',N'Nam','1999/10/14','537537668','TPHCM','+84383454657','nmkhanh@gmail.com','2018/10/30',N'Thu Ngân','C1',2000000,'2'),
    ('nv13',N'Vũ Thị Phương Uyên',N'Nữ','1998/12/11','353645754','HN','+84385765809','vtpuyen@gmail.com','2018/10/30',N'Thu Ngân','C2',2000000,'2'),
    ('nv14',N'Nguyễn Minh Hoàng',N'Nam','1997/08/12','466583457','HN','+84383522357','nmhoang@gmail.com','2017/11/25',N'Thu Ngân','C3',2000000,'2'),
    ('nv15',N'Nguyễn Gia Hân ',N'Nữ','1996/09/12','234244698','HN','+84380919949','nghan@gmail.com','2017/11/25',N'Quản Lý','FULLTIME',9000000,'1'),
	('nv16',N'Nguyễn Phú Quý ',N'Nam','1996/09/12','372891092','TPHCM','+84380932949','nghia982@gmail.com','2018/11/25',N'Nhân Viên Kho','FULLTIME',9000000,'1'),
	('nv17',N'Nguyễn Gia Huy ',N'Nữ','1996/09/12','328182736','HN','+84213249949','nghan123@gmail.com','2019/2/3',N'Nhân Viên Kho','FULLTIME',9000000,'1'),
	('admin',N'Nguyễn Gia Huy ',N'Nữ','1996/09/12','079097010010','HN','01234567891','nghan123@gmail.com','2019/2/3',N'Quản Lý','FULLTIME',9000000,'1');

INSERT INTO KHACHHANG(TENKH,DIACHI,SDT,EMAIL) VALUES
	(N'Trần Long',N'421 Hàn Thuyên, Phường Bến Nghé, Quận 1, TPHCM','+841213335049','long@gmail.com'),
	(N'Trần Duy',N'421 Hàn Thuyên, Phường Bến Nghé, Quận 1, TPHCM','01213335049','long12@gmail.com'),
	 (N'admin',N'421 Hàn Thuyên, Phường Bến Nghé, Quận 1, TPHCM','01234567891','admin@gmail.com'),
	(N'Nguyễn Minh Hạnh',N'31 Hàn Thuyên, Phường Bến Nghé, Quận 1, TPHCM','+84121333524','nmhanh@gmail.com'),
	(N'Lê Thị Thành',N'50 Đường số 8A, Khu đô thị An Phú An Khánh, Phường An Phú, Quận 2, TPHCM','+84384729759','ltthanh@gmail.com');
	 
INSERT INTO HOADON(TONGTIEN,NGAYXUAT,MSNV) VALUES
	(94000,'2019/01/02',12),
    (66000,'2019/01/02',13),
    (80000,'2019/01/02',14),
    (37000,'2019/02/02',12),
    (66000,'2019/02/02',13);
    
INSERT INTO CHITIETHOADON(MSHD,MSMH,SOLUONG,DONGIA) VALUES
	(1,8,1,52000),
    (1,55,1,42000),
    (2,46,1,66000),
    (3,23,2,80000),
    (4,17,1,37000),
    (5,50,1,66000);
     
INSERT INTO KHO(TENKHO) VALUES
	('A'),
    ('B'),
    ('C');

INSERT INTO NHACUNGCAP(TENNCC,DIACHI,SDT,EMAIL) VALUES
	(N'Công Ty TNHH Happy Life Tea Việt Nam',N'279/27 Huỳnh Văn Bánh, Phường 11, Quận Phú Nhuận, TPHCM','+84981808083','happylifeteavn@gmail.com'),
    (N'Công Ty TNHH Dotea',N'Lầu 1, Số 158/14 Trần Huy Liệu, Phường 15, Quận Phú Nhuận, TPHCM','+84873037368','dotea@gmail.com'),
    (N'Công Ty Cổ Phần ONEFOOD Việt Nam',N'Số 34, Lô BT2A, Làng Việt Kiều Châu Âu, Phường Mộ Lao, Quận Hà Đông, Hà Nội','+84885883666','onefoodvn@gmail.com');
    
INSERT INTO NGUYENLIEU(TENNL,DVT,GIABAN,MSNCC) VALUES
	(N'Nguyên diệp hồng trà',N'Gói',169000,2),
    (N'Đài thanh lục trà',N'Gói',154800,2),
    (N'Bột Trà Rang Houjicha',N'Gói',135000,1),
    (N'Bột Matcha Latte Grade',N'Gói',155000,1),
    (N'Đường đen Hàn Quốc',N'Gói',80000,3),
    (N'Sữa tươi nguyên kem Frischli',N'Hộp',31100,3),
    (N'Bột Cacao Onecocoa',N'Gói',80000,3),
    (N'Sữa Bột Ovaltine',N'Hộp',94200,3),
    (N'Thạch nha đam Sunfarm',N'Gói',40000,3),
    (N'Đào tươi Dole',N'Hộp',75000,3),
    (N'Konjac Jelly',N'Gói',68100,3),
    (N'Trân Châu Caramel Wings',N'Gói',138400,3);
    
INSERT INTO PHIEUNHAP(MSNV,TONGTIEN,NGAYNHAP,TRANGTHAI,NOTE) VALUES
    (15,55326900,'2019/02/01 08:03:26',N'Đã nhập hàng',''),
    (15,34795100,'2019/02/02 08:07:56',N'Đã nhập hàng','');
    
INSERT INTO CHITIETPHIEUNHAP(MSPN,MSNL,SOLUONG,DONGIA,MSKHO) VALUES
    (1,1,50,8450000,1),
    (1,2,49,7585200,1),
    (1,3,48,6480000,1),
    (1,4,47,7285000,1),
    (1,5,46,3680000,2),
    (1,6,45,1399500,3),
    (1,7,44,3520000,2),
    (1,8,43,4050600,2),
    (1,9,42,1680000,3),
    (1,10,41,3075000,3),
    (1,11,40,2724000,3),
	(1,12,39,5397600,3),
    (2,1,38,6422000,1),
    (2,2,37,5727600,1),
    (2,3,36,4860000,1),
    (2,4,35,5425000,1),
    (2,6,34,1057400,3),
    (2,7,33,2640000,2),
    (2,10,32,2400000,3),
    (2,11,31,2111100,3),
    (2,12,30,4152000,3);
    
 INSERT INTO PHIEUXUAT(MSNV,NGAYXUAT,NOTE) VALUES
	(15,'2019/03/01 22:17:14',''),
    (15,'2019/04/01 22:23:46',''),
    (15,'2019/05/01 22:21:39','');
    
 INSERT INTO CHITIETPHIEUXUAT(MSPX,MSNL,SOLUONG,MSKHO ) VALUES
	(1,1,3,1),
    (1,6,8,3),
    (1,10,12,3),
    (1,12,4,3),
    (2,4,9,3),
    (2,3,2,1),
    (2,5,3,2),
    (2,7,5,2),
    (2,8,2,2),
    (2,9,8,3),
    (2,11,6,3),
    (3,2,11,1),
    (3,4,9,1),
    (3,10,4,3);
    

	select * from TaiKhoan where username = 'admin' and password = '123456'