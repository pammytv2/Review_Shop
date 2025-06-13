-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2025 at 08:12 AM
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
-- Database: `backend2`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2025_06_12_055815_create_users_table', 1),
(2, '2025_06_12_055925_create_products_table', 1),
(3, '2025_06_12_060007_create_products_table', 1),
(4, '2025_06_12_061252_create_sessions_table', 1),
(5, '2025_06_12_064303_add_url_img_to_products_table', 1),
(6, '2025_06_12_085451_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '1c91f25d3694d0e4822aafc0a5a0aa44925ee2fb519eb521447d9b6adbe0c9c6', '[\"*\"]', NULL, NULL, '2025-06-12 02:02:48', '2025-06-12 02:02:48'),
(2, 'App\\Models\\User', 1, 'auth_token', 'ad63d11ddacb2c9eced26c3c6becaf7a6bfb63977cbe8bd92d097a2089ff87c9', '[\"*\"]', NULL, NULL, '2025-06-12 02:11:33', '2025-06-12 02:11:33'),
(3, 'App\\Models\\User', 1, 'auth_token', 'db4f7a5ff7415cba81dd0e7d8b9a54ac62db828dffae50c3b4a6c64085fec03b', '[\"*\"]', NULL, NULL, '2025-06-12 02:25:46', '2025-06-12 02:25:46'),
(4, 'App\\Models\\User', 1, 'auth_token', '71845306afdb8ea76d702b0b8382c520cded988162e8d9c0ae788e50a8fcf51b', '[\"*\"]', NULL, NULL, '2025-06-12 02:26:23', '2025-06-12 02:26:23'),
(5, 'App\\Models\\User', 1, 'auth_token', 'd3fc19723e8f3729c71c7ca3a7809305c37f050dba200fd60c66c79ee776d769', '[\"*\"]', '2025-06-12 02:28:00', NULL, '2025-06-12 02:27:52', '2025-06-12 02:28:00'),
(6, 'App\\Models\\User', 1, 'auth_token', '99fc3e72b45836fa81f40178bf940b6ac3ff4ffd25a2ceaa783f1e422a313444', '[\"*\"]', NULL, NULL, '2025-06-12 02:45:40', '2025-06-12 02:45:40'),
(7, 'App\\Models\\User', 3, 'auth_token', 'd9d2536be8a068ce74c2e026fb0cda3f29bc459188a16aca1abdb73b0fb2e3e4', '[\"*\"]', NULL, NULL, '2025-06-12 02:53:16', '2025-06-12 02:53:16'),
(8, 'App\\Models\\User', 4, 'auth_token', '186c8d18b29138a9a2e56072db3fc449144d009b474423521cffe4dc8dffe1de', '[\"*\"]', '2025-06-12 04:56:04', NULL, '2025-06-12 04:30:18', '2025-06-12 04:56:04'),
(9, 'App\\Models\\User', 3, 'auth_token', '7f5c59573b42d92526b962e072c901ac4f971a1b1e82345054e2f43ec89de638', '[\"*\"]', '2025-06-12 04:59:25', NULL, '2025-06-12 04:57:18', '2025-06-12 04:59:25'),
(10, 'App\\Models\\User', 1, 'auth_token', '75bd40bb8a49cbaf4f7aed7a881e6a906d2703b45722b8eecad8f17c6c866ac7', '[\"*\"]', NULL, NULL, '2025-06-12 05:00:40', '2025-06-12 05:00:40'),
(11, 'App\\Models\\User', 1, 'auth_token', '11a7b46812b9c1d50ab58b945b5ca5f580134ee575c04a4240fde13a4384ce7b', '[\"*\"]', NULL, NULL, '2025-06-12 05:01:13', '2025-06-12 05:01:13'),
(12, 'App\\Models\\User', 1, 'auth_token', 'af48bff83b4d905474ca09c22959df8e7bb73590f2cde03a7d1bd2058c786929', '[\"*\"]', '2025-06-12 05:02:10', NULL, '2025-06-12 05:01:35', '2025-06-12 05:02:10'),
(13, 'App\\Models\\User', 3, 'auth_token', 'a6a0b9497bd56a4ee0cfe54216d59f709bee7f59fff62d998cd154e04ec82e67', '[\"*\"]', '2025-06-12 10:01:36', NULL, '2025-06-12 05:03:06', '2025-06-12 10:01:36'),
(14, 'App\\Models\\User', 1, 'auth_token', '67d8fa18d1420d82367a1d37f1bfcbc8f38881922fedb1c1852549791838578a', '[\"*\"]', NULL, NULL, '2025-06-12 09:52:21', '2025-06-12 09:52:21'),
(15, 'App\\Models\\User', 1, 'auth_token', '33a36d0d6044ccd0837c91f1243e1567a837763f5e609c1766d80ac44d043903', '[\"*\"]', '2025-06-12 09:52:50', NULL, '2025-06-12 09:52:40', '2025-06-12 09:52:50'),
(16, 'App\\Models\\User', 3, 'auth_token', '53570c444e500c186235a4c0b7bf21e96bd7dcea1fa7a35ee4578fb3dd1b7d71', '[\"*\"]', '2025-06-12 10:13:52', NULL, '2025-06-12 10:02:16', '2025-06-12 10:13:52'),
(17, 'App\\Models\\User', 3, 'auth_token', '89246c313f15807787fbf981168940a058b9a29ba0f3017c358cf884e40661e6', '[\"*\"]', '2025-06-12 10:16:36', NULL, '2025-06-12 10:14:00', '2025-06-12 10:16:36'),
(18, 'App\\Models\\User', 3, 'auth_token', 'fc9d603e02036f12c928f98336eb6ca92783764ac626593c0a7135371d1fd214', '[\"*\"]', '2025-06-12 10:26:31', NULL, '2025-06-12 10:24:47', '2025-06-12 10:26:31'),
(19, 'App\\Models\\User', 3, 'auth_token', 'e53dc542d1321e323ad22b4cec09fe16cb9598a866b83fe91e3ee736beb17e80', '[\"*\"]', '2025-06-12 10:30:09', NULL, '2025-06-12 10:30:04', '2025-06-12 10:30:09'),
(20, 'App\\Models\\User', 3, 'auth_token', 'b5b6d11083235429e3f3d3b93cb92a91423cf2ca943802e1810a7a3a9ed6e2c3', '[\"*\"]', NULL, NULL, '2025-06-12 10:37:21', '2025-06-12 10:37:21'),
(21, 'App\\Models\\User', 3, 'auth_token', 'eed639cc1b5d601908254206516bd8b6e1a0b9b0d341f56045e78275ee9e6a7e', '[\"*\"]', '2025-06-12 11:24:36', NULL, '2025-06-12 10:48:30', '2025-06-12 11:24:36'),
(22, 'App\\Models\\User', 5, 'auth_token', '811aed5480721183f93bff0c7a76612eb18330619637bfd96a63b86e685d5af5', '[\"*\"]', '2025-06-12 11:26:16', NULL, '2025-06-12 11:26:06', '2025-06-12 11:26:16'),
(23, 'App\\Models\\User', 3, 'auth_token', '669c959cb0760f6adddbd382e36023347675ffd9f20413297d5ac58ee0575891', '[\"*\"]', NULL, NULL, '2025-06-12 22:17:44', '2025-06-12 22:17:44'),
(24, 'App\\Models\\User', 3, 'auth_token', 'a927b06b686c3f93c4dc689027cae4cdfa4afa3d43db8704638b5e0a3c0bf420', '[\"*\"]', '2025-06-12 23:07:16', NULL, '2025-06-12 22:17:45', '2025-06-12 23:07:16');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `url_img` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `url_img`, `created_at`, `updated_at`) VALUES
(1, 'iPhone 14', 'สมาร์ทโฟนรุ่นใหม่จาก Apple', 35900.00, 'https://www.dxomark.com/wp-content/uploads/medias/post-157904/Apple-iPhone-15_-blue_featured-image-packshot-review.jpg', '2025-06-12 09:03:33', '2025-06-12 09:03:33'),
(2, 'Galaxy S23', 'สมาร์ทโฟนเรือธงจาก Samsung', 28900.00, 'https://uat.checkraka.com/uploaded/gallery/fd/fde44c11f3a6ad497b2563e7a3c559f7.jpg', '2025-06-12 09:03:33', '2025-06-12 09:03:33'),
(3, 'Xiaomi 13', 'สมาร์ทโฟนกล้องเทพจาก Xiaomi', 19990.00, 'https://www.dxomark.com/wp-content/uploads/medias/post-139298/Xiaomi-13-featured-image-packshot-review-Recovered.jpg', '2025-06-12 09:03:33', '2025-06-12 09:03:33');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `content`, `rating`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'สุดยอดมือถือ กล้องสวยมาก', 5, '2025-06-12 09:03:53', '2025-06-12 09:03:53'),
(2, 2, 2, 'ราคาดี คุณภาพคุ้มค่า', 4, '2025-06-12 09:03:53', '2025-06-12 09:03:53'),
(3, 3, 3, 'ยังมีบั๊กเรื่องกล้อง แต่โดยรวมโอเค', 3, '2025-06-12 09:03:53', '2025-06-12 09:03:53');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('PMow0EoHPsg78910ugAXbRIpvwl89RbiFnfF5DcO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3Vyd1pHSlJQcHhlcUhBWHhvN0ZFTmVTVTZTdnUyRzM0YlgxMnRHZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749794951);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '$2y$12$guydGTSrePf/KMSdZp4NmufKawYu9dW6z/dOZ1lbO9JxHHxNIEIQi', '2025-06-12 02:02:48', '2025-06-12 02:02:48'),
(2, 'Admin Tester', 'admin@example.com', '$2y$10$w3YJwKw6n3k1cAj8uC8V6uPjA5FH/0gYfEbWYlt6he.ZLJhV2WgE6', '2025-06-12 09:03:45', '2025-06-12 09:03:45'),
(3, 'Test User2', 'test1@example.com', '$2y$12$xVgnMGN23.qnvwSLNltv3uPcxwhDBXraigy4dY8vs3NMql5.PIRO2', '2025-06-12 02:53:16', '2025-06-12 02:53:16'),
(4, 'xecute123', 'Admin2@example.com', '$2y$12$gYWCMtTzG4RRhvojq4RjMu5M7bjf0.07Wq49eypKrd1QDoRf/Vfmy', '2025-06-12 04:30:18', '2025-06-12 04:30:18'),
(5, 'test 22', 'test3@example.com', '$2y$12$Xfdy1sfoXjYnZh90RpVwveTA9ejsbuqC72e4ocnZ6Ff0ZGHC8Uo2K', '2025-06-12 11:26:06', '2025-06-12 11:26:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
