CREATE DATABASE QLDT_TTTN
GO
-----------------------------------------------------
-----------------------------------------------------
---------------------------------------------
USE QLDT_TTTN
------------------------------------------
CREATE TABLE DANHMUCDT(
	dm_MADT	char(4) not null,	
	dm_TENDT	nvarchar(100),
	dm_NGAY    nvarchar(20),
	k_MAKHOA	char(4) not null,	
	sv_MASV	char(4) not null,	--Khóa ngoại
	constraint pk_DANHMUCDT primary key(dm_MADT)
)
GO
-------------------------------------
CREATE TABLE KHOAHOC(
	kh_MAKH	char(4) not null,	
	kh_TENKH	nvarchar(40),
	constraint pk_KHAOHOC primary key(kh_MAKH)
)
GO
-------------------------------------
CREATE TABLE KHOA(
	k_MAKHOA	char(4) not null,	
	k_TENKHOA	nvarchar(40),
	constraint pk_KHOA primary key(k_MAKHOA)
)
GO
------------------------------------
CREATE TABLE SINHVIEN(
	sv_MASV	char(4) not null,	
	sv_TENSV	nvarchar(40),
	sv_GT nvarchar(40),
	sv_NGSINH  nvarchar (40),
	sv_lop nvarchar(40),
	kh_MAKH char(4) not null,   --Khóa ngoại
	constraint pk_SINHVIEN primary key(sv_MASV)
)
GO
---------------------------------------------
CREATE TABLE GIAOVIEN(
	gv_MAGV	char(4) not null,	
	gv_TENGV	nvarchar(40),
	gv_GTGV nvarchar(40),
	gv_NGSINHGV nvarchar(40),
	dm_MADT	char(4) not null,	  --Khóa ngoại
	constraint pk_GIAOVIEN primary key(gv_MAGV)
)
GO
---------------------------------------------
---------------------------------------------
--Khóa ngoại cho bảng danh mục đề tài
ALTER TABLE DANHMUCDT ADD CONSTRAINT pk01_DANHMUCDT FOREIGN KEY(sv_MASV) REFERENCES SINHVIEN(sv_MASV)
ALTER TABLE DANHMUCDT ADD CONSTRAINT pk02_DANHMUCDT FOREIGN KEY(k_MAKHOA) REFERENCES KHOA(k_MAKHOA)
---------------------------------------------
--Khóa ngoại cho bảng sinh viên
ALTER TABLE SINHVIEN ADD CONSTRAINT pk01_SINHVIEN FOREIGN KEY(kh_MAKH) REFERENCES KHOAHOC(kh_MAKH)
--Khóa ngoại cho bảng giáo viên
ALTER TABLE GIAOVIEN ADD CONSTRAINT pk01_GIAOVIEN FOREIGN KEY(dm_MADT) REFERENCES DANHMUCDT(dm_MADT)
-----------------------
set dateformat dmy
-------------------------------
-- DANHMUCDT
------------đề tài thực tập tốt nghiệp công nghệ thông tin
insert into DANHMUCDT values('DT01',N'Các biện pháp nâng cao hiệu quả sử dụng vốn kinh doanh tại Công ty Cơ khí Đông Anh','20/01/2023','KA01','SV01')
insert into danhmucdt values('DT02',N'Ứng dụng mô phỏng cách hoạt động của một trong các thuật toán (Dijkstra, Sắp xếp, mã hóa)','20/01/2023','KA01','SV02')
insert into danhmucdt values('DT03',N'Máy tính có giao diện trên Java','20/01/2023','KA01','SV03')
insert into danhmucdt values('DT04',N'Ứng dụng thuật toán tô màu đồ thị làm ứng dụng (website) sắp lịch học','20/01/2023','KA01','SV04')
insert into danhmucdt values('DT05',N'Xây dựn website quản lý nhân sự','20/01/2023','KA01','SV05')
insert into danhmucdt values('DT06',N'Xây dựn ứng dụng (website) tư vấn tổ chức tiệc cưới','20/01/2023','KA01','SV06')
------------đề tài thực tập tốt nghiệp Ngân hàng
insert into danhmucdt values('DT07',N'Giải pháp tăng cường huy động vốn tại chi nhánh Ngân hàng A','20/01/2023','KA05','SV07')
insert into danhmucdt values('DT08',N'Giải pháp đẩy mạnh hoạt động cho vay tiêu dùng tại Ngân hàng A','20/01/2023','KA05','SV08')
insert into danhmucdt values('DT09',N'Giải pháp nâng cao hiệu quả tín dụng trung – dài hạn tại ngân hàng A','20/01/2023','KA05','SV09')
------------đề tài thực tập tốt nghiệp Luật
insert into danhmucdt values('DT10',N'Bảo hiểm hàng hóa xuất nhập khẩu: Kiến nghị từ những tranh chấp thực tiễn','20/01/2023','KA10','SV10')
insert into danhmucdt values('DT11',N'Hoạt động factoring ở Việt nam','20/01/2023','KA10','SV11')
insert into danhmucdt values('DT12',N'Hoạt động môi giới thuê tàu -thực trạng và những giải pháp phát triển','20/01/2023','KA10','SV12')
insert into danhmucdt values('DT13',N'Phương hướng và các biện pháp phi thuế quan để bảo hộ sản xuất trong nước trong quá trình hội nhập kinh tế quốc tế','20/01/2023','KA10','SV14')
insert into danhmucdt values('DT14',N'Việt nam và APEC: Giải pháp để hội nhập hiệu quả','20/01/2023','KA10','SV13')

--KHOAHOC
insert into khoahoc values('KH01',N'10')
insert into khoahoc values('KH02',N'11')
insert into khoahoc values('KH03',N'12')
insert into khoahoc values('KH04',N'13')
-------------------------------
--KHOA
insert into khoa values('KA01',N'Công nghệ thông tin')
insert into khoa values('KA02',N'Quản trị kinh doanh')
insert into khoa values('KA03',N'Kinh tế')
insert into khoa values('KA04',N'Dược')
insert into khoa values('KA05',N'Luật')
insert into khoa values('KA06',N'Thiết kế đồ họa')
insert into khoa values('KA07',N'Dịch vụ du lịch và lữ hành')
insert into khoa values('KA08',N'Ngôn ngữ học')
insert into khoa values('KA09',N'Kiến trúc')
insert into khoa values('KA10',N'Ngân hàng')
-------------------------------
--SINHVIEN
insert into sinhvien values('SV01',N'Vũ Văn Linh',N'Nam','16/11/2003',1,'KH01')
insert into sinhvien values('SV02',N'Hoàng Mai Trang',N'Nữ','21/03/2003 ',2,'KH03')
insert into sinhvien values('SV03',N'Hoàng Mai Hiền Linh',N'Nữ','02/08/2003 ',3,'KH04')
insert into sinhvien values('SV04',N'Phan Thị Minh Châu',N'Nữ','05/11/2002 ',4,'KH03')
insert into sinhvien values('SV05',N'Đặng Quốc Công',N'Nam','21/05/2003',4,'KH02')
insert into sinhvien values('SV06',N'Võ Thanh Danh',N'Nam','07/08/2003',4,'KH04')
insert into sinhvien values('SV07',N'Trần Thị Đằng Giang',N'Nữ','14/05/2003',3,'KH01')
insert into sinhvien values('SV08',N'Nguyễn Thị Kim	Hai',N'Nữ','13/02/2003',2,'KH01')
insert into sinhvien values('SV09',N'Trần Thị Hằng',N'Nữ','09/10/2003',1,'KH04')
insert into sinhvien values('SV10',N'Nguyễn Thị Diệu Hiền',N'Nữ','14/11/2003',2,'KH02')
insert into sinhvien values('SV11',N'Đặng Đình Khương',N'Nam','17/10/2003',2,'KH02')
insert into sinhvien values('SV12',N'Võ Văn Phụng',N'Nam','04/01/2003',1,'KH04')
insert into sinhvien values('SV13',N'Huỳnh Văn Tiền',N'Nam','14/02/2003',2,'KH04')
insert into sinhvien values('SV14',N'Dương Minh Tuấn',N'Nam','25/03/2003',3,'KH03')
-------------------------------
-- GIAOVIEN
insert into giaovien values('GV01',N'Huỳnh Lê Quốc An',N'Nam','14/02/1981','DT02')
insert into giaovien values('GV02',N'Lương Thị Lan Anh',N'Nữ','14/02/1990','DT03')
insert into giaovien values('GV03',N'Nguyễn Hoàng Quí Châu',N'Nữ','16/08/1980','DT07')
insert into giaovien values('GV04',N'Nguyễn Lương Nhật Hà',N'Nữ','16/05/1978','DT06')
insert into giaovien values('GV05',N'Nguyễn Thị Thanh Phượng',N'Nữ','05/11/1992','DT04')
insert into giaovien values('GV06',N'Võ Thị Thu Quyên',N'Nữ','08/11/1991','DT04')
insert into giaovien values('GV07',N'Nguyễn Diễm Bảo Thy',N'Nữ','17/03/1996','DT01')
insert into giaovien values('GV08',N'Phạm Thị Thanh Trúc',N'Nữ','02/10/1973','DT01')
insert into giaovien values('GV09',N'Võ Quốc Việt',N'Nam','03/09/1984','DT07')
insert into giaovien values('GV10',N'Nguyễn Anh Thư',N'nữ','12/12/1983','DT08')
insert into giaovien values('GV11',N'Nguyễn Thị Thương',N'Nữ','15/12/1993','DT07')
insert into giaovien values('GV12',N'Trần Thị Thùy Dương',N'Nữ','25/02/1994','DT08')
insert into giaovien values('GV13',N'Huỳnh Trần Mai Thảo',N'Nữ','26/12/1998','DT04')
--có thể 2 giáo viên ở các khoa khác nhau cùng quản lý 1 đề tài 
-------------------------------
---------------------------------------------
select dm_MADT,dm_TENDT,dm_NGAY from danhmucdt;
select * from khoahoc;
select * from khoa;
select sv_MASV,sv_TENSV,sv_GT,sv_NGSINH,sv_lop from sinhvien;
select gv_MAGV,gv_TENGV,gv_GTGV,gv_NGSINHGV from giaovien;

select KHOA.k_Tenkhoa,SINHVIEN.sv_Masv,sv_Tensv,sv_Ngsinh,sv_Gt,DANHMUCDT.dm_Tendt from KHOA,SINHVIEN,DANHMUCDT 
WHERE DANHMUCDT.k_MAKHOA = KHOA.k_MAKHOA  and SINHVIEN.sv_MASV = DANHMUCDT.sv_MASV

--select SINHVIEN.sv_MASV,sv_TENSV,sv_GT,sv_lop,DANHMUCDT.dm_TENDT,dm_NGAY from inner Join SINHVIEN. DANHMUCDT where SINHVIEN.sv_MASV = DANHMUCDT.sv_MASV

--UPDATE danhmucdt SET DM_Madt = 2, DM_Tendt = 'dmm', DM_Ngay = 'abc' WHERE dm_MADT = 1
--DELETE khoahoc WHERE KH_Makh = 1	
--select * from KHOA.k_Tenkhoa,KHOAHOC.kh_Tenkh,SINHVIEN.sv_Masv,sv_Tensv,sv_Ngsinh,sv_Gt,DANHMUCDT.dm_Tendt;


-- Xuất thông tin GV và Khoa mà GV đó giảng dạy, đề tài mà gv đó quản lý

SELECT GV.gv_MAGV,GV.gv_TENGV,K.k_TENKHOA,dt.dm_TENDT
FROM dbo.danhmucdt AS dt
     JOIN dbo.GIAOVIEN AS GV ON GV.dm_MADT = dt.dm_MADT
     JOIN dbo.KHOA AS K ON K.k_MAKHOA = dt.k_MAKHOA

	 SELECT GV.gv_MAGV,GV.gv_TENGV,K.k_TENKHOA,dt.dm_TENDT FROM dbo.danhmucdt AS dt JOIN dbo.GIAOVIEN AS GV ON GV.dm_MADT = dt.dm_MADT JOIN dbo.KHOA AS K ON K.k_MAKHOA = dt.k_MAKHOA

--SELECT GV.MAGV,GV.HOTEN,K.TENKHOA
--FROM dbo.BOMON AS BM
--     JOIN dbo.GIAOVIEN AS GV ON GV.MABM = BM.MABM
--     JOIN dbo.KHOA AS K ON K.MAKHOA = BM.MAKHOA
