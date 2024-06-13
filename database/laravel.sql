-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Jun 2024 pada 11.06
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absensi`
--

CREATE TABLE `absensi` (
  `id` char(36) NOT NULL,
  `mahasiswa_id` char(36) NOT NULL,
  `keterangan` enum('hadir','tidak hadir','izin') NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `status` enum('datang','pulang','lainnya') DEFAULT NULL,
  `deskripsi_keterangan` varchar(255) NOT NULL,
  `bukti` varchar(255) DEFAULT NULL,
  `waktu` varchar(255) DEFAULT NULL,
  `filter` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `absensi`
--

INSERT INTO `absensi` (`id`, `mahasiswa_id`, `keterangan`, `deskripsi`, `status`, `deskripsi_keterangan`, `bukti`, `waktu`, `filter`, `created_at`, `updated_at`) VALUES
('9c2f1e15-66d8-4e56-bb34-e09129134bd5', '9c2f196e-9ad9-4e4b-9681-4496f16249eb', 'hadir', 'tes', 'datang', 'pulang cepat', NULL, 'Minggu, 02 Juni 2024 | 00:10:20', '06', '2024-06-01 17:10:21', '2024-06-01 17:10:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `departements`
--

CREATE TABLE `departements` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `departement` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `departements`
--

INSERT INTO `departements` (`id`, `user_id`, `departement`, `lokasi`, `created_at`, `updated_at`) VALUES
('77b4bff9-2037-11ef-aaa4-089798ebee9e', '9c2f1546-47de-400b-9853-1a2fd7044a1f', 'Kewirausahaan', 'Karawang', '2024-06-01 16:53:00', '2024-06-01 16:53:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `prodi` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`id`, `user_id`, `prodi`, `created_at`, `updated_at`) VALUES
('eb58ec41-2037-11ef-aaa4-089798ebee9e', '9c2f1544-9697-4a36-80a8-d1bc262cec5d', 'Teknik Informatika', '2024-06-01 16:56:23', '2024-06-01 16:56:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `evaluasi_empat_bulan`
--

CREATE TABLE `evaluasi_empat_bulan` (
  `id` char(36) NOT NULL,
  `absensi_id` char(36) NOT NULL,
  `departement_id` char(36) NOT NULL,
  `performa` varchar(255) NOT NULL,
  `actual_point` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `range` varchar(255) NOT NULL,
  `strong_point` varchar(255) NOT NULL,
  `weakness_point` varchar(255) NOT NULL,
  `development_skill` varchar(255) NOT NULL,
  `development_knowledge` varchar(255) NOT NULL,
  `catatan` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `logbook`
--

CREATE TABLE `logbook` (
  `id` char(36) NOT NULL,
  `mahasiswa_id` char(36) NOT NULL,
  `week` varchar(255) NOT NULL,
  `mounth` varchar(255) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `keterangan` text NOT NULL,
  `tool_used` varchar(255) DEFAULT NULL,
  `safety_key_point` varchar(255) DEFAULT NULL,
  `problem_solf` varchar(255) DEFAULT NULL,
  `hyarihatto` varchar(255) DEFAULT NULL,
  `point_to_remember` varchar(255) DEFAULT NULL,
  `self_evaluation` varchar(255) DEFAULT NULL,
  `mentor_eveluation` varchar(255) DEFAULT NULL,
  `komentar_mentor` varchar(255) DEFAULT NULL,
  `status` enum('pending','accept','reject') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `logbook`
--

INSERT INTO `logbook` (`id`, `mahasiswa_id`, `week`, `mounth`, `gambar`, `keterangan`, `tool_used`, `safety_key_point`, `problem_solf`, `hyarihatto`, `point_to_remember`, `self_evaluation`, `mentor_eveluation`, `komentar_mentor`, `status`, `created_at`, `updated_at`) VALUES
('9c2f1982-00c7-4418-8005-cff74c4faa11', '9c2f196e-9ad9-4e4b-9681-4496f16249eb', '1', 'June', NULL, 'tes', 'ok', 'ok', 'ok', 'ok', 'ok', '3', '4', 'ok', 'accept', '2024-06-01 16:57:33', '2024-06-01 23:22:40'),
('9c2fa592-e49e-4fda-80c4-05464e38a76c', '9c2f196e-9ad9-4e4b-9681-4496f16249eb', '1', 'June', '1717284552.jpg', 'ok', 'Oke', 'oke', 'oke', 'Oke', 'Oke', '4', '3', 'Oke', 'accept', '2024-06-01 23:29:12', '2024-06-02 22:19:13'),
('9c2fb240-2de7-497c-901b-d5b149697cd4', '9c2f196e-9ad9-4e4b-9681-4496f16249eb', '1', 'June', NULL, 'tes', NULL, NULL, NULL, NULL, NULL, '2', NULL, NULL, 'reject', '2024-06-02 00:04:39', '2024-06-02 00:05:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `mentor_id` char(36) NOT NULL,
  `dosen_id` char(36) NOT NULL,
  `noreg_vokasi` bigint(20) NOT NULL,
  `batch` bigint(20) NOT NULL,
  `divisi` varchar(255) NOT NULL,
  `shop` varchar(255) NOT NULL,
  `line` varchar(255) NOT NULL,
  `pos` varchar(255) NOT NULL,
  `shift` enum('white','red') NOT NULL DEFAULT 'white',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `user_id`, `mentor_id`, `dosen_id`, `noreg_vokasi`, `batch`, `divisi`, `shop`, `line`, `pos`, `shift`, `created_at`, `updated_at`) VALUES
('9c2f196e-9ad9-4e4b-9681-4496f16249eb', '9c2f1543-a18d-4d37-9705-c2a896923ac1', '9c2f185b-b81c-467f-8711-9215b2be51d9', 'eb58ec41-2037-11ef-aaa4-089798ebee9e', 509, 4, 'Tes', 'Tes', '1', '5', 'white', '2024-06-01 16:57:20', '2024-06-01 16:57:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mentors`
--

CREATE TABLE `mentors` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `section_id` char(36) NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `leader` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `mentors`
--

INSERT INTO `mentors` (`id`, `user_id`, `section_id`, `no_telp`, `leader`, `created_at`, `updated_at`) VALUES
('9c2f185b-b81c-467f-8711-9215b2be51d9', '9c2f1544-2bf0-4bc9-bb5f-9304085f397f', '8c323306-2037-11ef-aaa4-089798ebee9e', '085711115140', 'Wahyu Adi Nugroho', '2024-06-01 16:54:20', '2024-06-01 16:54:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_05_04_085143_create_departement_table', 1),
(6, '2024_05_04_085337_create_section_table', 1),
(7, '2024_05_04_085549_create_mentor_table', 1),
(8, '2024_05_04_085550_create_dosen_table', 1),
(9, '2024_05_04_085925_create_mahasiswa_table', 1),
(10, '2024_05_04_090353_create_absensi_table', 1),
(11, '2024_05_04_090910_create_logbook_table', 1),
(12, '2024_05_04_091912_create_evaluasi_empat_bulan_table', 1),
(13, '2024_05_18_111949_create_pengajuan_mentor_table', 1),
(14, '2024_05_18_112514_create_upload_table', 1),
(15, '2024_05_20_052839_create_paraf_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `parafs`
--

CREATE TABLE `parafs` (
  `id` char(36) NOT NULL,
  `mentor_id` char(36) NOT NULL,
  `ttd` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `parafs`
--

INSERT INTO `parafs` (`id`, `mentor_id`, `ttd`, `created_at`, `updated_at`) VALUES
('9c2fa33b-f5a8-462c-b536-7ef9900a536c', '9c2f185b-b81c-467f-8711-9215b2be51d9', '1717284160.png', '2024-06-01 23:22:40', '2024-06-01 23:22:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `id` char(36) NOT NULL,
  `email` varchar(255) NOT NULL,
  `remember_token` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan_mentors`
--

CREATE TABLE `pengajuan_mentors` (
  `id` char(36) NOT NULL,
  `mahasiswa_id` char(36) NOT NULL,
  `mentor_pertama` char(36) NOT NULL,
  `mentor_kedua` char(36) NOT NULL,
  `status` enum('pending','accept','reject') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sections`
--

CREATE TABLE `sections` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `departement_id` char(36) NOT NULL,
  `section` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sections`
--

INSERT INTO `sections` (`id`, `user_id`, `departement_id`, `section`, `created_at`, `updated_at`) VALUES
('8c323306-2037-11ef-aaa4-089798ebee9e', '9c2f1546-620d-4931-b258-f39ac03f1df9', '77b4bff9-2037-11ef-aaa4-089798ebee9e', '', '2024-06-01 16:53:41', '2024-06-01 16:53:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `uploads`
--

CREATE TABLE `uploads` (
  `id` char(36) NOT NULL,
  `mahasiswa_id` char(36) NOT NULL,
  `presentasi_final` varchar(255) DEFAULT NULL,
  `laporan_ta` varchar(255) DEFAULT NULL,
  `report_a3` varchar(255) DEFAULT NULL,
  `sertifikat` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `nomor_induk` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `foto_profile` varchar(255) DEFAULT 'default.jpg',
  `role` enum('admin','departement','section','mahasiswa','mentor','dosen') NOT NULL DEFAULT 'mahasiswa',
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nomor_induk`, `nama`, `email`, `email_verified_at`, `alamat`, `foto_profile`, `role`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
('9c2f1543-a18d-4d37-9705-c2a896923ac1', '123456', 'Eliane Hill', 'veum.alexane@example.com', NULL, '677 Sim Burg\nConnorton, UT 76594-7704', 'default.jpg', 'mahasiswa', '$2y$10$cVXj0icImcstrkOTNzoHjOEUpogvvOF6oPXTeurjf.ztW0YFiL4ZS', NULL, '2024-06-01 16:45:41', '2024-06-01 16:45:41'),
('9c2f1544-2bf0-4bc9-bb5f-9304085f397f', '11223344', 'Marcelo Sanford', 'ryann53@example.com', NULL, '82443 O\'Kon Groves Apt. 791\nNew Annaliseland, VA 50140', 'default.jpg', 'mentor', '$2y$10$5qzBYaWYQ8aPq0lbVt6Vxuf2U/iqvzxrECsWrjZiGw9viCDKoNKhm', NULL, '2024-06-01 16:45:41', '2024-06-01 16:45:41'),
('9c2f1544-4752-44f7-908c-27e597adfe35', '2024', 'Arden Rodriguez', 'marks.kattie@example.org', NULL, '64972 O\'Connell Street Suite 009\nElouisemouth, NV 33589', 'default.jpg', 'admin', '$2y$10$Qrcx8dym4UgoyKfonOAhoeYMuRVMCSU7Ls/cH/CSED/pLp0Z9TZem', NULL, '2024-06-01 16:45:41', '2024-06-01 16:45:41'),
('9c2f1544-622b-47e0-82cf-0979e8be31ea', '111222333444', 'Prof. Laila Mosciski III', 'rutherford.jerod@example.org', NULL, '73116 Hegmann Loaf\nWest Guillermo, VA 80923-4879', 'default.jpg', 'departement', '$2y$10$hFIYmgNy.UyQVviFGBFmeea6gOuKR3sr.nNK6Pe4xUy.a16GYqu1a', NULL, '2024-06-01 16:45:41', '2024-06-01 16:45:41'),
('9c2f1544-7c3f-48a3-bbcb-af6039870a55', '121212', 'Miss Vivienne Brown III', 'ohintz@example.org', NULL, '694 Goldner Gardens Apt. 259\nKuhicbury, KS 81346-1087', 'default.jpg', 'section', '$2y$10$F30GMq8laz3G5qHUnxw.UOUarHmVBqp9vSjGjDE4La3WEZoA7ECSS', NULL, '2024-06-01 16:45:42', '2024-06-01 16:45:42'),
('9c2f1544-9697-4a36-80a8-d1bc262cec5d', '131313', 'Bert Robel', 'blakin@example.org', NULL, '463 Kallie Station\nHaagstad, CO 64835-2425', 'default.jpg', 'dosen', '$2y$10$GEWZBARQkFIcNTokaz2izOIJ/3jXFIPiiQ.BlLnZEy2WeJnF2BZ/q', NULL, '2024-06-01 16:45:42', '2024-06-01 16:45:42'),
('9c2f1544-ba43-4247-8666-3733f1d8a380', '55435', 'Maria Champlin', 'mills.virginie@example.com', NULL, '386 Rice Prairie\nEast Bobbie, SD 44384-9221', 'default.jpg', 'mahasiswa', '$2y$10$7LHiv5VvjmWyg4qvLk5OlOBZ3MjvDNGS1lE/kY.ha3rpgdanJlDfq', NULL, '2024-06-01 16:45:42', '2024-06-01 16:45:42'),
('9c2f1544-d528-47e9-90ea-dd64c9bd945c', '34830', 'Mr. Guido Stroman Sr.', 'bvandervort@example.org', NULL, '356 Koch Manor\nPort Robb, WI 14289-4352', 'default.jpg', 'mahasiswa', '$2y$10$7MYIDMzQcvM//KpoJylh0.RTQDa.vLyfps95qrH0WbQR3Smau7JZi', NULL, '2024-06-01 16:45:42', '2024-06-01 16:45:42'),
('9c2f1544-f01d-4719-af10-794d9e53fa91', '89778', 'Amiya Kutch', 'mhomenick@example.net', NULL, '860 Gleason Motorway Suite 839\nNorth Juvenalbury, SD 37422', 'default.jpg', 'mahasiswa', '$2y$10$MtypHtlrFUDkV8yLL6GHKefEksMD5dGToj/89Jtrt4DitpGCT4.Xa', NULL, '2024-06-01 16:45:42', '2024-06-01 16:45:42'),
('9c2f1545-0bab-4157-9e66-677ffb9c4cfb', '11416', 'Titus VonRueden', 'janiya53@example.com', NULL, '2931 Conrad Springs Suite 445\nFunktown, WA 98989', 'default.jpg', 'mahasiswa', '$2y$10$ml.JKwK4Gs2HYsbFzuydT.tGyzLCHXi3OBUhrTuK1P3vFkUcu6Qzm', NULL, '2024-06-01 16:45:42', '2024-06-01 16:45:42'),
('9c2f1545-2659-45b0-8f7f-d8224e542466', '17713', 'Felicita Grimes', 'keshaun75@example.net', NULL, '68902 Konopelski Motorway\nLake Makayla, SC 82615-1301', 'default.jpg', 'mahasiswa', '$2y$10$AEPqe432Cz5iXkJ7AQyATOZmTeSl4ifISXI10xoaWfstk1nvVtOiy', NULL, '2024-06-01 16:45:42', '2024-06-01 16:45:42'),
('9c2f1545-4172-4202-999f-e7422f9abe1a', '17926', 'Dr. Santos Kuhn V', 'vida.bins@example.net', NULL, '694 Cronin Isle\nKatharinaborough, OH 56719-0936', 'default.jpg', 'mahasiswa', '$2y$10$Sa4nTjAK03P38hDRfFmDP.GGaHXeaPnLKvH9pFdkBghLBn1Jxu1bK', NULL, '2024-06-01 16:45:42', '2024-06-01 16:45:42'),
('9c2f1545-5b9e-4344-944f-b2664265ee07', '94135', 'Breana Simonis', 'ykautzer@example.com', NULL, '87451 Lennie Parks Apt. 673\nMcClureberg, MD 67967-8111', 'default.jpg', 'mahasiswa', '$2y$10$QcQttjIUaUpfm4NuJWVc2.OKOIeoduRA6U/354upfIbv8MS0gJ4om', NULL, '2024-06-01 16:45:42', '2024-06-01 16:45:42'),
('9c2f1545-7625-47ac-be97-8173131e57a0', '74967', 'Carolyn Kunze', 'hdaniel@example.net', NULL, '735 Ruby Square\nBergeton, MN 77302-8701', 'default.jpg', 'mahasiswa', '$2y$10$aTfyz6WvsBIkFLpE7gmsruj.CitUTlqF3FFaVU/37OeWa8bBGvV5u', NULL, '2024-06-01 16:45:42', '2024-06-01 16:45:42'),
('9c2f1545-903f-4dbb-a2ab-1d3ac04d5196', '95698', 'Preston Walsh', 'cielo94@example.org', NULL, '8718 Ebert Crescent\nHagenesville, VT 62159', 'default.jpg', 'mahasiswa', '$2y$10$L/h9clydr7AbTmYe8w7RIukOzzdJ35pTIdCnxOiqEyUZkqccYRr/y', NULL, '2024-06-01 16:45:42', '2024-06-01 16:45:42'),
('9c2f1545-aa97-47bb-a312-5285936a70f8', '69807', 'Giles Brown', 'margarita71@example.org', NULL, '933 Sandrine Tunnel\nConcepcionmouth, NE 90879', 'default.jpg', 'mahasiswa', '$2y$10$6Yzw./wU9WHGL.coJXp23e5uGSwjknDoNmhL1yNkHKXM7zPZeu/da', NULL, '2024-06-01 16:45:42', '2024-06-01 16:45:42'),
('9c2f1545-c4e8-49ee-be47-3fc223d4323c', '23087', 'Miss Angelita Bartoletti Jr.', 'tom.lehner@example.org', NULL, '1455 Brenden Square\nNew Avaberg, NJ 23336', 'default.jpg', 'mahasiswa', '$2y$10$uiACiO6CEa/cdIjjTUtmlOlj6cAajwd.A8..o3LIDC90F28iwnRIS', NULL, '2024-06-01 16:45:42', '2024-06-01 16:45:42'),
('9c2f1545-df36-46e3-951c-d3a53170112d', '76713', 'Prof. Narciso Gerhold', 'moshe.huel@example.com', NULL, '597 Edmond Skyway\nNatberg, MD 89934', 'default.jpg', 'mahasiswa', '$2y$10$us5p0mhoViQ2DNm.QH/vdOCOqISi81esa6ynje.N6Dw/tqvttTu/C', NULL, '2024-06-01 16:45:42', '2024-06-01 16:45:42'),
('9c2f1545-f983-401c-9d41-425504647856', '66783', 'Merl Hills Jr.', 'grayson76@example.org', NULL, '5596 Kreiger Creek\nWest Jason, AL 75189-6080', 'default.jpg', 'mahasiswa', '$2y$10$7ab48bmTAGP1WrLA18uU4uUQHcd9jsSKu9vXYIrxutxujWJcWrpbq', NULL, '2024-06-01 16:45:43', '2024-06-01 16:45:43'),
('9c2f1546-13af-404d-a8de-f4007a0d07d1', '39927', 'Darrick Robel', 'bechtelar.jayce@example.org', NULL, '6203 Molly Light Suite 389\nLake Christyfurt, MT 56855', 'default.jpg', 'mahasiswa', '$2y$10$Qgj6qM2izbyFUe/YT35Rq.QmEtFccehJCeYmjRn4PS1iSQ0AlFf2.', NULL, '2024-06-01 16:45:43', '2024-06-01 16:45:43'),
('9c2f1546-2dbb-4a39-abe9-debc7890e263', '30869', 'Zaria Toy', 'arice@example.com', NULL, '45986 Gino Street Suite 440\nMafaldaton, AZ 31344-5426', 'default.jpg', 'mahasiswa', '$2y$10$nCbtCUDE/RXlnBr8wZ51weSVHXhyVCLQ5BtIwAN3VXCFTzpEjsurq', NULL, '2024-06-01 16:45:43', '2024-06-01 16:45:43'),
('9c2f1546-47de-400b-9853-1a2fd7044a1f', '91171', 'Xander Hauck', 'pbogan@example.com', NULL, '48052 Robb Cliff Apt. 263\nMathildetown, MI 93244', 'default.jpg', 'mahasiswa', '$2y$10$cHC.Xv2qBnByWU5V7iSESuihKstLpx/E./R0ub9pZdeitY8IRyjge', NULL, '2024-06-01 16:45:43', '2024-06-01 16:45:43'),
('9c2f1546-620d-4931-b258-f39ac03f1df9', '12811', 'Ocie Bailey III', 'amaya88@example.com', NULL, '4644 Carli Villages\nPort Marietta, AZ 76512-0110', 'default.jpg', 'mahasiswa', '$2y$10$it.dtDEN6KxzdXcFGse9rurtBjApV1IdfBhUlzfJLIG96PW12/KQi', NULL, '2024-06-01 16:45:43', '2024-06-01 16:45:43'),
('9c2f1546-7d0f-4a66-af8b-d085f0b5cefb', '42394', 'Theodora Hettinger DDS', 'zoe.cronin@example.net', NULL, '564 Harvey Lake\nMarcusborough, IA 03842-8287', 'default.jpg', 'mahasiswa', '$2y$10$u3Qtk9p23wc8FzyTNkzzLOxZu.gIosWOZ0r1Mb6q5V68lhsamVCQS', NULL, '2024-06-01 16:45:43', '2024-06-01 16:45:43'),
('9c2f1546-9776-4393-ad61-dcf1122b79d6', '30954', 'Stephania Barton DDS', 'witting.catherine@example.org', NULL, '1482 Bins Course Suite 106\nGradychester, TX 62972-2829', 'default.jpg', 'mahasiswa', '$2y$10$xhCD0y2uv5hz8r7vNe/U6ONBMze4iyW5xKczcB7cuECts6X1aqsxa', NULL, '2024-06-01 16:45:43', '2024-06-01 16:45:43'),
('9c2f1546-b21f-45c3-aed8-060ad43c74e5', '13001', 'Jeffery Koch Jr.', 'haylee40@example.net', NULL, '112 Hanna Summit Suite 072\nJamesonmouth, DE 55099-3163', 'default.jpg', 'mahasiswa', '$2y$10$vXUhCykLglHTQnhgOCoiPeZDdM2Yffm/KpfFatjjWAGtOAWRVnRSS', NULL, '2024-06-01 16:45:43', '2024-06-01 16:45:43'),
('9c2f1546-ccf2-4893-9a5c-ed80e5fa1f32', '90521', 'Tatyana Graham', 'kelly.davis@example.org', NULL, '17196 Kuphal Course Apt. 358\nNew Jayde, WI 47224', 'default.jpg', 'mahasiswa', '$2y$10$zwHl6U2KP4FE8zXMjXDWneraqVr..eSP2eUDLmCYd9AW6ToD9Q1aS', NULL, '2024-06-01 16:45:43', '2024-06-01 16:45:43'),
('9c2f1546-e7ac-4e54-9737-9deea22014e0', '66227', 'Judah Welch', 'ondricka.billie@example.com', NULL, '426 Albertha Station\nPort Hansville, KY 54216-7745', 'default.jpg', 'mahasiswa', '$2y$10$UNxBZerZNHDxMaYvAEGqDeb1XPa95aERoYrVOkBLOuu82x2/ysxoe', NULL, '2024-06-01 16:45:43', '2024-06-01 16:45:43'),
('9c2f1547-0243-47c9-8899-aeee7866c146', '88097', 'Mr. Abner Roberts', 'marty42@example.net', NULL, '9812 Pollich Creek\nStreichside, GA 68915-6377', 'default.jpg', 'mahasiswa', '$2y$10$Adh8B00tEml6s/KpY/9j4eGchGzbOl8jnNDlQShDERRhYk5JCZjaq', NULL, '2024-06-01 16:45:43', '2024-06-01 16:45:43'),
('9c2f1547-1e8c-4959-9db6-805c96cb504c', '95394', 'Kristofer Walker', 'abernathy.otho@example.net', NULL, '798 Kiehn Branch Suite 184\nKonopelskiside, FL 96844-1226', 'default.jpg', 'mahasiswa', '$2y$10$AUBLk9io22/8cZ0RqWgAJ.FWc8CYDhRsIKAAN.aOympfKs2Bp4cka', NULL, '2024-06-01 16:45:43', '2024-06-01 16:45:43'),
('9c2f1547-3a18-497f-b84f-c5ad82530ff3', '65220', 'Mr. Ron Hayes', 'anabelle24@example.com', NULL, '46977 Dickinson Mountain Suite 832\nNew Morton, AZ 87508-1613', 'default.jpg', 'mahasiswa', '$2y$10$rM9wbYXvjLtkn.01VmL1.uQEnny03VkhD7o/vLUPCMYt0uxfXXOby', NULL, '2024-06-01 16:45:43', '2024-06-01 16:45:43'),
('9c2f1547-55ba-4075-ba0a-2b61a42f4fd6', '51170', 'Della Champlin', 'nweimann@example.org', NULL, '6927 King Points Apt. 541\nMedhurstmouth, WY 04495-8806', 'default.jpg', 'mahasiswa', '$2y$10$S6tGBdm7llQK1mPoGI3pPOBwxeb7U16ZWIOU4F2oynPijoa7j0NKi', NULL, '2024-06-01 16:45:43', '2024-06-01 16:45:43'),
('9c2f1547-7138-4e61-9273-962c9d2f36b9', '14354', 'Prof. Jeanette Zboncak', 'sjaskolski@example.com', NULL, '121 Hadley Plain\nWest Jarodhaven, AR 68936-9645', 'default.jpg', 'mahasiswa', '$2y$10$nXaGTA63G9G.KYavFuDfsu2EFlV.p3A1372UyAUIvtRtaEV9g26MC', NULL, '2024-06-01 16:45:43', '2024-06-01 16:45:43'),
('9c2f1547-8dd0-43ec-95bb-b37ab0f8f20d', '26425', 'Gustave McDermott', 'alvah.beahan@example.net', NULL, '46593 Kuhlman Flat Apt. 403\nPriceburgh, WY 36794-9425', 'default.jpg', 'mahasiswa', '$2y$10$BzesflLYvTfddRU9MgF9eO8cxO3NBWorfJdDzltdnXe1/.wtLJj6W', NULL, '2024-06-01 16:45:44', '2024-06-01 16:45:44'),
('9c2f1547-a9af-4d77-9530-03a81528b2fd', '77335', 'Lula Walter', 'larson.maggie@example.net', NULL, '19409 Bechtelar Plains Suite 133\nNew Jade, NE 58892-5249', 'default.jpg', 'mahasiswa', '$2y$10$25vyzZLlYdVU33p0lLXmt.r7m6bbpiAA8snTlyWmbBmd8x4j.w3oe', NULL, '2024-06-01 16:45:44', '2024-06-01 16:45:44'),
('9c2f1547-c6b6-430f-aedd-c19193f06e19', '61277', 'Seth Runolfsdottir', 'nitzsche.glen@example.com', NULL, '62154 Cyril Creek Apt. 129\nPort Stellaport, CA 24329', 'default.jpg', 'mahasiswa', '$2y$10$1MhxzkBweF78bbALwwkOE.EAkv805EEhqShI1TWouM2wBI7IX7/p6', NULL, '2024-06-01 16:45:44', '2024-06-01 16:45:44'),
('9c2f1547-e2ad-488a-afa3-39886c5db2a1', '15075', 'Dr. Niko Boyer IV', 'goldner.shea@example.com', NULL, '44733 O\'Keefe Ports\nMarksborough, ND 07580', 'default.jpg', 'mahasiswa', '$2y$10$ERKVttsTvV4kiuIX7MH4KuaV4t2k2Qzc8IeRvJBSZ7D70G9eg1/Om', NULL, '2024-06-01 16:45:44', '2024-06-01 16:45:44'),
('9c2f1547-fe74-40bf-8bf6-70a9c1a25299', '81156', 'Aron Lesch', 'herman.ledner@example.com', NULL, '195 Julien Underpass\nPablofort, TN 50638-7571', 'default.jpg', 'mahasiswa', '$2y$10$beRvb4KyPWH0uC.yttRvauKNRtlXDkzMhWjj8tlOviAfqFlWXAudW', NULL, '2024-06-01 16:45:44', '2024-06-01 16:45:44'),
('9c2f1548-1b31-47ab-9193-f37d6b41f059', '51009', 'Hudson Fay V', 'candelario.powlowski@example.net', NULL, '251 Maegan Hollow Apt. 998\nFionahaven, IA 43372-9686', 'default.jpg', 'mahasiswa', '$2y$10$vbYLDLs.8DhtqAUug.8wVeI9VXsPmlfx3kgVwX.LAVjf1KTzGfWZS', NULL, '2024-06-01 16:45:44', '2024-06-01 16:45:44'),
('9c2f1548-37f5-4747-b12c-f0603107f853', '54038', 'Dr. Felipa Jacobs', 'lhand@example.net', NULL, '4402 Lorine Lodge\nKuvalisstad, AZ 77383', 'default.jpg', 'mahasiswa', '$2y$10$ql290VyKUhbm5RAdCGEmOuTBb5J9f.0Owulv4g2x15xx8orFNOQPO', NULL, '2024-06-01 16:45:44', '2024-06-01 16:45:44'),
('9c2f1548-5bf8-46f9-9912-d1ea6e183bc2', '55798', 'Mr. Alvah Cassin DVM', 'alyce21@example.net', NULL, '850 Hermiston Pines Suite 417\nTurnerfort, KS 45576-9947', 'default.jpg', 'mahasiswa', '$2y$10$WIY4q3zyM.ItMoaE6t76/O/mFyPcz7CqSqWFoXXnYKzW2C/Zu6GcK', NULL, '2024-06-01 16:45:44', '2024-06-01 16:45:44'),
('9c2f1548-7624-49ef-8a48-0dfb60714e3f', '98408', 'Vince Eichmann', 'camryn24@example.com', NULL, '54153 Bergstrom Circles Suite 489\nPort Herminiobury, KY 14903', 'default.jpg', 'mahasiswa', '$2y$10$U8jIvaFeR79H90ClqwdLje9922u/Or3yScGNBLDxOOIalo0.gCBpC', NULL, '2024-06-01 16:45:44', '2024-06-01 16:45:44'),
('9c2f1548-907b-4459-982e-939e42c4119f', '83235', 'Mr. Ron O\'Hara', 'larkin.virgie@example.com', NULL, '3942 Kerluke Springs\nNorth Aidanshire, IA 20182', 'default.jpg', 'mahasiswa', '$2y$10$JpfOqMrxbhb0FuVRxfrMauX.55ZDuHu9Nawv7peizYzTBo3bhIFHe', NULL, '2024-06-01 16:45:44', '2024-06-01 16:45:44'),
('9c2f1548-ac17-465f-956f-893d4730c103', '75203', 'Alphonso Murray', 'hegmann.jadyn@example.net', NULL, '4089 Corkery Drive\nNew Tristin, PA 09969', 'default.jpg', 'mahasiswa', '$2y$10$8JBrTBVrLBJhZF7eOInIheCC8pd9pab.yInluFp3WtgZfZQfGM0sO', NULL, '2024-06-01 16:45:44', '2024-06-01 16:45:44'),
('9c2f1548-c68f-4cf2-8aa5-f98b8a3bb431', '46270', 'Miss Ayana Schiller I', 'iliana33@example.com', NULL, '7653 Arnoldo Land\nKovacekport, ME 99403', 'default.jpg', 'mahasiswa', '$2y$10$OSU4UK37lbcKn/uU8mPY2eTz.1gElEoQZcrYOcJdwZDUKgw6.2hPq', NULL, '2024-06-01 16:45:44', '2024-06-01 16:45:44'),
('9c2f1548-e113-4c7f-8e35-8ba838ad9033', '59969', 'Mark Deckow', 'breanna.wisozk@example.org', NULL, '53249 Ryan Bridge Apt. 220\nCristmouth, ME 77481', 'default.jpg', 'mahasiswa', '$2y$10$8QhF7FQJrwJd3Yiz2JFs2.HCp.mjjx8Zs9tdRO3wOEuVQh/GaIW86', NULL, '2024-06-01 16:45:44', '2024-06-01 16:45:44'),
('9c2f1548-fb4d-4c02-8242-ab57e9f1c1ee', '12297', 'Gaylord Haag', 'shemar74@example.net', NULL, '7903 Hegmann Meadow Suite 885\nLangworthview, SC 26758-2839', 'default.jpg', 'mahasiswa', '$2y$10$hEkLLa7OpoGtI4h2QYhkLe1yw0kmUXxNhrDHrHVCixAr.Z/wgQdjS', NULL, '2024-06-01 16:45:45', '2024-06-01 16:45:45'),
('9c2f1549-1752-4cfd-98ff-e51158b87ef0', '21200', 'Kristian Braun', 'gaston.schuppe@example.org', NULL, '899 Melissa Groves\nHalmouth, NH 69868-6845', 'default.jpg', 'mahasiswa', '$2y$10$O4x2dNgD/h6uB/KmIcR9MOUKfAwVOIpC..CRry1lBcnTNktjzLgO.', NULL, '2024-06-01 16:45:45', '2024-06-01 16:45:45'),
('9c2f1549-318b-42c9-922a-c74e7fbda526', '40006', 'Ms. Jadyn Terry', 'herman.vicente@example.net', NULL, '83877 Legros Oval\nWest Torreychester, PA 79513', 'default.jpg', 'mahasiswa', '$2y$10$ym41GzIHvCp.2U5HdbKKheZMVpKBKknTsj005/Uq1zcO6LRhqItL.', NULL, '2024-06-01 16:45:45', '2024-06-01 16:45:45'),
('9c2f1549-4c66-4dfb-a7a6-f3bca45fb0d0', '49553', 'Brendon Ziemann', 'johnathan.vandervort@example.net', NULL, '5752 Jaskolski Course\nHintzfort, SD 13105', 'default.jpg', 'mahasiswa', '$2y$10$9780cCi5HddUsbOp2SndqOuiy.7SaLz2z3D4P0eRqv/N84ZS9NCXi', NULL, '2024-06-01 16:45:45', '2024-06-01 16:45:45'),
('9c2f1549-6794-441b-91dc-f63da1f66ad4', '65615', 'Gideon Gerhold', 'ecollins@example.com', NULL, '97327 Maxime Alley\nSiennaton, MS 00405-0280', 'default.jpg', 'mahasiswa', '$2y$10$dlTOEFL.VzAiZkTY3UpC3.XyuvVolW1fD/bim9/5YNrNxcCl1DU9O', NULL, '2024-06-01 16:45:45', '2024-06-01 16:45:45'),
('9c2f1549-8322-42df-8cc7-e79595ddae95', '99896', 'Mrs. Karianne Boehm', 'kihn.gennaro@example.com', NULL, '1841 Kaela Forest\nAlishastad, MA 27418-1306', 'default.jpg', 'mahasiswa', '$2y$10$3J9I9TTnaJmCh6I.jHgzyOKLDqr38URqTroW2tAqX0hPSB.pjNFRO', NULL, '2024-06-01 16:45:45', '2024-06-01 16:45:45'),
('9c2f1549-a0ad-4f9f-af8a-dca89eaa4aad', '86423', 'Adrien Eichmann', 'rosemary.herzog@example.org', NULL, '80199 Kuvalis Lodge Apt. 200\nRoyburgh, NC 11089', 'default.jpg', 'mahasiswa', '$2y$10$j7xvYRVZ12rQdqSSRPTk.O16ctIL0rqJoga7DXPqJ4Zmt4iJ3zPrC', NULL, '2024-06-01 16:45:45', '2024-06-01 16:45:45'),
('9c2f1549-bec3-4a5d-a367-79e713095076', '37435', 'Arden Wisoky Jr.', 'ydickinson@example.net', NULL, '37056 Fay Courts\nJaidatown, NJ 15992', 'default.jpg', 'mahasiswa', '$2y$10$yuGWS.JAmcunlVBMxt2fu.BzZIaBoXPZP46pQMkFiAJnxJsP6e7KW', NULL, '2024-06-01 16:45:45', '2024-06-01 16:45:45'),
('9c2f1549-d951-4104-a720-9d5274594404', '45676', 'Tia Grimes I', 'kaycee.rolfson@example.com', NULL, '1041 Senger Unions\nPredovicshire, OK 16467-6744', 'default.jpg', 'mahasiswa', '$2y$10$paWfui4GlrEvRxtIctT61OOm3AzrOGx3zPJ/QqmpLg4L9hgTQC2Xe', NULL, '2024-06-01 16:45:45', '2024-06-01 16:45:45'),
('9c2f1549-f422-433f-a372-14333a9891f3', '55303', 'Corene Schimmel', 'breitenberg.cyril@example.org', NULL, '55416 Efrain Stravenue\nVerliestad, AR 87239', 'default.jpg', 'mahasiswa', '$2y$10$tJ1Lgoi0EY/oXDF7RnqryOMRxv9TGrEfvNFW6Lc8zkFhpTQnnWvWu', NULL, '2024-06-01 16:45:45', '2024-06-01 16:45:45'),
('9c2f154a-0e98-4a19-b7dc-1859b56b8952', '12462', 'Neha Altenwerth', 'jadyn22@example.net', NULL, '801 Nicolas Fall\nNew Yasminland, ND 24830-6983', 'default.jpg', 'mentor', '$2y$10$AeSdNjCm3skMVoNTG0R5Eef4O2cnqmKNLzEdGcufcVy4UF.J7v5Di', NULL, '2024-06-01 16:45:45', '2024-06-01 16:45:45'),
('9c2f154a-29ff-431a-b712-9c516a04d1e9', '95510', 'Joe Kovacek', 'kevon.dickinson@example.org', NULL, '51627 Demarco Village Suite 629\nEast Jedediah, MO 45896-8351', 'default.jpg', 'mentor', '$2y$10$7LDbAL2fqPPKT4iQgNPRYuXzt6avXoC1YhfFw3tVOOzEnys/n7gzG', NULL, '2024-06-01 16:45:45', '2024-06-01 16:45:45'),
('9c2f154a-459d-4830-a32c-b859304b2ee7', '67950', 'Sven Lockman I', 'keon85@example.org', NULL, '6487 Koelpin Island Suite 772\nLake Danika, NV 41928-0311', 'default.jpg', 'mentor', '$2y$10$S6J7.5//wvDvOVrB5vcrPuNDNsYghgD0699PRthiqhJZwN2IS9j/2', NULL, '2024-06-01 16:45:45', '2024-06-01 16:45:45'),
('9c2f154a-6267-42fe-be4d-51d7c37de4d5', '86084', 'Ressie Bednar', 'darion51@example.com', NULL, '79247 Rath Gardens Suite 978\nMariliefurt, MT 51464', 'default.jpg', 'mentor', '$2y$10$lQUXZlRWSsdjhBl4yVB7teFRtdgVq1mHIWYiPDa/psy2kVO.OVAi6', NULL, '2024-06-01 16:45:45', '2024-06-01 16:45:45'),
('9c2f154a-7d84-4f3f-be8f-e119cf2a9a12', '20635', 'Charity Fay', 'eddie63@example.com', NULL, '6883 Fay Square\nPort Rudolph, UT 49521', 'default.jpg', 'mentor', '$2y$10$VJdmnuUIB1wcy3qlJgCDXOGDQu8y8.I61blodMNXRxkdz/iDi8m62', NULL, '2024-06-01 16:45:45', '2024-06-01 16:45:45'),
('9c2f154a-99f9-4d25-89df-55c27fc95291', '36276', 'Mr. Giovani Homenick', 'oblick@example.com', NULL, '608 Madisyn Drive Apt. 018\nLondonton, ND 80380', 'default.jpg', 'mentor', '$2y$10$Hgu7g76ANqZE67P98u/HteOnOCy9Rm9eoUVwDvU3pH6dhT77hLuTq', NULL, '2024-06-01 16:45:46', '2024-06-01 16:45:46'),
('9c2f154a-b4d1-4dbc-a000-73b7fe43268d', '48038', 'Roberta Gorczany', 'madyson29@example.net', NULL, '94064 Barrows Wells Suite 650\nSouth Camryn, AZ 26970', 'default.jpg', 'mentor', '$2y$10$TL0S/DLIkaWRTTusRLXpIOZ/8qsWSOXIlF9iwqn3haUMgHaozctg.', NULL, '2024-06-01 16:45:46', '2024-06-01 16:45:46'),
('9c2f154a-d1c8-40e1-8f38-d571241609b4', '16161', 'Carter Hegmann', 'mante.justus@example.com', NULL, '5543 Adrienne Centers Apt. 955\nDietrichtown, ND 31484-1945', 'default.jpg', 'mentor', '$2y$10$4nuqEgQmKMlVdnjB3niEseTUMIn6lVWucroG6Spn15SdWEzS.hYz6', NULL, '2024-06-01 16:45:46', '2024-06-01 16:45:46'),
('9c2f154a-ee3c-4d6d-a91c-35cf6137dc70', '42891', 'Cicero Bogisich', 'pacocha.dangelo@example.org', NULL, '260 Morissette Extensions\nEast Jerryborough, KS 07132-7947', 'default.jpg', 'mentor', '$2y$10$YkFRj7NPcd8e1XDLhtFSYOJZVWtALEkBjgT29Qm2WQYwjX2PGMKfy', NULL, '2024-06-01 16:45:46', '2024-06-01 16:45:46'),
('9c2f154b-0a2a-4844-96ca-89e185530ce0', '50075', 'Dr. Myrl Rau', 'jhuels@example.net', NULL, '3546 Dicki Junctions\nWest Mattie, DE 49813', 'default.jpg', 'mentor', '$2y$10$EANeGMjJ0E/9dclFHulFNeH75zNcZ5p5g7ildrYDFYARwgmkw44Nq', NULL, '2024-06-01 16:45:46', '2024-06-01 16:45:46'),
('9c2f154b-2675-4c91-a165-0016a6f54ecd', '96853', 'Prof. Kelton Vandervort III', 'jmueller@example.org', NULL, '2293 Jayson Parkways\nWest Tarynshire, ME 10852-1515', 'default.jpg', 'mentor', '$2y$10$RcrVJ6.A5ZRqTZhbmpqLgO3UYc885ytfkQwOVew1Cfu1nT8sFZmB2', NULL, '2024-06-01 16:45:46', '2024-06-01 16:45:46'),
('9c2f154b-421b-4d8e-8719-c02f058edce5', '36363', 'Alessandra Rogahn', 'kaitlyn08@example.net', NULL, '15972 Waters Knoll\nLoriborough, NE 01985-2865', 'default.jpg', 'mentor', '$2y$10$lvIS1buMgP3yRCKzYnn72.g5vPx7VIVUMNzJy9TyuWgqPxrlpShRW', NULL, '2024-06-01 16:45:46', '2024-06-01 16:45:46'),
('9c2f154b-5ebb-42bf-87a5-b0276d8b3495', '47457', 'Delphia Hagenes', 'whills@example.org', NULL, '9084 Cronin Estates\nPort Rosarioburgh, LA 35116', 'default.jpg', 'mentor', '$2y$10$KYV3vMhGojxAXALEmhir/uSM/dmkCE8.JulJwbdN8CpJWo8WnkCCG', NULL, '2024-06-01 16:45:46', '2024-06-01 16:45:46'),
('9c2f154b-79f8-4cc3-946e-3d9b74e0cebf', '96932', 'Alanna Altenwerth', 'fay.delfina@example.org', NULL, '6308 Dibbert Isle\nBlockberg, OH 05169', 'default.jpg', 'mentor', '$2y$10$wnXbU9RIs7g66zvRUQjlduDcyI1umeGDLzQ/T2dTQDIyjymWwQLiC', NULL, '2024-06-01 16:45:46', '2024-06-01 16:45:46'),
('9c2f154b-9540-41e2-ac46-c788f5d050de', '81353', 'Adrienne Sporer', 'jimmy58@example.org', NULL, '7819 Einar Expressway Apt. 372\nLake Alison, OH 57221', 'default.jpg', 'mentor', '$2y$10$0ZZFIIrqXSQLT1S3QlTqyermJNyqA9V0ZH1gXm6nJYbCWlYJBN6da', NULL, '2024-06-01 16:45:46', '2024-06-01 16:45:46'),
('9c2f154b-b053-4c32-a891-9eb821445331', '96283', 'Dr. Delmer Franecki Jr.', 'janice79@example.org', NULL, '167 Funk Mews\nNew Malika, AK 08248-9285', 'default.jpg', 'mentor', '$2y$10$T4Yz7TJDHRbn.ZF8VZYGY.M23xknAbeslg5hFEqEH3lYKbGa49/i.', NULL, '2024-06-01 16:45:46', '2024-06-01 16:45:46'),
('9c2f154b-cc68-4b28-a554-530546f45652', '98671', 'Ismael Nienow', 'vwillms@example.com', NULL, '73020 Hodkiewicz Ways Apt. 603\nDurwardview, SC 12836-3534', 'default.jpg', 'mentor', '$2y$10$DTM61xEST0WEhjp0aNd23u5pOoNQf9vGBnBOyYYU1hdILOhtVjcPO', NULL, '2024-06-01 16:45:46', '2024-06-01 16:45:46'),
('9c2f154b-e760-4914-87ae-607fcde09034', '43403', 'Carlotta Raynor', 'bradley36@example.org', NULL, '6699 Golda Radial Apt. 899\nPort Dejuan, AR 31592-0803', 'default.jpg', 'mentor', '$2y$10$hb5kfzb6e0fOERuFXj9ybuIkoT7MoAi7qRhiNsipcORmCfZWvBOoW', NULL, '2024-06-01 16:45:46', '2024-06-01 16:45:46'),
('9c2f154c-0174-496f-a219-9e5202f9ffea', '31887', 'Clay Huels', 'bridget23@example.org', NULL, '444 Kertzmann Bridge\nKolbymouth, CA 80666', 'default.jpg', 'mentor', '$2y$10$4QjXJ1NfvgJ1dPMi8eZ3AOqcOml/4csmCPjDN2pCWkbL.AR2MgE4i', NULL, '2024-06-01 16:45:46', '2024-06-01 16:45:46'),
('9c2f154c-1b93-4789-ad21-dba849714d0d', '25564', 'Arlene Boyer PhD', 'altenwerth.adriana@example.com', NULL, '33365 Gutkowski Parks\nErnsertown, NE 23206-0209', 'default.jpg', 'mentor', '$2y$10$lw4ysknHdDGYxgJ6w6FomOxwoWA6BAKgAI3JG2.pokc9tIxzWCDhS', NULL, '2024-06-01 16:45:47', '2024-06-01 16:45:47'),
('9c2f154c-35d6-4141-bf5a-9872111f4ce8', '43293', 'Zaria Paucek', 'kuhlman.marisol@example.com', NULL, '7729 Harmon Falls\nPort Austyn, MT 37228', 'default.jpg', 'mentor', '$2y$10$5mhFrqKy8hNXtcGtbYI4YuEQiPkLESxUYaDaGfYR5OMCQXYpgIJ.2', NULL, '2024-06-01 16:45:47', '2024-06-01 16:45:47'),
('9c2f154c-51ac-400b-a1f6-08ef6dae9fd0', '84654', 'Dr. Reggie Miller III', 'lreynolds@example.com', NULL, '3841 Elyssa Inlet\nKiehnchester, WY 06052', 'default.jpg', 'mentor', '$2y$10$jLJEsRfF5EG8LWQ0f2WMseTemF2vqt86BcaObdkaxsMX.qfyUC8y.', NULL, '2024-06-01 16:45:47', '2024-06-01 16:45:47'),
('9c2f154c-6d0c-4e23-9e95-9f4be14cb736', '82293', 'Miss Jolie Kuvalis', 'rolfson.dolores@example.net', NULL, '336 Daron Island Suite 541\nNorth Turner, MD 93799-8891', 'default.jpg', 'mentor', '$2y$10$GE.v7BRt/mN7t/.BbyaxV.3yAC2da7f6etgNChuN5FYyNnXzatOAy', NULL, '2024-06-01 16:45:47', '2024-06-01 16:45:47'),
('9c2f154c-8a00-474e-9a1d-b02b3f3e50da', '75434', 'Prof. Syble Kreiger', 'freeman29@example.net', NULL, '1913 Bergnaum Crossing\nEast Citlalli, ND 99962', 'default.jpg', 'mentor', '$2y$10$LmdZ9hEfy25eNhYo4SOqZOqYZvEckhMWIvnO3VypfdpJbKBj5/Alu', NULL, '2024-06-01 16:45:47', '2024-06-01 16:45:47'),
('9c2f154c-a64c-46c9-bfce-f7dbd186fd9d', '54050', 'Mr. Alexandre Mraz II', 'bashirian.arturo@example.org', NULL, '5371 Waino Row Suite 849\nWest Joanny, MA 19684', 'default.jpg', 'mentor', '$2y$10$FnEHw1HQyXpwRTK4L7yWr.opAPkI89QCVtgx/R1SIWC3px07CmiIC', NULL, '2024-06-01 16:45:47', '2024-06-01 16:45:47'),
('9c2f154c-c213-4268-a9c8-5ab3551a850b', '91964', 'Miss Margarette Bogisich', 'wolf.naomi@example.org', NULL, '7980 Delta Shoals Apt. 831\nTurnerberg, MN 72275-7572', 'default.jpg', 'mentor', '$2y$10$IqA/LxqG2vW00sQpieAihOwAFjy07Uq/m0UPk3.PgI9x/jPCR1Gqy', NULL, '2024-06-01 16:45:47', '2024-06-01 16:45:47'),
('9c2f154c-e019-4774-b2aa-0a1c4f3dea3d', '16491', 'Nestor Streich', 'pfannerstill.giles@example.org', NULL, '57159 Baylee Stravenue\nSouth Tamara, AZ 49247', 'default.jpg', 'mentor', '$2y$10$1mcr6EQTdjFwWTLZqQkkVe/yQCKtu/NdzDhWrZIuVzwNexkTX1Rz6', NULL, '2024-06-01 16:45:47', '2024-06-01 16:45:47'),
('9c2f154c-fb7f-4801-b984-fc531b3aaff5', '13452', 'Frida Hilpert PhD', 'griffin31@example.com', NULL, '5675 Ryann Cliff\nEast Daneburgh, TN 29081', 'default.jpg', 'mentor', '$2y$10$DMlhEzCia0DkWTGrmRO.iewie3Pbtb0wBP0Uk4n6ad.yN7vFmBhUm', NULL, '2024-06-01 16:45:47', '2024-06-01 16:45:47'),
('9c2f154d-1671-47d0-86bd-19dbe6eaa3a2', '53603', 'Sonya Anderson', 'jackeline81@example.net', NULL, '89416 Hobart Lodge Suite 122\nWest Lupe, OH 35532', 'default.jpg', 'mentor', '$2y$10$EFFvp0LJf6upAvSxTxBjNOsOIzUuOQ4MbiHCSzMybYDaNfYGVUHwa', NULL, '2024-06-01 16:45:47', '2024-06-01 16:45:47'),
('9c2f154d-31cc-45c8-935e-6c710968a526', '18826', 'Mr. Frederik Bergstrom Jr.', 'rempel.zion@example.net', NULL, '32882 Cole Greens\nClairtown, UT 39581', 'default.jpg', 'mentor', '$2y$10$siVWOnzrUOaD2Yjjk6RjM.vQM24H1pMSRlDHh1PLqnGz5yLH7Nr.a', NULL, '2024-06-01 16:45:47', '2024-06-01 16:45:47'),
('9c2f154d-4c9b-415d-a222-b1ecf73f7ba9', '59894', 'Piper Mills', 'dhane@example.net', NULL, '761 Shemar Overpass\nSouth Deronview, ID 94102-8843', 'default.jpg', 'mentor', '$2y$10$X/XY85reKAQ2rBTvnO0hHen/Seaz9LfMRIXJ/WQv4PF3vTnU5G5lm', NULL, '2024-06-01 16:45:47', '2024-06-01 16:45:47'),
('9c2f154d-66b4-425f-b238-60103d287758', '85961', 'Prof. Hulda Dooley', 'gutmann.daron@example.com', NULL, '9278 Nayeli Plain\nSouth Rodrigo, AR 76186', 'default.jpg', 'mentor', '$2y$10$i.F2tsSGOYppWlLQBXYLRenGvc4OhlHK4hQyr9gNTu5BRiH.kov2e', NULL, '2024-06-01 16:45:47', '2024-06-01 16:45:47'),
('9c2f154d-80d3-4a3d-bba6-a9500468f2bb', '88814', 'Ms. Myrtice Bailey', 'chelsea03@example.org', NULL, '4019 Juliana Passage Suite 294\nJohnsonchester, DE 19675-5589', 'default.jpg', 'mentor', '$2y$10$iTPsO8SLspmV1088Myjr0O1s.XcWVKv.vzqDdLbHEEDbsDi0pHRt2', NULL, '2024-06-01 16:45:47', '2024-06-01 16:45:47'),
('9c2f154d-9aed-4f31-aa18-0b367f4e03d2', '49783', 'Eunice Lang', 'arely.auer@example.org', NULL, '72215 Gutmann Curve\nMurrayfort, CA 05727-1054', 'default.jpg', 'mentor', '$2y$10$b3YU4oIJ333LIi2j53rIPO9CghiOEOJxmPfOVrXcVGtCIOmqDOG6.', NULL, '2024-06-01 16:45:48', '2024-06-01 16:45:48'),
('9c2f154d-b5a2-4e3a-94c6-218272967502', '28947', 'Lavinia Kreiger', 'keon.zemlak@example.com', NULL, '65376 Davin Ridge Suite 889\nLynchfurt, GA 00510', 'default.jpg', 'mentor', '$2y$10$HwncPfjnOvEegMOGusJhd.ZfyG1/KIjub.rYv67IpxdQZbQkEZAmi', NULL, '2024-06-01 16:45:48', '2024-06-01 16:45:48'),
('9c2f154d-d100-4fdd-9272-1ca6ddfb356c', '78863', 'Cara Ward', 'rutherford.boyd@example.net', NULL, '93263 Lowe Avenue Suite 954\nSouth Adamstad, DC 06796', 'default.jpg', 'mentor', '$2y$10$jdTd1eP8qdS.w9TGo3d14udBr2nzGfdpkbuL5Bt96Jz.lLzP4DOnm', NULL, '2024-06-01 16:45:48', '2024-06-01 16:45:48'),
('9c2f154d-eb40-4685-9cef-e7473e69dbb3', '77654', 'Mrs. Bettie Rodriguez III', 'fbernier@example.org', NULL, '70307 Carmine Shore Apt. 190\nRodrigoton, DC 85615-2320', 'default.jpg', 'mentor', '$2y$10$.IvlsLWXLwHIVzB72m85TOpPumfO1LiVv0ivabEljTcq22TbKyzua', NULL, '2024-06-01 16:45:48', '2024-06-01 16:45:48'),
('9c2f154e-05ce-4e65-a99c-2e03e6025fba', '76632', 'Abigayle McGlynn', 'cydney.sauer@example.com', NULL, '571 Hilpert Vista\nLake Janet, IN 73867', 'default.jpg', 'mentor', '$2y$10$ps/RhLQ5ehxN4KIbMzITjee7lJJHQDNhbt./yuBL3x3wLGDFLIx5W', NULL, '2024-06-01 16:45:48', '2024-06-01 16:45:48'),
('9c2f154e-2023-4e22-bbe3-e6a3e16e64b3', '46972', 'Cyril Heidenreich I', 'gibson.mathew@example.com', NULL, '6634 Gleichner Gardens\nUnafort, DE 79235', 'default.jpg', 'mentor', '$2y$10$kQvymhTwvNp4U3LXjfRXJO.FLV6doU8HuAmNC2Rja6vyubbqDqnIy', NULL, '2024-06-01 16:45:48', '2024-06-01 16:45:48'),
('9c2f154e-3b07-462f-a654-68d08ba3538d', '88666', 'Jordy Lueilwitz', 'zemlak.yadira@example.org', NULL, '34311 Tre Keys Apt. 055\nWest Bethany, TN 92594', 'default.jpg', 'mentor', '$2y$10$7XTt.gnmv57uoTwpI0orKe7XWfozYP0OPQpah73R28LxCrv4m1lDq', NULL, '2024-06-01 16:45:48', '2024-06-01 16:45:48'),
('9c2f154e-5614-440c-91fc-0e2f3450aa2a', '46334', 'Petra Rogahn', 'oma85@example.org', NULL, '2995 Schmeler Terrace\nSheafort, IL 11637-4291', 'default.jpg', 'mentor', '$2y$10$0TB6afYOeTtvC5ckO326su7gbyA/b8dv2CEJsy4wt0sxgx4S6VQJ6', NULL, '2024-06-01 16:45:48', '2024-06-01 16:45:48'),
('9c2f154e-7078-4854-8788-7c7f897da308', '52135', 'Prof. Valentina Hayes', 'dbeahan@example.org', NULL, '3223 Malcolm Fork Suite 627\nOsinskiberg, OK 29573', 'default.jpg', 'mentor', '$2y$10$g7ZHNzAMZ3PRZHCGkPMZSO.AWJBYRV0E50AbBdxNQcGN8ap3PrdFO', NULL, '2024-06-01 16:45:48', '2024-06-01 16:45:48'),
('9c2f154e-8afb-4f0e-99d5-99da3a5f716e', '49392', 'Oma Langworth Jr.', 'jhuel@example.com', NULL, '610 Mante Extension Apt. 276\nHanechester, IL 35591-9117', 'default.jpg', 'mentor', '$2y$10$2SctJ3MbQdKUmWjl369L.uxyvyVwgzIibL6vWmIFSil/wRTsTfkIy', NULL, '2024-06-01 16:45:48', '2024-06-01 16:45:48'),
('9c2f154e-a55c-48e7-b2a6-3197b95f5a7c', '18658', 'Prof. Sienna Morar', 'donnelly.jayda@example.org', NULL, '4731 Frieda Mall\nLake Christopher, IN 86487-9074', 'default.jpg', 'mentor', '$2y$10$zwHV4u.SzfWLlZYOSlrQU.2fEg9wz6qo3Z9kuIJPn.dLTUW71qK3O', NULL, '2024-06-01 16:45:48', '2024-06-01 16:45:48'),
('9c2f154e-c1db-4aac-813d-65e72b98cfa5', '29319', 'Keven Donnelly', 'zschulist@example.org', NULL, '416 Joshuah Glen\nWelchtown, IL 25412-2381', 'default.jpg', 'mentor', '$2y$10$rVLlCvb8cts.yYBwZ8bzUe15TuakPUm.14ZrdIPvFjgD64T08OYJW', NULL, '2024-06-01 16:45:48', '2024-06-01 16:45:48'),
('9c2f154e-ddba-4ee9-ba98-791c42bf4663', '23023', 'Waino Aufderhar', 'aida42@example.com', NULL, '7858 Kreiger Motorway\nBaronport, NJ 10926', 'default.jpg', 'mentor', '$2y$10$liK.YQG7hYYoZxHsMB5kwO7ZjZ1f07mYTr0pq6T4.FVn5uy2N.rm2', NULL, '2024-06-01 16:45:48', '2024-06-01 16:45:48'),
('9c2f154e-f988-464d-9595-69f066c93067', '18177', 'Jordon Brekke', 'duncan32@example.com', NULL, '448 Denesik Shoal Suite 626\nWest Claudinefort, MI 87536-8485', 'default.jpg', 'mentor', '$2y$10$LFjwLNx3mzjfrU0SaR8W9ufxJIOfdb7QO9wRi9xNnusVtowoQLm0W', NULL, '2024-06-01 16:45:48', '2024-06-01 16:45:48'),
('9c2f154f-1538-4a94-89f5-14b1383a642f', '96703', 'Ms. Freda Kovacek Sr.', 'adelbert56@example.com', NULL, '906 Toy Ridge Apt. 244\nPort Pietroberg, GA 03990-5912', 'default.jpg', 'mentor', '$2y$10$xm65KjukRn6Q9GRYKK9BvusjvJAm9bnT8lhNNMsbprAiVSICe597S', NULL, '2024-06-01 16:45:49', '2024-06-01 16:45:49'),
('9c2f154f-314c-487d-8f69-a6de515f13c5', '12268', 'Ryley Monahan', 'funk.ansel@example.net', NULL, '43714 Lind Turnpike Apt. 200\nSouth Genevieve, MI 85023', 'default.jpg', 'mentor', '$2y$10$UWR6YlzWcxR0BGVhqE4OeuBngc8ObxI7qul2K5ZXLZc1HKv8Q7qQq', NULL, '2024-06-01 16:45:49', '2024-06-01 16:45:49'),
('9c2f154f-4cb7-4440-ade2-8db416aafd66', '23645', 'Julianne Bauch', 'mozell.schuster@example.net', NULL, '591 Shane View Apt. 246\nPort Jackelineshire, NY 86183', 'default.jpg', 'mentor', '$2y$10$Y/1yISvaWLeNCWQGH6g1H.5hB9yHJ6f9Q6Uy1jsklNMsV/uac9ilu', NULL, '2024-06-01 16:45:49', '2024-06-01 16:45:49'),
('9c2f154f-67f5-4930-8462-01befcccb20d', '20034', 'Hannah Kemmer', 'cratke@example.com', NULL, '7413 Blick Spurs\nEmardville, IL 81218-6616', 'default.jpg', 'departement', '$2y$10$k2rbcA7Vunem7kurFgsDyOReeZgvFclju8CtvlOw/D0Q8IgFY5XJa', NULL, '2024-06-01 16:45:49', '2024-06-01 16:45:49'),
('9c2f154f-839b-4893-8c45-3df743de5059', '55139', 'Laura Ryan MD', 'chanel.king@example.org', NULL, '4233 Julien Harbors\nCeciliabury, LA 87087-0796', 'default.jpg', 'departement', '$2y$10$8y24JVNGQJ1GTGeFc.50hO9vtJvMY/c3dy28DfvZmdGzZ9KhALnI2', NULL, '2024-06-01 16:45:49', '2024-06-01 16:45:49'),
('9c2f154f-9f1f-494b-95f9-850d480353e5', '32377', 'Ms. Kira Barrows IV', 'jeremy86@example.net', NULL, '146 Imogene Prairie\nKreigerhaven, IL 46844-2778', 'default.jpg', 'departement', '$2y$10$CHM9prHFb7A2KTA8xEN8Reqhwj1kUkXxVLnUzo2JfMT/MOLCDcFNS', NULL, '2024-06-01 16:45:49', '2024-06-01 16:45:49'),
('9c2f154f-bacb-4f7d-8912-2c388bd4321c', '65512', 'Elton Metz', 'lmurphy@example.org', NULL, '95276 Rodolfo Row Suite 741\nBalistreriberg, AL 26407', 'default.jpg', 'departement', '$2y$10$q7ZK8zveM50NaPJui5hz/ONjfOLrz4BxqwEPB1h3KEyARAfvbdPve', NULL, '2024-06-01 16:45:49', '2024-06-01 16:45:49'),
('9c2f154f-d730-4c3d-a0fd-37ed9afc922f', '78024', 'Theresia Bruen', 'eohara@example.org', NULL, '57005 Wisoky Prairie Apt. 673\nPort Zechariah, KY 14304', 'default.jpg', 'departement', '$2y$10$g5Ng7IhPxtBwBvyHwMhXcuiXfHgQwmgoaQbCOZqPsBWYGRSuQyxlG', NULL, '2024-06-01 16:45:49', '2024-06-01 16:45:49'),
('9c2f154f-f232-47fb-bcef-69a1d7bbf9c7', '76479', 'Ms. Alayna Schmeler', 'elwyn45@example.com', NULL, '9955 Jaqueline Lane Suite 678\nNew Dillan, AZ 29061', 'default.jpg', 'departement', '$2y$10$FcqS/WmsJXG5.k2DG53ZBOQAuFgpqyu./yR0afrgQQRiv487hKLpK', NULL, '2024-06-01 16:45:49', '2024-06-01 16:45:49'),
('9c2f1550-0dfb-4f4b-97fc-412368be1e28', '31687', 'Rosalinda Jaskolski', 'hlueilwitz@example.net', NULL, '9980 Chauncey Land Apt. 652\nEast Dustinshire, OR 56515', 'default.jpg', 'departement', '$2y$10$5v00fwVommm0TlEK1h/b9uGyGUcGNZplHZuVfhBQyYD0hCfIh3GwO', NULL, '2024-06-01 16:45:49', '2024-06-01 16:45:49'),
('9c2f1550-2a88-4647-8e80-9a7bf16d7a7d', '82875', 'Mrs. Dana Hermann Sr.', 'kasey65@example.com', NULL, '23082 Alberto Creek Suite 293\nWest Alford, OR 84143', 'default.jpg', 'departement', '$2y$10$vqKwYVKtAccvU97MihCB8OMQLQcUf0RVQpuioHhgWDg8n4Ao0yNhK', NULL, '2024-06-01 16:45:49', '2024-06-01 16:45:49'),
('9c2f1550-4690-4e72-8826-007101539162', '66100', 'Lea Hintz', 'katelynn56@example.net', NULL, '9715 Jovan Fords\nSouth Marilynemouth, NC 59068-3791', 'default.jpg', 'departement', '$2y$10$l6RBAh1kjPCeiC/8FPWX1.VujG9Y2W01ZrDxQoMRyeqhFR5W4LHvi', NULL, '2024-06-01 16:45:49', '2024-06-01 16:45:49'),
('9c2f1550-61fb-4a15-bd97-ef80ef90e07b', '85096', 'Ola Parker', 'barry09@example.net', NULL, '24553 Emil Fork Suite 657\nLake Tony, AK 80701', 'default.jpg', 'departement', '$2y$10$HMEW8CGEWI56CJ7SmfEhkuMg76BmlLoYLN24OUPm.S6unAccCrHkq', NULL, '2024-06-01 16:45:49', '2024-06-01 16:45:49'),
('9c2f1550-7cc7-4106-af75-d83e905c307b', '44213', 'Judd Grimes', 'gpadberg@example.com', NULL, '45778 Hudson Branch Suite 668\nLefflerhaven, CO 98621', 'default.jpg', 'departement', '$2y$10$DqdAZj4EnMas3N.UGZKLbuyRIf009MeBUEZUKHhDX2a9ub3AEL6Lm', NULL, '2024-06-01 16:45:49', '2024-06-01 16:45:49'),
('9c2f1550-9898-4586-8123-f2da3801eae6', '93169', 'Jordan Fay DDS', 'miracle21@example.org', NULL, '3276 Wolf Fall\nLubowitzview, FL 04681-2266', 'default.jpg', 'departement', '$2y$10$gGRQ0OgDXgLSXinnBCpXBuH3AuApdY/6cM8aveXPfwvH8LyJ6LjYO', NULL, '2024-06-01 16:45:49', '2024-06-01 16:45:49'),
('9c2f1550-b416-4393-a9b9-cd0438b52dd3', '70429', 'Syble Effertz', 'lindgren.willow@example.com', NULL, '44665 Jacobs Row\nWest Gwen, TX 05585-0432', 'default.jpg', 'departement', '$2y$10$3d0lV5Kfv45elUniwkBamueQLeTiS0lfLJ/j0X/CMgM7RwSUqF9Iy', NULL, '2024-06-01 16:45:50', '2024-06-01 16:45:50'),
('9c2f1550-cf82-47cd-b8ed-18853507c177', '18611', 'Paolo Hirthe', 'mortiz@example.com', NULL, '73060 Eudora Ramp Suite 214\nNew Cary, WY 69104', 'default.jpg', 'departement', '$2y$10$xOLKpFJbUN3TFJWAjVlDsezMgRjBWA5ZX3GiodARMaJpLvpVUMDEq', NULL, '2024-06-01 16:45:50', '2024-06-01 16:45:50'),
('9c2f1550-ea36-4b9d-9975-fe4653134c4a', '92519', 'Mr. Raymond Casper DVM', 'jkuhic@example.net', NULL, '34095 O\'Keefe Vista\nNorth Bernieville, SC 34525', 'default.jpg', 'departement', '$2y$10$u56vFpHyFb/ayTJ32zkMz.Qf.e6puZl0giRrNylg8Dpgi8gX8PUYG', NULL, '2024-06-01 16:45:50', '2024-06-01 16:45:50'),
('9c2f1551-0636-4d37-b56e-1bfd33db283c', '45747', 'Angelita Nolan', 'jeffry70@example.net', NULL, '2677 Towne Spring\nWalterport, NH 79623', 'default.jpg', 'departement', '$2y$10$0lpsH20dGOz/V0m1THVj2eqUnzkwllbihw4RS2fAD9ZZfjd8CU6GO', NULL, '2024-06-01 16:45:50', '2024-06-01 16:45:50'),
('9c2f1551-2281-408b-be35-60ed55f12038', '34910', 'Kale Shields', 'delphine72@example.org', NULL, '12683 Lavinia Trafficway Apt. 245\nNorth Tiara, MD 04134-1414', 'default.jpg', 'departement', '$2y$10$yjj4v.0OZt802ly4HT/4re9Ce3ZbDVhjVJQXM67nazbHpRcdrRMLq', NULL, '2024-06-01 16:45:50', '2024-06-01 16:45:50'),
('9c2f1551-3f42-4cf1-9a84-fc5db04f2e67', '84631', 'Lavinia Fay', 'yrussel@example.com', NULL, '457 Miller Walks Apt. 426\nPort Helmer, SD 19588', 'default.jpg', 'departement', '$2y$10$vkJwy3M6bfKFzaQSFQDfbeAV.oqAl/C.PVxgOH8vRy/GrxK8byu4G', NULL, '2024-06-01 16:45:50', '2024-06-01 16:45:50'),
('9c2f1551-5a98-498b-ba16-f78af4d73618', '61303', 'Prof. Kamron Upton', 'ziemann.ervin@example.com', NULL, '375 Hettinger View Apt. 271\nNorth Roberto, PA 55118-0831', 'default.jpg', 'departement', '$2y$10$5hV5iv0QTvlq9SbVONiuLOi0pWN04ghLLGEuSih4GGohDZm3wE.py', NULL, '2024-06-01 16:45:50', '2024-06-01 16:45:50'),
('9c2f1551-7624-482a-a3e4-cb71d74e23bc', '61176', 'Loyce Frami', 'marianne.schowalter@example.org', NULL, '8314 Xander Unions\nMadonnaborough, ND 11209', 'default.jpg', 'departement', '$2y$10$IttQKsqUc01QGz5X4aANeOWf9tKPfDJwabyHzEemkHYfn5PB.ZOiy', NULL, '2024-06-01 16:45:50', '2024-06-01 16:45:50'),
('9c2f1551-9046-4116-9966-58792d9dcd0f', '43552', 'Josh O\'Conner', 'bnienow@example.com', NULL, '539 Stella Village\nEast Jaylen, NM 77698', 'default.jpg', 'departement', '$2y$10$tiyHe1KyaZ8.hYQQOuQvxOXfuTc/KNwMo.fdiz4Axp/.T2SMFrZbK', NULL, '2024-06-01 16:45:50', '2024-06-01 16:45:50'),
('9c2f1551-ab83-43d9-81cd-e102404e805f', '81530', 'Allan Stanton', 'waters.zelda@example.com', NULL, '316 Kovacek Avenue\nHipolitoside, MN 38989-4169', 'default.jpg', 'departement', '$2y$10$tLfwofZnuLlFQ/TQXRKiIu2b5dYHjR0Q38EPMHUlG.WiPJKfKFbIu', NULL, '2024-06-01 16:45:50', '2024-06-01 16:45:50'),
('9c2f1551-c62b-467d-b1bb-800536124890', '53317', 'Abbie Nicolas', 'kreiger.amparo@example.net', NULL, '3286 Otto Island\nNorth Marley, NV 37451-5816', 'default.jpg', 'departement', '$2y$10$WvKcMk3ylEddKWMFL6BOK.aeLNeqe7mVMD/oR0aD9O9cQSOKr/k6K', NULL, '2024-06-01 16:45:50', '2024-06-01 16:45:50'),
('9c2f1551-e131-4496-81b0-8b62dbb7a228', '26436', 'Norbert Klein', 'edwardo24@example.org', NULL, '12399 Helene Mission\nWest Adrielberg, SC 91921-0215', 'default.jpg', 'departement', '$2y$10$QlCCvkoE1MTH9eCdO0Nu2uVKu/MOavSkWVTNOZdHSf4Kju95QRwpe', NULL, '2024-06-01 16:45:50', '2024-06-01 16:45:50'),
('9c2f1551-fbaa-42b8-9016-fdd1c1087b38', '81558', 'Cyril Metz', 'pagac.giovanni@example.net', NULL, '965 Kautzer Freeway\nSethbury, WY 72439-5341', 'default.jpg', 'departement', '$2y$10$0zoFp8QmCg98FYQfkwM2we67R/4epJWBOfBpWVm9AIBur8YXSyaSq', NULL, '2024-06-01 16:45:50', '2024-06-01 16:45:50'),
('9c2f1552-191d-4491-a28f-3b96105c529f', '73248', 'Izaiah Hills V', 'malvina.bartell@example.org', NULL, '738 Dillon Mills Suite 282\nNorth Rafaelafort, ID 43447', 'default.jpg', 'departement', '$2y$10$BNM0eBEk6O6rygjtgUQstuemT1gIB6AMnLCdnjMTYXSlRBhm.bCbG', NULL, '2024-06-01 16:45:50', '2024-06-01 16:45:50'),
('9c2f1552-342f-4275-b30c-b4102c500dab', '87114', 'Violet Ryan', 'candice99@example.net', NULL, '5217 Katrina Walk Suite 138\nAlysafort, MD 55422-4516', 'default.jpg', 'departement', '$2y$10$kEZRkal2IRNnQ7/GXBG.4usDt5XGsXbbW3qBhkUJAGSlfUQMTqSba', NULL, '2024-06-01 16:45:51', '2024-06-01 16:45:51'),
('9c2f1552-4e9e-47d2-aa70-fc4f35dd33c9', '41744', 'Jocelyn Effertz', 'cary65@example.net', NULL, '207 Lynch View Apt. 216\nWelchmouth, NY 98177-6946', 'default.jpg', 'departement', '$2y$10$QyjfnOG/TEO1ghTTvi35f.ZRJC0qq99sTTfPrDtGbJJ4yjLfBmOvW', NULL, '2024-06-01 16:45:51', '2024-06-01 16:45:51'),
('9c2f1552-698a-472c-8cf6-78a091c67270', '63386', 'Miss Shanelle Hoppe III', 'buckridge.keshaun@example.net', NULL, '257 Hintz Spurs Suite 988\nPort Macyhaven, CO 37460', 'default.jpg', 'departement', '$2y$10$tn99cLVYg79QmpeYj85wle45RNh0ITuyg3DuXh.LLdDyC.nSVuSMW', NULL, '2024-06-01 16:45:51', '2024-06-01 16:45:51'),
('9c2f1552-840f-4c4a-b8a6-4f638cea07ba', '34734', 'Prof. Paolo Bergnaum II', 'cruickshank.kellie@example.com', NULL, '47760 Lia Key\nSouth Randallbury, DC 75420', 'default.jpg', 'departement', '$2y$10$z7um1igncvVJT2.3.iZTLu9/mtdziB1gXVUY68j9MKVaIlsM7UDsu', NULL, '2024-06-01 16:45:51', '2024-06-01 16:45:51'),
('9c2f1552-9efd-4abc-9ee1-e049cdf49f2b', '92362', 'Lauren Schultz', 'emmalee.ruecker@example.com', NULL, '92257 Hermiston Grove Apt. 943\nDanialport, NY 12834-0494', 'default.jpg', 'departement', '$2y$10$Fn3/Ych0qAbbrjLoki.IauTDuTTfvHOIvF3BW8umehVnDlgtOeSJy', NULL, '2024-06-01 16:45:51', '2024-06-01 16:45:51'),
('9c2f1552-ba2e-4d10-ab62-5f56da838b5d', '64800', 'Prof. Loyce Krajcik DVM', 'bethany.hauck@example.net', NULL, '481 Kris Villages Apt. 001\nDougborough, MD 10945-8354', 'default.jpg', 'departement', '$2y$10$L8qNV.YNbg/GOpGMxN061.a6jdbZuleocQ.YIbFJLcqhVcthjeQ1W', NULL, '2024-06-01 16:45:51', '2024-06-01 16:45:51'),
('9c2f1552-d63a-4b88-b1a2-a2daaf386a6a', '25594', 'Aleen Boyer', 'blaze23@example.org', NULL, '12541 Rempel Point Suite 970\nSchowalterstad, TX 85190-0757', 'default.jpg', 'departement', '$2y$10$TOq9RxTlRgmNuNeUxHzvm.2z/NQmxIsPlPufGo/Akkc8freoTG8/G', NULL, '2024-06-01 16:45:51', '2024-06-01 16:45:51'),
('9c2f1552-f3c2-492d-b986-8052d6de2d5d', '35884', 'Zion Vandervort', 'kozey.collin@example.net', NULL, '408 Adelle Cape Suite 646\nEileenmouth, NE 76687', 'default.jpg', 'departement', '$2y$10$JdYYdRGreDQIDBUDbms2O.tZg6b6pnuYqbk9UMEklgfsYL.QU/MRG', NULL, '2024-06-01 16:45:51', '2024-06-01 16:45:51'),
('9c2f1553-0ff8-4325-b05d-0d9f2b2681d6', '21440', 'Janelle Rohan', 'bogan.carmen@example.org', NULL, '448 Pfeffer Track\nPort Nat, DC 51024', 'default.jpg', 'departement', '$2y$10$3pcDObQtRPC0loDrLMGG/u4hRJHfVEf6h4Jpd4/6XDB9fB9JKDrlG', NULL, '2024-06-01 16:45:51', '2024-06-01 16:45:51'),
('9c2f1553-2a0f-4f5c-9053-5dd77c174099', '63108', 'Miss Clare Lynch I', 'bkautzer@example.org', NULL, '2445 Fae Plaza Apt. 864\nSouth Shemar, MI 36315', 'default.jpg', 'departement', '$2y$10$zyMyIQX.H1UIih40z7yMEuUFiGH2EHUvFBGu8rwG.I8DXgB9Y74hK', NULL, '2024-06-01 16:45:51', '2024-06-01 16:45:51'),
('9c2f1553-4456-497a-a132-4df70e36cbef', '37831', 'Giovani Becker', 'bergstrom.katlyn@example.net', NULL, '28137 Maurice Ramp\nHettingerbury, NC 10828-9701', 'default.jpg', 'departement', '$2y$10$iya/EKSPydgciRvp9.h0tuqBG9mDc07m7Jiv2T5hJnnTGCgdMQoZq', NULL, '2024-06-01 16:45:51', '2024-06-01 16:45:51'),
('9c2f1553-610d-4744-ab63-c519ba6738f3', '29196', 'Emmett Hagenes', 'gkirlin@example.org', NULL, '79967 Abbott Cape Apt. 961\nWest Erneststad, DC 17537', 'default.jpg', 'departement', '$2y$10$reSnlxt/bwJWe/YRTBOAi.QUQ8yyTxKi0ZSTlGUqmMWuwHkPx2FAC', NULL, '2024-06-01 16:45:51', '2024-06-01 16:45:51'),
('9c2f1553-7c79-4a6c-8c1a-0cb960828102', '99103', 'Jacky Kemmer V', 'tanner.hamill@example.net', NULL, '82555 Lang Plaza Apt. 247\nPacochaborough, KS 01076-9012', 'default.jpg', 'departement', '$2y$10$NY0f8Jk1DEldX0CLR7Htg.R9MtJF2Ag7o5fdz2ofkaBu3LUj0MWAS', NULL, '2024-06-01 16:45:51', '2024-06-01 16:45:51'),
('9c2f1553-97a2-4c3e-a874-261eaee3c137', '20975', 'Prof. Jaeden Mills', 'kheaney@example.com', NULL, '6954 Robel Prairie Suite 269\nLake Irwin, CO 18898-8137', 'default.jpg', 'departement', '$2y$10$v4nuhXycD8F//QAqoECN.uFkpPcoaF9A9/fQk8zliq6LAfDoQYzZi', NULL, '2024-06-01 16:45:51', '2024-06-01 16:45:51'),
('9c2f1553-b43b-45f9-9a28-45eb66e77bac', '67953', 'Bobbie Gutmann', 'murazik.reagan@example.org', NULL, '691 Mann Mills Suite 395\nDorothytown, PA 90507-0374', 'default.jpg', 'departement', '$2y$10$Eos6Ejqjqq4DPXtLPrQSROZEgmFw/Uu.oVvTgQIDUxas4QfhxKdXS', NULL, '2024-06-01 16:45:52', '2024-06-01 16:45:52'),
('9c2f1553-d205-402b-9c3f-22177805564d', '54846', 'Jerald Abernathy', 'emmerich.seamus@example.com', NULL, '8202 Salvatore Forest\nEast Arnehaven, WY 96203', 'default.jpg', 'departement', '$2y$10$xTotx9m3/XbL5eS2i2IbReyPNYzVcLpkmMXc14SQiHgoHIBdaQhBu', NULL, '2024-06-01 16:45:52', '2024-06-01 16:45:52'),
('9c2f1553-f42a-422c-b05a-09e8147dc908', '31442', 'Mr. Wilfredo Bosco PhD', 'bogan.raymundo@example.com', NULL, '3219 Bethel Stream Apt. 960\nLake Ona, VT 54838', 'default.jpg', 'departement', '$2y$10$1hdAwfpw2qvpjACkPGZzgubQJ//pzkVKwmZvwjcPick1zzH/3QXbG', NULL, '2024-06-01 16:45:52', '2024-06-01 16:45:52'),
('9c2f1554-1378-4490-96c7-df8696962503', '18422', 'Guadalupe Smith', 'casper.bennie@example.net', NULL, '87008 Kozey Squares Suite 629\nPort Eraview, OR 45130-6079', 'default.jpg', 'departement', '$2y$10$i.WmG/fnSx36CySFnDzXDuZdPXmxkdqWe3/T49aiHcQY8397wgtma', NULL, '2024-06-01 16:45:52', '2024-06-01 16:45:52'),
('9c2f1554-3006-46f7-9f7f-a82ac99bb034', '66929', 'Richard Reichert', 'jameson99@example.org', NULL, '2949 Gutkowski Squares\nNew Britney, NH 56696', 'default.jpg', 'departement', '$2y$10$vudNdzZfSYuffH3ui6fyXeNOk2W4DbzO1p7of5ApxH7YJXgPigZLS', NULL, '2024-06-01 16:45:52', '2024-06-01 16:45:52'),
('9c2f1554-5258-4500-97fd-f956dbbce8b4', '69035', 'Brown Bayer', 'hane.osvaldo@example.com', NULL, '23200 Kacie Roads\nOndrickastad, WV 19201', 'default.jpg', 'departement', '$2y$10$cm/A7Idv6CGXjA27FH8rLuRU09HUNSGGoyEtkq7IUEDM2yaOfmGtC', NULL, '2024-06-01 16:45:52', '2024-06-01 16:45:52'),
('9c2f1554-73d8-43f5-8b04-1b2a6ce90491', '48587', 'Elian VonRueden PhD', 'will.kamren@example.com', NULL, '9641 Kris River\nWest Odie, AK 80246-9047', 'default.jpg', 'departement', '$2y$10$uvtm7zBfEoCL.4wykQJhW.I7j5A0fFjKa/yGrs014q.410Std2zpS', NULL, '2024-06-01 16:45:52', '2024-06-01 16:45:52'),
('9c2f1554-8ef8-4850-9b15-5b9e682fe408', '26934', 'Boris Lebsack', 'eloy.dickinson@example.org', NULL, '87666 Loyce Path Suite 322\nNew Abigalechester, MT 96765', 'default.jpg', 'departement', '$2y$10$SfEhYUn3EGQSlBotu0aLy.PTPG2IVvoY0I6ImKgxMPwS8e55kTFUq', NULL, '2024-06-01 16:45:52', '2024-06-01 16:45:52'),
('9c2f1554-aa87-47c6-a7d4-b5ecd7ca3eaa', '66347', 'Lorenza Fisher', 'albertha36@example.org', NULL, '84208 Homenick Manors Apt. 791\nLake Renetown, SD 81486', 'default.jpg', 'departement', '$2y$10$bwDXFglfrO3fPH3kklehB.0MONcyFvUdJQZ63XmBbkO9fNx1YzB1y', NULL, '2024-06-01 16:45:52', '2024-06-01 16:45:52'),
('9c2f1554-c518-4614-b61b-92c5dca290b9', '54360', 'Isaac Skiles V', 'jesse15@example.com', NULL, '3055 Greenfelder Radial\nWest Leland, OK 64237', 'default.jpg', 'departement', '$2y$10$b3U2Ncyo4neRY08YoiG/7uNqin5oiCXavqhOHSPF18E36ybKFXSSG', NULL, '2024-06-01 16:45:52', '2024-06-01 16:45:52'),
('9c2f1554-e014-48dd-bbda-a303b6b9ba2f', '13325', 'Mr. Keyon Bogan', 'schroeder.josh@example.com', NULL, '8518 Barrows Prairie\nNorth Pauline, CT 40444-5466', 'default.jpg', 'section', '$2y$10$sBLLqZkPyTY9y99BTKZ1guBbf6HcVVHIHMiJLL7li6TDQyw1r53eW', NULL, '2024-06-01 16:45:52', '2024-06-01 16:45:52'),
('9c2f1554-fad4-422b-97dd-60ea634b457c', '62246', 'Bridget Kerluke', 'obecker@example.com', NULL, '6878 Coralie Streets Suite 210\nChasityborough, VA 03137', 'default.jpg', 'section', '$2y$10$2HBQuWE9BgBIsuZud7KcE.oAm5vrcgpc5KhFTNwbrsfkBh0hN59QO', NULL, '2024-06-01 16:45:52', '2024-06-01 16:45:52'),
('9c2f1555-156c-4a5d-9c29-48006af3a7a7', '25889', 'Mrs. Alanna Ziemann II', 'fheathcote@example.org', NULL, '40589 Grant Valleys Suite 180\nElizabethport, GA 67643-5194', 'default.jpg', 'section', '$2y$10$jVt8wdV53IiIuCWRCVBncuSTAelXdbvKbhiwPrGg3osBOKIG1XDpG', NULL, '2024-06-01 16:45:52', '2024-06-01 16:45:52'),
('9c2f1555-3144-4847-8103-6a8ec2daecf8', '90223', 'Dangelo Jacobs', 'verlie96@example.net', NULL, '5782 Irwin Ridge\nSouth Reanna, CO 77492', 'default.jpg', 'section', '$2y$10$ynYVCTpwKJhM.mVnGixxpOpfdhTlS.7Srbx0NVDBwWA6WhwMQz/vi', NULL, '2024-06-01 16:45:53', '2024-06-01 16:45:53'),
('9c2f1555-4c5b-4f97-898b-45f358191977', '96561', 'Vita Lueilwitz IV', 'jlindgren@example.net', NULL, '92785 Dagmar Road Apt. 809\nLake Yasmine, PA 08130', 'default.jpg', 'section', '$2y$10$wFZdyscWtvh.QAK2Cyuw8eIk26Y7MEZFymp0O8L8tXBRJidiDGOSm', NULL, '2024-06-01 16:45:53', '2024-06-01 16:45:53'),
('9c2f1555-6806-4e48-a77b-5eab3e8a131b', '40236', 'Dr. Blaise Feil', 'lance.deckow@example.org', NULL, '3098 Heathcote Cove\nNorth Luisa, MA 90565-3289', 'default.jpg', 'section', '$2y$10$mj2VcYRFOBtgIWkCKfWQn.vm2vy49uZCIuTu/EWOHJckthze6oqBi', NULL, '2024-06-01 16:45:53', '2024-06-01 16:45:53'),
('9c2f1555-836d-4085-a08c-b5ee610f63b0', '42975', 'Josue Murazik', 'shields.maggie@example.com', NULL, '138 Annette Crescent\nPort Edgar, MD 65125-7805', 'default.jpg', 'section', '$2y$10$91tIhtm5nWwyl34UfMzCEe7sWtHS27pQviwyRoagdUSnmv5U6liJu', NULL, '2024-06-01 16:45:53', '2024-06-01 16:45:53'),
('9c2f1555-9eac-4193-b51f-e43a331b18ee', '44589', 'Mrs. Estefania Kling I', 'jaylen93@example.net', NULL, '82541 Kassulke Roads\nNew Sharon, UT 08164', 'default.jpg', 'section', '$2y$10$SjpLs7WMFz0l72zFzoVwleIIcIJfzX5CqT8OFMPslBWmUNpiLG/Va', NULL, '2024-06-01 16:45:53', '2024-06-01 16:45:53'),
('9c2f1555-b98a-4f8b-8420-bf4579e43269', '87465', 'Terrill Douglas V', 'kcasper@example.com', NULL, '10085 Kessler Mall\nElfriedaville, HI 61429', 'default.jpg', 'section', '$2y$10$TcAEp.eJV9P9o8X50DHR7.YP3.beJJOEC7mYm6TW5Mk2xFHa/Oyx.', NULL, '2024-06-01 16:45:53', '2024-06-01 16:45:53'),
('9c2f1555-d4a3-4ed2-b381-c02b6e1704e1', '43863', 'Lee Gaylord', 'vhuels@example.org', NULL, '558 Lindgren Throughway Suite 380\nPort Corneliuston, GA 03724', 'default.jpg', 'section', '$2y$10$j3tlNpV7xc9ojhoJsxcBa.3SOVKPViIs4X17QI.8uXW22SZurbiCO', NULL, '2024-06-01 16:45:53', '2024-06-01 16:45:53'),
('9c2f1555-ef2c-4c64-80f5-9fd0841aae18', '93762', 'Kiera Leffler I', 'turner.emmanuelle@example.org', NULL, '403 Olson Meadows Apt. 949\nEthelynborough, DC 48848-3954', 'default.jpg', 'section', '$2y$10$XSYtprYQJguckcKdok2oEON6fZJYA7D3koDCHD8YF46Ou9Eh0VJ6y', NULL, '2024-06-01 16:45:53', '2024-06-01 16:45:53');
INSERT INTO `users` (`id`, `nomor_induk`, `nama`, `email`, `email_verified_at`, `alamat`, `foto_profile`, `role`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
('9c2f1556-09f4-4c1d-a267-9e07d689a177', '89255', 'Althea Hackett', 'xosinski@example.org', NULL, '956 Robel Radial Suite 503\nWest Cortez, PA 57799', 'default.jpg', 'section', '$2y$10$NvYN0dE1yjx0G5lqGrUKj.AJj06HY52pZYput5tzAe9roGDcPqMHC', NULL, '2024-06-01 16:45:53', '2024-06-01 16:45:53'),
('9c2f1556-24e0-4a19-bfb5-c312e234966f', '43827', 'Jaycee Hettinger', 'liza.boyer@example.com', NULL, '702 Laury Meadow\nEast Jaiden, OK 97566', 'default.jpg', 'section', '$2y$10$4Pt/FDDimMWQKZjo6z8Gx.dH4s/jfavPO45dN17Tx9HXRAuUkXaJ6', NULL, '2024-06-01 16:45:53', '2024-06-01 16:45:53'),
('9c2f1556-3f43-4182-b7eb-fd57adfaf5d8', '13526', 'Ms. Florine Runolfsson III', 'fkemmer@example.net', NULL, '26213 Rickie Gateway Suite 484\nSouth Lazaro, NJ 62486-4821', 'default.jpg', 'section', '$2y$10$qOQ831.Py32/HIzUNvv3KeajcH.aa2OgpiAE8orHKZ3nJ921UrIpm', NULL, '2024-06-01 16:45:53', '2024-06-01 16:45:53'),
('9c2f1556-5c83-4526-b6ee-cb94bbe785db', '29612', 'Dr. Luigi Paucek Sr.', 'robin55@example.org', NULL, '1864 Stiedemann Springs\nLondonshire, ND 96081-1379', 'default.jpg', 'section', '$2y$10$9R4zCttAmhmXTZl06PDsAeRQfOd1vmdvXgrARbW3rb6YtH3ZgfZQ.', NULL, '2024-06-01 16:45:53', '2024-06-01 16:45:53'),
('9c2f1556-775a-43b6-9f81-d92fd1741c02', '87544', 'Carmela Douglas', 'johnson.curt@example.net', NULL, '470 Sauer Roads Suite 344\nNew Jazlyn, AK 34714', 'default.jpg', 'section', '$2y$10$B1d7IQJ9Gz/NNTZ2w/rOf.s05LzAQNDwx6vZSXIA/HdsN6d6okR0y', NULL, '2024-06-01 16:45:53', '2024-06-01 16:45:53'),
('9c2f1556-9247-46a7-a1b2-a648d40fd879', '95280', 'Alexandrea Barton', 'samara00@example.org', NULL, '8554 O\'Keefe Expressway\nEast Margaretta, AK 77274', 'default.jpg', 'section', '$2y$10$dydpf92JNo5z/pL7VoZW7uiFNNDTTR/rI0T8VSTbTrz5KYWyYm96K', NULL, '2024-06-01 16:45:53', '2024-06-01 16:45:53'),
('9c2f1556-aee5-495f-aea9-d2b390589be3', '88386', 'Constantin Ruecker', 'daphnee33@example.org', NULL, '76086 Garrick Villages\nErdmantown, MA 50160', 'default.jpg', 'section', '$2y$10$5wyNhxC70QFcmFq87ycu7.1rWrNLzMQvYwRBEEcaobsiHunn3o8gK', NULL, '2024-06-01 16:45:53', '2024-06-01 16:45:53'),
('9c2f1556-c9c7-4d4f-ac09-b85ab8038cd9', '65745', 'Veronica Weissnat', 'iemmerich@example.net', NULL, '453 Connie Islands\nPort Ilene, MD 70739-5242', 'default.jpg', 'section', '$2y$10$vCKBxvoqlOc/8DOeEqM/8uu/7YiOvujZEisS8R3Q0j7lUu5nTnGp6', NULL, '2024-06-01 16:45:54', '2024-06-01 16:45:54'),
('9c2f1556-e406-469e-8812-cce1358e02fa', '41523', 'Mrs. Georgianna Goldner II', 'justen.steuber@example.net', NULL, '60382 Satterfield Greens Apt. 688\nBonitaport, CO 98061', 'default.jpg', 'section', '$2y$10$tiw2PAvhpgCwOxijIDX8YumE/efOAJ8y1FbmXEC7qTsco/N7QXtbG', NULL, '2024-06-01 16:45:54', '2024-06-01 16:45:54'),
('9c2f1556-fe4b-498d-9864-46f76360b032', '15394', 'Chester Boyle', 'ydurgan@example.com', NULL, '77513 Jean Park\nAugustusfurt, WA 48599-3506', 'default.jpg', 'section', '$2y$10$AUJIQrfsrDrrs7g72eJ5seBKWcno1ruB67U24S8G3L7MEsDIdiOy6', NULL, '2024-06-01 16:45:54', '2024-06-01 16:45:54'),
('9c2f1557-1a02-44fa-93ff-0f26a955aa77', '67552', 'Kole Welch', 'otho.lubowitz@example.org', NULL, '385 Baby Valleys Apt. 549\nWest Joshuahmouth, MS 41235-6730', 'default.jpg', 'section', '$2y$10$0t8gxSPvkJu4KV6iRXlZfeLIrBC6z8fQlLEUja/gEpbXZWOopWURe', NULL, '2024-06-01 16:45:54', '2024-06-01 16:45:54'),
('9c2f1557-35be-4938-89b9-6a1f1b445ccc', '92683', 'Sabrina Boehm', 'jordyn.kilback@example.net', NULL, '280 Williamson Mountain Suite 070\nWest Kendall, OH 40128-1977', 'default.jpg', 'section', '$2y$10$7GoOzterMO6foxOD2P40r.qImcbGccASiob6uH2A3GsBjG8QfLgxW', NULL, '2024-06-01 16:45:54', '2024-06-01 16:45:54'),
('9c2f1557-50ba-42a6-a570-cf33064ed1c4', '90626', 'Freddie Rutherford', 'effertz.marques@example.org', NULL, '2587 Jordon Islands\nDomingofurt, GA 15599', 'default.jpg', 'section', '$2y$10$hIMlBtQbJ5lhIEy822sls./SEzV0Z2PafXz6vec0pYJexc6oiDGQG', NULL, '2024-06-01 16:45:54', '2024-06-01 16:45:54'),
('9c2f1557-6b29-4cbc-ae23-d5b13ce7bc80', '67373', 'Prof. Gavin Koelpin Jr.', 'macejkovic.elouise@example.org', NULL, '97704 Stokes Way Suite 840\nBaileytown, NY 95381-1320', 'default.jpg', 'section', '$2y$10$8Nw37kzcrOpxQHBdreVKUOSHYNmhJugYCbJbfqeQVNspbmC4bMD0K', NULL, '2024-06-01 16:45:54', '2024-06-01 16:45:54'),
('9c2f1557-85ca-48e7-b002-65c356cd20a8', '80966', 'Christa Howe', 'muriel87@example.org', NULL, '95271 Jonathan Rue Apt. 154\nBinshaven, AL 91959', 'default.jpg', 'section', '$2y$10$1HgA0XzN5X7gboMQwxbtmO7LYDt12598e0MCXYSFh5Wk.lJ3mdySa', NULL, '2024-06-01 16:45:54', '2024-06-01 16:45:54'),
('9c2f1557-a11c-4890-bb81-daf618f450aa', '45509', 'Maude Sanford', 'eleanore09@example.net', NULL, '97867 Tracey Villages\nWest Camillechester, MD 26325', 'default.jpg', 'section', '$2y$10$gpMEDQqAp89PHF9ETl5V5.VZiP61IGzGE.DUDogLKXNfHDGAGBA.q', NULL, '2024-06-01 16:45:54', '2024-06-01 16:45:54'),
('9c2f1557-bc8a-4a93-a64a-51767df88fc0', '66461', 'Lenore Swift', 'anabel.gislason@example.net', NULL, '37045 Lottie Parkway\nEast Floyd, DC 68999-8479', 'default.jpg', 'section', '$2y$10$OtPy.jqIwT9XRc8HCBoeleY90slkKX.CfpwESOd0.hIHToRLMzggG', NULL, '2024-06-01 16:45:54', '2024-06-01 16:45:54'),
('9c2f1557-d80f-40ad-ad7f-e21929256333', '41306', 'Brendon Ortiz', 'joel.hackett@example.com', NULL, '94136 Blanda Loaf\nNew Jaidenmouth, MI 41418', 'default.jpg', 'section', '$2y$10$6W8KMP2sTaPDtc3HxA8zt.6/rMY34967MhZKjARjXDHd/pbt9TMsG', NULL, '2024-06-01 16:45:54', '2024-06-01 16:45:54'),
('9c2f1557-f31e-41aa-a8c3-a91b2ef51590', '79249', 'Sydnee Ward', 'deangelo.reilly@example.com', NULL, '55691 Lucile River\nSouth Jewell, KS 11980-7025', 'default.jpg', 'section', '$2y$10$AdCw10qSezZrXvB7llz.vuvlNBVBILXcmslA3Eyty8chy4CTz.HsS', NULL, '2024-06-01 16:45:54', '2024-06-01 16:45:54'),
('9c2f1558-0e8b-47cc-8d71-da0cea49f4d0', '79626', 'Shanny Schinner', 'cheller@example.net', NULL, '5807 Monte Walks\nStantonland, KS 63220-1629', 'default.jpg', 'section', '$2y$10$BgQP910QK12NmiXRuRmtcuvksp4ok8Rzj1J7Cgmo9qOmhXiBkvhXi', NULL, '2024-06-01 16:45:54', '2024-06-01 16:45:54'),
('9c2f1558-2a1d-4379-a300-14c28dc68ac8', '99625', 'Kiley Connelly Jr.', 'kylee.rowe@example.com', NULL, '91856 Sister Corner\nRodriguezberg, NM 05374', 'default.jpg', 'section', '$2y$10$30XhPdipfibBcFfNW6J.i.cF1v1d0.D2YK6JbrTmCGz99/NMsqW/m', NULL, '2024-06-01 16:45:54', '2024-06-01 16:45:54'),
('9c2f1558-4584-48a3-b5ea-cdba4d166995', '14510', 'Jaylen Marks', 'winnifred.bergnaum@example.net', NULL, '33474 Weissnat Locks Apt. 511\nHuelfort, TX 23620-9285', 'default.jpg', 'section', '$2y$10$af0wRxdAQwJmywnHGipbv.4S8lDV0Wp2seXnGzW1gorsMj6blvm7m', NULL, '2024-06-01 16:45:55', '2024-06-01 16:45:55'),
('9c2f1558-60cd-4396-ab7e-29961cacfd7e', '19117', 'Celestine Wintheiser', 'newell.wolff@example.com', NULL, '31923 Stanton Brooks\nWest Marc, KY 73751-8829', 'default.jpg', 'section', '$2y$10$w0G9EtuOFVH/fHYGJwUmJulWMEBwfQK.3sc5djVCvWTFkO9m7lucq', NULL, '2024-06-01 16:45:55', '2024-06-01 16:45:55'),
('9c2f1558-7ced-487c-b231-e2d3d37baa23', '85385', 'Jordyn Cole', 'moen.dorthy@example.net', NULL, '4738 Weimann Wells Suite 063\nEvalynbury, VT 45931-9049', 'default.jpg', 'section', '$2y$10$G4cJKBqfsptAc84Pjt35quo7w7mKAyu5Xkf13mTsV5r2pYYx.EC1e', NULL, '2024-06-01 16:45:55', '2024-06-01 16:45:55'),
('9c2f1558-97e0-4365-bdfd-91388cb1bf1b', '30493', 'Rosamond Bergnaum', 'mae.koss@example.com', NULL, '63427 Felipa Lakes\nEast Aliviafurt, PA 71208-8343', 'default.jpg', 'section', '$2y$10$gixABhHKoyrqbTueFlBIpOpC0PAFdAECJF4z7CV59A2JWTz4YCKIq', NULL, '2024-06-01 16:45:55', '2024-06-01 16:45:55'),
('9c2f1558-b36d-4eac-9f14-81b8235a8d08', '74883', 'Kendall Tillman', 'elliott.wehner@example.com', NULL, '443 Waters Creek Suite 278\nLake Billy, NE 26921', 'default.jpg', 'section', '$2y$10$kW5prkUIuXXOljtrFoRCk.XI2TBKWw8blCIl9jOX4KnLlKStjOxle', NULL, '2024-06-01 16:45:55', '2024-06-01 16:45:55'),
('9c2f1558-d012-4532-b875-6a8706314fc4', '24893', 'Florine Mraz', 'hcarroll@example.org', NULL, '736 McLaughlin Course Apt. 985\nNorth Carmellaside, IN 36455', 'default.jpg', 'section', '$2y$10$9IFBFHhW/rA0QCJv2nxfx.9osvwo3jde9nVJDj5kVPdol2cEOQ6Cu', NULL, '2024-06-01 16:45:55', '2024-06-01 16:45:55'),
('9c2f1558-ebb5-4358-8fdd-0c1811f64ae9', '13732', 'Favian Deckow', 'ecormier@example.net', NULL, '926 Skyla Orchard Apt. 482\nLake Anissa, MD 83376', 'default.jpg', 'section', '$2y$10$dntkOutfpu9Az1/.xQRAq.btHIXicmkkG4P/1905SjdyPBB5bchu6', NULL, '2024-06-01 16:45:55', '2024-06-01 16:45:55'),
('9c2f1559-0750-42e0-9a39-53b90b791286', '33538', 'Marisol Abshire', 'alexie55@example.com', NULL, '676 Torp Branch Apt. 324\nPort Madilynberg, CO 10297-8186', 'default.jpg', 'section', '$2y$10$BKOGcJ9tiWMLakFbbs5.s.veN5ZuQZ6rQN5sPC3EKLMl5Wo4ppEvy', NULL, '2024-06-01 16:45:55', '2024-06-01 16:45:55'),
('9c2f1559-237f-4912-b5da-412ccd6c2d71', '86737', 'Prof. Lupe Wisozk', 'edooley@example.net', NULL, '606 Emard Fords\nWittingborough, CT 78723-0006', 'default.jpg', 'section', '$2y$10$NoptPyQmdY8gWOQjw6zGo.3BJnrP4/LPLEfzq.6vqoYjwrWkk5wte', NULL, '2024-06-01 16:45:55', '2024-06-01 16:45:55'),
('9c2f1559-3f89-45a3-902b-02906d880844', '15355', 'Don McGlynn', 'lucas18@example.com', NULL, '531 Ardella Alley\nMullerport, IL 50093-7827', 'default.jpg', 'section', '$2y$10$z6hHAdqaBsb35kAp17ahjuTagVus6E7N4LFklrRvYvTrb3.YAOSxG', NULL, '2024-06-01 16:45:55', '2024-06-01 16:45:55'),
('9c2f1559-5cab-49a3-9436-bbb4c1f5b5bb', '81854', 'Mr. Seth Jakubowski', 'icruickshank@example.org', NULL, '873 Yvonne Mountains\nBeverlyview, SD 97346-1413', 'default.jpg', 'section', '$2y$10$52FxrQrdvPtFdBA7NSFpvuXGAVU3SdAWvilldocY7h/9yE2vRzhHq', NULL, '2024-06-01 16:45:55', '2024-06-01 16:45:55'),
('9c2f1559-793f-478a-a9ec-061314808cfc', '74919', 'Micaela Corwin PhD', 'tomas67@example.org', NULL, '5580 Willms Plains\nDorisview, CO 55115', 'default.jpg', 'section', '$2y$10$bRhjCM2i20lScD2Ry46nl.tBxVwrlBjACvgAaSICgpCy88IhLBMY6', NULL, '2024-06-01 16:45:55', '2024-06-01 16:45:55'),
('9c2f1559-953a-4860-9094-b09a47c042ae', '54364', 'Russell Hirthe', 'emely.cronin@example.com', NULL, '3940 Marquardt Well\nLangshire, DC 41260', 'default.jpg', 'section', '$2y$10$VVCipbw5WtTke8pWeOqjDOjYmusTll8vrdWgjSad5x3vLrBDp2lOy', NULL, '2024-06-01 16:45:55', '2024-06-01 16:45:55'),
('9c2f1559-b0be-4656-b9eb-a065f2d17d91', '66515', 'Abe Mayer', 'ukeebler@example.com', NULL, '461 Champlin Glen\nEmmerichtown, IL 48297-8491', 'default.jpg', 'section', '$2y$10$z3Yw.gaFzTUXMLfoTmDIIOD7dhNxIo3.p6EVaHqWqV0ivRG5EcUGa', NULL, '2024-06-01 16:45:55', '2024-06-01 16:45:55'),
('9c2f1559-cd0c-4e3f-9145-9824227493eb', '16097', 'Adolphus Moen V', 'kattie57@example.com', NULL, '32469 Lulu Mission Suite 034\nNew Dorcasberg, OR 73150', 'default.jpg', 'section', '$2y$10$Si1wFXmGKHHbgQHM7dLNquHUdWTas3xY8o2CQ/e5Wl1u12AmT9c2u', NULL, '2024-06-01 16:45:56', '2024-06-01 16:45:56'),
('9c2f1559-e943-480f-87fd-ac4b983cb8b5', '80157', 'Gerhard Gaylord', 'jalyn.streich@example.org', NULL, '44756 Vern Lakes\nLake Faustinoton, NC 76975-7801', 'default.jpg', 'section', '$2y$10$R/tIM9AETIglkBWoL7LBD.qxAeiyjNEwJacMECJw26TSV9eO.A1OO', NULL, '2024-06-01 16:45:56', '2024-06-01 16:45:56'),
('9c2f155a-058a-4081-bcc1-2d07068de40b', '24540', 'Nakia Stoltenberg MD', 'bell64@example.com', NULL, '518 Yundt Haven\nPort Nakia, WI 05205-5565', 'default.jpg', 'section', '$2y$10$H34TjY13RG7Q.25A8GammuOejnNpkv3o6Ly7VFnaJGvzsEYW8.nC6', NULL, '2024-06-01 16:45:56', '2024-06-01 16:45:56'),
('9c2f155a-21cc-4711-8664-41afe6844802', '60851', 'Tyrique Kertzmann', 'haley.brisa@example.net', NULL, '90592 Kiley Course\nAricborough, NH 44378-2194', 'default.jpg', 'section', '$2y$10$MYblIXFLJjhDQ8s5xJnQJOH46TFh0k3mfjo4StRC8TmqbtZhujmnK', NULL, '2024-06-01 16:45:56', '2024-06-01 16:45:56');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `absensi_mahasiswa_id_foreign` (`mahasiswa_id`);

--
-- Indeks untuk tabel `departements`
--
ALTER TABLE `departements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departements_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dosen_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `evaluasi_empat_bulan`
--
ALTER TABLE `evaluasi_empat_bulan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluasi_empat_bulan_absensi_id_foreign` (`absensi_id`),
  ADD KEY `evaluasi_empat_bulan_departement_id_foreign` (`departement_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `logbook`
--
ALTER TABLE `logbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logbook_mahasiswa_id_foreign` (`mahasiswa_id`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mahasiswa_user_id_foreign` (`user_id`),
  ADD KEY `mahasiswa_mentor_id_foreign` (`mentor_id`),
  ADD KEY `mahasiswa_dosen_id_foreign` (`dosen_id`);

--
-- Indeks untuk tabel `mentors`
--
ALTER TABLE `mentors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mentors_user_id_foreign` (`user_id`),
  ADD KEY `mentors_section_id_foreign` (`section_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `parafs`
--
ALTER TABLE `parafs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parafs_mentor_id_foreign` (`mentor_id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengajuan_mentors`
--
ALTER TABLE `pengajuan_mentors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengajuan_mentors_mahasiswa_id_foreign` (`mahasiswa_id`),
  ADD KEY `pengajuan_mentors_mentor_pertama_foreign` (`mentor_pertama`),
  ADD KEY `pengajuan_mentors_mentor_kedua_foreign` (`mentor_kedua`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_user_id_foreign` (`user_id`),
  ADD KEY `sections_departement_id_foreign` (`departement_id`);

--
-- Indeks untuk tabel `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploads_mahasiswa_id_foreign` (`mahasiswa_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `absensi_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `departements`
--
ALTER TABLE `departements`
  ADD CONSTRAINT `departements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `evaluasi_empat_bulan`
--
ALTER TABLE `evaluasi_empat_bulan`
  ADD CONSTRAINT `evaluasi_empat_bulan_absensi_id_foreign` FOREIGN KEY (`absensi_id`) REFERENCES `absensi` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluasi_empat_bulan_departement_id_foreign` FOREIGN KEY (`departement_id`) REFERENCES `departements` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `logbook`
--
ALTER TABLE `logbook`
  ADD CONSTRAINT `logbook_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_dosen_id_foreign` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mahasiswa_mentor_id_foreign` FOREIGN KEY (`mentor_id`) REFERENCES `mentors` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mahasiswa_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mentors`
--
ALTER TABLE `mentors`
  ADD CONSTRAINT `mentors_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mentors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `parafs`
--
ALTER TABLE `parafs`
  ADD CONSTRAINT `parafs_mentor_id_foreign` FOREIGN KEY (`mentor_id`) REFERENCES `mentors` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengajuan_mentors`
--
ALTER TABLE `pengajuan_mentors`
  ADD CONSTRAINT `pengajuan_mentors_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_mentors_mentor_kedua_foreign` FOREIGN KEY (`mentor_kedua`) REFERENCES `mentors` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_mentors_mentor_pertama_foreign` FOREIGN KEY (`mentor_pertama`) REFERENCES `mentors` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_departement_id_foreign` FOREIGN KEY (`departement_id`) REFERENCES `departements` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sections_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `uploads`
--
ALTER TABLE `uploads`
  ADD CONSTRAINT `uploads_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
