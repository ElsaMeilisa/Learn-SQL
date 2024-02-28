create database Bimbingan;
use Bimbingan;

create table Perusahaan(
Kode_Perusahaan varchar(2) not null primary key,
Nama_Perusahaan varchar(45) not null,
Kontak_Perusahaan varchar(25) not null);

create table Pembimbing (
Nip_pembimbing varchar(3) primary key not null,
Nama_pembimbing varchar(30) not null,
Telp_Pembimbing varchar(20) not null
);

create table Mahasiswa(
NRP varchar(3) primary key not null,
Nama_Mahasiswa varchar(45) not null,
Gender enum('L', 'P') not null,
Kelas char not null,
Kode_Perusahaan varchar(2) not null,
Nip_Pembimbing varchar(3) not null,
constraint fk_Mahasiswa_Perusahaan
foreign key (Kode_Perusahaan) references Perusahaan(Kode_Perusahaan)
On delete cascade
on update cascade,
constraint fk_Mahasiswa_Pembimbing 
foreign key(Nip_Pembimbing) references Pembimbing(Nip_Pembimbing)
On delete cascade
on update cascade);

create table Bimbingan(
NRP varchar(3) not null,
Tanggal_bimbingan date not null,
Desk_bimbingan varchar(10),
constraint fk_Bimbingan_Mahasiswa
foreign key (NRP) references Mahasiswa(NRP)
on update cascade
on delete cascade);

insert into Perusahaan values
('P1', 'PT Indosat', 'Bu Honey'),
('P2', 'PT Telkomsel', 'Pak Har'),
('P3', 'PT XL', 'Pak Jai');

insert into Pembimbing values
('101','Bu Shofi', '812'),
('102', 'Bu Dwi', '822'),
('103', 'Pak Didin', '813');

insert into Mahasiswa values
('122', 'Bagus', 'L', 'A', 'P1', '101'),
('123', 'Ifa', 'P', 'C', 'P2', '102'),
('124', 'Hafizh', 'P', 'B', 'P1', '103'),
('125', 'Fira', 'P', 'A', 'P3', '101');

insert into Bimbingan values
('122', '2023-11-01', 'Bab 1'),
('123', '2023-11-02', 'Bab 1'),
('123', '2023-11-03', 'Bab 2'),
('124', '2023-11-01', 'Bab 3'),
('125', '2023-11-04', 'Bab 1');

select Mahasiswa.NRP, Mahasiswa.Nama_Mahasiswa, Pembimbing.Nama_Pembimbing, Pembimbing.Telp_Pembimbing, Perusahaan.Nama_Perusahaan, Bimbingan.Desk_bimbingan, Bimbingan.Tanggal_bimbingan
from Bimbingan
inner join Mahasiswa on mahasiswa.Nrp= Bimbingan.Nrp
inner join Pembimbing on Pembimbing.Nip_Pembimbing = Mahasiswa.Nip_Pembimbing
inner join Perusahaan on Perusahaan.Kode_Perusahaan = Mahasiswa.Kode_Perusahaan
order by tanggal_bimbingan;