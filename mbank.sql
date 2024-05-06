-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2024 at 03:49 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mbank`
--

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `ID_pembayaran` int(11) NOT NULL,
  `ID_Pengguna` int(11) DEFAULT NULL,
  `nomor_tagihan` int(11) DEFAULT NULL,
  `jumlah_pembayaran` int(11) DEFAULT NULL,
  `tanggal_pembayaran` date DEFAULT NULL,
  `status_pembayaran` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`ID_pembayaran`, `ID_Pengguna`, `nomor_tagihan`, `jumlah_pembayaran`, `tanggal_pembayaran`, `status_pembayaran`) VALUES
(18, 1, 56, 10, '2024-05-05', 'berhasil'),
(24, 2, 87, 20, '2024-05-04', 'berhasil'),
(36, 3, 52, 15, '2024-05-03', 'berhasil');

-- --------------------------------------------------------

--
-- Table structure for table `penerimaan`
--

CREATE TABLE `penerimaan` (
  `ID_penerimaan` int(11) NOT NULL,
  `ID_Pengguna` int(11) DEFAULT NULL,
  `nomor_rekening` varchar(10) DEFAULT NULL,
  `nama_penerimaan` varchar(255) DEFAULT NULL,
  `jumlah_penerimaan` int(11) DEFAULT NULL,
  `tanggal_penerimaan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penerimaan`
--

INSERT INTO `penerimaan` (`ID_penerimaan`, `ID_Pengguna`, `nomor_rekening`, `nama_penerimaan`, `jumlah_penerimaan`, `tanggal_penerimaan`) VALUES
(6, 2, '152664', 'isa', 20, '2024-05-04'),
(7, 3, '234568', 'byun', 15, '2024-05-03'),
(8, 1, '898898', 'saa', 10, '2024-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `ID_pengguna` int(11) NOT NULL,
  `nama_pengguna` varchar(255) DEFAULT NULL,
  `nomor_akun` varchar(20) DEFAULT NULL,
  `password` varchar(5) DEFAULT NULL,
  `saldo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`ID_pengguna`, `nama_pengguna`, `nomor_akun`, `password`, `saldo`) VALUES
(1, 'cha', '2345', '0987', '100'),
(2, 'jel', '3456', '0988', '50'),
(3, 'daf', '4567', '0587', '150');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `ID_transaksi` int(11) NOT NULL,
  `ID_Pengguna` int(11) DEFAULT NULL,
  `jenis_transaksi` varchar(255) DEFAULT NULL,
  `Jumlah_Transaksi` int(11) DEFAULT NULL,
  `tanggal_Transaksi` date DEFAULT NULL,
  `deskripsi_Transaksi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`ID_transaksi`, `ID_Pengguna`, `jenis_transaksi`, `Jumlah_Transaksi`, `tanggal_Transaksi`, `deskripsi_Transaksi`) VALUES
(125, 1, 'gopay', 10, '2024-05-05', 'top up gopay'),
(254, 2, 'listrik', 20, '2024-05-04', 'bayar listrik'),
(378, 3, 'pulsa', 15, '2024-05-03', 'isi pulsa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`ID_pembayaran`),
  ADD KEY `ID_Pengguna` (`ID_Pengguna`);

--
-- Indexes for table `penerimaan`
--
ALTER TABLE `penerimaan`
  ADD PRIMARY KEY (`ID_penerimaan`),
  ADD KEY `ID_Pengguna` (`ID_Pengguna`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`ID_pengguna`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID_transaksi`),
  ADD KEY `ID_Pengguna` (`ID_Pengguna`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`ID_Pengguna`) REFERENCES `pengguna` (`ID_pengguna`);

--
-- Constraints for table `penerimaan`
--
ALTER TABLE `penerimaan`
  ADD CONSTRAINT `penerimaan_ibfk_1` FOREIGN KEY (`ID_Pengguna`) REFERENCES `pengguna` (`ID_pengguna`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`ID_Pengguna`) REFERENCES `pengguna` (`ID_pengguna`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
