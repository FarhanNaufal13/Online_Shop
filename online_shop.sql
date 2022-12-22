-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Des 2022 pada 11.48
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_shop`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(120) NOT NULL,
  `keterangan` varchar(225) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(1, 'Kaos Bibir', 'T-shirt oversize white', 'tshirt', 150000, 9, 'White_T-Shirt_Mockup.jpg'),
(2, 'Sweater Smile', 'Swater smile rebel edition', 'jacket', 300000, 12, 'sweater-putih.jpg'),
(3, 'Hat White', 'Hat white series limit edition', 'accessories', 75000, 12, 'topi-putih.jpg'),
(4, 'Jeans Washed', 'Jeans washed limitid edition', 'bottom', 250000, 5, 'jeans.jpg'),
(9, 'Mantel Lucu Jga', 'Mantel Lucu BGT', 'jacket', 200000, 15, '4ff1c590f70cf7c4e80d8f1694a52f31.jpg'),
(11, 'Kaos Hitam ', 'Kaos hitam keren', 'tshirt', 100000, 12, 'images.jpg'),
(12, 'Kaos University', 'Kaos University Mantep', 'tshirt', 90000, 12, 'infinide-4453-4477763-1.jpg'),
(13, 'Kaos Putih Polos', 'Kaos Putih Polos Lembut', 'tshirt', 70000, 13, '69406f43d6c698ff8d7870fd882c165e.jpg'),
(14, 'Topi Racing', 'Topi Racing Keren', 'accessories', 90000, 10, 'rhodey-topi-baseball-snapback-motors-racing-team-nm261-red-6.jpg'),
(15, 'Jacket Varsity', 'Jacket Varsity B&W', 'jacket', 200000, 15, '63462fb07fc79fac3ca12c58e550907c.jpg'),
(16, 'Celana Pendek', 'Celana Pendek Coklat', 'bottom', 80000, 12, '238bdeeca146502dbfcbcc5ea68a2ce7.jpg'),
(17, 'Kalung Titanium', 'Kalung titanium pria', 'accessories', 50000, 8, 'KALUNG_TITANIUM_PRIA.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_invoice`
--

CREATE TABLE `tb_invoice` (
  `id` int(11) NOT NULL,
  `nama` varchar(56) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_invoice`
--

INSERT INTO `tb_invoice` (`id`, `nama`, `alamat`, `tgl_pesan`, `batas_bayar`) VALUES
(4, 'FARHAN NAUFAL', 'Sentra Summarecon Bekasi, Jl. Boulevard Ahmad Yani, Marga Mulya, Kec. Bekasi Utara, Kota Bks, Jawa Barat 17142', '2022-12-20 17:39:04', '2022-12-21 17:39:04'),
(5, 'Sarah', 'Cipanas Jawa Barat', '2022-12-20 17:40:52', '2022-12-21 17:40:52'),
(6, 'Rey', 'Kp. Cimahi', '2022-12-20 21:01:57', '2022-12-21 21:01:57'),
(7, 'Anggi', 'Kp. Cimahi Utara', '2022-12-20 21:03:16', '2022-12-21 21:03:16'),
(8, 'SILMI KAFFA', 'Kp. Cijoho Koramil', '2022-12-21 19:58:14', '2022-12-22 19:58:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`, `pilihan`) VALUES
(6, 4, 1, 'Kaos', 1, 150000, ''),
(7, 4, 4, 'Jeans Washed', 1, 250000, ''),
(8, 5, 8, 'Hoodie Mantel', 1, 200000, ''),
(9, 5, 3, 'Hat White', 2, 75000, ''),
(10, 5, 2, 'Sweater Smile', 1, 300000, ''),
(11, 6, 1, 'Kaos Bibir', 1, 150000, ''),
(12, 7, 3, 'Hat White', 2, 75000, ''),
(13, 8, 3, 'Hat White', 1, 75000, '');

--
-- Trigger `tb_pesanan`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `tb_pesanan` FOR EACH ROW BEGIN
	UPDATE tb_barang SET stok = stok-NEW.jumlah
    WHERE id_brg = NEW.id_brg;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `role_id`) VALUES
(1, 'admin', 'admin', '123', 1),
(2, 'user', 'user', '123', 2),
(3, 'FARHAN NAUFAL', 'farhan', '123', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indeks untuk tabel `tb_invoice`
--
ALTER TABLE `tb_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `tb_invoice`
--
ALTER TABLE `tb_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
