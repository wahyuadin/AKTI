-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jun 2024 pada 16.32
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
('9c4707d9-896b-4362-b92d-2b1cc856c498', '9c4702bc-e5f8-4b8b-968f-6aca1e90ee47', 'hadir', 'Absen Pulang', 'pulang', 'pulang tepat', 'playstation_588258.png', 'Kamis, 13 Juni 2024 | 21:28:03', '06', '2024-06-13 14:28:03', '2024-06-13 14:28:03');

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
('8ec15373-298e-11ef-b4cb-089798ebee9e', '9c470089-d624-450c-af54-2ab3888977d7', 'Warehouse', 'Karawang', '2024-06-13 14:08:59', '2024-06-13 14:08:59');

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
('03cd41b6-298f-11ef-b4cb-089798ebee9e', '9c47008a-0b9e-4af6-bfb2-bf4020f65d78', 'Teknik Informatika', '2024-06-13 14:12:27', '2024-06-13 14:12:27');

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
('9c470313-523a-4e63-9979-5b2143511d44', '9c4702bc-e5f8-4b8b-968f-6aca1e90ee47', '3', 'June', '1718288082.jpg', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Accusantium quibusdam error odio sit aut, quaerat molestiae, cupiditate saepe iusto consequuntur enim corporis debitis aliquid ex. Ducimus a odio minus! Quia, dolor dolorum consectetur unde facere necessitatibus laborum quaerat sunt ratione provident placeat, quisquam eum minus modi tempore! Ipsa harum dolores, nostrum maxime optio sequi officiis dolorem voluptatum nihil eligendi dignissimos dolore hic cupiditate ut quidem facere eaque modi ullam explicabo voluptatem. Quod vitae deserunt eaque totam. Veritatis ea voluptas odio et, aut illum quod exercitationem numquam, nemo qui, quae non. Ducimus excepturi vel quo eius. Odio enim iure minima magni?', NULL, NULL, NULL, NULL, NULL, '4', NULL, NULL, 'pending', '2024-06-13 14:14:42', '2024-06-13 14:14:42'),
('9c470334-996a-444b-a8c1-1b726733ca34', '9c4702bc-e5f8-4b8b-968f-6aca1e90ee47', '3', 'June', NULL, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Animi, eaque!', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 'pending', '2024-06-13 14:15:03', '2024-06-13 14:15:03'),
('9c470388-721b-4325-ae22-94c07e32f7df', '9c4702bc-e5f8-4b8b-968f-6aca1e90ee47', '3', 'June', '1718288158.jpeg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestiae, ipsum maiores veniam provident eum corporis quo recusandae expedita unde velit nam quisquam consectetur rem quaerat in excepturi tempora quis similique?', NULL, NULL, NULL, NULL, NULL, '3', NULL, NULL, 'pending', '2024-06-13 14:15:58', '2024-06-13 14:15:58'),
('9c47046c-aea1-4a3c-84d7-be9ce47833c4', '9c4702bc-e5f8-4b8b-968f-6aca1e90ee47', '3', 'June', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestiae, ipsum maiores veniam provident eum corporis quo recusandae expedita unde velit nam quisquam consectetur rem quaerat in excepturi tempora quis similique?', NULL, NULL, NULL, NULL, NULL, '4', NULL, NULL, 'reject', '2024-06-13 14:18:28', '2024-06-13 14:22:32'),
('9c470493-d3ed-403e-a8a3-27518ac19695', '9c4702bc-e5f8-4b8b-968f-6aca1e90ee47', '3', 'June', NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestiae, ipsum maiores veniam provident eum corporis quo recusandae expedita unde velit nam quisquam consectetur rem quaerat in excepturi tempora quis similique?', 'ok', 'ok', 'ok', 'ok', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestiae, ipsum maiores veniam provident eum corporis quo recusandae expedita unde velit nam quisquam consectetur rem quaerat in excepturi tempora quis similique?', '3', '4', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestiae, ipsum maiores veniam provident eum corporis quo recusandae expedita unde velit nam quisquam consectetur rem quaerat in excepturi tempora quis similique?', 'accept', '2024-06-13 14:18:54', '2024-06-13 14:19:52');

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
('9c4702bc-e5f8-4b8b-968f-6aca1e90ee47', '9c470089-8234-4926-b098-ffedd7c715b1', '9c4701aa-5e9b-4828-9bbc-42075352e0d0', '03cd41b6-298f-11ef-b4cb-089798ebee9e', 88, 16, 'Perkantoran', 'LAB', '1', 'Admin', 'white', '2024-06-13 14:13:45', '2024-06-13 14:13:45');

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
('9c4701aa-5e9b-4828-9bbc-42075352e0d0', '9c470089-9f40-4efd-be2c-ec8ed5b139d4', 'af491a21-298e-11ef-b4cb-089798ebee9e', '0876726452', 'Jamaludin Indra', '2024-06-13 14:10:45', '2024-06-13 14:10:45');

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
('9c4704ec-db61-4425-baf0-78d7c1594528', '9c4701aa-5e9b-4828-9bbc-42075352e0d0', '1718288392.png', '2024-06-13 14:19:52', '2024-06-13 14:19:52');

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
('af491a21-298e-11ef-b4cb-089798ebee9e', '9c470089-f13b-4e54-894f-ad668f5e03a5', '8ec15373-298e-11ef-b4cb-089798ebee9e', 'Head', '2024-06-13 14:09:47', '2024-06-13 14:09:47');

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
('9c470089-8234-4926-b098-ffedd7c715b1', '123456', 'Prof. Llewellyn Gutkowski Jr.', 'ngerlach@example.com', NULL, '8184 Lindsey Union\nAbigalechester, GA 43791', 'default.jpg', 'mahasiswa', '$2y$10$1rfxDVHH3YF772QgqMYkKeopoQOB/gjmi3LBf4akFxZv3ikCyCQTy', NULL, '2024-06-13 14:07:36', '2024-06-13 14:07:36'),
('9c470089-9f40-4efd-be2c-ec8ed5b139d4', '11223344', 'Kelton Koch II', 'wilkinson.peter@example.com', NULL, '922 Evelyn Hill\nCorkeryburgh, NV 58159', 'default.jpg', 'mentor', '$2y$10$S9A6FeHT0xdjRTiCCtKo1uEaT.7JTiMqn41K.tun0OI7DcHzA9G7K', NULL, '2024-06-13 14:07:36', '2024-06-13 14:07:36'),
('9c470089-ba90-4325-9815-6afe18100c16', '2024', 'Cory Yost', 'cathryn.moen@example.com', NULL, '3703 Pouros Mountains Apt. 143\nEmardstad, CA 31205-5659', 'default.jpg', 'admin', '$2y$10$q0WLXuxCJDjGtQ8RdTftqeqr6al6B5UTTc3Lpf2tbwhULMNIt40OO', NULL, '2024-06-13 14:07:36', '2024-06-13 14:07:36'),
('9c470089-d624-450c-af54-2ab3888977d7', '111222333444', 'Nico Witting', 'tlehner@example.net', NULL, '2324 Ward Estates Apt. 567\nEstebanbury, ND 94271', 'default.jpg', 'departement', '$2y$10$OyXk4XpPiZWWIKoxb.n9m.wxlH.0HEtX55b2rVDj4DLF5JscQ8jOq', NULL, '2024-06-13 14:07:36', '2024-06-13 14:07:36'),
('9c470089-f13b-4e54-894f-ad668f5e03a5', '121212', 'Mrs. Emely Casper', 'ibauch@example.net', NULL, '665 Goodwin Harbor Apt. 366\nBrandibury, TX 53738', 'default.jpg', 'section', '$2y$10$I0G9Z7A/6Hq/rQPJBRr.Hud6SVFgbEORjTcESliog5ktOvfpsoIZ2', NULL, '2024-06-13 14:07:36', '2024-06-13 14:07:36'),
('9c47008a-0b9e-4af6-bfb2-bf4020f65d78', '131313', 'Kayla Treutel', 'bratke@example.com', NULL, '51382 Karlie Lodge\nLilianafort, AR 79993', 'default.jpg', 'dosen', '$2y$10$Kw8vhkZjiyb5PuAjVrgEye2pjvXYHpOMjrhTJDDuHDofLTmpdQLsW', NULL, '2024-06-13 14:07:36', '2024-06-13 14:07:36'),
('9c47008a-2705-4011-bef0-f1436ad69b4f', '63448', 'Prof. Brycen Cole', 'cordelia44@example.net', NULL, '58360 Penelope Square Apt. 540\nSouth Karlimouth, ME 50007', 'default.jpg', 'mahasiswa', '$2y$10$liNkpb.s0VspkzGw45EFnuwd3a5YeB553InYqXFmh3N3HqOwK4bG2', NULL, '2024-06-13 14:07:36', '2024-06-13 14:07:36'),
('9c47008a-444f-488c-a6aa-0589dcc4f121', '20950', 'Mr. Modesto Orn V', 'mertz.emily@example.com', NULL, '146 Fermin Hill Apt. 074\nJohannland, AK 67015-5108', 'default.jpg', 'mahasiswa', '$2y$10$x5y5kZIQpNr3KaMIUmy8MeN4JazYXjUjn6nB0T8XP3u4GWUJc4kmy', NULL, '2024-06-13 14:07:36', '2024-06-13 14:07:36'),
('9c47008a-60a8-4dbd-b2d8-95394e45dae3', '25440', 'Lawrence Okuneva', 'darwin.hoppe@example.com', NULL, '259 McDermott Hills\nEast Lola, CT 11911', 'default.jpg', 'mahasiswa', '$2y$10$QL32pEKJ0DBZfFHVRZVB6uZM6vXHURmdmlmaA2LayZQZqX0B0GXl.', NULL, '2024-06-13 14:07:36', '2024-06-13 14:07:36'),
('9c47008a-81b0-489b-a8f9-d9435749cf9e', '62336', 'Retha Torphy I', 'daniel.jules@example.com', NULL, '67254 Bethel Stravenue Apt. 890\nLeonelmouth, MT 29487', 'default.jpg', 'mahasiswa', '$2y$10$osh67ew.31KWFKDtB8RDNuwTszhp2YgwDvWpnOcVsFEPt51OaOyKy', NULL, '2024-06-13 14:07:36', '2024-06-13 14:07:36'),
('9c47008a-9e0b-4b52-b11a-458f9a95fa08', '53647', 'Ms. Lou Pouros', 'abel.ondricka@example.com', NULL, '62265 Koelpin Mills\nCelineshire, MN 06379-0385', 'default.jpg', 'mahasiswa', '$2y$10$7PCueS3z731Q1gr0cqUKqeA.4jxgctfmkxJmSlBTQoY5r0Q0J4wJq', NULL, '2024-06-13 14:07:36', '2024-06-13 14:07:36'),
('9c47008a-bc1d-4b0c-8cd8-40a54966b6dc', '41157', 'Dean Ferry III', 'ydare@example.com', NULL, '4082 Helga Brooks Apt. 103\nEast Verdaville, CA 32750-6933', 'default.jpg', 'mahasiswa', '$2y$10$Bq.Qtzv9tHXM797MEUAUpeZeqty/neyFIzLvg8aHTyyd7hpShUR8i', NULL, '2024-06-13 14:07:37', '2024-06-13 14:07:37'),
('9c47008a-d6c4-4e23-a4ed-5390c59776a9', '97721', 'Bethel Spencer II', 'bryce35@example.org', NULL, '54506 Rashad Lakes Apt. 741\nEast Lauryshire, NE 65570-8615', 'default.jpg', 'mahasiswa', '$2y$10$z71p0BfyqrdEvIrB6n8hR.4bJiVL8gWMNE7s20IPj1ZbJFrx49bMi', NULL, '2024-06-13 14:07:37', '2024-06-13 14:07:37'),
('9c47008a-f1f7-4f10-9177-e8b30cd4c28b', '57101', 'Devon Pouros', 'ypurdy@example.org', NULL, '9510 Wiegand Mountains Apt. 316\nWest Noel, WV 95154-0107', 'default.jpg', 'mahasiswa', '$2y$10$2GdKacTMC0GgfCY5KS1O0OUMvZN2SCDqM.VZrsMXqGqwjRuUjKcRe', NULL, '2024-06-13 14:07:37', '2024-06-13 14:07:37'),
('9c47008b-0c6f-469f-9e91-c33dfd0e008d', '54380', 'Marty Yundt Sr.', 'shayna30@example.com', NULL, '57095 Liam View Apt. 389\nMayerton, CA 01709-7369', 'default.jpg', 'mahasiswa', '$2y$10$cDUeo/vp8fafC8aCAYtTUOh1PJg8CxA4Jgo/IJerlghiSAyPHTJgm', NULL, '2024-06-13 14:07:37', '2024-06-13 14:07:37'),
('9c47008b-27b3-43ba-854a-4d706adad212', '74609', 'Laurel Brekke', 'runte.manuela@example.org', NULL, '1672 Destiny Estates Apt. 456\nNew Simone, AZ 97470', 'default.jpg', 'mahasiswa', '$2y$10$5le9HydmVwWX8vmhkUfIdupuaaigWQicZBzv6voKmXuS/FVyRngfu', NULL, '2024-06-13 14:07:37', '2024-06-13 14:07:37'),
('9c47008b-42bb-4e8c-a7c3-af11bc3ed0ba', '55401', 'Noemie O\'Reilly', 'karlie76@example.org', NULL, '2523 Jett Loaf Apt. 158\nEast Margefurt, MN 97204', 'default.jpg', 'mahasiswa', '$2y$10$TaDPKv.kFLUSvh0r2RFdV.RsUrEhlp6N4QWz.f3/mQyd2dBMHd0l2', NULL, '2024-06-13 14:07:37', '2024-06-13 14:07:37'),
('9c47008b-5eaa-4e44-8a81-937cca0747b8', '17633', 'Prof. Robb Russel', 'plindgren@example.org', NULL, '23390 Gisselle Grove Suite 101\nPagacburgh, MA 08888', 'default.jpg', 'mahasiswa', '$2y$10$UdrJsVTqsYdkiLJJIP8tA..7.4CaCNu5Pgh5fVmvQyUHEF5J578QK', NULL, '2024-06-13 14:07:37', '2024-06-13 14:07:37'),
('9c47008b-7a0c-4f97-8f74-cffd4e809eee', '97906', 'Parker Lind', 'forrest06@example.com', NULL, '6077 Jeramie Port Apt. 222\nAbernathyfurt, IA 56132-5576', 'default.jpg', 'mahasiswa', '$2y$10$6UIClv/JMJsi9sJwiMjVneF.hftLgoqNLIahNUmY2Cn0w2F0X5pu2', NULL, '2024-06-13 14:07:37', '2024-06-13 14:07:37'),
('9c47008b-94df-4cb7-8a1e-3a92eb660839', '19725', 'Prof. Fidel Blick Jr.', 'jarrell97@example.com', NULL, '6119 Alphonso Overpass\nNorth Kristy, MD 56587-0004', 'default.jpg', 'mahasiswa', '$2y$10$z2jwX4ImROxrEDpBvjxRf.E69U68AMAge3HTVPYnV1fLuR7R33bGS', NULL, '2024-06-13 14:07:37', '2024-06-13 14:07:37'),
('9c47008b-af13-4891-b4c6-c44545fd60a4', '23402', 'Ivy Funk', 'violet34@example.org', NULL, '8671 Brekke Pike\nShainachester, AL 06764', 'default.jpg', 'mahasiswa', '$2y$10$qy2MTQx/t./3iW.d4Uu6MeoIOe4BVhD1AXJPxCRxgHaCHXnjRrWbC', NULL, '2024-06-13 14:07:37', '2024-06-13 14:07:37'),
('9c47008b-ca19-4052-8430-8f657ecf7d2f', '26220', 'Prof. Cameron Bergstrom', 'ydeckow@example.net', NULL, '712 Streich Lock\nColtonbury, ID 07176', 'default.jpg', 'mahasiswa', '$2y$10$FbILRy7aaDgpB.k7jE6L1.pWeO0UTJUkLS9JJMa7SS2wdGgxha39q', NULL, '2024-06-13 14:07:37', '2024-06-13 14:07:37'),
('9c47008b-e50b-49cf-b815-cfb2d40881ff', '77259', 'Dr. Danyka Skiles', 'ahmad.koelpin@example.org', NULL, '4462 Kiehn Ramp\nCruickshankstad, IL 82403-5481', 'default.jpg', 'mahasiswa', '$2y$10$eNp.F2bNliLU6dddDQ0d9.8YgK.nkBePhAZ.c9N.JhOPwVGWp7.Pa', NULL, '2024-06-13 14:07:37', '2024-06-13 14:07:37'),
('9c47008b-ffa3-41fa-8274-1a0bad16bfb6', '79851', 'Lindsey Hand', 'yasmeen30@example.net', NULL, '384 O\'Conner Common\nSavionmouth, AK 37971', 'default.jpg', 'mahasiswa', '$2y$10$5SWuxbaqDHmjS6Pa0alf5u4Z2rh9SGhKM0tgIN1oc05Xq/lCJLU62', NULL, '2024-06-13 14:07:37', '2024-06-13 14:07:37'),
('9c47008c-1b09-4d81-be08-57f29f2252c7', '11846', 'Ella Hartmann MD', 'caroline27@example.org', NULL, '253 Klocko Unions Suite 580\nNew Lailaland, VA 12518-8056', 'default.jpg', 'mahasiswa', '$2y$10$d2AX8w.tVSM3rsLy/nVXpe9yHd0GF47pnEbF4Zp3dxPFZQ2ALyGpS', NULL, '2024-06-13 14:07:37', '2024-06-13 14:07:37'),
('9c47008c-359d-4d6d-b2c3-5bb834d36ab7', '17837', 'Clementina Macejkovic', 'mstehr@example.com', NULL, '820 Goldner Motorway Suite 071\nTownemouth, WY 09824-7068', 'default.jpg', 'mahasiswa', '$2y$10$VTU1DxmtGNmGlYGAHiO50eOVXmgewEf1UeskM2QEdIAoGVQ32uzXq', NULL, '2024-06-13 14:07:37', '2024-06-13 14:07:37'),
('9c47008c-50e9-45af-bf52-62a430b7c51f', '66614', 'Melyssa Koss IV', 'alivia.gleichner@example.com', NULL, '17433 Krystel Rapids Suite 109\nLeifside, IN 37351', 'default.jpg', 'mahasiswa', '$2y$10$K9WdRv7UtguH4iy73H9ZU.yghyuutmSPRpEkL82iguqTnyroeTEeO', NULL, '2024-06-13 14:07:38', '2024-06-13 14:07:38'),
('9c47008c-6bb7-4099-828c-c274dc3f6b7c', '98727', 'Johathan Feil III', 'ellsworth45@example.com', NULL, '3504 Brittany Falls Suite 735\nElwinhaven, IA 56925', 'default.jpg', 'mahasiswa', '$2y$10$FKmyyn7axxk1qHN/0J3eN.QIcU/EtMOBjdsE4jhwHdlTMrCp1aSLK', NULL, '2024-06-13 14:07:38', '2024-06-13 14:07:38'),
('9c47008c-85f5-4ce0-ae57-85695b5bf9df', '93881', 'Nina Auer DDS', 'simeon17@example.org', NULL, '2692 Marietta Lock\nEast Imani, MO 18237-3183', 'default.jpg', 'mahasiswa', '$2y$10$jqY3xddJzAcBCYKWJPUxzuvbXuJaispN4L7F..dZBZMqJVjNbpHXC', NULL, '2024-06-13 14:07:38', '2024-06-13 14:07:38'),
('9c47008c-a09c-4c13-b029-b2d808fb9dab', '63743', 'Khalil Considine', 'hudson84@example.com', NULL, '58414 Hoppe Extension Suite 823\nSipesside, OH 15150', 'default.jpg', 'mahasiswa', '$2y$10$99xbms8xAmFtrlbErUO2cO2CkvAZau8jGl5UjQLvzG0eE6SvxxSI6', NULL, '2024-06-13 14:07:38', '2024-06-13 14:07:38'),
('9c47008c-bafb-40e1-aa90-762e637ba45b', '38320', 'Obie Hodkiewicz', 'cronin.carroll@example.net', NULL, '636 Alexandro Drive\nNorth Isom, KS 18973-3968', 'default.jpg', 'mahasiswa', '$2y$10$fxELUt82AdqCAQNsoctS1On0FbRg3BkZX4aCso.0PnsvHpyGaX5q6', NULL, '2024-06-13 14:07:38', '2024-06-13 14:07:38'),
('9c47008c-d577-46c8-a778-ace218bc1a28', '72371', 'Mr. Celestino Conroy', 'alex97@example.com', NULL, '3806 Gerson Point\nLake Elena, MO 14823', 'default.jpg', 'mahasiswa', '$2y$10$hVfWpsbl5aoOynyMCgr8huwYTRl3YgIq8rfzigNHGC.ZxhKVW2yUu', NULL, '2024-06-13 14:07:38', '2024-06-13 14:07:38'),
('9c47008c-f0e0-4959-bd37-0beda906416c', '16495', 'Vicente Kub', 'verlie09@example.org', NULL, '89187 Deckow Causeway Suite 729\nIrwinborough, ND 04541-0253', 'default.jpg', 'mahasiswa', '$2y$10$4sngyeNR.TH.vD29XatNg.GQOzJcxq7CALQQSr/F4GoalLY1p8Mye', NULL, '2024-06-13 14:07:38', '2024-06-13 14:07:38'),
('9c47008d-0bf6-47a1-b593-88fc45591aab', '72322', 'Ms. Lydia Cummerata DDS', 'eloy.ritchie@example.org', NULL, '5386 Kreiger View Suite 882\nPort Dakota, SD 83673', 'default.jpg', 'mahasiswa', '$2y$10$0EsIhbtg1rbuKUMCF.TkNuESuhOXu9eB4gnde8DOiVsH6F./n77g.', NULL, '2024-06-13 14:07:38', '2024-06-13 14:07:38'),
('9c47008d-2665-44e7-a0d3-f9a8abd4e51c', '27282', 'Ima Miller', 'emmett76@example.net', NULL, '103 Tom Causeway Suite 875\nSouth Consuelo, NC 52736-4138', 'default.jpg', 'mahasiswa', '$2y$10$uadsOfsm2IviZ.29W8CiT.7WrHD9g8oKwlSGwUXqBKFWMR0JCqtre', NULL, '2024-06-13 14:07:38', '2024-06-13 14:07:38'),
('9c47008d-40f9-4b51-924c-8227381fbcdd', '60772', 'Mr. Brian Hayes III', 'alaina23@example.com', NULL, '16418 West Stravenue\nColliermouth, ID 59139-2964', 'default.jpg', 'mahasiswa', '$2y$10$t3Q7kArnO3cLs9K.88FS5uiXVSsnvdlVBJJtZsQlFmfLwn6J8rnCe', NULL, '2024-06-13 14:07:38', '2024-06-13 14:07:38'),
('9c47008d-5c1a-4faf-be12-06da3ce3da65', '99326', 'Mrs. Alycia Stracke', 'lurline.bradtke@example.com', NULL, '83193 Veum Spring\nNorth Dawn, TN 00733', 'default.jpg', 'mahasiswa', '$2y$10$a7zVovumB6owuhnL8ywQsOZeYi3z1olzLnhBr3r664vyFnJYc98tS', NULL, '2024-06-13 14:07:38', '2024-06-13 14:07:38'),
('9c47008d-770c-414d-a968-89955cf354ae', '64966', 'Dr. Helmer Ward', 'flatley.tyrel@example.net', NULL, '9090 Wava Locks Apt. 751\nKayleyberg, AL 98662', 'default.jpg', 'mahasiswa', '$2y$10$Wap0PpettQq8vQnd1k75seK44bhsPeZ9UdjMz2Gw2.rixf/4m264u', NULL, '2024-06-13 14:07:38', '2024-06-13 14:07:38'),
('9c47008d-92ea-4e08-a5c9-fe19df67009e', '26555', 'Kian Murphy', 'jesse.lang@example.org', NULL, '242 Heathcote Curve\nLindsayborough, RI 03718', 'default.jpg', 'mahasiswa', '$2y$10$Xr/jea9QjbxNp2F8zlrCSOB8MpHV19Q.IYZUmoKxPLrgxlJ/FDBka', NULL, '2024-06-13 14:07:38', '2024-06-13 14:07:38'),
('9c47008d-af95-45c2-9ede-86bb42a26f58', '97902', 'Prof. Martine Dickinson', 'lauriane94@example.org', NULL, '9850 David Junctions\nSouth Adahburgh, MN 72077', 'default.jpg', 'mahasiswa', '$2y$10$KqdX0jW2bEFkJ5Ylm6vRY.pc69EK6it.sMG6N/Gx.SLA8tjXLMO2q', NULL, '2024-06-13 14:07:38', '2024-06-13 14:07:38'),
('9c47008d-cbbb-4637-a373-f30ba5c176b5', '84916', 'Prof. Aidan Kemmer', 'milford.grimes@example.com', NULL, '419 Antoinette Ridges Suite 640\nKaiaside, OH 76498', 'default.jpg', 'mahasiswa', '$2y$10$pGlnVtiLlMw5LANZbsRNTuGEoMNPHJahT0VMV9SatNmHFFr71Fi2m', NULL, '2024-06-13 14:07:39', '2024-06-13 14:07:39'),
('9c47008d-e6bf-4470-bc39-528559ba5bbc', '91079', 'Prof. Thea Roberts IV', 'dlowe@example.org', NULL, '586 Grimes Port Suite 478\nJohnsonchester, FL 91001-1337', 'default.jpg', 'mahasiswa', '$2y$10$z1aXOTFw7DnXn7PTarlgouPIPbN68dySvi2K3twG1Fn9twJ.PO6DW', NULL, '2024-06-13 14:07:39', '2024-06-13 14:07:39'),
('9c47008e-0163-44f5-8b2f-bedb064699dc', '19848', 'Jordi Nitzsche', 'rigoberto41@example.net', NULL, '97222 Pollich Mill\nSouth Clint, TN 63592-1617', 'default.jpg', 'mahasiswa', '$2y$10$o/BwtqxZuS7UzHeoIgJLYOYkZc8esysBSYG3J0Kb5lZcQtA/uru7O', NULL, '2024-06-13 14:07:39', '2024-06-13 14:07:39'),
('9c47008e-1b74-4ea5-b907-7058e8be1bb6', '34521', 'Mazie Bins MD', 'bertha.ryan@example.net', NULL, '6020 King Mall\nNew Rosa, AZ 47385-7875', 'default.jpg', 'mahasiswa', '$2y$10$O5WQIHPnf.Sa2qTT/YUkAup0W7ZZ6Rvo8IVoWtuUe4toXPFIOksvq', NULL, '2024-06-13 14:07:39', '2024-06-13 14:07:39'),
('9c47008e-3683-4827-8cf8-fb67803b63b3', '65336', 'Emiliano Vandervort', 'xwisozk@example.com', NULL, '81398 Kirlin Estate\nOrahaven, NH 19228', 'default.jpg', 'mahasiswa', '$2y$10$XaO0UBG1xyC/kSHJyriVKOhsDlBke/4y7ZCxpjPrhFCsWWjeJ8ZAu', NULL, '2024-06-13 14:07:39', '2024-06-13 14:07:39'),
('9c47008e-57f0-4fb3-a817-9760674a6964', '17573', 'Dr. Verdie Davis I', 'jakubowski.issac@example.com', NULL, '3510 Zita Junction Suite 569\nFarrellhaven, PA 56462', 'default.jpg', 'mahasiswa', '$2y$10$MTEIoa94f/i8AQVCnjIsW.girvVqIGJEnanAWca.zH8ozb9b6CtoO', NULL, '2024-06-13 14:07:39', '2024-06-13 14:07:39'),
('9c47008e-7290-43bf-adff-c5ba2a842f5b', '76764', 'Dr. Hester Moore Sr.', 'vwuckert@example.org', NULL, '3118 Eulah Alley Apt. 303\nNorth Broderickview, DC 97365-7789', 'default.jpg', 'mahasiswa', '$2y$10$duR2suR9m8M2QSCVoRjZzOxvYrF3OkKlZ8q1QvNMCJxZcsdIDEgzK', NULL, '2024-06-13 14:07:39', '2024-06-13 14:07:39'),
('9c47008e-8cc3-47b4-92b4-5e4193045d22', '67081', 'Dr. Lilliana White DDS', 'ben.konopelski@example.org', NULL, '309 Auer Radial Apt. 891\nNorth Deshawnchester, NM 93697', 'default.jpg', 'mahasiswa', '$2y$10$Fj4M9WjYMjY0dhqt1W9LAObgAUfII1oAX0f4ZJcMgT6FC41VDTCey', NULL, '2024-06-13 14:07:39', '2024-06-13 14:07:39'),
('9c47008e-a779-4335-9f7e-ab65d2662b39', '53423', 'Mr. Theron Quitzon', 'hilpert.rosella@example.org', NULL, '98292 Tremaine Mall Apt. 830\nNikolausville, FL 38745', 'default.jpg', 'mahasiswa', '$2y$10$2Z1tKgUM93m0ANU8oxbGhuR2sZZKBY5ESMN0Obx1rqAOyeEdY4U3G', NULL, '2024-06-13 14:07:39', '2024-06-13 14:07:39'),
('9c47008e-c23d-4765-969d-0046ca694250', '27151', 'Ms. Susie Shanahan Jr.', 'emard.hilton@example.com', NULL, '160 Callie Mill Suite 914\nNew Justynfort, NE 90883', 'default.jpg', 'mahasiswa', '$2y$10$E/dgsFYCD1Lvql0NoUGqIunzi3FqadDyTKGiPAIloTXheDxr3M3cu', NULL, '2024-06-13 14:07:39', '2024-06-13 14:07:39'),
('9c47008e-dc85-45f8-a152-c371de077927', '88937', 'Talon Larson', 'paolo.morar@example.net', NULL, '73629 Wilderman Centers\nGreenfelderfort, RI 72874', 'default.jpg', 'mahasiswa', '$2y$10$Er7fgsJAH52XqtpVT2VZBeW276jpNeZd8tXiv2Efd2/kSx93ciq7u', NULL, '2024-06-13 14:07:39', '2024-06-13 14:07:39'),
('9c47008e-f6e1-4cf9-b216-6b62c9467649', '22443', 'Julius Kerluke', 'jules42@example.org', NULL, '56045 Clarissa Prairie\nThaddeusburgh, MD 27031-8806', 'default.jpg', 'mahasiswa', '$2y$10$dc0Le0t7Y9v9w30UAFaLkuRjaUI.l0ZP1kMhDgh8lQimMApxtHgxi', NULL, '2024-06-13 14:07:39', '2024-06-13 14:07:39'),
('9c47008f-1105-4f88-9e27-b4d9edd9668e', '26572', 'Eli Hoeger I', 'ethiel@example.net', NULL, '361 Delaney Vista Suite 937\nHayeshaven, NH 05118', 'default.jpg', 'mahasiswa', '$2y$10$5Im3LnvMGd.2O02h7z8wYurzrl/WUD7qHpKKVNRriUKaa2PVoxrTS', NULL, '2024-06-13 14:07:39', '2024-06-13 14:07:39'),
('9c47008f-2be6-4e48-ab52-22eecadb6397', '40733', 'Jack Hane', 'uadams@example.net', NULL, '98436 Reid Trail\nMissouritown, NY 19153-2325', 'default.jpg', 'mahasiswa', '$2y$10$vqjthjkGW2/yQgPEbEnjLu4h2gmfzZ7Erhv215PsvaOBaHxNuZ1Le', NULL, '2024-06-13 14:07:39', '2024-06-13 14:07:39'),
('9c47008f-4682-426d-b156-9ba1c9942549', '33918', 'Maiya Rutherford', 'yundt.guy@example.net', NULL, '255 Bartoletti Cape Suite 652\nNorth Alethahaven, NC 27281-2442', 'default.jpg', 'mahasiswa', '$2y$10$SlAsZOvBWdGAQc9P4EKJ6uxxjGQgHckhGlIDBdfLkLeYKpx16pxoa', NULL, '2024-06-13 14:07:40', '2024-06-13 14:07:40'),
('9c47008f-61fe-489c-9bfb-e6f8f9e9bb8d', '84313', 'Augustine Murray', 'yasmeen58@example.com', NULL, '3836 Kassulke Freeway Suite 740\nBoyerberg, ND 36508-9365', 'default.jpg', 'mahasiswa', '$2y$10$CxZaVJZcUgjog39nA/sC9.kuoMxzKzA.6wvhvkgdpvPdRrr9AIboC', NULL, '2024-06-13 14:07:40', '2024-06-13 14:07:40'),
('9c47008f-7c1f-40bd-8404-df8a9185f9f4', '55268', 'Bart Doyle', 'beahan.chasity@example.com', NULL, '85493 Elissa Parkway\nCummerataland, CO 74545-0444', 'default.jpg', 'mentor', '$2y$10$ZJpeTRHqHSP6xxUoA.TN0.ag8pGenYwR7jqtiwj/NwzLIU9Q5sCU6', NULL, '2024-06-13 14:07:40', '2024-06-13 14:07:40'),
('9c47008f-9704-48c2-bd48-b46d5bcb4681', '39015', 'Kamren Cassin IV', 'afriesen@example.com', NULL, '630 Rodriguez Greens Apt. 057\nWest Hattie, MA 40370', 'default.jpg', 'mentor', '$2y$10$KXGC6L2UlKlzbhwnUBseQuJxEnt587xmU7YhmA452xVS8k14RNlpm', NULL, '2024-06-13 14:07:40', '2024-06-13 14:07:40'),
('9c47008f-b21e-419c-ac67-485a0d448a65', '52716', 'Lourdes Kunze V', 'karianne88@example.net', NULL, '366 Scotty Plains\nRobelport, TN 83056-6266', 'default.jpg', 'mentor', '$2y$10$hodKvCbNowvUaL5hU/c/C.DJmquzKpc4SNxciylnWkrlY3Y69af7G', NULL, '2024-06-13 14:07:40', '2024-06-13 14:07:40'),
('9c47008f-cd22-4644-8927-ee16d3a0153f', '10911', 'Addison Lindgren', 'dietrich.oda@example.com', NULL, '5529 Abel Canyon Suite 563\nKeeblerton, OK 51467', 'default.jpg', 'mentor', '$2y$10$uMuDzeasXu9p1Mrr1Hpbk.rjFAh4c7U2WyaKU1O/501UMbALJRroG', NULL, '2024-06-13 14:07:40', '2024-06-13 14:07:40'),
('9c47008f-e959-48bb-bca5-d48076d4d3a0', '26665', 'Aiyana Lind DDS', 'mcglynn.sarina@example.com', NULL, '4913 Kulas Fall\nNew Florian, NH 43635-6787', 'default.jpg', 'mentor', '$2y$10$CgzR5F5cLDkJPMzT1rmvkeBACbbZM.PfYHxcIMHZV5WxmsrQLuuvS', NULL, '2024-06-13 14:07:40', '2024-06-13 14:07:40'),
('9c470090-0387-481b-9165-703799f383f3', '85639', 'Kenneth Hammes', 'diego.trantow@example.net', NULL, '781 Dooley Circles\nJoelmouth, IA 06575-0368', 'default.jpg', 'mentor', '$2y$10$tSyfp.gWTgRHVBpIRIyfCOzSn1XXs4VI5C3FPjcFltzh7u31c16eu', NULL, '2024-06-13 14:07:40', '2024-06-13 14:07:40'),
('9c470090-1efa-452b-aee9-c488dbce22ac', '63592', 'Mr. Terence Dickens', 'vince98@example.com', NULL, '65326 Kilback Estate Suite 320\nSouth Carissa, MA 22258', 'default.jpg', 'mentor', '$2y$10$5aeNXPPe/ObnQxJ0F/Xef.1V7wNN6p56n1qlDbo6.nD602f5Whtfe', NULL, '2024-06-13 14:07:40', '2024-06-13 14:07:40'),
('9c470090-3939-4089-90e9-123e1ae9aba7', '83495', 'Mr. Edison Rice I', 'hermann.dorthy@example.net', NULL, '85008 Bradtke Port Suite 822\nPort Tomasa, CT 84963-5748', 'default.jpg', 'mentor', '$2y$10$PV/fNmQ5qr78vBJmbLSo/OjnFnKmCr46dwzQCnr9gDuXspvfAXQNu', NULL, '2024-06-13 14:07:40', '2024-06-13 14:07:40'),
('9c470090-538f-4f24-8965-870078ea2529', '27280', 'Dr. Maryse Marks', 'effertz.oswald@example.com', NULL, '56179 Pfeffer Common Suite 556\nNew Fae, LA 49118', 'default.jpg', 'mentor', '$2y$10$qHHvMG.HKAk9bDkqVtKCCeNS3GLP5pOWecH.GpO9JwhAI/vuysdwm', NULL, '2024-06-13 14:07:40', '2024-06-13 14:07:40'),
('9c470090-6f7b-4b49-b150-fe9e69a27143', '63572', 'Mrs. Daniella Jacobi', 'jennings54@example.net', NULL, '853 Reagan Rue Apt. 279\nTomasaburgh, MN 89319-5893', 'default.jpg', 'mentor', '$2y$10$QVz1m40Cp6kehG4xkorEceAh2TrQhVMUF7I72hUdItcQHUGCQPPgK', NULL, '2024-06-13 14:07:40', '2024-06-13 14:07:40'),
('9c470090-8aad-4708-84a9-b990e5a90a26', '37447', 'Mrs. Brittany Haley', 'cindy.simonis@example.net', NULL, '788 Annamae Burgs\nMistystad, ID 10420', 'default.jpg', 'mentor', '$2y$10$If4.83wm3zn5d2tWIgh8MeWsjYSN5zS4ZGvxqS8AmtTjhFICcFXS.', NULL, '2024-06-13 14:07:40', '2024-06-13 14:07:40'),
('9c470090-a603-458f-84b6-2849a795a983', '60371', 'Rex Kris', 'goldner.sophie@example.net', NULL, '11085 Langosh Oval Apt. 488\nSouth Gilbertbury, DE 10051', 'default.jpg', 'mentor', '$2y$10$mdmuJVbaxzrEeUhfisiIpulvy8zaWUz8jdLcKcNANpP7etwcWhBdO', NULL, '2024-06-13 14:07:40', '2024-06-13 14:07:40'),
('9c470090-c1fa-4bcb-b686-9fa856b201c8', '11636', 'Carroll Gleason', 'dashawn59@example.net', NULL, '3344 Ritchie Stravenue Suite 012\nKoepptown, MA 79112', 'default.jpg', 'mentor', '$2y$10$TqAyK7o9d3uilehVlfUaLeU0gjmp.esJuA2EePJ3BTW8.z6vNNSPa', NULL, '2024-06-13 14:07:40', '2024-06-13 14:07:40'),
('9c470090-dcaf-4ad8-8721-cd9cb366f368', '54624', 'Concepcion Wolff', 'meagan.gerhold@example.org', NULL, '2636 Crist Prairie Suite 310\nJeremyville, CT 31959-9945', 'default.jpg', 'mentor', '$2y$10$w3951NOTSp2HEu1TIXAod.yzF9Ja/Ss23eI7zjQefCB37ogtA/j56', NULL, '2024-06-13 14:07:41', '2024-06-13 14:07:41'),
('9c470090-f811-452c-afe9-2a44c37a3947', '21031', 'Elijah Towne', 'marcelina74@example.org', NULL, '2165 Sophie Brook\nCecileburgh, NV 85010', 'default.jpg', 'mentor', '$2y$10$mz4RU9jLVN2pXuGOrAqt7.IoXcDW72W5GqHwcI5iYYvtm7AkQLDzq', NULL, '2024-06-13 14:07:41', '2024-06-13 14:07:41'),
('9c470091-12bf-4174-97d7-f3418cea0a90', '56603', 'Jermaine Robel', 'adah98@example.org', NULL, '129 Gerlach Hollow\nWest Jacey, UT 14490-2355', 'default.jpg', 'mentor', '$2y$10$h/eBM0dOGs/vT7PKiZzYUe/hGYyEnRrRMNpcRqqBUNfAFW2hGKw2u', NULL, '2024-06-13 14:07:41', '2024-06-13 14:07:41'),
('9c470091-2cf1-4023-b741-86f0aea287ac', '20353', 'Susana Bins', 'hbalistreri@example.net', NULL, '626 Kuhlman Fall\nEmeliaburgh, TN 12693', 'default.jpg', 'mentor', '$2y$10$q9tSv8F4w77cVPL.zjLQRuOW7NI61CRQFXyIqo1ODCO7c8vxDN2Jm', NULL, '2024-06-13 14:07:41', '2024-06-13 14:07:41'),
('9c470091-4766-4b43-8a7f-dd44f6e26d8f', '54101', 'Greta Murray', 'rolfson.hillary@example.org', NULL, '330 Fisher Road Apt. 041\nHuelsville, NJ 60613-5562', 'default.jpg', 'mentor', '$2y$10$mah.eyTEN4jljGRkBSuHFe3cMLoEoRfP909AIffbbvDc/m33q1N9O', NULL, '2024-06-13 14:07:41', '2024-06-13 14:07:41'),
('9c470091-6222-4302-8eff-58ec635c8b64', '22782', 'Thomas Schulist', 'ricardo10@example.com', NULL, '4532 Powlowski Mills\nNew Weldon, MO 55126-7980', 'default.jpg', 'mentor', '$2y$10$Jf7gAOG1eAWpxZLeptz9aemsguX0bDMWU9w74iNBzCQ8Dfd4FeRve', NULL, '2024-06-13 14:07:41', '2024-06-13 14:07:41'),
('9c470091-7e64-46d1-9f76-8c7179385561', '85506', 'Paige Dietrich', 'rosenbaum.curtis@example.com', NULL, '3928 Little Street Apt. 086\nSwifthaven, NE 36912-8682', 'default.jpg', 'mentor', '$2y$10$Y7m/H0adWBcK.OV6E51raOc3cn/vmelFTtyxr6.bIsTLp/JT3/Dzu', NULL, '2024-06-13 14:07:41', '2024-06-13 14:07:41'),
('9c470091-99e1-47bc-8ff1-22b0cf68abe1', '30194', 'Prof. Misael Johnson V', 'roberts.deron@example.com', NULL, '4139 Wilfred Road Apt. 871\nLake Emmaborough, CO 84524-6691', 'default.jpg', 'mentor', '$2y$10$tEOv3JLSXmGB1BC8vbv9YOErAxx0GrwQFIek1rBcM/CKuhhHDS1Yy', NULL, '2024-06-13 14:07:41', '2024-06-13 14:07:41'),
('9c470091-b495-4e17-86f2-19148ddf14eb', '20676', 'Myron Stroman', 'jaron.murazik@example.org', NULL, '679 Dare Crossing Apt. 329\nNorth Clarabelle, TX 33206-0256', 'default.jpg', 'mentor', '$2y$10$7t1S82ncuN9lKD85K1hPjObSGK7Xh3.tvslqMdU5hrr2XIOas44Ha', NULL, '2024-06-13 14:07:41', '2024-06-13 14:07:41'),
('9c470091-ceef-4fb1-a391-afceb97b9ff2', '74875', 'Malcolm Schiller', 'tgutmann@example.org', NULL, '590 Trantow Walks\nReichelfurt, GA 52883', 'default.jpg', 'mentor', '$2y$10$Y5m8Wt3QBCJikj0XsOfFJO1NhrWI/4GXuimJMzForAvH8vkIimf5m', NULL, '2024-06-13 14:07:41', '2024-06-13 14:07:41'),
('9c470091-e911-478e-8e50-879c10b01dd6', '37715', 'Marcel Bauch DDS', 'kennedi68@example.net', NULL, '601 Weldon Ferry\nWest Landen, MN 72400-7482', 'default.jpg', 'mentor', '$2y$10$MkZecE5NiCb9afuGhFYDHutSfvNs1ByXmrlyz.3gSqiGaIi7p28Ge', NULL, '2024-06-13 14:07:41', '2024-06-13 14:07:41'),
('9c470092-0337-4990-b7c5-bc8e6ce50bdb', '92121', 'Prof. Armand Spencer', 'weimann.marlon@example.org', NULL, '902 Prosacco Skyway\nSouth Aliyah, ND 80432', 'default.jpg', 'mentor', '$2y$10$aHPG2vekEeQDbpllykSKSuxsOqSCZappGeq36rTli3VyEtsiEn4mK', NULL, '2024-06-13 14:07:41', '2024-06-13 14:07:41'),
('9c470092-1e5a-4012-97c4-95a66cd8dccd', '65149', 'Cullen Towne II', 'erin67@example.net', NULL, '69646 Lelah Mountains Apt. 675\nStrackeport, FL 89674-8761', 'default.jpg', 'mentor', '$2y$10$lSG7FciwawQK1b9dO03Ewum/U/tu67CR4wCcylRn.hZNqXsonCipW', NULL, '2024-06-13 14:07:41', '2024-06-13 14:07:41'),
('9c470092-38ed-4a32-8ff7-33d59e0d6927', '77868', 'Sandy Ratke', 'edwin.streich@example.com', NULL, '10672 Mosciski Isle\nPort Blanca, HI 18801', 'default.jpg', 'mentor', '$2y$10$rUX9ShYzXh1ntdyclXDY/ewVR/2AKuQpxd5EMgLX/hO2NRz122d0u', NULL, '2024-06-13 14:07:41', '2024-06-13 14:07:41'),
('9c470092-5316-4111-bd79-51d6615aeaaa', '47793', 'Ibrahim Gutmann', 'harber.morris@example.org', NULL, '88696 Austen Gardens Apt. 791\nPort Fannieberg, NH 56635', 'default.jpg', 'mentor', '$2y$10$zJ5WaG1U9vHAJMyQr7/lTu8EYCE/gEJ/RBQ4.pVDh/awtzeh0aNya', NULL, '2024-06-13 14:07:42', '2024-06-13 14:07:42'),
('9c470092-6e10-4041-bcd7-be26df1d2d66', '20268', 'Keeley Lesch', 'cmitchell@example.net', NULL, '34028 Mariela Parks Suite 235\nSouth Sabrina, WY 51622-2061', 'default.jpg', 'mentor', '$2y$10$LFW.G1GR2YqvTGgDP0CgjuaR70mxWNOxWGntZ/SNY5Ks2S31Wg25W', NULL, '2024-06-13 14:07:42', '2024-06-13 14:07:42'),
('9c470092-8966-44c9-ae4e-a546249b0df2', '99599', 'Kevon Bogisich', 'lyric95@example.net', NULL, '44514 Chet Avenue\nNew Henriette, IA 17543', 'default.jpg', 'mentor', '$2y$10$Iexvb/eEO6UiFl2HXeXeSeafBrb3kAeWAm0hD6DZ39OpZmqwh0NEu', NULL, '2024-06-13 14:07:42', '2024-06-13 14:07:42'),
('9c470092-a3a5-47cb-82bd-b9f87478f3a5', '18460', 'Arno Nikolaus', 'coleman47@example.org', NULL, '3485 Aliza Route Suite 594\nNorth Lora, IN 29645-5649', 'default.jpg', 'mentor', '$2y$10$3S0Zs0P7RXvEsbVX3ar9x.AuncDMYZ7ibjtbrAxcy9Y.nMnE3NfHa', NULL, '2024-06-13 14:07:42', '2024-06-13 14:07:42'),
('9c470092-be36-41cf-97fc-ed8225712409', '17654', 'August Sauer', 'friesen.ophelia@example.net', NULL, '4499 Koch Freeway Suite 567\nNew Daltonside, NM 14951', 'default.jpg', 'mentor', '$2y$10$W.bGEHwKi9SrObFm05Zi0.xTzjEP5bOgNvWUio2G/OeDn8eFepXca', NULL, '2024-06-13 14:07:42', '2024-06-13 14:07:42'),
('9c470092-d85d-440a-b7c3-c82ec332e2b2', '14711', 'Dr. Candelario Moen V', 'considine.stella@example.com', NULL, '2821 Emerald Cliffs\nWardshire, IN 93060', 'default.jpg', 'mentor', '$2y$10$ggfHmgesjmnp8WT4q/g2c.sLOQV5Q9yAulR/ZSEWHU97lTHu6T05m', NULL, '2024-06-13 14:07:42', '2024-06-13 14:07:42'),
('9c470092-f43f-4fef-b20e-bc1538ed8df4', '72794', 'Quinton Nolan', 'kblock@example.com', NULL, '90026 Turner Passage Suite 611\nJoymouth, PA 05252', 'default.jpg', 'mentor', '$2y$10$AFD2fb5X1ybYdGzHrZ6P7OGhbAKqIKLUDygx1N8XPp9EoeAHtNTEu', NULL, '2024-06-13 14:07:42', '2024-06-13 14:07:42'),
('9c470093-0eb4-4fad-8e0a-a0be28774867', '10971', 'Danielle Fahey IV', 'daufderhar@example.org', NULL, '9254 Jacky Tunnel Apt. 435\nNorth Xzavierburgh, NM 27119', 'default.jpg', 'mentor', '$2y$10$BoTC3vsqK2DSIcE0L1aMeOvqS/8Y6xpgIKyuOF2nrnLpFkMDIkBTm', NULL, '2024-06-13 14:07:42', '2024-06-13 14:07:42'),
('9c470093-2983-4d7a-8764-a5862b7c8d68', '98909', 'Prof. Benedict Rau Jr.', 'santiago.reinger@example.org', NULL, '77336 Ahmad Pike\nSagemouth, IA 80225', 'default.jpg', 'mentor', '$2y$10$hYiQneMtvZo0Jv45s5HchOIggx2Xgpvqo5u/ShLHpJOfv97AB9fW2', NULL, '2024-06-13 14:07:42', '2024-06-13 14:07:42'),
('9c470093-43ff-4256-b3c5-b9cd45a12eea', '60924', 'Muriel Considine', 'orlo.runte@example.org', NULL, '777 Tressa Trail Suite 458\nEast Janie, NH 82787', 'default.jpg', 'mentor', '$2y$10$HMVZcAnwcc74i2cGmXD6i.UEgZKQhdMhMt3Euvj77F1JVxS05kfRa', NULL, '2024-06-13 14:07:42', '2024-06-13 14:07:42'),
('9c470093-5e1a-494e-ab7c-ae9de261b2a1', '72102', 'Bryon Williamson', 'claudie15@example.net', NULL, '3196 Barton Fields\nPort Quinnfurt, VT 39641-3458', 'default.jpg', 'mentor', '$2y$10$n9zg.XBfFScz9F1aM7WeU.kBoO1Fph7pYulKZL2ZNjuIyGMTdEs1C', NULL, '2024-06-13 14:07:42', '2024-06-13 14:07:42'),
('9c470093-7899-47d2-a77d-0ee0e44a81c9', '62348', 'Lemuel Zboncak', 'greg.lebsack@example.net', NULL, '41752 Gorczany Drives\nNew Jayne, IA 42434', 'default.jpg', 'mentor', '$2y$10$flId5GjazoD2AqsBTb/9t.kJLLSExC4yIu1kuEufPFQzofvaeLooK', NULL, '2024-06-13 14:07:42', '2024-06-13 14:07:42'),
('9c470093-9359-4126-9726-91426a79cafd', '84172', 'Quinten Lubowitz DDS', 'kilback.jorge@example.com', NULL, '231 Barrows Road Apt. 959\nNorth Tatum, NH 82939-6883', 'default.jpg', 'mentor', '$2y$10$XnFiy5gZB6d2ks74Ti.hlu3WAWmzdbaaUfbwjUidCOm2OSdOsSWnG', NULL, '2024-06-13 14:07:42', '2024-06-13 14:07:42'),
('9c470093-ad93-4564-bfe6-fa6d5d4a4e47', '14059', 'Christiana Corkery', 'agustina.dibbert@example.org', NULL, '5301 Dwight Crest\nWest Reginald, ID 60571', 'default.jpg', 'mentor', '$2y$10$GudCOBg8H2pfkCvyF8YBN.j1n/byT8I/KKQxmP2vrtLREZ/7LCJPW', NULL, '2024-06-13 14:07:42', '2024-06-13 14:07:42'),
('9c470093-c84b-4ada-ab18-1c7485c61e10', '11988', 'Cristina Zieme DVM', 'kolby.medhurst@example.net', NULL, '59224 Britney Fort Suite 440\nLake Erikmouth, WV 52351', 'default.jpg', 'mentor', '$2y$10$6yVKMefFt4q/MvnFxs73eOlQ4jGljVgz8qi6yU/pRS7v2Zf9nmoBm', NULL, '2024-06-13 14:07:42', '2024-06-13 14:07:42'),
('9c470093-e42c-414a-b119-8410ab92efc4', '27868', 'Camille Volkman', 'skyla09@example.org', NULL, '6119 Schoen Passage\nConnieside, NY 07801-7279', 'default.jpg', 'mentor', '$2y$10$vOMFroytYORQ4LGPSrbFsOEXJMRjUH4C.HoH1YlLRxcPcnewiqv7S', NULL, '2024-06-13 14:07:43', '2024-06-13 14:07:43'),
('9c470093-ff55-4963-9933-a5d1105c3f9e', '72972', 'Ruby Goldner', 'towne.karson@example.net', NULL, '5014 Rippin Village\nEast Abelardohaven, NE 01406-6540', 'default.jpg', 'mentor', '$2y$10$iuYvUa6inrOBljlqK2dD1./MkZmYEmwJXf3FJWbH68ogqrV8IIRwO', NULL, '2024-06-13 14:07:43', '2024-06-13 14:07:43'),
('9c470094-19ea-4845-8d96-ca8ef0ac63f3', '52726', 'Juston Ernser', 'kutch.katrine@example.net', NULL, '97383 Keven Land Apt. 986\nAraceliside, TN 90985', 'default.jpg', 'mentor', '$2y$10$alkPlNU8INkzlOxsybEaGOH5XGKO1D4d3NNaLa8hk9yMRA28QCKKO', NULL, '2024-06-13 14:07:43', '2024-06-13 14:07:43'),
('9c470094-3438-4a15-b7c7-4590f32ade84', '30696', 'Deven Zieme', 'jailyn82@example.com', NULL, '50930 Emmerich Ville\nKihnberg, NM 96921', 'default.jpg', 'mentor', '$2y$10$TwkcvwaIXqT5sgaX2HmDBufNRpObegwXxrlLHvXNqXv/qAWqSZQbe', NULL, '2024-06-13 14:07:43', '2024-06-13 14:07:43'),
('9c470094-4ec5-43c4-b191-2a1bad92a9bb', '99838', 'Kamryn Ruecker', 'fmcclure@example.org', NULL, '2372 Keshaun Rue Suite 306\nJenkinston, OK 84413', 'default.jpg', 'mentor', '$2y$10$luTLJ9UPj0rrPNGM6q42l.cFVEqRz9XqaVb54S583Z/In9StDqqk6', NULL, '2024-06-13 14:07:43', '2024-06-13 14:07:43'),
('9c470094-68ea-4425-97bb-fc80e702b109', '32021', 'Helga Romaguera', 'ptremblay@example.org', NULL, '47481 Dooley Park Suite 362\nLakinton, CO 36906-0612', 'default.jpg', 'mentor', '$2y$10$ySplTEKWQjJun3XlJovxSOC/X1hXz9T3BFhniY0S5RhgqahGMLKqS', NULL, '2024-06-13 14:07:43', '2024-06-13 14:07:43'),
('9c470094-832f-40af-afc3-2d6596fdc6dd', '46529', 'Mr. Kay Gottlieb II', 'fadel.cordie@example.org', NULL, '93208 Johnson Village Suite 364\nSouth Elvis, UT 56484-4772', 'default.jpg', 'mentor', '$2y$10$qzGwIciPHgWtA94bdO0Ov.1jvckQqERkHtblFhMJ/BtiA2qYI.Lw.', NULL, '2024-06-13 14:07:43', '2024-06-13 14:07:43'),
('9c470094-a1dd-46e0-85a1-b5fc3632bfd2', '57911', 'Domenico Padberg IV', 'blanca50@example.net', NULL, '16582 Emmerich Tunnel Suite 702\nNorth Nikkiborough, IN 35271', 'default.jpg', 'mentor', '$2y$10$2x1oH7cgFp11d5o6ivnYd.doAm/6NvaaRB/CxAD3FGRvGsYRu9z6.', NULL, '2024-06-13 14:07:43', '2024-06-13 14:07:43'),
('9c470094-bdad-4fb8-a895-4d2c93cf84de', '15847', 'Nathanael Lehner', 'jcartwright@example.org', NULL, '455 Alex Forges Suite 100\nEast Baronburgh, WY 57728', 'default.jpg', 'departement', '$2y$10$P0vqg.lpnWN7HJvobmK3wuGM4Jv4.AHx3K0KVR7MP81nqxpWM69S6', NULL, '2024-06-13 14:07:43', '2024-06-13 14:07:43'),
('9c470094-d802-4467-8d1b-4dcbf199919e', '95193', 'Miss Electa Stiedemann', 'earl.sawayn@example.net', NULL, '98344 Wolff Parkway\nAnnabelchester, LA 28026', 'default.jpg', 'departement', '$2y$10$w1r2XAqWuulUARr3FA2E/uoibisqgaYBV7FK.Hl.5nKQ04sN6m4R6', NULL, '2024-06-13 14:07:43', '2024-06-13 14:07:43'),
('9c470094-f238-4621-aea1-e1cb2430ca37', '85655', 'Prof. Enrico Terry', 'sprice@example.net', NULL, '8345 Trantow Keys\nNew Sheridan, IL 18401-8994', 'default.jpg', 'departement', '$2y$10$CJ/LRGODUE9hx.eA4uPxNuFiNOpDGD3tnakAjZdKtJRw2TRhZFazS', NULL, '2024-06-13 14:07:43', '2024-06-13 14:07:43'),
('9c470095-0cc6-4d92-86c5-4f5cb1c1715b', '44486', 'Kamille McDermott IV', 'raleigh04@example.org', NULL, '27400 Larkin Lakes\nShaniyaport, NE 01912-2640', 'default.jpg', 'departement', '$2y$10$4VZXZh8o6hwvDJ6DPQj9TOGvUiMuvBl6sVYQ5nFibLB3luodErmtC', NULL, '2024-06-13 14:07:43', '2024-06-13 14:07:43'),
('9c470095-2767-412a-bbcc-70883e3911f6', '91034', 'Ms. Priscilla Satterfield MD', 'alind@example.net', NULL, '111 Willms Plain\nBoscoton, MO 08461-3581', 'default.jpg', 'departement', '$2y$10$nXs3KG0cVYGj9bb.AQOTIOHBKwhDYq1eO9bcDG0AyQXvfwbGIhpvu', NULL, '2024-06-13 14:07:43', '2024-06-13 14:07:43'),
('9c470095-42b1-4054-b465-67f11aee4114', '71556', 'Marian Johnston', 'jules.vonrueden@example.com', NULL, '9416 Bridget Gateway\nPort Raul, MN 02709-3790', 'default.jpg', 'departement', '$2y$10$h4FRtZEdAyOfmUimvX5Efe1K1AyJA/Eg.KcVnDd3fqjMPVPa9g/nS', NULL, '2024-06-13 14:07:43', '2024-06-13 14:07:43'),
('9c470095-5d92-416f-b6af-bc9378d24a93', '49787', 'Benton Borer', 'deondre48@example.org', NULL, '673 Metz Drive Apt. 749\nSouth Brionnachester, SD 12877', 'default.jpg', 'departement', '$2y$10$dXCFpT7Wyfb2ur0Reiuy0ejtvOjlutWumzxw6/G5YN2GjYa21r0Ye', NULL, '2024-06-13 14:07:43', '2024-06-13 14:07:43'),
('9c470095-7997-44d3-aa49-8814ac5b59cc', '70811', 'Trystan Dach', 'mabel67@example.com', NULL, '7795 Missouri Port Apt. 105\nSouth Treyfort, MI 01918-6534', 'default.jpg', 'departement', '$2y$10$z/Phjn2bETC4CB5xUMSQQemJl31F0eKGeW2l4b0vXlekUFLNs5CTm', NULL, '2024-06-13 14:07:44', '2024-06-13 14:07:44'),
('9c470095-93e9-48d4-96c2-0bd891db3959', '16702', 'Miss Fatima White DDS', 'jacobson.jaylon@example.org', NULL, '905 Annalise Crossing Apt. 397\nPort Kaneshire, CT 53894', 'default.jpg', 'departement', '$2y$10$4W/n2HnGE805BTOBhdnlwOBCTiPL1NOLh7zii8Dm/tboU6TmO2Jue', NULL, '2024-06-13 14:07:44', '2024-06-13 14:07:44'),
('9c470095-ae0b-4e44-8d75-48fc8dbf8e98', '75784', 'Mr. Ross Wolff', 'dmann@example.org', NULL, '18762 Amaya Fall\nSchusterton, ME 95967', 'default.jpg', 'departement', '$2y$10$KlUYw9cZGruDivDe0k/ozessSBH8n27RfHnctU/HXMod6nIX3qpEK', NULL, '2024-06-13 14:07:44', '2024-06-13 14:07:44'),
('9c470095-c7fb-448a-9a0f-dabb47a42853', '93431', 'Reece Kunde', 'rfeeney@example.org', NULL, '6709 Beatty Extensions\nPort Luellaburgh, ND 21762-8009', 'default.jpg', 'departement', '$2y$10$bKLE4dNNhV/jLusjPk7LhehIhUjq9zKo2uYPSOqze19u2VzZlt1qW', NULL, '2024-06-13 14:07:44', '2024-06-13 14:07:44'),
('9c470095-e336-48e0-9e50-5510b342da98', '71676', 'Anabelle Goyette', 'xhilpert@example.net', NULL, '8552 Haag Trafficway\nNew Beau, MO 48453', 'default.jpg', 'departement', '$2y$10$PCGCvul9H959utZ9xN7nteyN2vQN0lpvbME4NNanYiGfP5osaJEFu', NULL, '2024-06-13 14:07:44', '2024-06-13 14:07:44'),
('9c470095-fe38-46ed-8994-48c23c6f6570', '73088', 'Lela Homenick DVM', 'jalyn.mclaughlin@example.com', NULL, '349 Darwin View\nMurphychester, NC 80674', 'default.jpg', 'departement', '$2y$10$5mySeod6cBZZZjMDmsjsm.4fsxBCPn300NnYYzoXsmWEROPVvJKZK', NULL, '2024-06-13 14:07:44', '2024-06-13 14:07:44'),
('9c470096-1834-4225-b6c9-cb5797cbe0cd', '75130', 'Lucienne Hettinger', 'corkery.darrick@example.net', NULL, '83765 Friesen Summit Suite 356\nBartellchester, IL 25799', 'default.jpg', 'departement', '$2y$10$2VpCTSJP.Mo1DuAQMNhkt.TGedEzo9fQU0zUoGIP8D.i6Z4jiMeEO', NULL, '2024-06-13 14:07:44', '2024-06-13 14:07:44'),
('9c470096-32e4-4934-8347-51e5577b3a96', '67514', 'Gregg Bailey', 'lavonne76@example.net', NULL, '6604 Kilback Isle Apt. 496\nWest Dannie, IL 91512', 'default.jpg', 'departement', '$2y$10$sO6SRbp82ih84S.ssyf1v.Jl862WAKs9R5HzvgMm6YvjiA6GKlwgC', NULL, '2024-06-13 14:07:44', '2024-06-13 14:07:44'),
('9c470096-4df3-4d06-9e47-51a8385b76e8', '63260', 'Oma Baumbach', 'art.gaylord@example.org', NULL, '17090 Timothy Groves\nPacochaberg, VA 27828-5663', 'default.jpg', 'departement', '$2y$10$voSrFJP8kxyfa1Y55FF6H.G3gqw3aWVd74Rz96oVPF3Ri56.ibhGC', NULL, '2024-06-13 14:07:44', '2024-06-13 14:07:44'),
('9c470096-6841-41d8-b4c7-e3818f6cd9b5', '22768', 'Fern Brakus', 'alfred24@example.org', NULL, '6863 Kulas Vista Suite 779\nNorth Celine, NE 13000-0946', 'default.jpg', 'departement', '$2y$10$KVKP6KOA88/VMYrCn1azheFlxKvO6etya/3gnc66X2dl.MsGqWZdy', NULL, '2024-06-13 14:07:44', '2024-06-13 14:07:44'),
('9c470096-8323-4f00-80c5-d857fd04a394', '83547', 'Deon Harvey Sr.', 'caleb13@example.com', NULL, '4433 Little Mountains Suite 137\nWest Erik, OH 12364', 'default.jpg', 'departement', '$2y$10$jRsrPRPfai/Cp6/SGPU6hORnuEUqeiz/Ga2p82lLixKcCdwwiwHem', NULL, '2024-06-13 14:07:44', '2024-06-13 14:07:44'),
('9c470096-9d3a-47c9-8d14-e033cbdd8773', '62850', 'Alberto Bogan', 'archibald.hammes@example.net', NULL, '586 Wiza Square Suite 841\nGleasonstad, MT 08595-9395', 'default.jpg', 'departement', '$2y$10$7F.P2W9Ioq1AFf501/XAourilNYtMA.HxhirxGTYefuD7kpc.CZbG', NULL, '2024-06-13 14:07:44', '2024-06-13 14:07:44'),
('9c470096-b7f6-4cf2-9372-664d82720557', '63149', 'Sid Hane', 'smcglynn@example.com', NULL, '8236 Addie Gateway Apt. 481\nJerdefurt, AR 80453', 'default.jpg', 'departement', '$2y$10$YWpSXmsb13iL.BMpU3/dKe.5ogvXEsqVt2NoXbHaY0b2s0eWl9a0O', NULL, '2024-06-13 14:07:44', '2024-06-13 14:07:44'),
('9c470096-d306-4b34-8b89-3d3fd3403244', '78612', 'Carolyne Kirlin V', 'nash.cruickshank@example.com', NULL, '428 Ashley Meadow Suite 415\nRaymundobury, FL 20963-8933', 'default.jpg', 'departement', '$2y$10$uSd6F.d0k33xSC9KZnCKq.jkNQQ7evekhE.mj5dLFDCWy3ndYiVMi', NULL, '2024-06-13 14:07:44', '2024-06-13 14:07:44'),
('9c470096-ed57-44e3-a0da-90c4799dfa28', '65421', 'Prof. Jaron Rogahn V', 'mariela22@example.com', NULL, '2582 McGlynn River\nWest Thelma, DE 36259-1538', 'default.jpg', 'departement', '$2y$10$sOk439tyXTdDCK6lsdEOquaAqs.cdM94wWFmPmI0vxH3SEndFHYce', NULL, '2024-06-13 14:07:45', '2024-06-13 14:07:45'),
('9c470097-07f0-4f80-9171-3d4eebf7916f', '85911', 'Kathleen Gulgowski', 'kuhlman.weldon@example.com', NULL, '957 Valerie Route\nNew Daxshire, OK 96324', 'default.jpg', 'departement', '$2y$10$6pg0Srl7eJmONwuNgFtXQ.1JU0LxmuTAJTNsy1dieDhvsaGLoXVrK', NULL, '2024-06-13 14:07:45', '2024-06-13 14:07:45'),
('9c470097-22df-4ae4-b67b-2144a33c8863', '28517', 'Nasir Mosciski', 'wehner.ursula@example.net', NULL, '8766 Padberg Extension Suite 675\nPort Akeem, AR 29442', 'default.jpg', 'departement', '$2y$10$B/C36x38jfRCUDG4x1XoeuCXZYOjcc/.eB2MSOKGd2pt.9e8ze.JC', NULL, '2024-06-13 14:07:45', '2024-06-13 14:07:45'),
('9c470097-3d65-43ec-803a-633ed15f96ee', '33059', 'Astrid Brown', 'santina23@example.net', NULL, '87431 Leuschke Plaza Suite 441\nBernhardfort, NY 15192-7751', 'default.jpg', 'departement', '$2y$10$9vVUuaP5vTBnqhpTgLavt.6.bd4b2kkDLxv2E4Hg4WOJBSgULJTm2', NULL, '2024-06-13 14:07:45', '2024-06-13 14:07:45'),
('9c470097-57de-4cbf-a1df-f082a04cf634', '29881', 'Sheldon VonRueden', 'tommie78@example.org', NULL, '6363 O\'Connell Underpass\nConnellyburgh, ID 19144-8174', 'default.jpg', 'departement', '$2y$10$klhb/ZWEwGEVKyULK/jEEerjOmp61F6.0w0mKQGTFIbrlH4uLbLhC', NULL, '2024-06-13 14:07:45', '2024-06-13 14:07:45'),
('9c470097-72b6-4216-b7e0-8ebdc1e3b242', '65704', 'Domingo Cruickshank', 'aurelio01@example.org', NULL, '77363 Moen Street Suite 539\nNew Heath, NC 21695', 'default.jpg', 'departement', '$2y$10$baTZDTtmJt6wP.k4h10klOK/sq10/BXwbBJydI.IQEPMN4ERsWATu', NULL, '2024-06-13 14:07:45', '2024-06-13 14:07:45'),
('9c470097-8d4a-4410-8351-0dff76575d48', '32092', 'Darrin Leannon Jr.', 'desiree68@example.org', NULL, '26472 Rath Crossing\nKaylahland, ID 94391', 'default.jpg', 'departement', '$2y$10$S/0lBlf2fTVOOSUTmGRts.oQ2sg22ALSQYYCI3OgTzO37YNvctpcG', NULL, '2024-06-13 14:07:45', '2024-06-13 14:07:45'),
('9c470097-a781-4d16-a601-52ebcb6fda1c', '97492', 'Emilio Lubowitz', 'ewald.powlowski@example.org', NULL, '199 Kuhic Port\nEast Adelefurt, GA 25797-4957', 'default.jpg', 'departement', '$2y$10$EXwWfsxYByN43cCyTfIomubM53ojs4c7iD85d0FEuQNbpoOMIXTmm', NULL, '2024-06-13 14:07:45', '2024-06-13 14:07:45'),
('9c470097-c222-4e2d-b84a-91436422f2d8', '52296', 'Dr. Leon Glover Jr.', 'charlene84@example.org', NULL, '1625 Wiegand Prairie\nEffertzburgh, TN 91818-9078', 'default.jpg', 'departement', '$2y$10$Xj/CTIKDKachGjQHuwQ/Q.o3UsGxycm2.INnBXZ1KAdIwx6ScFQeq', NULL, '2024-06-13 14:07:45', '2024-06-13 14:07:45'),
('9c470097-dca6-4d39-bacb-e9c6ff58ba39', '72497', 'Gwendolyn Erdman', 'therese.cruickshank@example.net', NULL, '759 Bauch Groves\nDesmondtown, NM 67609', 'default.jpg', 'departement', '$2y$10$cbvZRx/U4d5awCEUfRJaEulTkbw2I2tiIrYT32A6DyauJ2CtArLxa', NULL, '2024-06-13 14:07:45', '2024-06-13 14:07:45'),
('9c470097-f764-4b87-8f97-9c455b4fd3fd', '38220', 'Prof. Florence Zulauf IV', 'flarson@example.net', NULL, '7009 Craig Estates\nSouth Bobby, AZ 47290', 'default.jpg', 'departement', '$2y$10$8tAcNv2bhRhujdzlZ7sTQO1NdsaPmk1NbPEhM8RPKPinOKBG679ym', NULL, '2024-06-13 14:07:45', '2024-06-13 14:07:45'),
('9c470098-1233-48e2-826d-d1051948baa4', '85604', 'Emmy Spinka', 'modesta14@example.net', NULL, '135 Davonte View Apt. 786\nOsinskimouth, NY 22183-2246', 'default.jpg', 'departement', '$2y$10$RnWdKavjO9LaLLOoicuyru.op5rukSKrzZ3.JdPPIPB9xmkKHvx0i', NULL, '2024-06-13 14:07:45', '2024-06-13 14:07:45'),
('9c470098-2ce6-4474-8f29-0e876e6d4cab', '97265', 'Ward Okuneva', 'lgusikowski@example.org', NULL, '591 Mayert Islands\nNew Nola, CO 31181-8457', 'default.jpg', 'departement', '$2y$10$lByrAKqfB3tOTaU/o8484O82jatxgmoy6Y.uQrYgT12qkJ2vDVTF.', NULL, '2024-06-13 14:07:45', '2024-06-13 14:07:45'),
('9c470098-4755-427c-b93e-71b6ff20d383', '87897', 'Mr. Cameron Hoeger', 'walker.lavinia@example.com', NULL, '6506 Cartwright Ford Apt. 792\nEast Mallorymouth, MI 01716', 'default.jpg', 'departement', '$2y$10$r5Ec5QHdt/mNGKdeizpGKu5v7737pgtR82.GH1wIPdF3zn247mTFG', NULL, '2024-06-13 14:07:45', '2024-06-13 14:07:45'),
('9c470098-6200-4868-aa55-67e053b6db0d', '96139', 'Skye Larkin', 'bahringer.arnoldo@example.com', NULL, '63308 Lillie Fields\nPrestonville, AR 62459-5123', 'default.jpg', 'departement', '$2y$10$56GPiAQLvYgSKLOeSJ0CU.j/O/9Yqm14NfiKjHw1efRr..1iotaFC', NULL, '2024-06-13 14:07:45', '2024-06-13 14:07:45'),
('9c470098-7c31-4cf4-afff-97e835aef14e', '77360', 'Prof. Buddy Green', 'gthompson@example.org', NULL, '5055 Markus Lodge Apt. 507\nAnkundingfurt, SC 82876', 'default.jpg', 'departement', '$2y$10$eYSKOj9F41JgNPk.Kn9VbuuJ1SA9Fj8i78AuPAKx3fnsqtVXJ3GN.', NULL, '2024-06-13 14:07:46', '2024-06-13 14:07:46'),
('9c470098-964c-455f-a8a4-8b69db163de1', '86101', 'Abraham Marvin', 'neha86@example.com', NULL, '57894 Missouri Lake Apt. 296\nEast Sanfordland, WI 70970-9629', 'default.jpg', 'departement', '$2y$10$FNYdwul1tOk6xqCVYSUt/uWL1HKoutxxMOSGNVtbyVPprtHy9SZc2', NULL, '2024-06-13 14:07:46', '2024-06-13 14:07:46'),
('9c470098-b0fb-4890-be1b-fe98ee903c02', '90257', 'Opal Baumbach Sr.', 'nwiza@example.org', NULL, '11870 Donnelly Light Suite 191\nNew Rocio, OH 00615', 'default.jpg', 'departement', '$2y$10$aoQAuFa6B0S25TkWDTb8G.bI7RgVsKlFwkcR4uaHe2mycgOV7KH9O', NULL, '2024-06-13 14:07:46', '2024-06-13 14:07:46'),
('9c470098-cb51-45ae-b14a-50047e1d757f', '44880', 'Dr. Jadon Greenholt', 'isaias.kohler@example.org', NULL, '9743 Bill Plaza\nDonnellystad, IL 77034-7075', 'default.jpg', 'departement', '$2y$10$phSgpxkdBtJgLl94KshkfusWc4eHcSRAufGE1km1yiCvjjMVxcnB6', NULL, '2024-06-13 14:07:46', '2024-06-13 14:07:46'),
('9c470098-e600-4db7-a6f9-64c09371169e', '13649', 'Laurine Olson', 'lia.grant@example.net', NULL, '4528 Effertz Junction\nHaleymouth, RI 56866', 'default.jpg', 'departement', '$2y$10$npHsfs9m8H.9VoUnjjrX8.lnWVQtcbSsYgD6mnaZfU/o/lurxsQ.2', NULL, '2024-06-13 14:07:46', '2024-06-13 14:07:46'),
('9c470099-0092-4751-92d5-7aa447e8acd9', '19349', 'Brenda Dibbert', 'ojones@example.net', NULL, '7747 Legros Cove Suite 545\nNew Kellie, HI 64785', 'default.jpg', 'departement', '$2y$10$vUlwe0ozcApqs4aFmvttRuXJOvgNiQlTZBCxUjc1VsyVmDs1RJSga', NULL, '2024-06-13 14:07:46', '2024-06-13 14:07:46'),
('9c470099-1bde-481e-a9f8-1d5aa06120db', '94917', 'Madaline Treutel', 'maribel59@example.net', NULL, '9382 Tristian Drive\nNew Lucaschester, HI 76093', 'default.jpg', 'departement', '$2y$10$72dCojLYYv3AmL/mYz8KCO19EpKlpAfXo39i9oVVAtw5mmX277OgW', NULL, '2024-06-13 14:07:46', '2024-06-13 14:07:46'),
('9c470099-361f-4081-a30f-37bcc9f94f48', '60878', 'Cullen McLaughlin MD', 'langworth.jody@example.com', NULL, '30983 Onie Garden\nBarryfort, ME 57304', 'default.jpg', 'departement', '$2y$10$oLTUEm5liNf4iHLTP2Ozi.ar4DHU3r4fkLvf.rffMmiXUeK6FiGKS', NULL, '2024-06-13 14:07:46', '2024-06-13 14:07:46'),
('9c470099-5188-4900-85fb-df6335415324', '86057', 'Laurel Tremblay I', 'xjast@example.net', NULL, '68601 Thaddeus Circle\nCarterberg, OH 30413', 'default.jpg', 'departement', '$2y$10$X.B6TrnSsxzFnzw84F2Gfeb.3RdLa7NCJx2.GkrHv/ZZr6AX6.mPy', NULL, '2024-06-13 14:07:46', '2024-06-13 14:07:46'),
('9c470099-6bdf-4f62-925c-ca5b9baa437b', '12636', 'Jamil Effertz Sr.', 'francisco94@example.org', NULL, '88887 Lowell Point\nWilhelminebury, WI 23556-6709', 'default.jpg', 'departement', '$2y$10$0pIhFhLO.4vkmqgobf0yI.9lwwoWbxQS0zoKu7pRpR6vkogYF7NIW', NULL, '2024-06-13 14:07:46', '2024-06-13 14:07:46'),
('9c470099-8676-474a-80bc-c9065c058cda', '99395', 'Quinn Ward Jr.', 'dach.savanna@example.net', NULL, '18938 Langworth Route Suite 127\nHirthetown, NJ 22127-0009', 'default.jpg', 'departement', '$2y$10$BFq.oRULE04CpIjUEcCqsO7VQmvjjUoLjkq2bvjqoHnI9ARmHV02.', NULL, '2024-06-13 14:07:46', '2024-06-13 14:07:46'),
('9c470099-a15f-424b-b972-9c6014726d98', '84946', 'Grover Block', 'jessika20@example.net', NULL, '294 Ilene Bypass\nHattieland, MA 85454-4309', 'default.jpg', 'departement', '$2y$10$NN0MLTlP7CjbZLpqN7D5j.gUECLBFwf709CV0ufQIGUA/a.gGUSEG', NULL, '2024-06-13 14:07:46', '2024-06-13 14:07:46'),
('9c470099-bce3-463b-baa3-7ef0c8ba55b7', '45735', 'Jefferey Johnston', 'haag.sherwood@example.com', NULL, '33478 Misty Forks Apt. 545\nSouth Faye, WA 94742', 'default.jpg', 'departement', '$2y$10$YgSDXRSBXi.7NTIUqwCIMOxWt/0GFOrJogrojRRpSM6GtWO/23/Yu', NULL, '2024-06-13 14:07:46', '2024-06-13 14:07:46'),
('9c470099-d82f-4827-ae8c-3eff489db815', '49730', 'Dr. Jamil Koss', 'judge.dooley@example.org', NULL, '400 Giovanny Trafficway Suite 916\nPort Agnesfurt, KY 13100', 'default.jpg', 'departement', '$2y$10$iiILmgXM5WmrZHrtDO5M0O991M/HGfgyWhE0Nc8/nKXXaj7FDGtlG', NULL, '2024-06-13 14:07:46', '2024-06-13 14:07:46'),
('9c470099-f411-4728-ad0c-e63dd2a2cfde', '70203', 'Ms. Sunny Nolan', 'tillman.skiles@example.com', NULL, '44992 Beer Knoll Apt. 938\nValeriemouth, IN 62818', 'default.jpg', 'section', '$2y$10$gMiJYOizdg7AzK4a9n3bsenPZzkpOjNrPigeXshyK5StvsFB8r5RS', NULL, '2024-06-13 14:07:47', '2024-06-13 14:07:47'),
('9c47009a-0f8e-4e7a-981b-308deb8e542f', '38889', 'Sedrick Beahan', 'tshields@example.org', NULL, '6365 Simonis Summit Suite 830\nNorth Edenburgh, MD 97545-9490', 'default.jpg', 'section', '$2y$10$9VjA6UtH6/sJX7Ss9qah1uWv8Uq/JfKj3edeyiklKa1Dsz2hD7PUW', NULL, '2024-06-13 14:07:47', '2024-06-13 14:07:47'),
('9c47009a-29f9-4b32-9d5e-ef41e012a542', '32558', 'Abigale Yost DVM', 'gleason.kayleigh@example.org', NULL, '3237 Friesen Springs\nAlanhaven, MA 00475-3225', 'default.jpg', 'section', '$2y$10$gHAXclwXfUNLeENuHNQSjOgQrLiuBMqiaLr3xgT39x3qeEWbCmxO2', NULL, '2024-06-13 14:07:47', '2024-06-13 14:07:47'),
('9c47009a-446a-452c-aff7-7705a8f42239', '90214', 'Scot Will I', 'tierra19@example.net', NULL, '961 Dwight Parks\nLouchester, ID 86094-9357', 'default.jpg', 'section', '$2y$10$mmvdqLhXBbgkky6Olfi.VefAmOSnStfZOcTqlRnRq96cHs8TM.boa', NULL, '2024-06-13 14:07:47', '2024-06-13 14:07:47'),
('9c47009a-5f62-45bd-b339-d4612bd69ed4', '65294', 'Carolyn Lowe', 'astrid.cartwright@example.com', NULL, '7817 Terry Rapids\nEast Roy, WY 68233-3673', 'default.jpg', 'section', '$2y$10$j.beaLi5lYuR1GxjwQ4trOtr5kEXeiowzI/ukFQO9cWugv9C5ejTW', NULL, '2024-06-13 14:07:47', '2024-06-13 14:07:47'),
('9c47009a-79a4-4d8a-8ee8-7d0f28b30d8e', '63050', 'Kris Carroll', 'maddison88@example.com', NULL, '7302 Hessel Loop Suite 993\nWest Cortez, NM 36471-8092', 'default.jpg', 'section', '$2y$10$INAyAV.aExg9gEYaRB3sI.dhxWioftUl770Jf4Su40uS6zn4vDsp.', NULL, '2024-06-13 14:07:47', '2024-06-13 14:07:47'),
('9c47009a-949d-4405-9cb1-a4863c9fbd92', '94852', 'Glennie Botsford', 'cole43@example.net', NULL, '865 Tressie Passage\nLake Khalid, OR 49954-8021', 'default.jpg', 'section', '$2y$10$95WP1fqyZBcrfZaYZs55Eu.Ef4nLs4wfbyQBrsEKSD5ihTh4JXyR.', NULL, '2024-06-13 14:07:47', '2024-06-13 14:07:47'),
('9c47009a-aec2-4bac-b9e1-d99aab243cf9', '38792', 'Prof. Aleen Streich I', 'leonie.koelpin@example.com', NULL, '200 Fahey Shores Suite 442\nOsvaldoberg, NJ 98894-6236', 'default.jpg', 'section', '$2y$10$lqDO/1f.2VVPK/AVP2UQBuPiAJBdmKbKo98d7a7WdEfRsjyYOmTbC', NULL, '2024-06-13 14:07:47', '2024-06-13 14:07:47'),
('9c47009a-c95a-4289-8fcf-2f300be41408', '37859', 'Rosella Veum', 'whitney.baumbach@example.com', NULL, '43936 Reilly Fork\nLake Troyburgh, UT 93969', 'default.jpg', 'section', '$2y$10$Zshq29SNbS9cKBCkH.JI6.jCX6JN07MaloxQLrS/YMN5YZmVlvW96', NULL, '2024-06-13 14:07:47', '2024-06-13 14:07:47'),
('9c47009a-e484-4d97-bb24-4fe3d1ef0a50', '84268', 'Mr. Austin Metz Sr.', 'ratke.dena@example.com', NULL, '93709 Wisoky Ramp\nWest Houstonmouth, NY 78852-2239', 'default.jpg', 'section', '$2y$10$2i.SOQ9WPA3z8LGJWRhz7ex3Tlab.mbS10oSAMhVoSlfR4fB2O/gO', NULL, '2024-06-13 14:07:47', '2024-06-13 14:07:47'),
('9c47009b-0068-42a6-8e3b-5f87ff99b14c', '50316', 'Mrs. Leora Lockman DVM', 'zemard@example.net', NULL, '48403 McKenzie Lake\nUptonberg, CA 97824-4332', 'default.jpg', 'section', '$2y$10$uOIU0MFcTEPUhsTKeGP2ueMZMGqE9LH..8fOZeiO/vkO4s8dKvH2e', NULL, '2024-06-13 14:07:47', '2024-06-13 14:07:47');
INSERT INTO `users` (`id`, `nomor_induk`, `nama`, `email`, `email_verified_at`, `alamat`, `foto_profile`, `role`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
('9c47009b-1bff-4fe5-9cee-47289bae79d2', '48158', 'Dr. Dominique Lubowitz', 'roslyn.feest@example.com', NULL, '21805 Mante Ways\nPort Ruth, KS 18840', 'default.jpg', 'section', '$2y$10$2w6dFJmgwGaEtv8DFqQEA.cF7oislm21BKiSLd8gQbZ9GlzACgoSG', NULL, '2024-06-13 14:07:47', '2024-06-13 14:07:47'),
('9c47009b-3771-474e-9f8f-79c7f4fbae3a', '45538', 'Levi Hirthe', 'tina.rippin@example.org', NULL, '373 Kris Dam Apt. 721\nKshlerinchester, TX 73286', 'default.jpg', 'section', '$2y$10$g60fJvFD6l02oI218xNBFOfRdtkRCXpJWx4fWeCJ7zcbQ9AuaQT7.', NULL, '2024-06-13 14:07:47', '2024-06-13 14:07:47'),
('9c47009b-5399-4316-8b77-84df190e5b4b', '66772', 'Dr. Kylie Mayer PhD', 'retha59@example.com', NULL, '731 Carter Mountains\nWintheiserport, ME 63284-1298', 'default.jpg', 'section', '$2y$10$cnhPx.Nt425IC9lhZhlm7O7iQ0GGgX8xz1/QA9EUdy1/pG8b.mlMG', NULL, '2024-06-13 14:07:47', '2024-06-13 14:07:47'),
('9c47009b-71dd-4aa8-8386-88cdf462f630', '82503', 'Dr. Waino Kunze MD', 'rutherford.alec@example.net', NULL, '1725 Weissnat Turnpike\nRathchester, WA 95653', 'default.jpg', 'section', '$2y$10$oKMjQVdN2K5A8.mkwax81.jGf0WkXhgKMijvqwFO/.x5qKKSHka4C', NULL, '2024-06-13 14:07:47', '2024-06-13 14:07:47'),
('9c47009b-8c3b-4741-b71c-0082d5f65539', '89153', 'Helene Welch', 'frami.elmore@example.net', NULL, '15037 Evert Trail Apt. 378\nSouth Milotown, AK 70290-7163', 'default.jpg', 'section', '$2y$10$syOPcKnzUPKujHYl2fMKuu9vI6u0W0XhYbQSm9yCDhstGiCJ45tlO', NULL, '2024-06-13 14:07:48', '2024-06-13 14:07:48'),
('9c47009b-a79c-4717-a8ca-f63ad89e0d8c', '87309', 'Mr. Nicola Gutkowski Sr.', 'douglas.viviane@example.com', NULL, '71896 Asha Shore Suite 073\nKemmerchester, RI 13633-2567', 'default.jpg', 'section', '$2y$10$KlnnDH45BtNaN0Y/Rg2B2OScUskUk03GlC/LZkpnPmM71EqSTbe.q', NULL, '2024-06-13 14:07:48', '2024-06-13 14:07:48'),
('9c47009b-c202-4d94-819b-3f6523902c47', '40715', 'Mr. Lesley Greenfelder PhD', 'ceffertz@example.org', NULL, '139 Rice Fork\nWest Felix, AZ 76555', 'default.jpg', 'section', '$2y$10$2BESIFRshPL9wZQj7.chu.2B/WrEjgG0hPTNfHGqH/uWsC6Vf9W7G', NULL, '2024-06-13 14:07:48', '2024-06-13 14:07:48'),
('9c47009b-dc3f-4a56-8fb5-ab83bc5391c6', '11391', 'Avis Lemke', 'harber.rosetta@example.com', NULL, '147 Berge Fork Suite 917\nLake Joyceshire, GA 56499-3955', 'default.jpg', 'section', '$2y$10$PElHtGo5jjdsdFJ9WTFqg.8qMp8eD.wkPHndmSzPWoMkO2NjjlLw2', NULL, '2024-06-13 14:07:48', '2024-06-13 14:07:48'),
('9c47009b-f646-4fde-bb60-f7a22d0c1a66', '71966', 'Roberto Stroman', 'zoe90@example.org', NULL, '52548 Krajcik Circle Suite 515\nSouth Rosalinda, NE 52687', 'default.jpg', 'section', '$2y$10$lGzrQ4mSPcGBhBJas5EzCOBp80/nAzJOLPXqt3xXPUlEqdM7ryDFS', NULL, '2024-06-13 14:07:48', '2024-06-13 14:07:48'),
('9c47009c-10ce-4e6a-862b-7cbcea2ebee9', '67707', 'Pansy Moen', 'bprosacco@example.com', NULL, '12974 Maddison Pines\nNew Conor, NH 20300-9893', 'default.jpg', 'section', '$2y$10$/xxzyZtv7Q9JqoawDiUyOekqKxTwgez7yIprWrNtXQ3jhz1SP3sBS', NULL, '2024-06-13 14:07:48', '2024-06-13 14:07:48'),
('9c47009c-2b99-4bdb-b7dc-7ef8c58dc338', '67077', 'Madyson O\'Reilly II', 'ceasar.weissnat@example.com', NULL, '2826 Johanna Forest Suite 541\nNorth Alison, NM 46720-4511', 'default.jpg', 'section', '$2y$10$imXeHCqdmyE3NbSG7NdK4uH8brt04E//Bcp41SeIQxp1Jy0qk9OsS', NULL, '2024-06-13 14:07:48', '2024-06-13 14:07:48'),
('9c47009c-4613-4fca-9c74-9fdbdfc27185', '60745', 'Murphy Eichmann', 'viva.heathcote@example.org', NULL, '3472 Modesto Radial Suite 421\nTrudiefurt, PA 43095-1493', 'default.jpg', 'section', '$2y$10$QT4FygHCGbuuo.1fJt8WR.LdckGrHwof91TJPDEwi6raNETL/PbEi', NULL, '2024-06-13 14:07:48', '2024-06-13 14:07:48'),
('9c47009c-60b9-48e5-9713-a47d24c6463e', '77011', 'Athena Rutherford', 'horace.beier@example.com', NULL, '389 Tyrique Mountain\nEast Mazieborough, FL 23482-6846', 'default.jpg', 'section', '$2y$10$S7KXQzXjjJhmzQ75zxcv5OY4v66oSYFwwfXmOfsuluNa/wP8j03WS', NULL, '2024-06-13 14:07:48', '2024-06-13 14:07:48'),
('9c47009c-7b1f-45aa-8b26-1d4375598008', '18873', 'Darren O\'Kon', 'wgoodwin@example.org', NULL, '55193 Aufderhar Path Apt. 181\nNorth Albin, VT 99443-7983', 'default.jpg', 'section', '$2y$10$AmQnGN5jemlHItiP6nPlcewyONcEmCCTpKdFiuvxU2vcHcZE7rLgO', NULL, '2024-06-13 14:07:48', '2024-06-13 14:07:48'),
('9c47009c-9617-473b-8fc4-e65d6e7137e0', '33674', 'Elda Kerluke', 'olin36@example.org', NULL, '4309 Domingo Fields Apt. 712\nPort Bransonborough, TX 27211-4813', 'default.jpg', 'section', '$2y$10$zBMS09UdfvvvOrvVU6jBm.cOialvbx3BTrF3842k9rohthf0aQcTq', NULL, '2024-06-13 14:07:48', '2024-06-13 14:07:48'),
('9c47009c-b12b-4663-8e50-9a7d916a9466', '48365', 'Shanny McGlynn', 'dibbert.ramona@example.org', NULL, '96764 Mandy Rapid\nLake Buster, NM 52836-7621', 'default.jpg', 'section', '$2y$10$v.3ocZmzfFYA5sVuezp3N.X0Atj2/E1jV7oEvJFeOBmou4H/qZVJ.', NULL, '2024-06-13 14:07:48', '2024-06-13 14:07:48'),
('9c47009c-cbfa-4f17-bed2-fbfd3af9ccdf', '43234', 'Prof. Demarcus Fay DDS', 'jcummerata@example.net', NULL, '662 Koepp Dam\nTheodoratown, AL 06162', 'default.jpg', 'section', '$2y$10$6texHHu2RCCo.sGQp3dZs.tszN8Un9dk7baEWPy7x5csPApGf/Cuq', NULL, '2024-06-13 14:07:48', '2024-06-13 14:07:48'),
('9c47009c-e6b7-45ed-995f-c1d954163e87', '79306', 'Greta Stoltenberg', 'polly06@example.com', NULL, '640 Mills Drive Apt. 494\nBroderickmouth, NC 13836', 'default.jpg', 'section', '$2y$10$FPqydgc3UTUcv4MaGusYYuDxjeNuhfXJbzf2WySYD3D4cloREoZDK', NULL, '2024-06-13 14:07:48', '2024-06-13 14:07:48'),
('9c47009d-01e3-441d-8d93-8201d833e2fd', '33449', 'Hosea McClure', 'williamson.zoe@example.org', NULL, '7101 Sandy Ways\nPort Darionhaven, WA 39202', 'default.jpg', 'section', '$2y$10$sHaxK8j3EG5vWkwo4iBqYuPbtFfyuQjYBLzY3bq54yOBdrNtdlD5m', NULL, '2024-06-13 14:07:49', '2024-06-13 14:07:49'),
('9c47009d-1c55-454b-be32-be6baf2ec37b', '34701', 'Janiya Hodkiewicz', 'runolfsson.steve@example.org', NULL, '123 Ledner Courts Apt. 715\nStreichside, ID 74453', 'default.jpg', 'section', '$2y$10$xHWynhWxNl0y8o3uZRdSq.rnLG2er6tiF8mhKIfDoXXoSfhdPUKkq', NULL, '2024-06-13 14:07:49', '2024-06-13 14:07:49'),
('9c47009d-3729-4b85-a0e1-511db484da32', '68996', 'Adah Kassulke', 'ryder69@example.org', NULL, '9206 Deven Parkway Suite 329\nSouth Willardmouth, KY 57666-6631', 'default.jpg', 'section', '$2y$10$0gD67mirZQPrqLpP8KkOG.rA73baLmaGDdE08T/rx8Isi0AMaIvM2', NULL, '2024-06-13 14:07:49', '2024-06-13 14:07:49'),
('9c47009d-5232-40da-bcc0-6810b93ff17e', '92489', 'Prof. Ryley Pfannerstill Sr.', 'lorna29@example.com', NULL, '530 Annetta Springs Suite 685\nNew Myrtis, OK 34357-0328', 'default.jpg', 'section', '$2y$10$67YJYzjHchEO4i8SAFYRBOe9NvSxlOrS3Smwx4JhkZeAWtTDMdvHq', NULL, '2024-06-13 14:07:49', '2024-06-13 14:07:49'),
('9c47009d-6dfe-43ed-8cbd-6f9dcadc5e65', '23042', 'Estevan Gerlach', 'marcellus95@example.org', NULL, '32261 Nya Inlet\nRunolfssonhaven, AK 59228', 'default.jpg', 'section', '$2y$10$CbbYUs9gP1uSnQHxRfVreesYgVQGR3R0ym4m7iUPKJ/R1OY6wgyaG', NULL, '2024-06-13 14:07:49', '2024-06-13 14:07:49'),
('9c47009d-8861-4a40-bdec-ac4b59ec55a0', '95550', 'Adrian Quitzon IV', 'adrain.wiegand@example.net', NULL, '5905 Gibson Lock Apt. 994\nNorth Amberberg, WI 53503', 'default.jpg', 'section', '$2y$10$5KtGRYJXTq8PR4eGrslc/eUNlMYFjJE7zgp5lP5XDur1RBHaq4e1i', NULL, '2024-06-13 14:07:49', '2024-06-13 14:07:49'),
('9c47009d-a2a7-4184-9f66-32aed523500d', '40588', 'Amani Rutherford', 'cleveland69@example.com', NULL, '1308 Hill Squares Apt. 118\nBaumbachchester, RI 36078-4817', 'default.jpg', 'section', '$2y$10$RmfZWJakwh.iIxKqlmw.De03NQTcWvCpRXCEyD2H0i/zAdQN5bL.G', NULL, '2024-06-13 14:07:49', '2024-06-13 14:07:49'),
('9c47009d-bfb2-491b-ae24-09e95b1ae638', '32337', 'Estevan Waelchi', 'edwin45@example.com', NULL, '630 Armstrong Forks\nNorth Sammouth, MT 78737', 'default.jpg', 'section', '$2y$10$Em9ivcEobXWrpm9dd6vGP.mcIwDaDUSJ5B/trWePXarIVgdPB7dle', NULL, '2024-06-13 14:07:49', '2024-06-13 14:07:49'),
('9c47009d-d9e9-4c80-8a22-0b58b8bd9878', '37975', 'Lilyan Hermiston', 'eshields@example.net', NULL, '79298 Okuneva Route Apt. 917\nSouth Geoview, PA 94393', 'default.jpg', 'section', '$2y$10$w9h9BRrx912tEhs7sERuO.KDxauSnJolDtbGkz0SdAPaf.BRHfOhC', NULL, '2024-06-13 14:07:49', '2024-06-13 14:07:49'),
('9c47009d-f52d-4caf-919c-980c11cc9d87', '50293', 'Donald Huels', 'albertha83@example.org', NULL, '1202 Lillie Port\nEast Janiya, NE 27851', 'default.jpg', 'section', '$2y$10$akD8NwRQEO2yjJPZBUiapOAN608IL68Wwl4l63a6w4C781/Rzj.6G', NULL, '2024-06-13 14:07:49', '2024-06-13 14:07:49'),
('9c47009e-0f69-41b8-8d4c-56955b804af5', '48374', 'Thora Halvorson', 'ucormier@example.org', NULL, '9559 Langosh Walk Suite 255\nSalvadorton, ID 61265', 'default.jpg', 'section', '$2y$10$YKAw/orej7blA.3RQiwE2esQOyOW/kSSAhDoT2a5U7Yv2rbX0t91W', NULL, '2024-06-13 14:07:49', '2024-06-13 14:07:49'),
('9c47009e-29ec-4adc-8451-0bd09b34ac78', '96615', 'Stanford Wolf', 'heidenreich.nikki@example.org', NULL, '43804 Geraldine Mill Suite 451\nLoyceport, AK 46748-3940', 'default.jpg', 'section', '$2y$10$47OJRF6pwrEiTPyR4fajheX5cjNnVmk5XJuPTRK8785BgS7C9QLgq', NULL, '2024-06-13 14:07:49', '2024-06-13 14:07:49'),
('9c47009e-44fe-469d-8e4b-779993719ff0', '33811', 'Dr. Janis Breitenberg I', 'strosin.ruby@example.net', NULL, '548 Harber Inlet\nTheresiashire, WY 24650', 'default.jpg', 'section', '$2y$10$GQfACGdR3HBgGAD4BV61l.EpaZvGHdRKjmNrotUHYkmiZUTwd1oMq', NULL, '2024-06-13 14:07:49', '2024-06-13 14:07:49'),
('9c47009e-6029-4c10-a783-021a45db2714', '33759', 'Dr. River Towne DDS', 'prohaska.georgianna@example.com', NULL, '14642 Murray Fall Suite 234\nEast Arne, KS 53970-9171', 'default.jpg', 'section', '$2y$10$GS6jhpOwnztfKo/vVMYRI.xJjMQv1TjYbzneD9QUYpAueskTtv/yG', NULL, '2024-06-13 14:07:49', '2024-06-13 14:07:49'),
('9c47009e-7e68-4fdd-863a-8f23118132c5', '11793', 'Lazaro Langosh', 'louisa.harris@example.net', NULL, '13989 Friesen Crossroad\nKihnfort, NJ 61961-1071', 'default.jpg', 'section', '$2y$10$fGBJMqxDHYLCYD5rgNJePuBlo04.RCgeabFk2SR/p6dMpERQ391x.', NULL, '2024-06-13 14:07:49', '2024-06-13 14:07:49'),
('9c47009e-99d4-4961-8fd2-783aeed9b0f5', '34756', 'Alf Goldner', 'larkin.arvid@example.com', NULL, '247 Ondricka Springs\nWest Ruthieview, PA 81264', 'default.jpg', 'section', '$2y$10$La.k4LVBRBeU7/GZ3AfgtOiq6YEW5jGaD9ngSjUDaASfcnA1Wmaxa', NULL, '2024-06-13 14:07:50', '2024-06-13 14:07:50'),
('9c47009e-b532-4bf4-b3ae-712f5b61259c', '10620', 'Daphnee Schuppe', 'ona31@example.org', NULL, '3103 Rau Village Apt. 081\nNikolausshire, KY 50495', 'default.jpg', 'section', '$2y$10$IGhF2Hn1ECCbnLv1NJZkMelBg/ZQQFyAC/LQXxXh55MJi.0jCcMsO', NULL, '2024-06-13 14:07:50', '2024-06-13 14:07:50'),
('9c47009e-d109-4aff-9582-5be64fc49c8c', '99570', 'Gilbert Wehner', 'bettye20@example.net', NULL, '5004 Nat Springs Suite 647\nBertrambury, ND 46202', 'default.jpg', 'section', '$2y$10$w8CbYbM1S4N7z0wa/pLPF.q5R9VhnIjXgZHPhfJgXR7jtpBLSoSXO', NULL, '2024-06-13 14:07:50', '2024-06-13 14:07:50'),
('9c47009e-eb45-49b0-b8eb-3b41d2c15a12', '86999', 'Elody Goyette', 'brendon23@example.org', NULL, '579 Kulas Court Apt. 033\nJakubowskifort, FL 84048-2751', 'default.jpg', 'section', '$2y$10$5REzlVpyLeW.yHFA7mR73eazyE2aaEaiSY7WxCzYJE1q3IrR2mr8i', NULL, '2024-06-13 14:07:50', '2024-06-13 14:07:50'),
('9c47009f-0587-42dd-b168-7f679c182d62', '69878', 'Candace Mohr MD', 'ferry.citlalli@example.net', NULL, '537 Keith Springs Suite 201\nPort Davonfort, MT 68635', 'default.jpg', 'section', '$2y$10$KY7.HiJDmpC5p66obHp3d.fcL.i3dBfeFWA/0vArORo2.mEbxbBES', NULL, '2024-06-13 14:07:50', '2024-06-13 14:07:50'),
('9c47009f-1fb1-438e-82bb-972e2d2714c9', '43160', 'Conrad Sporer PhD', 'farrell.lincoln@example.org', NULL, '31117 Eulalia Squares\nNorth Lexusview, MO 93286', 'default.jpg', 'section', '$2y$10$XTooW.s4.Qx7Zd.3w2pV1Od6sugwU/IVhlRJ.R4Yhfnw6M1qibMuW', NULL, '2024-06-13 14:07:50', '2024-06-13 14:07:50');

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
