-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2025 at 05:41 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tb_math2`
--

-- --------------------------------------------------------

--
-- Table structure for table `crawler`
--

CREATE TABLE `crawler` (
  `idcrawler` int(10) UNSIGNED ZEROFILL NOT NULL,
  `url` text NOT NULL,
  `content` text NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crawler`
--

INSERT INTO `crawler` (`idcrawler`, `url`, `content`, `lastupdate`) VALUES
(0000000001, 'https://elektro.um.ac.id/', ' Departemen Teknik Elektro dan Informatika UM - FT - UM\r\nBeranda\r\n \r\nProfile\r\n \r\nAkademik\r\n \r\nPenelitian dan Pengabdian\r\n \r\nPenjamin Mutu\r\n \r\nFasilitas\r\n \r\nSDGs\r\n \r\nInformasi\r\nSearch …\r\nVideo Player\r\nDEPARTEMEN TEKNIK ELEKTRO DAN INFORMATIKA\r\n6\r\n\r\nProgram Studi\r\n7\r\n\r\nGuru Besar\r\n52\r\n\r\nTenaga Dosen\r\n1200\r\n\r\nMahasiswa\r\n\r\nDepartemen Teknik Elektro dan Informatika\r\nSejak Semester Gasal Tahun Akademik 2006/2007, Jurusan Teknik Elektro menyelenggarakan pendidikan Strata 1 (S1) yaitu Program Studi Pendidikan Teknik Informatika bidang keahlian Teknik Informatika. Pada Semester Gasal Tahun Akademik 2009/2010, Jurusan Teknik Elektro membuka program studi baru, yaitu S1 Pendidikan Teknik Elektro bidang keahlian Teknik Listrik dan Teknik Elektronika.\r\n\r\n\r\n\r\n\r\nProgram Studi\r\n\r\nProgram Teknik Elektro dan Informatika Universitas Negeri Malang fokus pada pengembangan ilmu dan keterampilan di teknik elektro dan informatika. Mengajarkan perancangan, pengembangan, dan aplikasi teknologi seperti komunikasi, kontrol, elektronika, komputer, dan pemrograman. Mahasiswa memahami prinsip-prinsip dasar dan mengembangkan proyek inovatif sesuai kebutuhan industri dan masyarakat. Tujuannya adalah mencetak lulusan kompeten untuk berkontribusi dalam pengembangan teknologi di era digital global.\r\nSelengkapnya\r\nAkademik\r\nDepartemen Teknik Elektro dan Informatika di Universitas Negeri Malang menggabungkan ilmu teknik elektro dan informatika dalam pendekatan komprehensif. Kurikulum berfokus pada pemecahan masalah, pengembangan kreatif, dan penerapan teknologi modern. Dosen berkualitas, fasilitas laboratorium lengkap, serta program pengabdian masyarakat terintegrasi membuat departemen ini ideal bagi pendidikan teknik elektro dan informatika. Lulusan siap berkompetisi di dunia profesional yang terus berkembang.\r\nSelengkapnya\r\n\r\n\r\nPenjaminan Mutu\r\n\r\nDepartemen Teknik Elektro dan Informatika Universitas Negeri Malang berkomitmen menjaga standar mutu pendidikan melalui evaluasi berkala kurikulum, dosen berkualifikasi, dan metode pembelajaran efektif. Kolaborasi aktif dengan industri dan umpan balik dari mahasiswa, lulusan, dan pemangku kepentingan digunakan untuk meningkatkan mutu pendidikan, mencetak lulusan berkualitas dan siap menghadapi tantangan di teknik elektro dan informatika.\r\nSelengkapnya\r\n\r\nBerita Departemen Teknik Elektro dan Informatika\r\n\r\n\r\nKuliah Tamu “Integrasi Smart City dan Green Energy: Menuju Kota Masa Depan yang Berkelanjutan”\r\nKuliah Tamu “Integrasi Smart City dan Green Energy: Menuju Kota Masa Depan yang Berkelanjutan”\r\nMay 17, 2025\r\n\r\nJumat, 16 Mei 2025 - Pada hari Jumat, telah dilaksanakan kegiatan Kuliah Tamu dengan tema “Integrasi Smart City dan Green Energi: Menuju Kota Masa Depan yang Berkelanjutan” yang diselenggarakan oleh Himpunan Mahasiswa Departemen Teknik Elektro dan Informatika (HMD...\r\n\r\nMasa Depan Teknologi dan Perdagangan Dimulai di Sini: Tech and Trade Competition 2025\r\nMasa Depan Teknologi dan Perdagangan Dimulai di Sini: Tech and Trade Competition 2025\r\nMay 7, 2025\r\n\r\nMalang, 6 Mei 2025 – Himpunan Mahasiswa Departemen Teknik Elektro dan Informatika, Fakultas Teknik, Universitas Negeri Malang telah sukses menyelenggarakan Tech and Trade Competition 2025 secara daring melalui platform Zoom Meeting. Kegiatan yang mengusung tema...\r\n\r\nThe Future of Computer Vision: Kolaborasi DTEI FT UM dan UiTM Malaysia\r\nThe Future of Computer Vision: Kolaborasi DTEI FT UM dan UiTM Malaysia\r\nMay 6, 2025\r\n\r\nMalang, 05 Mei 2025 – Pada hari Senin, telah dilaksanakan kegiatan Kuliah Tamu yang diselenggarakan oleh Departemen Teknik Elektro dan Informatika (DTEI), Fakultas Teknik, Universitas Negeri Malang, bekerja sama dengan Universitas Teknologi MARA (UiTM) Malaysia....\r\n\r\nDepartemen Teknik Elektro dan Informatika UM - FT - UM 2024\r\nid id ', '2025-05-21 13:23:08'),
(0000000002, 'https://elektro.um.ac.id/visi-misi-tujuan-edit/', ' Departemen Teknik Elektro dan Informatika UM - FT - UM\r\nBeranda\r\n \r\nProfile\r\n \r\nAkademik\r\n \r\nPenelitian dan Pengabdian\r\n \r\nPenjamin Mutu\r\n \r\nFasilitas\r\n \r\nSDGs\r\n \r\nInformasi\r\nSearch …\r\n\r\n\r\nVisi\r\n\r\nMewujudkan Departemen Teknik Elektro dan Informatika sebagai departemen yang unggul dan menjadi rujukan nasional dalam pengembangan bidang pendidikan dan sains khususnya dalam bidang pendidikan teknik elektro dan informatika yang relevan dengan kebutuhan pembangunan, masyarakat dan kemanusiaan.\r\n\r\n\r\nMisi\r\n\r\n1. Menyelenggarakan pendidikan dan pembelajaran yang berkualitas tinggi untuk mengembangkan potensi dan kepribadian mahasiswa yang unggul secara nasional dan regional.\r\n\r\n2. Menyelenggarakan penelitian untuk memajukan ilmu pengetahuan dan teknologi elektro dan informatika, meningkatkan kesejahteraan masyarakat, dan mendapatkan pengakuan nasional dan internasional.\r\n\r\n3. Menyelenggarakan pengabdian kepada masyarakat sebagai pengamalan dan pembudayaan ilmu pengetahuan dan teknologi khususnya pada bidang elektro dan informatika untuk memajukan kesejahteraan masyarakat dan mencerdaskan kehidupan bangsa.\r\n\r\n4. Menyelenggarakan tata pamong departemen yang tangguh, akuntabel, dan transparan dan memperkuat kemitraan dalam rangka meningkatkan kualitas berkelanjutan.\r\n\r\nTujuan\r\n\r\n1. Menghasilkan lulusan dengan level Doktoral, Magister, Sarjana dan Diploma di bidang Teknik Elektro dan Teknik Informatika yang unggul dan berdaya saing tinggi.\r\n\r\n2. Menghasilkan karya akademik melalui kegiatan penelitian dan pengembangan ilmu dalam bidang Teknik Elektro dan Informatika.\r\n\r\n3. Mewujudkan kesejahteraan masyarakat melalui kegiatan penerapan IPTEKS dalam bidang Teknik Elektro dan Informatika.\r\n\r\n4. Meningkatkan kualitas dan kinerja departemen, melalui pelaksanaan kerja sama dengan berbagai pihak, baik di dalam maupun di luar TEUM.\r\n\r\n5. Meningkatkan peran dan citra Departemen, melalui pemberdayaan alumni yang tersebar di berbagai lapangan kerja di seluruh Indonesia.\r\n\r\n6. Mewujudkan organisasi departemen yang sehat berdasarkan prinsip otonomi, akuntabilitas, akreditasi, dan evaluasi diri secara berkesinambungan.\r\n\r\nDepartemen Teknik Elektro dan Informatika UM - FT - UM 2024\r\nid id ', '2025-05-21 13:25:16');

-- --------------------------------------------------------

--
-- Table structure for table `hyperlink`
--

CREATE TABLE `hyperlink` (
  `idhyperlink` int(10) UNSIGNED ZEROFILL NOT NULL,
  `from_node` tinyint(4) NOT NULL,
  `to_node` tinyint(4) NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hyperlink`
--

INSERT INTO `hyperlink` (`idhyperlink`, `from_node`, `to_node`, `lastupdate`) VALUES
(0000000001, 1, 2, '2025-05-21 13:27:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `crawler`
--
ALTER TABLE `crawler`
  ADD PRIMARY KEY (`idcrawler`),
  ADD UNIQUE KEY `url` (`url`) USING HASH;

--
-- Indexes for table `hyperlink`
--
ALTER TABLE `hyperlink`
  ADD PRIMARY KEY (`idhyperlink`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `crawler`
--
ALTER TABLE `crawler`
  MODIFY `idcrawler` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hyperlink`
--
ALTER TABLE `hyperlink`
  MODIFY `idhyperlink` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
