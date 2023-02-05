-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 05, 2016 at 04:14 
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bbpjn6_perijinan_v_aang`
--

-- --------------------------------------------------------

--
-- Table structure for table `perijin4n_menus`
--

CREATE TABLE `perijin4n_menus` (
  `ID` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `level` int(1) NOT NULL DEFAULT '5',
  `parent` int(11) NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perijin4n_menus`
--

INSERT INTO `perijin4n_menus` (`ID`, `text`, `link`, `level`, `parent`, `sort`) VALUES
(1, 'Dashboard', '#/', 5, 0, 0),
(2, 'Master Data', '', 3, 0, 0),
(3, 'Data Provinsi', '#/master_data/provinsi', 3, 2, 0),
(4, 'Data Ruas Jalan', '#/master_data/ruas_jalan', 3, 2, 0),
(5, 'Data Perijinan', '#/data_perijinan', 5, 0, 0),
(6, 'Pengguna', '#/pengguna', 3, 0, 0),
(7, 'Administrator', '#/administrator', 1, 0, 0),
(8, 'Profil', '#/profil', 5, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `perijin4n_perijinan`
--

CREATE TABLE `perijin4n_perijinan` (
  `ID` bigint(20) NOT NULL,
  `ruas_jalan` int(11) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `nomor_surat` varchar(255) NOT NULL,
  `tanggal_surat` date NOT NULL,
  `jenis_permohonan` int(11) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `telp` varchar(255) NOT NULL,
  `attachments` longtext NOT NULL,
  `creator` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `status` enum('PENDING','PROCESSING','ACCEPT','REJECT') NOT NULL DEFAULT 'PENDING',
  `accept_by` int(11) NOT NULL,
  `accpeted_time` datetime NOT NULL,
  `reject_by` int(11) NOT NULL,
  `rejected_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perijin4n_perijinan`
--

INSERT INTO `perijin4n_perijinan` (`ID`, `ruas_jalan`, `perihal`, `keterangan`, `nomor_surat`, `tanggal_surat`, `jenis_permohonan`, `contact_person`, `telp`, `attachments`, `creator`, `created_time`, `status`, `accept_by`, `accpeted_time`, `reject_by`, `rejected_time`) VALUES
(2792655928, 1, 'Akses Jalan Keluar-Masuk Pembangunan Gedung Wisma', 'Kami ingin membuat akses jalan keluar-masuk pembangunan gedung Wisma. Mohon dibantu.', '10002000', '2016-10-02', 3, 'Naura', '082268499998', 'a:9:{i:0;a:2:{s:4:"name";s:6:"bg.png";s:11:"description";s:28:"Lorem ipsum dollor sit ammet";}i:1;a:2:{s:4:"name";s:9:"bgkfc.png";s:11:"description";s:28:"Lorem ipsum dollor sit ammet";}i:2;a:2:{s:4:"name";s:15:"logonatuna2.png";s:11:"description";s:28:"Lorem ipsum dollor sit ammet";}i:3;a:2:{s:4:"name";s:16:"panic_button.png";s:11:"description";s:28:"Lorem ipsum dollor sit ammet";}i:4;a:2:{s:4:"name";s:17:"red-circle-hi.png";s:11:"description";s:28:"Lorem ipsum dollor sit ammet";}i:5;a:2:{s:4:"name";s:22:"sendi-riana-antoni.pdf";s:11:"description";s:28:"Lorem ipsum dollor sit ammet";}i:6;a:2:{s:4:"name";s:23:"1024px-KFC_logo.svg.png";s:11:"description";s:28:"Lorem ipsum dollor sit ammet";}i:7;a:2:{s:4:"name";s:25:"2016083157c6473ba9b3c.jpg";s:11:"description";s:28:"Lorem ipsum dollor sit ammet";}i:8;a:2:{s:4:"name";s:12:"bgnatuna.png";s:11:"description";s:28:"Lorem ipsum dollor sit ammet";}}', 7, '2016-10-04 20:58:57', 'PROCESSING', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(3302512451, 2, 'Test', 'Tes ya', '928282888', '2016-10-04', 5, 'Erwan Halil', '081327084383', 'a:3:{i:0;a:2:{s:4:"name";s:23:"1024px-KFC_logo.svg.png";s:11:"description";s:8:"Logo KFC";}i:1;a:2:{s:4:"name";s:25:"2016083157c6473ba9b3c.jpg";s:11:"description";s:6:"Koppas";}i:2;a:2:{s:4:"name";s:6:"bg.png";s:11:"description";s:9:"KFC Store";}}', 7, '2016-10-04 06:58:13', 'REJECT', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(9728566327, 2, 'Membuat Videotron Untuk Advertising', 'Mohon dibantu untuk membuatkan ijin pembuatan videotron ya', '6589000', '2016-10-04', 7, 'Rihana', '0219292999', 'a:3:{i:0;a:2:{s:4:"name";s:16:"panic_button.png";s:11:"description";s:12:"Panic Button";}i:1;a:2:{s:4:"name";s:17:"red-circle-hi.png";s:11:"description";s:10:"Red Button";}i:2;a:2:{s:4:"name";s:22:"sendi-riana-antoni.pdf";s:11:"description";s:13:"PDF fille aja";}}', 7, '2016-10-04 21:29:36', 'PENDING', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `perijin4n_provinsi`
--

CREATE TABLE `perijin4n_provinsi` (
  `ID` int(11) NOT NULL,
  `hash_id` varchar(32) NOT NULL,
  `nama_provinsi` text NOT NULL,
  `remark` text NOT NULL,
  `creator` int(11) NOT NULL,
  `created_time` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perijin4n_provinsi`
--

INSERT INTO `perijin4n_provinsi` (`ID`, `hash_id`, `nama_provinsi`, `remark`, `creator`, `created_time`, `status`) VALUES
(1, '57e6455f18bee', 'Banten', 'Provinsi Banten', 1, '2016-09-24 16:20:31', 0),
(2, '57e6487774411', 'Banten', 'Provinsi Banten 2', 1, '2016-09-24 16:33:43', 0),
(3, '57e6489882acb', 'Banten', 'Provinsi Banten 4', 1, '2016-09-24 16:34:16', 0),
(4, '57e649f2522a5', 'Banten', 'Provinsi Banten', 1, '2016-09-24 16:40:02', 0),
(5, '57e64a1192124', 'Banten', 'Provinsi Banten', 1, '2016-09-24 16:40:33', 1),
(6, '57e64a3bec5e7', 'Jawa Barat', 'Provinsi Jawa Barat', 1, '2016-09-24 16:41:15', 1),
(7, '57e64a4c289ff', 'DKI Jakarta', 'Provinsi Daerah Khusus Ibu Kota Jakarta', 1, '2016-09-24 16:41:32', 1);

-- --------------------------------------------------------

--
-- Table structure for table `perijin4n_ruas_jalan`
--

CREATE TABLE `perijin4n_ruas_jalan` (
  `ID` int(11) NOT NULL,
  `hash_id` varchar(32) NOT NULL,
  `id_provinsi` int(11) NOT NULL,
  `nama_ruas_jalan` text NOT NULL,
  `panjang` float NOT NULL,
  `remark` text NOT NULL,
  `creator` int(11) NOT NULL,
  `created_time` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perijin4n_ruas_jalan`
--

INSERT INTO `perijin4n_ruas_jalan` (`ID`, `hash_id`, `id_provinsi`, `nama_ruas_jalan`, `panjang`, `remark`, `creator`, `created_time`, `status`) VALUES
(1, '57e6602253a68', 7, 'Jl. Daan Mogot Jakarta', 12.5, 'Jalan Daan Mogot', 1, '2016-09-24 18:14:42', 1),
(2, '57e662d6d28af', 6, 'Jl. Bekasi Raya', 3.44, 'Bekasi raya', 1, '2016-09-24 18:26:14', 1),
(3, '57e662f32f35b', 7, 'Jl. Raya Pelabuhan', 0.35, 'Jalan raya pelabuhan', 1, '2016-09-24 18:26:43', 0);

-- --------------------------------------------------------

--
-- Table structure for table `perijin4n_tracking`
--

CREATE TABLE `perijin4n_tracking` (
  `ID` int(11) NOT NULL,
  `id_perijinan` bigint(20) NOT NULL,
  `remark` text NOT NULL,
  `creator` int(11) NOT NULL,
  `created_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perijin4n_tracking`
--

INSERT INTO `perijin4n_tracking` (`ID`, `id_perijinan`, `remark`, `creator`, `created_time`) VALUES
(1, 3789873882, 'Permohonan dibuat oleh  (langsat007@yahoo.com)', 7, '2016-10-03 00:57:44'),
(2, 5094539457, 'Permohonan dibuat oleh Erwan Halil (langsat007@yahoo.com)', 7, '2016-10-03 01:00:20'),
(3, 3302512451, 'Permohonan dibuat oleh Erwan Halil (langsat007@yahoo.com)', 7, '2016-10-04 06:58:13'),
(4, 3302512451, 'Berkas / dokumen diterima dari Ahmad Dahlan', 1, '2016-10-04 14:07:30'),
(5, 3302512451, 'Berkas / dokumen diterima dari Aang Kunaefi', 1, '2016-10-04 14:50:50'),
(24, 3302512451, 'Oke lah', 1, '2016-10-04 16:51:40'),
(25, 3302512451, 'Mantap boss', 1, '2016-10-04 16:57:30'),
(26, 3302512451, 'Update status baru', 1, '2016-10-04 19:08:11'),
(27, 3302512451, 'Update status lagi', 1, '2016-10-04 19:21:58'),
(28, 3302512451, 'Permohonan kami terima', 1, '2016-10-04 19:49:11'),
(29, 3302512451, '<span class=''text-green''><i class=''fa fa-check''></i>Permohonan diterima</span>', 1, '2016-10-04 19:49:11'),
(30, 3302512451, 'Mohon maaf di area tersebut tidak dapat dibangun media iklan karena rawan kecelakaan.', 1, '2016-10-04 20:01:37'),
(31, 3302512451, '<span class=''text-red''><i class=''fa fa-ban''></i> Permohonan ditolak</span>', 1, '2016-10-04 20:01:37'),
(32, 2792655928, 'Permohonan dibuat oleh Erwan Halil (programmermaster@yahoo.co.id)', 7, '2016-10-04 20:58:57'),
(33, 7777609343, 'Permohonan dibuat oleh Erwan Halil (programmermaster@yahoo.co.id)', 7, '2016-10-04 21:00:06'),
(34, 9728566327, 'Permohonan dibuat oleh Erwan Halil (programmermaster@yahoo.co.id)', 7, '2016-10-04 21:29:36'),
(35, 2792655928, 'Berkas / dokumen diterima dari Rojikin', 1, '2016-10-05 06:25:17'),
(36, 2792655928, 'Survey lapangan', 1, '2016-10-05 06:33:30');

-- --------------------------------------------------------

--
-- Table structure for table `perijin4n_user`
--

CREATE TABLE `perijin4n_user` (
  `ID` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tipe_organisasi` varchar(255) NOT NULL,
  `nama_organisasi` varchar(255) NOT NULL,
  `pimpinan_organisasi` varchar(255) NOT NULL,
  `alamat_organisasi` varchar(255) NOT NULL,
  `telp_organisasi` varchar(255) NOT NULL,
  `fax_organisasi` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `level` int(1) NOT NULL DEFAULT '5',
  `created_time` datetime NOT NULL,
  `pin` int(8) NOT NULL DEFAULT '0',
  `blacklist` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perijin4n_user`
--

INSERT INTO `perijin4n_user` (`ID`, `email`, `password`, `tipe_organisasi`, `nama_organisasi`, `pimpinan_organisasi`, `alamat_organisasi`, `telp_organisasi`, `fax_organisasi`, `nama_lengkap`, `jabatan`, `level`, `created_time`, `pin`, `blacklist`) VALUES
(1, 'webmaster@gmail.com', '227e731c7c1b1b7dadd2bf96808a0a10', '', '', '', '', '', '', 'Webmaster BBPJN6', '', 1, '0000-00-00 00:00:00', 0, 0),
(2, 'aang.is.kefy@gmail.com', '123456', 'KELOMPOK MASYARAKAT', 'ewtewt', 'etewt', 'twet', 'ewtwet', 'etewt', 'etwt', 'wetewt', 5, '0000-00-00 00:00:00', 0, 0),
(3, 'aang.is.kefy@gmail.com', '123456qwr', 'BADAN USAHA', 'fyeryer', 'yeryery', 'eryery', 'eryery', 'eyeryery', 'eryeryery', 'eryeryery', 5, '0000-00-00 00:00:00', 0, 0),
(4, 'aangkunaefy@hotmail.com', 'admin', 'KELOMPOK MASYARAKAT', 'ewtwetew', 'twetewtewt', 'ewtewt', 'ewtwetwe', 'twetewt', '123456', 'ewtewtew5t', 5, '0000-00-00 00:00:00', 0, 0),
(5, 'aangkunaefy@hotmail.com', 'admin', 'PERORANGAN', '', '', '', '', '', '123456', '', 5, '0000-00-00 00:00:00', 0, 0),
(6, 'aangkunaefy@hotmail.con', '227e731c7c1b1b7dadd2bf96808a0a10', 'ORGANISASI', '35325235', '325325325', '325325', '325325', '235235235', '235325325', '235235', 5, '0000-00-00 00:00:00', 15522622, 0),
(7, 'programmermaster@yahoo.com', '87a733f3ce9a729473f069e371cb81bf', 'ORGANISASI', 'LP3ES', 'Erwan Halil', 'Pejaten Jakarta', '0219475758', '0219484949', 'Erwan Halil', 'Direktur', 5, '0000-00-00 00:00:00', 0, 0),
(8, 'aang@gmail.com', '227e731c7c1b1b7dadd2bf96808a0a10', 'BADAN USAHA', 'PT. Bolak-Balik', 'Bolak Sihombing', 'Jakarta Pusat', '0219292929', '0219292928', 'Aang Kunaefi', 'IT Programmer', 5, '0000-00-00 00:00:00', 0, 0),
(14, 'programmermaster@yahoo.com', '0cc327b14f75b8e1732f879f8db66dfa', '', '', '', '', '', '', 'Aang Kunaefi', '', 3, '2016-10-05 07:49:50', 0, 0),
(15, 'nurcholis@marketproperti.id', '3011c70fae9a964d520ff37009f2f59e', '', '', '', '', '', '', 'Aang Kunaefi', '', 3, '2016-10-05 07:51:01', 0, 0),
(18, 'programmermaster@yahoo.co.id', '7ab7ef6aa028d25a6bbfe102abe616c2', '', '', '', '', '', '', 'Aang Kunaefi', '', 3, '2016-10-05 07:58:10', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `perijin4n_menus`
--
ALTER TABLE `perijin4n_menus`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `perijin4n_perijinan`
--
ALTER TABLE `perijin4n_perijinan`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `perijin4n_provinsi`
--
ALTER TABLE `perijin4n_provinsi`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `perijin4n_ruas_jalan`
--
ALTER TABLE `perijin4n_ruas_jalan`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `perijin4n_tracking`
--
ALTER TABLE `perijin4n_tracking`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `perijin4n_user`
--
ALTER TABLE `perijin4n_user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `perijin4n_menus`
--
ALTER TABLE `perijin4n_menus`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `perijin4n_provinsi`
--
ALTER TABLE `perijin4n_provinsi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `perijin4n_ruas_jalan`
--
ALTER TABLE `perijin4n_ruas_jalan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `perijin4n_tracking`
--
ALTER TABLE `perijin4n_tracking`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `perijin4n_user`
--
ALTER TABLE `perijin4n_user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
