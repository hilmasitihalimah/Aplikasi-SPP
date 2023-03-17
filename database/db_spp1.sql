-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2023 at 03:26 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_spp1`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `cekLoginPetugas` (IN `uname` VARCHAR(100), IN `pass` VARCHAR(100))   BEGIN
	SELECT * FROM petugas WHERE username = uname AND PASSWORD = pass;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cekLoginSiswa` (IN `nis_` VARCHAR(100), IN `pass` VARCHAR(100))   BEGIN
SELECT * FROM siswa WHERE nis = nis_ AND PASSWORD = pass;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `levelPetugas` (IN `uname` VARCHAR(100), IN `pass` VARCHAR(100))   BEGIN
SELECT * FROM petugas WHERE username = uname AND PASSWORD = pass;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tampilData` (IN `tabel` VARCHAR(50), IN `kolom` VARCHAR(50))   BEGIN 
DECLARE tab varchar(50);
SET tab = tabel;
SELECT * FROM tab ORDER BY kolom desc;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` enum('10 RPL 1','10 RPL 2','10 RPL 3','10 TKJ 1','10 TKJ 2','10 TKJ 3','10 BDP 1','10 BDP 2','10 BDP 3','10 OTKP 1','10 OTKP 2','10 OTKP 3','10 AKL 1','10 AKL 2','10 AKL 3','10 AKL 4','10 UPW 1','10 UPW 2','11 RPL 1','11 RPL 2','11 RPL 3','11 TKJ 1','11 TKJ 2','11 TKJ 3','11 BDP 1','11 BDP 2','11 BDP 3','11 OTKP 1','11 OTKP 2','11 OTKP 3','11 AKL 1','11 AKL 2','11 AKL 3','11 AKL 4','11 UPW 1','11 UPW 2','12 RPL 1','12 RPL 2','12 RPL 3','12 TKJ 1','12 TKJ 2','12 TKJ 3','12 BDP 1','12 BDP 2','12 BDP 3','12 OTKP 1','12 OTKP 2','12 OTKP 3','12 AKL 1','12 AKL 2','12 AKL 3','12 AKL 4','12 UPW 1','12 UPW 2') NOT NULL,
  `kompetensi_keahlian` enum('Rekayasa Perangkat Lunak','Teknik Komputer dan Jaringan','Otomatisasi Tata Kelola Perkantoran','Akutansi Keuangan Lembaga','Bisnis Daring Pemasaran','Usaha Perjalanan Wisata') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `kompetensi_keahlian`) VALUES
(1, '10 RPL 2', 'Rekayasa Perangkat Lunak'),
(2, '11 OTKP 3', 'Otomatisasi Tata Kelola Perkantoran'),
(3, '12 TKJ 2', 'Teknik Komputer dan Jaringan');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `nisn` char(10) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `bulan_dibayar` enum('January','Febuari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember') NOT NULL,
  `tahun_dibayar` year(4) NOT NULL,
  `id_spp` int(11) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_petugas`, `nisn`, `tgl_bayar`, `bulan_dibayar`, `tahun_dibayar`, `id_spp`, `jumlah_bayar`) VALUES
(1, 1, '001', '2023-02-01', 'Maret', 2022, 1, 7000000),
(2, 2, '002', '2023-02-09', 'Mei', 2023, 2, 200000),
(3, 1, '006', '2023-03-01', 'Febuari', 2021, 1, 600000);

--
-- Triggers `pembayaran`
--
DELIMITER $$
CREATE TRIGGER `update_total_spp` AFTER INSERT ON `pembayaran` FOR EACH ROW BEGIN
	UPDATE spp SET nominal = nominal + NEW.jumlah_bayar WHERE 		id_spp = NEW.id_spp;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nama_petugas` varchar(35) NOT NULL,
  `level` enum('admin','petugas','siswa') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `username`, `password`, `nama_petugas`, `level`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 'Dela Maelani', 'admin'),
(2, 'diki', 'bcbe3365e6ac95ea2c0343a2395834dd', 'Diki Patria', 'petugas'),
(3, 'syaidatul', '310dcbbf4cce62f762a2aaa148d556bd', 'Syaidatul Musa\'idah', 'siswa');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nisn` char(10) NOT NULL,
  `nis` char(8) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `id_spp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nisn`, `nis`, `nama`, `id_kelas`, `password`, `alamat`, `no_telp`, `id_spp`) VALUES
('001', '234', 'Romi', 1, '202cb962ac59075b964b07152d234b70', 'Kuningan', '08776546785', 1),
('002', '192001', 'Febi Vitaloka', 1, '202cb962ac59075b964b07152d234b70', 'Kuningan', '0888657768', 1),
('003', '12343', 'Nancy', 1, '202cb962ac59075b964b07152d234b70', 'Nancy Nurul Apni', '089765434', 1),
('004', '23451678', 'Agiesta', 2, 'b706835de79a2b4e80506f582af3676a', 'Cirebon', '087657432123', 2),
('005', '3214321', 'Fira Oktavia', 2, '202cb962ac59075b964b07152d234b70', 'Kuningan', '0877546765', 2),
('006', '12345', 'Agiesta ', 1, '202cb962ac59075b964b07152d234b70', 'Cirebon', '0854325678', 2);

-- --------------------------------------------------------

--
-- Table structure for table `spp`
--

CREATE TABLE `spp` (
  `id_spp` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `nominal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `spp`
--

INSERT INTO `spp` (`id_spp`, `tahun`, `nominal`) VALUES
(1, 2022, 1300000),
(2, 2023, 3000000),
(3, 2000, 550000),
(4, 2001, 6500000),
(5, 2018, 450000000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `nisn` (`nisn`),
  ADD KEY `id_spp` (`id_spp`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nisn`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_spp` (`id_spp`);

--
-- Indexes for table `spp`
--
ALTER TABLE `spp`
  ADD PRIMARY KEY (`id_spp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `spp`
--
ALTER TABLE `spp`
  MODIFY `id_spp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembayaran_ibfk_3` FOREIGN KEY (`id_spp`) REFERENCES `spp` (`id_spp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembayaran_ibfk_4` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `siswa_ibfk_2` FOREIGN KEY (`id_spp`) REFERENCES `spp` (`id_spp`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
