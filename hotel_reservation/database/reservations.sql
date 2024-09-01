-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Sep 2024 pada 18.24
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_reservation`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `reservations`
--

CREATE TABLE `reservations` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `id_number` varchar(16) NOT NULL,
  `room_type` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `breakfast` tinyint(1) NOT NULL,
  `total_payment` int(11) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `reservations`
--

INSERT INTO `reservations` (`id`, `name`, `gender`, `id_number`, `room_type`, `price`, `duration`, `booking_date`, `breakfast`, `total_payment`, `reg_date`) VALUES
(1, 'farhan', 'male', '1910204788333333', 'standard', 500000, 3, '2025-02-07', 1, 1740000, '2024-09-01 10:53:01'),
(2, 'farhan', 'male', '1910204788333333', 'standard', 500000, 5, '2024-02-07', 1, 2650000, '2024-09-01 11:04:16'),
(3, 'budi', 'male', '2333309939444333', 'deluxe', 750000, 3, '2025-02-07', 1, 2490000, '2024-09-01 15:01:04'),
(4, 'budi', 'male', '1910204788333333', 'standard', 500000, 3, '2024-02-07', 1, 1740000, '2024-09-01 15:14:13'),
(5, 'budi', 'male', '1910204788333333', 'standard', 500000, 3, '2024-02-07', 1, 1740000, '2024-09-01 15:18:04'),
(6, 'budi', 'male', '1910204788333333', 'standard', 500000, 3, '2024-02-07', 1, 1740000, '2024-09-01 15:18:12'),
(7, 'budi', 'male', '1910204788333333', 'standard', 500000, 3, '2024-02-07', 1, 1740000, '2024-09-01 15:18:45'),
(8, 'budi', 'male', '1910204788333333', 'standard', 500000, 3, '2024-02-07', 1, 1740000, '2024-09-01 15:23:41'),
(9, 'budi', 'male', '1910204788333333', 'standard', 500000, 3, '2024-02-07', 1, 1740000, '2024-09-01 15:25:10'),
(10, 'budi', 'male', '1910204788333333', 'standard', 500000, 3, '2024-02-07', 1, 1740000, '2024-09-01 15:35:27'),
(11, 'budi', 'male', '1910204788333333', 'standard', 500000, 3, '2024-02-07', 1, 1740000, '2024-09-01 15:43:02'),
(12, 'budi', 'male', '2333309939444333', 'family', 1000000, 5, '2025-02-03', 1, 4900000, '2024-09-01 16:19:45');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
