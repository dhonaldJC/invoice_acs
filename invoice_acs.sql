-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2017 at 05:34 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoice_acs`
--

-- --------------------------------------------------------

--
-- Table structure for table `dlmbg_daftar_cetak`
--

CREATE TABLE `dlmbg_daftar_cetak` (
  `id_daftar_cetak` int(10) NOT NULL,
  `kode_pemesanan` varchar(20) NOT NULL,
  `kode_jenis_cetakan` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dlmbg_gaji_karyawan`
--

CREATE TABLE `dlmbg_gaji_karyawan` (
  `id_gaji_karyawan` int(5) NOT NULL,
  `id_karyawan` int(5) NOT NULL,
  `tanggal` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dlmbg_jenis_satuan`
--

CREATE TABLE `dlmbg_jenis_satuan` (
  `id_jenis_satuan` int(10) NOT NULL,
  `satuan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dlmbg_jenis_satuan`
--

INSERT INTO `dlmbg_jenis_satuan` (`id_jenis_satuan`, `satuan`) VALUES
(1, 'Hours'),
(2, 'Days'),
(3, 'Month'),
(4, 'Years'),
(5, '4 Hours');

-- --------------------------------------------------------

--
-- Table structure for table `dlmbg_jenis_service`
--

CREATE TABLE `dlmbg_jenis_service` (
  `kode_jenis_service` int(5) NOT NULL,
  `id_jenis_satuan` int(10) NOT NULL,
  `nama_service` varchar(100) NOT NULL,
  `harga` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dlmbg_jenis_service`
--

INSERT INTO `dlmbg_jenis_service` (`kode_jenis_service`, `id_jenis_satuan`, `nama_service`, `harga`) VALUES
(7, 1, 'Share Desk', 150000);

-- --------------------------------------------------------

--
-- Table structure for table `dlmbg_karyawan`
--

CREATE TABLE `dlmbg_karyawan` (
  `id_karyawan` int(5) NOT NULL,
  `nama_karyawan` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `gaji_pokok` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dlmbg_kwitansi`
--

CREATE TABLE `dlmbg_kwitansi` (
  `kode_kwitansi` varchar(20) NOT NULL,
  `kode_nota` varchar(20) NOT NULL,
  `tgl_bayar` int(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dlmbg_pelanggan`
--

CREATE TABLE `dlmbg_pelanggan` (
  `kode_pelanggan` int(5) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `alamat_pelanggan` text NOT NULL,
  `email` varchar(75) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dlmbg_pelanggan`
--

INSERT INTO `dlmbg_pelanggan` (`kode_pelanggan`, `nama_pelanggan`, `jenis`, `alamat_pelanggan`, `email`, `phone`) VALUES
(36, 'testing', 'Umum', 'testing', 'cs@apiary.id', '081278993552');

-- --------------------------------------------------------

--
-- Table structure for table `dlmbg_pembayaran`
--

CREATE TABLE `dlmbg_pembayaran` (
  `kode_pembayaran` varchar(30) NOT NULL,
  `kode_pemesanan` varchar(30) NOT NULL,
  `tgl_bayar` varchar(40) NOT NULL,
  `bayar` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dlmbg_pemesanan`
--

CREATE TABLE `dlmbg_pemesanan` (
  `kode_pemesanan` varchar(20) NOT NULL,
  `tgl_pesan` varchar(30) NOT NULL,
  `tgl_selesai` varchar(30) NOT NULL,
  `kode_pelanggan` int(5) NOT NULL,
  `jumlah_harga` int(20) NOT NULL,
  `uang_muka` int(20) NOT NULL,
  `status_pembayaran` varchar(50) NOT NULL DEFAULT 'Belum Lunas'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dlmbg_pemesanan_detail`
--

CREATE TABLE `dlmbg_pemesanan_detail` (
  `id_pemesanan_detail` int(10) NOT NULL,
  `kode_pemesanan` varchar(30) NOT NULL,
  `kode_jenis_cetakan` int(10) NOT NULL,
  `jumlah` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dlmbg_sessions`
--

CREATE TABLE `dlmbg_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dlmbg_sessions`
--

INSERT INTO `dlmbg_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('6b8086855ea54a9d6e395831497ab169', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 1512145836, 'a:9:{s:9:\"user_data\";s:0:\"\";s:9:\"logged_in\";s:17:\"yesGetMeLoginBaby\";s:15:\"nama_user_login\";s:5:\"Admin\";s:9:\"kode_user\";s:1:\"1\";s:8:\"username\";s:5:\"admin\";s:5:\"level\";s:5:\"admin\";s:10:\"key_search\";s:16:\"a.kode_pemesanan\";s:3:\"key\";s:0:\"\";s:14:\"kode_pelanggan\";s:2:\"36\";}');

-- --------------------------------------------------------

--
-- Table structure for table `dlmbg_setting`
--

CREATE TABLE `dlmbg_setting` (
  `id_setting` int(10) NOT NULL,
  `tipe` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content_setting` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dlmbg_setting`
--

INSERT INTO `dlmbg_setting` (`id_setting`, `tipe`, `title`, `content_setting`) VALUES
(1, 'site_title', 'Nama Situs', 'APLIKASI INVOICE'),
(2, 'site_quotes', 'Quotes Situs', 'Apiary Coworking Space'),
(3, 'site_footer', 'Teks Footer', 'APIARY COWORKING SPACE'),
(4, 'key_login', 'Hash Key MD5', 'AppInvoice'),
(5, 'site_theme', 'Theme Folder', 'flat-dot'),
(6, 'site_limit_small', 'Limit Data Small', '5'),
(7, 'site_limit_medium', 'Limit Data Medium', '10');

-- --------------------------------------------------------

--
-- Table structure for table `dlmbg_user`
--

CREATE TABLE `dlmbg_user` (
  `kode_user` int(5) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(10) NOT NULL,
  `nama_user` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dlmbg_user`
--

INSERT INTO `dlmbg_user` (`kode_user`, `username`, `password`, `level`, `nama_user`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'Admin'),
(3, 'kasir', 'c7911af3adbd12a035b289556d96470a', 'kasir', 'Kasir');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dlmbg_daftar_cetak`
--
ALTER TABLE `dlmbg_daftar_cetak`
  ADD PRIMARY KEY (`id_daftar_cetak`);

--
-- Indexes for table `dlmbg_gaji_karyawan`
--
ALTER TABLE `dlmbg_gaji_karyawan`
  ADD PRIMARY KEY (`id_gaji_karyawan`);

--
-- Indexes for table `dlmbg_jenis_satuan`
--
ALTER TABLE `dlmbg_jenis_satuan`
  ADD PRIMARY KEY (`id_jenis_satuan`);

--
-- Indexes for table `dlmbg_jenis_service`
--
ALTER TABLE `dlmbg_jenis_service`
  ADD PRIMARY KEY (`kode_jenis_service`);

--
-- Indexes for table `dlmbg_karyawan`
--
ALTER TABLE `dlmbg_karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `dlmbg_kwitansi`
--
ALTER TABLE `dlmbg_kwitansi`
  ADD PRIMARY KEY (`kode_kwitansi`);

--
-- Indexes for table `dlmbg_pelanggan`
--
ALTER TABLE `dlmbg_pelanggan`
  ADD PRIMARY KEY (`kode_pelanggan`);

--
-- Indexes for table `dlmbg_pembayaran`
--
ALTER TABLE `dlmbg_pembayaran`
  ADD PRIMARY KEY (`kode_pembayaran`);

--
-- Indexes for table `dlmbg_pemesanan`
--
ALTER TABLE `dlmbg_pemesanan`
  ADD PRIMARY KEY (`kode_pemesanan`);

--
-- Indexes for table `dlmbg_pemesanan_detail`
--
ALTER TABLE `dlmbg_pemesanan_detail`
  ADD PRIMARY KEY (`id_pemesanan_detail`);

--
-- Indexes for table `dlmbg_sessions`
--
ALTER TABLE `dlmbg_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `dlmbg_setting`
--
ALTER TABLE `dlmbg_setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indexes for table `dlmbg_user`
--
ALTER TABLE `dlmbg_user`
  ADD PRIMARY KEY (`kode_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dlmbg_daftar_cetak`
--
ALTER TABLE `dlmbg_daftar_cetak`
  MODIFY `id_daftar_cetak` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dlmbg_gaji_karyawan`
--
ALTER TABLE `dlmbg_gaji_karyawan`
  MODIFY `id_gaji_karyawan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dlmbg_jenis_satuan`
--
ALTER TABLE `dlmbg_jenis_satuan`
  MODIFY `id_jenis_satuan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dlmbg_jenis_service`
--
ALTER TABLE `dlmbg_jenis_service`
  MODIFY `kode_jenis_service` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dlmbg_karyawan`
--
ALTER TABLE `dlmbg_karyawan`
  MODIFY `id_karyawan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dlmbg_pelanggan`
--
ALTER TABLE `dlmbg_pelanggan`
  MODIFY `kode_pelanggan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `dlmbg_pemesanan_detail`
--
ALTER TABLE `dlmbg_pemesanan_detail`
  MODIFY `id_pemesanan_detail` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `dlmbg_setting`
--
ALTER TABLE `dlmbg_setting`
  MODIFY `id_setting` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dlmbg_user`
--
ALTER TABLE `dlmbg_user`
  MODIFY `kode_user` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
