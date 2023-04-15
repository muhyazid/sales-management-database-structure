-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2023 at 12:13 AM
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
-- Database: `db_manajemen_sales`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `ID_absensi` int(10) NOT NULL,
  `ID_sales` int(10) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `tgl_keluar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `ID_barang` int(10) NOT NULL,
  `jenis_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(15) NOT NULL,
  `harga` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID_pelangan` int(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `nama_pelanggan` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `alamat` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gaji`
--

CREATE TABLE `gaji` (
  `ID_gaji` int(20) NOT NULL,
  `ID_sales` int(10) NOT NULL,
  `ID_pelatihan` int(10) NOT NULL,
  `nama_sales` varchar(20) NOT NULL,
  `produk_terjual` int(10) NOT NULL,
  `gaji_pokok` int(20) NOT NULL,
  `potongan_gaji` int(20) NOT NULL,
  `total_gaji` int(20) NOT NULL,
  `bonus` int(20) NOT NULL,
  `tgl_penggajian` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kinerja_sales`
--

CREATE TABLE `kinerja_sales` (
  `ID_kinerja` int(10) NOT NULL,
  `ID_sales` int(10) NOT NULL,
  `nama_sales` int(20) NOT NULL,
  `ID_absensi` int(10) NOT NULL,
  `ID_transaksi` int(10) NOT NULL,
  `ID_pengajuan` int(10) NOT NULL,
  `ID_pelatihan` int(10) NOT NULL,
  `ID_tunjangan` int(10) NOT NULL,
  `ID_gaji` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelatihan`
--

CREATE TABLE `pelatihan` (
  `ID_pelatihan` int(10) NOT NULL,
  `ID_pendidikan` int(10) NOT NULL,
  `nama_pelatihan` varchar(20) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `waktu_pelatihan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pendidikan`
--

CREATE TABLE `pendidikan` (
  `ID_pendidikan` int(10) NOT NULL,
  `ID_sales` int(10) NOT NULL,
  `pendidikan_terakhir` varchar(10) NOT NULL,
  `minat_pendidikan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_ijin`
--

CREATE TABLE `pengajuan_ijin` (
  `ID_pengajuan` int(10) NOT NULL,
  `ID_sales` int(10) NOT NULL,
  `jenis_ijin` varchar(10) NOT NULL,
  `alasan_pengajuan` varchar(20) NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `status_persetujuan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `ID_sales` int(10) NOT NULL,
  `nama_sales` varchar(20) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  `alamat` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `ID_transaksi` int(15) NOT NULL,
  `ID_barang` int(15) NOT NULL,
  `nama_barang` varchar(15) NOT NULL,
  `ID_sales` int(15) NOT NULL,
  `ID_pelanggan` int(15) NOT NULL,
  `ID_tujuan` int(11) NOT NULL,
  `jumlah_pesanan` int(10) NOT NULL,
  `tgl_transaksi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tujuan_lokasi`
--

CREATE TABLE `tujuan_lokasi` (
  `ID_tujuan` int(10) NOT NULL,
  `ID_transaksi` int(10) NOT NULL,
  `nama_barang` varchar(15) NOT NULL,
  `nama_pelanggan` varchar(20) NOT NULL,
  `alamat_tujuan` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tunjangan`
--

CREATE TABLE `tunjangan` (
  `ID_tunjangan` int(10) NOT NULL,
  `ID_sales` int(10) NOT NULL,
  `nama_sales` varchar(20) NOT NULL,
  `tunjangan_kesehatan` int(20) NOT NULL,
  `tunjangan_transportasi` int(20) NOT NULL,
  `tunjangan_makan` int(20) NOT NULL,
  `total_tunjangan` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`ID_absensi`),
  ADD KEY `ID_sales` (`ID_sales`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`ID_barang`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID_pelangan`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`ID_gaji`),
  ADD KEY `ID_pelatihan` (`ID_pelatihan`),
  ADD KEY `ID_sales` (`ID_sales`);

--
-- Indexes for table `kinerja_sales`
--
ALTER TABLE `kinerja_sales`
  ADD PRIMARY KEY (`ID_kinerja`),
  ADD KEY `ID_sales` (`ID_sales`),
  ADD KEY `ID_absensi` (`ID_absensi`),
  ADD KEY `ID_transaksi` (`ID_transaksi`),
  ADD KEY `ID_pengajuan` (`ID_pengajuan`),
  ADD KEY `ID_pelatihan` (`ID_pelatihan`),
  ADD KEY `ID_tunjangan` (`ID_tunjangan`),
  ADD KEY `ID_gaji` (`ID_gaji`);

--
-- Indexes for table `pelatihan`
--
ALTER TABLE `pelatihan`
  ADD PRIMARY KEY (`ID_pelatihan`),
  ADD KEY `ID_pendidikan` (`ID_pendidikan`);

--
-- Indexes for table `pendidikan`
--
ALTER TABLE `pendidikan`
  ADD PRIMARY KEY (`ID_pendidikan`),
  ADD KEY `ID_sales` (`ID_sales`);

--
-- Indexes for table `pengajuan_ijin`
--
ALTER TABLE `pengajuan_ijin`
  ADD PRIMARY KEY (`ID_pengajuan`),
  ADD KEY `ID_sales` (`ID_sales`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`ID_sales`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID_transaksi`),
  ADD KEY `ID_barang` (`ID_barang`),
  ADD KEY `ID_sales` (`ID_sales`),
  ADD KEY `ID_pelanggan` (`ID_pelanggan`),
  ADD KEY `ID_tujuan` (`ID_tujuan`);

--
-- Indexes for table `tujuan_lokasi`
--
ALTER TABLE `tujuan_lokasi`
  ADD PRIMARY KEY (`ID_tujuan`),
  ADD KEY `ID_transaksi` (`ID_transaksi`);

--
-- Indexes for table `tunjangan`
--
ALTER TABLE `tunjangan`
  ADD PRIMARY KEY (`ID_tunjangan`),
  ADD KEY `ID_sales` (`ID_sales`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `absensi_ibfk_1` FOREIGN KEY (`ID_sales`) REFERENCES `sales` (`ID_sales`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`username`) REFERENCES `pengguna` (`username`);

--
-- Constraints for table `gaji`
--
ALTER TABLE `gaji`
  ADD CONSTRAINT `gaji_ibfk_1` FOREIGN KEY (`ID_sales`) REFERENCES `sales` (`ID_sales`),
  ADD CONSTRAINT `gaji_ibfk_2` FOREIGN KEY (`ID_pelatihan`) REFERENCES `pelatihan` (`ID_pelatihan`);

--
-- Constraints for table `kinerja_sales`
--
ALTER TABLE `kinerja_sales`
  ADD CONSTRAINT `kinerja_sales_ibfk_1` FOREIGN KEY (`ID_sales`) REFERENCES `sales` (`ID_sales`),
  ADD CONSTRAINT `kinerja_sales_ibfk_2` FOREIGN KEY (`ID_absensi`) REFERENCES `absensi` (`ID_absensi`),
  ADD CONSTRAINT `kinerja_sales_ibfk_3` FOREIGN KEY (`ID_transaksi`) REFERENCES `transaksi` (`ID_transaksi`),
  ADD CONSTRAINT `kinerja_sales_ibfk_4` FOREIGN KEY (`ID_pengajuan`) REFERENCES `pengajuan_ijin` (`ID_pengajuan`),
  ADD CONSTRAINT `kinerja_sales_ibfk_5` FOREIGN KEY (`ID_pelatihan`) REFERENCES `pelatihan` (`ID_pelatihan`),
  ADD CONSTRAINT `kinerja_sales_ibfk_6` FOREIGN KEY (`ID_tunjangan`) REFERENCES `tunjangan` (`ID_tunjangan`),
  ADD CONSTRAINT `kinerja_sales_ibfk_7` FOREIGN KEY (`ID_gaji`) REFERENCES `gaji` (`ID_gaji`);

--
-- Constraints for table `pelatihan`
--
ALTER TABLE `pelatihan`
  ADD CONSTRAINT `pelatihan_ibfk_1` FOREIGN KEY (`ID_pendidikan`) REFERENCES `pendidikan` (`ID_pendidikan`);

--
-- Constraints for table `pendidikan`
--
ALTER TABLE `pendidikan`
  ADD CONSTRAINT `pendidikan_ibfk_1` FOREIGN KEY (`ID_sales`) REFERENCES `sales` (`ID_sales`);

--
-- Constraints for table `pengajuan_ijin`
--
ALTER TABLE `pengajuan_ijin`
  ADD CONSTRAINT `pengajuan_ijin_ibfk_1` FOREIGN KEY (`ID_sales`) REFERENCES `sales` (`ID_sales`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`username`) REFERENCES `pengguna` (`username`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`ID_barang`) REFERENCES `barang` (`ID_barang`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`ID_sales`) REFERENCES `sales` (`ID_sales`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`ID_pelanggan`) REFERENCES `customer` (`ID_pelangan`),
  ADD CONSTRAINT `transaksi_ibfk_4` FOREIGN KEY (`ID_tujuan`) REFERENCES `tujuan_lokasi` (`ID_tujuan`);

--
-- Constraints for table `tujuan_lokasi`
--
ALTER TABLE `tujuan_lokasi`
  ADD CONSTRAINT `tujuan_lokasi_ibfk_1` FOREIGN KEY (`ID_transaksi`) REFERENCES `transaksi` (`ID_transaksi`);

--
-- Constraints for table `tunjangan`
--
ALTER TABLE `tunjangan`
  ADD CONSTRAINT `tunjangan_ibfk_1` FOREIGN KEY (`ID_sales`) REFERENCES `sales` (`ID_sales`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
