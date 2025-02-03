-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 07, 2024 at 11:23 PM
-- Server version: 8.0.37
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eoms_beta_chocolate`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `previous_balance` double NOT NULL DEFAULT '0',
  `current_balance` double NOT NULL DEFAULT '0',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `type`, `amount`, `previous_balance`, `current_balance`, `note`, `created_at`, `updated_at`) VALUES
(1, 'Credit', 870, 0, 870, 'Order Payment #2', '2024-06-28 11:19:42', '2024-06-28 11:19:42'),
(2, 'Credit', 3100, 870, 3970, 'Order Payment #4', '2024-07-07 15:10:49', '2024-07-07 15:10:49');

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` bigint UNSIGNED NOT NULL,
  `total_amount` bigint NOT NULL,
  `added_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `delete_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_items`
--

CREATE TABLE `attribute_items` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_id` bigint UNSIGNED NOT NULL,
  `extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `position` int DEFAULT '1000',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` bigint UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `blog_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `position` int DEFAULT '1000',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` bigint UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `status`, `title`, `slug`, `short_description`, `description`, `position`, `featured`, `meta_title`, `meta_description`, `meta_tags`, `image`, `media_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Aptamil', 'aptamil', 'Aptamil formulas begin life as fresh cows\' milk. Using high quality ingredients, this milk is then transformed into formula.', '<p>Aptamil formulas&nbsp;<strong>begin life as fresh cows&#39; milk</strong>. Using high quality ingredients, this milk is then transformed into formula.</p>', 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-20 06:19:54', '2024-06-21 13:01:32');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `admin_read` tinyint(1) NOT NULL DEFAULT '2',
  `product_id` bigint UNSIGNED NOT NULL,
  `product_data_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `admin_read`, `product_id`, `product_data_id`, `user_id`, `session_id`, `quantity`, `note`, `created_at`, `updated_at`) VALUES
(3, 2, 2, 2, 1, NULL, 1, NULL, '2024-06-20 15:29:44', '2024-06-20 15:29:44'),
(4, 2, 17, 17, NULL, 'pUeebZr20CZGFOqctr4CXzAOG8ajn1L9MefGSxYa', 1, NULL, '2024-06-21 13:06:46', '2024-06-21 13:06:46'),
(7, 2, 55, 55, NULL, 'ezsVpVgCduXHqG0l4qGZmZkHIANmAV2qt3AobTJX', 1, NULL, '2024-06-29 08:02:16', '2024-06-29 08:02:16'),
(8, 2, 88, 88, 1, NULL, 1, NULL, '2024-07-07 05:35:22', '2024-07-07 05:35:22');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `feature` tinyint(1) NOT NULL DEFAULT '0',
  `home_block` tinyint NOT NULL DEFAULT '0',
  `feature_position` int NOT NULL DEFAULT '1000',
  `for` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'product',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `position` int DEFAULT '1000',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` bigint UNSIGNED DEFAULT NULL,
  `background_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `status`, `feature`, `home_block`, `feature_position`, `for`, `title`, `slug`, `short_description`, `description`, `category_id`, `position`, `featured`, `meta_title`, `meta_description`, `meta_tags`, `image`, `media_id`, `background_color`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1000, 'product', 'Chocolate', 'chocolate', NULL, '<p>Chocolate</p>', NULL, 1000, 0, 'After Eight Chocolate', 'After Eight Chocolate', 'After Eight Chocolate', NULL, NULL, NULL, '2024-06-15 09:34:00', '2024-06-15 08:49:07', '2024-06-15 09:34:00'),
(2, 1, 1, 1, 1000, 'product', 'All Baby Accessories', 'all-baby-accessories', 'All Baby Accessories', '<p>All Baby Accessories</p>', NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-15 09:33:58', '2024-06-15 08:49:17', '2024-06-15 09:33:58'),
(3, 1, 0, 1, 1000, 'product', 'Baby Cereal', 'baby-cereal', 'Fortified baby cereal has added iron and other vitamins and nutrients, making it a good first food for your baby. It has a number of minerals, including iron, zinc, and magnesium; and some varieties have vitamins (such as vitamins A, E, D, and B)', NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-15 09:36:18', '2024-06-15 09:36:18'),
(4, 1, 0, 0, 1000, 'product', 'Baby Oats', 'baby-oats', 'Oats are a single grain food that are easy on your baby\'s digestive system.', '<p>Oats are a single grain food that are easy on your baby&#39;s digestive system. They&nbsp;<strong>help promote fullness and a healthy appetite while preventing gas</strong>. Many babies tend to experience constipation when they start new foods. Oatmeal is a fiber-rich food that acts as a natural laxative to help prevent constipation.</p>', NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-15 09:37:03', '2024-06-15 09:37:03'),
(5, 1, 0, 1, 1000, 'product', 'Aptamil Formula Milk', 'aptamil-formula-milk', NULL, NULL, NULL, 1000, 0, 'Aptamil Formula Milk', NULL, NULL, '2024/06/1718974484.jpg', 37, NULL, NULL, '2024-06-21 10:42:36', '2024-06-21 12:54:44'),
(6, 1, 0, 1, 1000, 'product', 'Cow & gate Formula Milk', 'cow-gate-formula-milk', NULL, NULL, NULL, 1000, 0, 'Cow & gate Formula Milk', NULL, NULL, '2024/06/1718974389.jpg', 36, NULL, NULL, '2024-06-21 10:43:02', '2024-06-21 12:53:09'),
(7, 1, 0, 1, 1000, 'product', 'Pediasure', 'pediasure', NULL, NULL, NULL, 1000, 0, 'Pediasure', NULL, NULL, '2024/06/1718974507.jpg', 39, NULL, NULL, '2024-06-21 10:56:03', '2024-06-21 12:55:07'),
(8, 1, 0, 0, 1000, 'product', 'Similac Formula Milk', 'similac-formula-milk', NULL, NULL, NULL, 1000, 0, 'Similac Formula Milk', NULL, 'Similac Formula Milk', '2024/06/1718974214.jpg', 32, NULL, NULL, '2024-06-21 10:56:25', '2024-06-21 12:50:14'),
(9, 1, 1, 1, 1000, 'product', 'Nestle Cerelac', 'nestle-cerelac', NULL, NULL, NULL, 1000, 0, 'Nestle Cerelac', NULL, 'Nestle Cerelac', '2024/06/1718974495.jpg', 38, NULL, NULL, '2024-06-21 10:56:46', '2024-06-21 12:54:56'),
(10, 1, 0, 0, 1000, 'product', 'Cadbury Chocolate', 'cadbury-chocolate', NULL, NULL, NULL, 1000, 0, 'Cadbury Chocolate', 'Cadbury Chocolate', 'Cadbury Chocolate', NULL, NULL, NULL, NULL, '2024-06-21 17:37:14', '2024-06-21 17:37:14'),
(11, 1, 0, 0, 1000, 'product', 'Chocolate Packs', 'chocolate-packs', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-21 17:41:48', '2024-06-21 17:41:48'),
(12, 1, 0, 0, 1000, 'product', 'Chocolate Box', 'chocolate-box', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-22 05:42:32', '2024-06-22 05:42:32'),
(13, 1, 0, 0, 1000, 'product', 'Sauce Items', 'sauce-items', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-22 05:42:46', '2024-06-22 05:42:46'),
(14, 1, 0, 0, 1000, 'product', 'Mayonnaise', 'mayonnaise', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-22 05:42:52', '2024-06-22 05:42:52'),
(15, 1, 0, 0, 1000, 'product', 'Cornflakes', 'cornflakes', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-22 05:43:02', '2024-06-22 05:43:02'),
(16, 1, 0, 0, 1000, 'product', 'Baby Noodles', 'baby-noodles', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-22 05:43:13', '2024-06-22 05:43:13'),
(17, 1, 0, 0, 1000, 'product', 'Tang Drinking Powder', 'tang-drinking-powder', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-22 05:43:35', '2024-06-22 05:43:35'),
(18, 1, 0, 0, 1000, 'product', 'Foster Clark\'s Drinking Powder', 'foster-clark-s-drinking-powder', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-22 05:43:49', '2024-06-22 05:43:49'),
(19, 1, 0, 0, 1000, 'product', 'Gatorade Drinking Powder', 'gatorade-drinking-powder', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-22 05:44:02', '2024-06-22 05:44:02'),
(20, 1, 0, 0, 1000, 'product', 'Fabric Liquid Detergent', 'fabric-liquid-detergent', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-22 05:44:30', '2024-06-22 05:44:30'),
(21, 1, 0, 0, 1000, 'product', 'Fabric Detergent Powder', 'fabric-detergent-powder', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-22 05:44:42', '2024-06-22 05:44:42'),
(22, 1, 0, 0, 1000, 'product', 'Fabric Conditioner', 'fabric-conditioner', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-22 05:44:53', '2024-06-22 05:44:53'),
(23, 1, 0, 0, 1000, 'product', 'Gerber Cereal', 'gerber-cereal', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-22 05:45:08', '2024-06-22 05:45:08'),
(24, 1, 0, 0, 1000, 'product', 'Baby Finger Foods & Snacks', 'baby-finger-foods-snacks', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-22 05:45:28', '2024-06-22 05:45:28'),
(25, 1, 0, 0, 1000, 'product', 'SMA Pro', 'sma-pro', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-22 10:29:25', '2024-06-22 10:29:25'),
(26, 1, 0, 1, 1000, 'product', 'Nestle Nido Formula Milk', 'nestle-nido-formula-milk', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-22 10:42:23', '2024-06-22 10:42:23'),
(27, 1, 0, 1, 1000, 'product', 'Nan Optipro Formula Milk', 'nan-optipro-formula-milk', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-24 03:21:52', '2024-06-24 03:21:52'),
(28, 1, 0, 1, 1000, 'product', 'Enfamil Formula Milk', 'enfamil-formula-milk', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-24 03:54:15', '2024-06-24 03:54:15'),
(29, 1, 0, 1, 1000, 'product', 'Cowhead Milk', 'cowhead-milk', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-24 04:35:59', '2024-06-24 05:13:18'),
(30, 1, 0, 1, 1000, 'product', 'Almarai Milk', 'almarai-milk', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-24 06:22:00', '2024-06-24 06:22:00'),
(31, 1, 0, 1, 1000, 'product', 'Lactogen Milk', 'lactogen-milk', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-24 06:30:23', '2024-06-24 06:30:23'),
(32, 1, 0, 1, 1000, 'product', 'Dano Milk', 'dano-milk', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-24 06:40:11', '2024-06-24 06:40:11'),
(33, 1, 0, 0, 1000, 'product', 'New-Born Baby Diapers', 'new-born-baby-diapers', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-25 10:50:26', '2024-06-25 10:50:26'),
(34, 1, 0, 1, 1000, 'product', 'Shampoo & Conditioner', 'shampoo-conditioner', NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, '2024/07/1720334143.jpg', 121, NULL, NULL, '2024-07-07 05:52:47', '2024-07-07 06:35:43');

-- --------------------------------------------------------

--
-- Table structure for table `compare_products`
--

CREATE TABLE `compare_products` (
  `id` bigint UNSIGNED NOT NULL,
  `admin_read` tinyint(1) NOT NULL DEFAULT '2',
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `discount_type` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int NOT NULL DEFAULT '0',
  `expiry_date` timestamp NULL DEFAULT NULL,
  `minimum_spend` int DEFAULT NULL,
  `maximum_spend` int DEFAULT NULL,
  `maximum_use` int DEFAULT NULL,
  `total_use` int NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` bigint UNSIGNED NOT NULL,
  `customers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `emails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `amount` double NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint UNSIGNED NOT NULL,
  `admin_read` tinyint(1) NOT NULL DEFAULT '2',
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `product_data_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_ads`
--

CREATE TABLE `feature_ads` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `placement` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Place 1',
  `position` int NOT NULL DEFAULT '1000',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` bigint UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incomes`
--

CREATE TABLE `incomes` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `amount` double NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landing_builders`
--

CREATE TABLE `landing_builders` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `products_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `views` bigint NOT NULL DEFAULT '0',
  `head_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `footer_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `server_track` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pixel_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pixel_access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Type 1',
  `others` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `file_name`, `year`, `month`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '1718441226.jpeg', '2024', '06', NULL, '2024-06-15 08:47:06', '2024-06-15 08:47:06'),
(2, '1718441249.jpeg', '2024', '06', NULL, '2024-06-15 08:47:29', '2024-06-15 08:47:29'),
(3, '1718441288.jpeg', '2024', '06', NULL, '2024-06-15 08:48:08', '2024-06-15 08:48:08'),
(4, '1718462581.png', '2024', '06', NULL, '2024-06-15 14:43:02', '2024-06-15 14:43:02'),
(5, '1718783658.jpg', '2024', '06', NULL, '2024-06-19 07:54:18', '2024-06-19 07:54:18'),
(6, '1718783711.jpg', '2024', '06', NULL, '2024-06-19 07:55:11', '2024-06-19 07:55:11'),
(7, '1718861067.jpg', '2024', '06', NULL, '2024-06-20 05:24:28', '2024-06-20 05:24:28'),
(8, '1718864393.png', '2024', '06', NULL, '2024-06-20 06:19:53', '2024-06-20 06:19:53'),
(9, '1718966607.png', '2024', '06', NULL, '2024-06-21 10:43:27', '2024-06-21 10:43:27'),
(10, '1718968174.png', '2024', '06', NULL, '2024-06-21 11:09:35', '2024-06-21 11:09:35'),
(11, '1718968193.jpg', '2024', '06', NULL, '2024-06-21 11:09:57', '2024-06-21 11:09:57'),
(12, '1718968202.jpg', '2024', '06', NULL, '2024-06-21 11:10:03', '2024-06-21 11:10:03'),
(13, '1718968788.jpg', '2024', '06', NULL, '2024-06-21 11:19:48', '2024-06-21 11:19:48'),
(14, '1718968802.jpg', '2024', '06', NULL, '2024-06-21 11:20:03', '2024-06-21 11:20:03'),
(15, '1718969006.png', '2024', '06', NULL, '2024-06-21 11:23:27', '2024-06-21 11:23:27'),
(16, '1718970287.jpg', '2024', '06', NULL, '2024-06-21 11:44:47', '2024-06-21 11:44:47'),
(17, '1718970411.jpg', '2024', '06', NULL, '2024-06-21 11:46:51', '2024-06-21 11:46:51'),
(18, '1718970543.jpg', '2024', '06', NULL, '2024-06-21 11:49:03', '2024-06-21 11:49:03'),
(19, '1718970743.jpg', '2024', '06', NULL, '2024-06-21 11:52:23', '2024-06-21 11:52:23'),
(20, '1718970844.jpg', '2024', '06', NULL, '2024-06-21 11:54:05', '2024-06-21 11:54:05'),
(21, '1718970938.jpg', '2024', '06', NULL, '2024-06-21 11:55:38', '2024-06-21 11:55:38'),
(22, '1718971416.jpg', '2024', '06', NULL, '2024-06-21 12:03:36', '2024-06-21 12:03:36'),
(23, '1718971554.jpg', '2024', '06', NULL, '2024-06-21 12:05:54', '2024-06-21 12:05:54'),
(24, '1718971695.jpg', '2024', '06', NULL, '2024-06-21 12:08:15', '2024-06-21 12:08:15'),
(25, '1718971824.jpg', '2024', '06', NULL, '2024-06-21 12:10:24', '2024-06-21 12:10:24'),
(26, '1718972058.jpg', '2024', '06', NULL, '2024-06-21 12:14:18', '2024-06-21 12:14:18'),
(27, '1718972435.jpg', '2024', '06', NULL, '2024-06-21 12:20:35', '2024-06-21 12:20:35'),
(28, '1718972779.jpg', '2024', '06', NULL, '2024-06-21 12:26:19', '2024-06-21 12:26:19'),
(29, '1718972969.jpg', '2024', '06', NULL, '2024-06-21 12:29:29', '2024-06-21 12:29:29'),
(30, '1718973940.jpg', '2024', '06', NULL, '2024-06-21 12:45:40', '2024-06-21 12:45:40'),
(31, '1718974019.jpg', '2024', '06', NULL, '2024-06-21 12:46:59', '2024-06-21 12:46:59'),
(32, '1718974214.jpg', '2024', '06', NULL, '2024-06-21 12:50:14', '2024-06-21 12:50:14'),
(33, '1718974324.jpg', '2024', '06', NULL, '2024-06-21 12:52:04', '2024-06-21 12:52:04'),
(34, '1718974335.jpg', '2024', '06', NULL, '2024-06-21 12:52:15', '2024-06-21 12:52:15'),
(35, '1718974346.jpg', '2024', '06', NULL, '2024-06-21 12:52:26', '2024-06-21 12:52:26'),
(36, '1718974389.jpg', '2024', '06', NULL, '2024-06-21 12:53:09', '2024-06-21 12:53:09'),
(37, '1718974484.jpg', '2024', '06', NULL, '2024-06-21 12:54:44', '2024-06-21 12:54:44'),
(38, '1718974495.jpg', '2024', '06', NULL, '2024-06-21 12:54:56', '2024-06-21 12:54:56'),
(39, '1718974507.jpg', '2024', '06', NULL, '2024-06-21 12:55:07', '2024-06-21 12:55:07'),
(40, '1719052333.jpg', '2024', '06', NULL, '2024-06-22 10:32:13', '2024-06-22 10:32:13'),
(41, '1719052430.jpg', '2024', '06', NULL, '2024-06-22 10:33:50', '2024-06-22 10:33:50'),
(42, '1719052613.jpg', '2024', '06', NULL, '2024-06-22 10:36:53', '2024-06-22 10:36:53'),
(43, '1719053137.jpg', '2024', '06', NULL, '2024-06-22 10:45:37', '2024-06-22 10:45:37'),
(44, '1719053396.jpg', '2024', '06', NULL, '2024-06-22 10:49:56', '2024-06-22 10:49:56'),
(45, '1719198623.jpg', '2024', '06', NULL, '2024-06-24 03:10:23', '2024-06-24 03:10:23'),
(46, '1719198820.jpg', '2024', '06', NULL, '2024-06-24 03:13:40', '2024-06-24 03:13:40'),
(47, '1719198897.jpg', '2024', '06', NULL, '2024-06-24 03:14:57', '2024-06-24 03:14:57'),
(48, '1719198964.jpg', '2024', '06', NULL, '2024-06-24 03:16:04', '2024-06-24 03:16:04'),
(49, '1719199100.jpg', '2024', '06', NULL, '2024-06-24 03:18:20', '2024-06-24 03:18:20'),
(50, '1719199227.jpg', '2024', '06', NULL, '2024-06-24 03:20:27', '2024-06-24 03:20:27'),
(51, '1719199492.jpg', '2024', '06', NULL, '2024-06-24 03:24:52', '2024-06-24 03:24:52'),
(52, '1719199591.jpg', '2024', '06', NULL, '2024-06-24 03:26:31', '2024-06-24 03:26:31'),
(53, '1719199666.jpg', '2024', '06', NULL, '2024-06-24 03:27:46', '2024-06-24 03:27:46'),
(54, '1719199721.jpg', '2024', '06', NULL, '2024-06-24 03:28:41', '2024-06-24 03:28:41'),
(55, '1719200439.jpg', '2024', '06', NULL, '2024-06-24 03:40:40', '2024-06-24 03:40:40'),
(56, '1719200568.jpg', '2024', '06', NULL, '2024-06-24 03:42:48', '2024-06-24 03:42:48'),
(57, '1719200626.jpg', '2024', '06', NULL, '2024-06-24 03:43:46', '2024-06-24 03:43:46'),
(58, '1719200807.jpg', '2024', '06', NULL, '2024-06-24 03:46:47', '2024-06-24 03:46:47'),
(59, '1719200905.jpg', '2024', '06', NULL, '2024-06-24 03:48:25', '2024-06-24 03:48:25'),
(60, '1719201352.jpg', '2024', '06', NULL, '2024-06-24 03:55:52', '2024-06-24 03:55:52'),
(61, '1719201421.jpg', '2024', '06', NULL, '2024-06-24 03:57:02', '2024-06-24 03:57:02'),
(62, '1719201634.jpg', '2024', '06', NULL, '2024-06-24 04:00:34', '2024-06-24 04:00:34'),
(63, '1719201709.jpg', '2024', '06', NULL, '2024-06-24 04:01:49', '2024-06-24 04:01:49'),
(64, '1719201800.jpg', '2024', '06', NULL, '2024-06-24 04:03:20', '2024-06-24 04:03:20'),
(65, '1719201863.jpg', '2024', '06', NULL, '2024-06-24 04:04:24', '2024-06-24 04:04:24'),
(66, '1719201978.jpg', '2024', '06', NULL, '2024-06-24 04:06:18', '2024-06-24 04:06:18'),
(67, '1719202101.jpg', '2024', '06', NULL, '2024-06-24 04:08:21', '2024-06-24 04:08:21'),
(68, '1719203930.jpg', '2024', '06', NULL, '2024-06-24 04:38:51', '2024-06-24 04:38:51'),
(69, '1719204065.jpg', '2024', '06', NULL, '2024-06-24 04:41:05', '2024-06-24 04:41:05'),
(70, '1719204353.jpg', '2024', '06', NULL, '2024-06-24 04:45:54', '2024-06-24 04:45:54'),
(71, '1719205359.jpg', '2024', '06', NULL, '2024-06-24 05:02:39', '2024-06-24 05:02:39'),
(72, '1719205723.jpg', '2024', '06', NULL, '2024-06-24 05:08:43', '2024-06-24 05:08:43'),
(73, '1719205796.jpg', '2024', '06', NULL, '2024-06-24 05:09:56', '2024-06-24 05:09:56'),
(74, '1719205885.jpg', '2024', '06', NULL, '2024-06-24 05:11:26', '2024-06-24 05:11:26'),
(75, '1719205974.jpg', '2024', '06', NULL, '2024-06-24 05:12:54', '2024-06-24 05:12:54'),
(76, '1719210249.jpg', '2024', '06', NULL, '2024-06-24 06:24:09', '2024-06-24 06:24:09'),
(77, '1719210299.jpg', '2024', '06', NULL, '2024-06-24 06:24:59', '2024-06-24 06:24:59'),
(78, '1719210345.jpg', '2024', '06', NULL, '2024-06-24 06:25:45', '2024-06-24 06:25:45'),
(79, '1719210391.jpg', '2024', '06', NULL, '2024-06-24 06:26:31', '2024-06-24 06:26:31'),
(80, '1719210821.jpg', '2024', '06', NULL, '2024-06-24 06:33:41', '2024-06-24 06:33:41'),
(81, '1719210927.jpg', '2024', '06', NULL, '2024-06-24 06:35:27', '2024-06-24 06:35:27'),
(82, '1719211107.jpg', '2024', '06', NULL, '2024-06-24 06:38:27', '2024-06-24 06:38:27'),
(83, '1719211359.jpg', '2024', '06', NULL, '2024-06-24 06:42:39', '2024-06-24 06:42:39'),
(84, '1719226382.jpg', '2024', '06', NULL, '2024-06-24 10:53:02', '2024-06-24 10:53:02'),
(85, '1719820334.jpg', '2024', '07', NULL, '2024-07-01 07:52:14', '2024-07-01 07:52:14'),
(86, '1719820567.jpg', '2024', '07', NULL, '2024-07-01 07:56:08', '2024-07-01 07:56:08'),
(87, '1719820676.jpg', '2024', '07', NULL, '2024-07-01 07:57:56', '2024-07-01 07:57:56'),
(88, '1719820769.jpg', '2024', '07', NULL, '2024-07-01 07:59:29', '2024-07-01 07:59:29'),
(89, '1719821194.jpg', '2024', '07', NULL, '2024-07-01 08:06:34', '2024-07-01 08:06:34'),
(90, '1719821365.jpg', '2024', '07', NULL, '2024-07-01 08:09:25', '2024-07-01 08:09:25'),
(91, '1719821457.jpg', '2024', '07', NULL, '2024-07-01 08:10:58', '2024-07-01 08:10:58'),
(92, '1719821556.jpg', '2024', '07', NULL, '2024-07-01 08:12:37', '2024-07-01 08:12:37'),
(93, '1719821717.jpg', '2024', '07', NULL, '2024-07-01 08:15:18', '2024-07-01 08:15:18'),
(94, '1719821929.jpg', '2024', '07', NULL, '2024-07-01 08:18:49', '2024-07-01 08:18:49'),
(95, '1719821993.jpg', '2024', '07', NULL, '2024-07-01 08:19:54', '2024-07-01 08:19:54'),
(96, '1719822715.jpg', '2024', '07', NULL, '2024-07-01 08:31:55', '2024-07-01 08:31:55'),
(97, '1719908847.jpg', '2024', '07', NULL, '2024-07-02 08:27:27', '2024-07-02 08:27:27'),
(98, '1719909071.jpg', '2024', '07', NULL, '2024-07-02 08:31:11', '2024-07-02 08:31:11'),
(99, '1719909152.jpg', '2024', '07', NULL, '2024-07-02 08:32:32', '2024-07-02 08:32:32'),
(100, '1719911077.jpg', '2024', '07', NULL, '2024-07-02 09:04:42', '2024-07-02 09:04:42'),
(101, '1719911142.jpg', '2024', '07', NULL, '2024-07-02 09:05:42', '2024-07-02 09:05:42'),
(102, '1719911947.jpg', '2024', '07', NULL, '2024-07-02 09:19:09', '2024-07-02 09:19:09'),
(103, '1719983082.jpg', '2024', '07', NULL, '2024-07-03 05:04:43', '2024-07-03 05:04:43'),
(104, '1719983207.jpg', '2024', '07', NULL, '2024-07-03 05:06:47', '2024-07-03 05:06:47'),
(105, '1719983342.jpg', '2024', '07', NULL, '2024-07-03 05:09:02', '2024-07-03 05:09:02'),
(106, '1719983385.jpg', '2024', '07', NULL, '2024-07-03 05:09:45', '2024-07-03 05:09:45'),
(107, '1719984092.jpg', '2024', '07', NULL, '2024-07-03 05:21:32', '2024-07-03 05:21:32'),
(108, '1720001393.jpg', '2024', '07', NULL, '2024-07-03 10:09:53', '2024-07-03 10:09:53'),
(109, '1720002332.jpg', '2024', '07', NULL, '2024-07-03 10:25:33', '2024-07-03 10:25:33'),
(110, '1720003742.jpg', '2024', '07', NULL, '2024-07-03 10:49:02', '2024-07-03 10:49:02'),
(111, '1720063982.jpg', '2024', '07', NULL, '2024-07-04 03:33:02', '2024-07-04 03:33:02'),
(112, '1720064042.jpg', '2024', '07', NULL, '2024-07-04 03:34:02', '2024-07-04 03:34:02'),
(113, '1720064207.jpg', '2024', '07', NULL, '2024-07-04 03:36:47', '2024-07-04 03:36:47'),
(114, '1720064300.jpg', '2024', '07', NULL, '2024-07-04 03:38:20', '2024-07-04 03:38:20'),
(115, '1720064378.jpg', '2024', '07', NULL, '2024-07-04 03:39:39', '2024-07-04 03:39:39'),
(116, '1720064619.jpg', '2024', '07', NULL, '2024-07-04 03:43:42', '2024-07-04 03:43:42'),
(117, '1720064630.jpg', '2024', '07', NULL, '2024-07-04 03:43:50', '2024-07-04 03:43:50'),
(118, '1720069666.jpg', '2024', '07', NULL, '2024-07-04 05:07:46', '2024-07-04 05:07:46'),
(119, '1720070446.jpg', '2024', '07', NULL, '2024-07-04 05:20:46', '2024-07-04 05:20:46'),
(120, '1720334103.jpg', '2024', '07', NULL, '2024-07-07 06:35:03', '2024-07-07 06:35:03'),
(121, '1720334143.jpg', '2024', '07', NULL, '2024-07-07 06:35:43', '2024-07-07 06:35:43'),
(122, '1720337364.jpg', '2024', '07', NULL, '2024-07-07 07:29:27', '2024-07-07 07:29:27'),
(123, '1720337497.jpg', '2024', '07', NULL, '2024-07-07 07:31:37', '2024-07-07 07:31:37'),
(124, '1720337557.jpg', '2024', '07', NULL, '2024-07-07 07:32:37', '2024-07-07 07:32:37'),
(125, '1720337632.jpg', '2024', '07', NULL, '2024-07-07 07:33:52', '2024-07-07 07:33:52'),
(126, '1720337695.jpg', '2024', '07', NULL, '2024-07-07 07:34:56', '2024-07-07 07:34:56'),
(127, '1720337771.jpg', '2024', '07', NULL, '2024-07-07 07:36:11', '2024-07-07 07:36:11'),
(128, '1720337850.jpg', '2024', '07', NULL, '2024-07-07 07:37:30', '2024-07-07 07:37:30'),
(129, '1720337964.jpg', '2024', '07', NULL, '2024-07-07 07:39:24', '2024-07-07 07:39:24'),
(130, '1720338310.jpg', '2024', '07', NULL, '2024-07-07 07:45:10', '2024-07-07 07:45:10'),
(131, '1720338398.jpg', '2024', '07', NULL, '2024-07-07 07:46:38', '2024-07-07 07:46:38'),
(132, '1720338494.jpg', '2024', '07', NULL, '2024-07-07 07:48:17', '2024-07-07 07:48:17'),
(133, '1720338624.jpg', '2024', '07', NULL, '2024-07-07 07:50:25', '2024-07-07 07:50:25'),
(134, '1720338756.jpg', '2024', '07', NULL, '2024-07-07 07:52:42', '2024-07-07 07:52:42'),
(135, '1720338891.jpg', '2024', '07', NULL, '2024-07-07 07:54:51', '2024-07-07 07:54:51'),
(136, '1720339655.jpg', '2024', '07', NULL, '2024-07-07 08:07:55', '2024-07-07 08:07:55'),
(137, '1720339910.jpg', '2024', '07', NULL, '2024-07-07 08:11:50', '2024-07-07 08:11:50'),
(138, '1720340010.jpg', '2024', '07', NULL, '2024-07-07 08:13:31', '2024-07-07 08:13:31'),
(139, '1720340594.jpg', '2024', '07', NULL, '2024-07-07 08:23:16', '2024-07-07 08:23:16'),
(140, '1720340821.jpg', '2024', '07', NULL, '2024-07-07 08:27:01', '2024-07-07 08:27:01'),
(141, '1720340879.jpg', '2024', '07', NULL, '2024-07-07 08:27:59', '2024-07-07 08:27:59'),
(142, '1720341074.jpg', '2024', '07', NULL, '2024-07-07 08:31:14', '2024-07-07 08:31:14'),
(143, '1720341511.jpg', '2024', '07', NULL, '2024-07-07 08:38:31', '2024-07-07 08:38:31'),
(144, '1720341994.jpg', '2024', '07', NULL, '2024-07-07 08:46:35', '2024-07-07 08:46:35'),
(145, '1720343272.jpg', '2024', '07', NULL, '2024-07-07 09:07:53', '2024-07-07 09:07:53'),
(146, '1720343363.jpg', '2024', '07', NULL, '2024-07-07 09:09:24', '2024-07-07 09:09:24'),
(147, '1720343640.jpg', '2024', '07', NULL, '2024-07-07 09:14:01', '2024-07-07 09:14:01'),
(148, '1720343707.jpg', '2024', '07', NULL, '2024-07-07 09:15:07', '2024-07-07 09:15:07'),
(149, '1720343773.jpg', '2024', '07', NULL, '2024-07-07 09:16:13', '2024-07-07 09:16:13');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `status`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Main Menu', NULL, '2024-06-15 08:43:09', '2024-06-15 08:43:09'),
(2, 1, 'cholate', NULL, '2024-06-15 08:43:34', '2024-06-15 08:43:34'),
(3, 1, 'Baby food', NULL, '2024-06-15 08:43:50', '2024-06-15 08:43:50'),
(4, 1, 'Diaper', NULL, '2024-06-15 08:44:07', '2024-06-15 08:44:07'),
(5, 1, 'Baby care', NULL, '2024-06-15 08:44:16', '2024-06-15 08:44:16'),
(6, 1, 'Baby Food', NULL, '2024-06-15 09:33:38', '2024-06-15 09:33:38'),
(7, 1, 'milk', NULL, '2024-06-20 15:24:47', '2024-06-20 15:24:47'),
(8, 1, 'Baby Milk', NULL, '2024-06-21 17:42:36', '2024-06-21 17:42:36'),
(9, 1, 'Baby Milk', NULL, '2024-07-07 05:28:47', '2024-07-07 05:28:47'),
(10, 1, 'Baby Food', NULL, '2024-07-07 05:29:10', '2024-07-07 05:29:10'),
(11, 1, 'Shampoo & conditioner', NULL, '2024-07-07 06:28:40', '2024-07-07 06:28:40');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `menu_id` bigint UNSIGNED NOT NULL,
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation_id` bigint UNSIGNED DEFAULT NULL,
  `relation_with` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL DEFAULT '1000',
  `menu_item_id` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `status`, `menu_id`, `text`, `url`, `relation_id`, `relation_with`, `position`, `menu_item_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(9, 1, 8, NULL, NULL, 5, 'category', 0, NULL, NULL, '2024-06-21 17:43:03', '2024-06-21 17:43:08'),
(10, 1, 8, NULL, NULL, 6, 'category', 1, NULL, NULL, '2024-06-21 17:43:03', '2024-06-21 17:43:08'),
(11, 1, 8, NULL, NULL, 8, 'category', 2, NULL, NULL, '2024-06-21 17:43:03', '2024-06-21 17:43:08'),
(12, 1, 1, NULL, NULL, 3, 'category', 0, NULL, NULL, '2024-07-07 05:31:40', '2024-07-07 05:31:42'),
(18, 1, 1, NULL, NULL, 34, 'category', 1, NULL, NULL, '2024-07-07 06:29:08', '2024-07-07 06:30:28'),
(19, 1, 1, NULL, NULL, 5, 'category', 2, NULL, NULL, '2024-07-07 06:30:09', '2024-07-07 06:30:28'),
(20, 1, 1, NULL, NULL, 6, 'category', 3, NULL, NULL, '2024-07-07 06:30:26', '2024-07-07 06:30:28'),
(21, 1, 1, NULL, NULL, 28, 'category', 4, NULL, NULL, '2024-07-07 06:30:26', '2024-07-07 06:30:28');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscribers`
--

CREATE TABLE `newsletter_subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `status` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Processing',
  `admin_read` tinyint(1) NOT NULL DEFAULT '2',
  `payment_status` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_mobile_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_apartment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_post_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_charge` double NOT NULL DEFAULT '0',
  `hidden_shipping_charge` double DEFAULT NULL,
  `shipping_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_weight` double NOT NULL DEFAULT '0',
  `shipping_length` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_invoice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_id` bigint DEFAULT NULL,
  `shipping_order_id` bigint DEFAULT NULL,
  `product_total` double NOT NULL DEFAULT '0',
  `tax` double NOT NULL DEFAULT '0',
  `tax_amount` double NOT NULL DEFAULT '0',
  `other_cost` double NOT NULL DEFAULT '0',
  `discount` double NOT NULL DEFAULT '0',
  `discount_amount` double NOT NULL DEFAULT '0',
  `courier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courier_invoice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courier_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courier_payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courier_payment_at` timestamp NULL DEFAULT NULL,
  `courier_submitted_at` timestamp NULL DEFAULT NULL,
  `payment_method` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_shipping_amount` double NOT NULL DEFAULT '0',
  `refund_other_charge` double NOT NULL DEFAULT '0',
  `refund_product_total` double NOT NULL DEFAULT '0',
  `refund_tax_amount` double NOT NULL DEFAULT '0',
  `refund_total_amount` double NOT NULL DEFAULT '0',
  `coupon_id` bigint UNSIGNED DEFAULT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `staff_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `status`, `admin_read`, `payment_status`, `user_id`, `first_name`, `last_name`, `street`, `apartment`, `city`, `state`, `zip`, `country`, `mobile_number`, `email`, `shipping_full_name`, `shipping_email`, `shipping_mobile_number`, `shipping_street`, `shipping_apartment`, `shipping_post_code`, `shipping_city`, `shipping_state`, `shipping_country`, `shipping_charge`, `hidden_shipping_charge`, `shipping_method`, `shipping_weight`, `shipping_length`, `shipping_invoice`, `shipping_id`, `shipping_order_id`, `product_total`, `tax`, `tax_amount`, `other_cost`, `discount`, `discount_amount`, `courier`, `courier_invoice`, `courier_status`, `courier_payment_status`, `courier_payment_at`, `courier_submitted_at`, `payment_method`, `payment_transaction_id`, `refund_shipping_amount`, `refund_other_charge`, `refund_product_total`, `refund_tax_amount`, `refund_total_amount`, `coupon_id`, `coupon_code`, `note`, `staff_note`, `reference_no`, `attachment`, `admin_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Returned', 1, 'Pending', 1, NULL, 'Admin', 'abcd', NULL, NULL, NULL, NULL, NULL, '12345678900', NULL, 'Admin', NULL, '12345678900', 'abcd', NULL, NULL, NULL, NULL, NULL, 150, NULL, 'Cash On delivery', 0, NULL, NULL, NULL, NULL, 3050, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-19 07:57:18', '2024-07-04 11:36:33'),
(2, 'Delivered', 1, 'Paid', 3, NULL, 'Rana Ahmed', '4/1D Hare street wari Dhaka', NULL, NULL, NULL, NULL, NULL, '01966497446', NULL, 'Rana Ahmed', NULL, '01966497446', '4/1D Hare street wari Dhaka', NULL, NULL, NULL, NULL, NULL, 80, NULL, 'Cash On delivery', 0, NULL, NULL, NULL, NULL, 790, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-24 10:54:24', '2024-06-28 11:19:42'),
(3, 'Canceled', 1, 'Pending', 4, NULL, 'MD Rifat Hossain', 'Bethuyajani, Betila, Manikgonj, Dhaka, Bangladesh', NULL, NULL, NULL, NULL, NULL, '01644979237', NULL, 'MD Rifat Hossain', NULL, '01644979237', 'Bethuyajani, Betila, Manikgonj, Dhaka, Bangladesh', NULL, NULL, NULL, NULL, NULL, 80, NULL, 'Cash On delivery', 0, NULL, NULL, NULL, NULL, 3050, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-29 08:01:59', '2024-07-07 15:01:31'),
(4, 'In Courier', 1, 'Paid', 3, NULL, 'Monsur alam', 'Bhaktiar para  Nur jame mosjid  Anowara  Chattogram', NULL, NULL, NULL, NULL, NULL, '01882834149', NULL, 'Monsur alam', NULL, '01882834149', 'Bhaktiar para  Nur jame mosjid  Anowara  Chattogram', NULL, NULL, NULL, NULL, NULL, 150, NULL, 'Cash On delivery', 0, NULL, NULL, NULL, NULL, 2950, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-07 15:08:16', '2024-07-07 15:13:11'),
(5, 'Confirmed', 1, 'Due', 3, NULL, 'Salahuddin Ahammad', 'House 19 road 11 sector 14 Uttara', NULL, NULL, NULL, NULL, NULL, '01734651933', NULL, 'Salahuddin Ahammad', NULL, '01734651933', 'House 19 road 11 sector 14 Uttara', NULL, NULL, NULL, NULL, NULL, 80, NULL, 'Cash On delivery', 0, NULL, NULL, NULL, NULL, 3300, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-07 15:38:15', '2024-07-07 15:38:54');

-- --------------------------------------------------------

--
-- Table structure for table `order_payments`
--

CREATE TABLE `order_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `status` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `order_id` bigint UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `gateway_order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txn_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `product_data_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_item_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quantity` int NOT NULL,
  `return_quantity` int NOT NULL DEFAULT '0',
  `sale_price` double NOT NULL DEFAULT '0',
  `shipping_weight` double NOT NULL DEFAULT '0',
  `shipping_length` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_amount` int NOT NULL DEFAULT '0',
  `tax_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `product_data_id`, `title`, `attribute_item_ids`, `quantity`, `return_quantity`, `sale_price`, `shipping_weight`, `shipping_length`, `tax_amount`, `tax_type`, `tax_method`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Aptamil Formula Milk Stage-1 800gm', NULL, 1, 0, 3050, 0, NULL, 0, NULL, NULL, NULL, '2024-06-19 07:57:18', '2024-06-19 07:57:18'),
(2, 2, 63, 63, 'Heinz Summer Fruits Porridge 7m+ 220gm', NULL, 1, 0, 790, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 10:54:24', '2024-06-24 10:54:24'),
(3, 3, 3, 3, 'Aptamil Formula Milk Stage-3 800gm', NULL, 1, 0, 3050, 0, NULL, 0, NULL, NULL, NULL, '2024-06-29 08:01:59', '2024-06-29 08:01:59'),
(4, 4, 6, 6, 'Cow & Gate Formula Milk Stage-2 800gm', NULL, 1, 0, 2950, 0, NULL, 0, 'Fixed', '', NULL, '2024-07-07 15:08:16', '2024-07-07 15:08:16'),
(5, 5, 61, 61, 'Nestle Lactogrow Stage-3 (1 to 3 Years) 1800gm', NULL, 1, 0, 3300, 0, NULL, 0, 'Fixed', '', NULL, '2024-07-07 15:38:15', '2024-07-07 15:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `order_product_stocks`
--

CREATE TABLE `order_product_stocks` (
  `id` bigint UNSIGNED NOT NULL,
  `order_product_id` bigint UNSIGNED NOT NULL,
  `stock_id` bigint UNSIGNED NOT NULL,
  `quantity` bigint NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `old_status` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `order_id`, `old_status`, `status`, `file`, `added_by`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Order created', NULL, 'Customer', '2024-06-19 07:57:18', '2024-06-19 07:57:18'),
(2, 2, NULL, 'Order created', NULL, 'Customer', '2024-06-24 10:54:24', '2024-06-24 10:54:24'),
(3, 3, NULL, 'Order created', NULL, 'Customer', '2024-06-29 08:01:59', '2024-06-29 08:01:59'),
(4, 4, NULL, 'Order created', NULL, 'Customer', '2024-07-07 15:08:16', '2024-07-07 15:08:16'),
(5, 5, NULL, 'Order created', NULL, 'Customer', '2024-07-07 15:38:15', '2024-07-07 15:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `position` int DEFAULT '1000',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` bigint UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pre_users`
--

CREATE TABLE `pre_users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Simple',
  `featured` tinyint NOT NULL DEFAULT '0',
  `clearance_sale` tinyint NOT NULL DEFAULT '0',
  `spacial_offer` tinyint NOT NULL DEFAULT '0',
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` bigint UNSIGNED DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `position` int NOT NULL DEFAULT '1000',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` bigint UNSIGNED DEFAULT NULL,
  `stock` bigint NOT NULL DEFAULT '0',
  `stock_alert_quantity` bigint NOT NULL DEFAULT '0',
  `stock_pre_alert_quantity` bigint NOT NULL DEFAULT '0',
  `custom_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view` bigint NOT NULL DEFAULT '0',
  `average_rating` double NOT NULL DEFAULT '0',
  `total_review` int NOT NULL DEFAULT '0',
  `expire_date` date DEFAULT NULL,
  `sale_price` double NOT NULL DEFAULT '0',
  `regular_price` double NOT NULL DEFAULT '0',
  `attribute_items_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `status`, `title`, `slug`, `type`, `featured`, `clearance_sale`, `spacial_offer`, `short_description`, `description`, `brand_id`, `meta_title`, `meta_description`, `meta_tags`, `position`, `image`, `image_path`, `media_id`, `stock`, `stock_alert_quantity`, `stock_pre_alert_quantity`, `custom_label`, `view`, `average_rating`, `total_review`, `expire_date`, `sale_price`, `regular_price`, `attribute_items_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Aptamil Formula Milk Stage-1 800gm', 'aptamil-formula-milk-stage-1-800gm', 'Simple', 0, 0, 0, '<h2><strong>Description</strong></h2>\r\n\r\n<p>First Infant Milk, with a 29% fermented dairy-based blend</p>\r\n\r\n<p>Breastmilk substitute with our unique blend of ingredients</p>\r\n\r\n<p>Suitable for combination or bottle feeding- Contains DHA (Omega-3 LCPs)*<br />\r\n*as required by the legislation for all infant formula.</p>\r\n\r\n<ul>\r\n</ul>', '<p>- Nutritionally complete**<br />\r\n** As required by legislation. First infant milk is nutritionally complete and suitable as a sole source of nutrition from birth and as part of a varied weaning diet from 6 months.<br />\r\n<br />\r\nOur Patented Formulation<br />\r\nOur First Infant Milk developed by combining our blend of ingredients with our unique process.<br />\r\nContains DHA (Omega-3 LCPs) as required by the legislation for all infant formula.</p>\r\n\r\n<p>Our Unique Expertise<br />\r\nNutricia has over 120 years of expertise in early life science, with a passionate team of more than 500 scientists and experts. We have been pioneering research for 40 years, taking inspiration from the benefits of nature.<br />\r\nOur research has enabled us to develop our unique infant milk suitable from birth.</p>\r\n\r\n<h2><strong>Ingredients</strong></h2>\r\n\r\n<ul>\r\n	<li>Dairy-Based Blend (of which 29% is fermented) [Lactose (from&nbsp;Milk), Vegetable Oils (Palm Oil, Coconut Oil, Rapeseed Oil, High Oleic Sunflower Oil, Sunflower Oil), Skimmed&nbsp;Milk, Demineralised Whey (from&nbsp;Milk), Whey Concentrate (from&nbsp;Milk),&nbsp;Fish&nbsp;Oil, Calcium Phosphate, Potassium Citrate, Choline Chloride, Potassium Chloride, Magnesium Chloride, Vitamin C, Sodium Citrate, Emulsifier (Soy&nbsp;Lecithin), Inositol, L-Carnitine, Vitamin E, Antioxidant (Ascorbyl Palmitate), Pantothenic Acid, Nicotinamide, Calcium Carbonate, Thiamin, Riboflavin, Vitamin B6, Folic Acid, Potassium Iodide, Vitamin K1, Biotin, Vitamin B12],</li>\r\n	<li>&nbsp;</li>\r\n	<li>Galacto-Oligosaccharides (GOS) (from&nbsp;Milk),</li>\r\n	<li>&nbsp;</li>\r\n	<li>Whey Protein (from&nbsp;Milk),</li>\r\n	<li>&nbsp;</li>\r\n	<li>Fructo-Oligosaccharides (FOS),</li>\r\n	<li>&nbsp;</li>\r\n	<li>Oil from Mortierella Alpina,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Sodium Chloride,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Taurine,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Ferrous Sulphate,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Zinc Sulphate,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Uridine 5&#39;-Monophosphate Sodium Salt,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Cytidine 5&#39;-Monophosphate,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Adenosine 5&#39;-Monophosphate,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Inosine 5&#39;-Monophosphate Sodium Salt,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Magnesium Hydrogen Phosphate,</li>\r\n	<li>&nbsp;</li>\r\n	<li>L-Tryptophan,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Guanosine 5&#39;-Monophosphate Sodium Salt,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Copper Sulphate,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Vitamin E,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Vitamin A,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Sodium Selenite,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Manganese Sulphate,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Vitamin D3</li>\r\n</ul>\r\n\r\n<h2><strong>Information</strong></h2>\r\n\r\n<p>For allergens, see ingredients in&nbsp;bold.</p>\r\n\r\n<p>Contains Fish</p>\r\n\r\n<p>Contains Milk</p>\r\n\r\n<p>Contains Soya</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2><strong>Preparation</strong></h2>\r\n\r\n<p>Feeding Guide<br />\r\nApprox. age: Up to 2 weeks, Approx. weight: 3.5kg, 7 3/4lb, No. of level scoops per feed (1 scoop = 4.6g): 3, Quantity of water per feed: 90ml, 3fl oz, No. of feeds per 24 hours: 6<br />\r\nApprox. age: 2-4 weeks, Approx. weight: 3.9kg, 8 1/2lb, No. of level scoops per feed (1 scoop = 4.6g): 4, Quantity of water per feed: 120ml, 4fl oz, No. of feeds per 24 hours: 5<br />\r\nApprox. age: 4-8 weeks, Approx. weight: 4.7kg, 10 1/2lb, No. of level scoops per feed (1 scoop = 4.6g): 5, Quantity of water per feed: 150ml, 5fl oz, No. of feeds per 24 hours: 5<br />\r\nApprox. age: 8-12 weeks, Approx. weight: 5.4kg, 12lb, No. of level scoops per feed (1 scoop = 4.6g): 6, Quantity of water per feed: 180ml, 6fl oz, No. of feeds per 24 hours: 5<br />\r\nApprox. age: 3-4 months, Approx. weight: 6.2kg, 13 3/4lb, No. of level scoops per feed (1 scoop = 4.6g): 6, Quantity of water per feed: 180ml, 6fl oz, No. of feeds per 24 hours: 5<br />\r\nApprox. age: 4-5 months, Approx. weight: 6.9kg, 15 1/4lb, No. of level scoops per feed (1 scoop = 4.6g): 7, Quantity of water per feed: 210ml, 7fl oz, No. of feeds per 24 hours: 5<br />\r\nApprox. age: 5-6 months, Approx. weight: 7.6kg, 16 3/4lb, No. of level scoops per feed (1 scoop = 4.6g): 7, Quantity of water per feed: 210ml, 7fl oz, No. of feeds per 24 hours: 5<br />\r\nApprox. age: 7-12 months, Approx. weight: - kg, - lb, No. of level scoops per feed (1 scoop = 4.6g): 7, Quantity of water per feed: 210ml, 7fl oz, No. of feeds per 24 hours: 3<br />\r\n<br />\r\nAssumes weaning at 6 months. Your baby may need more or less than the feeding guide above. This information is given as a guide only. Consult your healthcare professional if you require more advice.<br />\r\nImportant: Always use the scoop provided, please note the colour of the scoop in this pack may change from time to time.<br />\r\n<br />\r\nPreparing your baby&#39;s feed<br />\r\nBecause powdered milks are not sterile, failure to follow instructions may make your baby ill.<br />\r\n1 Wash hands and sterilise all utensils according to manufacturers&#39; instructions.<br />\r\n2 Boil 1 litre of freshly run water. Leave kettle to cool for 30 minutes and no longer. Measure the required amount of water (refer to feeding guide) into a sterilised bottle. Be careful of scalding. Do not use artificially softened or repeatedly boiled water.<br />\r\n3 Using the scoop provided, level off the powder with the built in leveller. Do not press/heap the powder.<br />\r\n4 Add the correct measure of powder to the water. Adding too many or too few scoops can be harmful. Place the sterilised teat and cap on the bottle and shake immediately, vertically and vigorously for at least 10 seconds, until the powder is dissolved.<br />\r\n5 Cool under running tap. Check temperature of feed. Feed immediately.</p>\r\n\r\n<p>Important feeding advice<br />\r\n- Make up each feed as required.<br />\r\n- For hygiene reasons, do not store made up feeds, discard unfinished feeds as soon as possible, and always within 2 hours.<br />\r\n- Do not heat feeds in a microwave, hot spots may occur and cause scalding.<br />\r\n- Never add extra scoops or anything else to your baby&#39;s feed.<br />\r\n- Never leave your baby alone during feeding.<br />\r\n<br />\r\nImportant notice</p>\r\n\r\n<p><br />\r\nBreastfeeding is best for babies. Aptamil&reg; First Infant Milk should only be used on the advice of a doctor, midwife, health visitor, public health nurse, dietitian, pharmacist, or other professional responsible for maternal and child care.<br />\r\nWhen bottle feeding do not allow prolonged or frequent contact of milk feeds with your baby&#39;s teeth as this increases the risk of tooth decay. Ask your healthcare professional or dentist for advice. Make sure your baby&#39;s teeth are cleaned after the last feed at night.</p>\r\n\r\n<h3>Country of Origin</h3>\r\n\r\n<p>Country of origin: Produce of the Uk</p>\r\n\r\n<p>Manufactured in the Uk.</p>\r\n\r\n<h2><strong>Storage</strong></h2>\r\n\r\n<p>- Store powder in a cool dry place.<br />\r\n- Do not refrigerate.<br />\r\n- Use powder within 4 weeks of opening.</p>\r\n\r\n<h2><strong>Disclaimer</strong></h2>\r\n\r\n<p>The above details have been prepared to help you select suitable products. Products and their ingredients are liable to change.</p>\r\n\r\n<p><strong>You should always read the label before consuming or using the product and never rely solely on the information presented here.</strong></p>\r\n\r\n<ul>\r\n	<li>Delivery Charge Inside Dhaka 80 Taka&nbsp;</li>\r\n	<li>Outside Dhaka 150 Taka</li>\r\n</ul>', NULL, 'Aptamil Stage 1 First Infant Milk (Birth to 6months) 800G', NULL, 'Aptamil Stage 1 First Infant Milk (Birth to 6months) 800G', 1000, '1718783711.jpg', '2024/06', 6, 0, 0, 0, NULL, 0, 0, 0, NULL, 3050, 0, NULL, NULL, '2024-06-19 07:55:12', '2024-06-19 07:55:12'),
(2, 1, 'Aptamil Formula Milk Stage-2 800gm', 'aptamil-formula-milk-stage-2-800gm', 'Simple', 0, 0, 0, '<h1 data-auto=\"pdp-product-title\">Aptamil 2 Follow On Baby Milk Formula Powder 6-12 Months</h1>', '<h2 data-testid=\"accordion-header\"><button aria-controls=\"accordion-panel-product-description\" aria-expanded=\"true\" data-accordion-button=\"\" data-testid=\"accordion-control\" id=\"accordion-header-product-description\" type=\"button\">Product Description</button></h2>\r\n\r\n<p>Follow On Milk, with a 29% fermented dairy-based blendAll reviews are from parents with children older than 6 months and have not been edited by Nutricia.IMPORTANT NOTICE: Breastfeeding is best. Follow-on milk should only be used as part of a mixed diet and not as a breastmilk substitute before 6 months. Use on the advice of a healthcare professional.Preparation instructions on pack must be followed. #Nutri fibres (GOS/FOS)Vitamins A, C, DDHA (Omega-3 LCP)IronPalm Oil FreeOil BlendA Pack Designed for YouDouble safely strip to be sure your formula has not been opened and retains its freshnessScoop leveller to get the dose just rightScoop storer to keep your scoop and hands out of the powderAptamil&reg; Follow On Milk is tailored to help meet the increased nutritional needs of babies aged 6-12 months.Nutri FibresGOS/FOS - Our blend of Galacto- and Fructo-oligosaccharidesImmunonutrientVitamin D to support the normal function of the immune systemDHA (Omega-3 LCP)Supports normal visual development. Benefit obtained from a daily intake of 100mg DHAVitamins A &amp; C and IronIron supports normal cognitive developmentNo artificial preservatives**as required by the legislation.</p>', 1, 'Aptamil 2 Follow On Baby Milk Formula Powder 6-12 Months', 'Aptamil 2 Follow On Baby Milk Formula Powder 6-12 Months', 'Aptamil 2 Follow On Baby Milk Formula Powder 6-12 Months', 1000, '1718861067.jpg', '2024/06', 7, 0, 0, 0, NULL, 0, 0, 0, NULL, 3050, 0, NULL, NULL, '2024-06-20 05:24:28', '2024-06-20 06:20:15'),
(3, 1, 'Aptamil Formula Milk Stage-3 800gm', 'aptamil-formula-milk-stage-3-800gm', 'Simple', 0, 0, 0, '<h2 id=\"dialog-header\">Baby Milk Suitable For 1-2 Years</h2>\r\n\r\n<section>\r\n<p>Baby Milk</p>\r\n\r\n<p>Growing Up &amp; Toddler Milk is a fortified milk drink to be used as part of a varied, balanced diet from 1 year. It can be used as a drink or mixed with other foods</p>\r\n</section>', '<p>Preparation and Usage</p>\r\n\r\n<p>A Pack Designed for You<br />\r\nDouble safety strip<br />\r\nTo be sure your formula has not been opened and retains its freshness<br />\r\nScoop leveller<br />\r\nTo get the dose just right<br />\r\nScoop storer<br />\r\nTo keep your scoop and hands out of the powder<br />\r\n<br />\r\nPreparing Your Toddler&#39;s Drink<br />\r\nWe recommend giving your toddler about 2 x 150ml beakers of Aptamil&reg; Toddler Milk a day, as part of a varied, balanced diet. Aptamil Toddler Milk is specially formulated to help meet the increased nutritional needs of toddlers from 1 year onwards.<br />\r\n1 Beaker: No. of level scoops per drink (1 scoop = 5.0g): 5, Quantity of water per drink: 150 ml / 5 fl oz<br />\r\n<br />\r\nImportant: Always use the scoop provided, please note the colour of the scoop in this pack may change from time to time.<br />\r\n1 Water: Measure 150ml or 5fl.oz of boiled, cooled water into a clean beaker.<br />\r\n2 Powder: Using the scoop provided, add 5 levelled scoops of powder into the beaker. Do not press/heap the powder.<br />\r\n3 Shake: Place the clean lid on the beaker and shake straight away. For best results, shake vertically and vigorously for at least 10 seconds, until all of the powder is dissolved.<br />\r\n4 Check temperature and drink immediately.<br />\r\n<br />\r\nImportant feeding and storage advice<br />\r\nMake up each drink as required.<br />\r\nFor hygiene reasons, do not store made up drinks, discard unfinished drinks as soon as possible, and always within 2 hours.<br />\r\nDo not heat drinks in a microwave, hot spots may occur and cause scalding.<br />\r\nNever add extra scoops or anything else to your toddler&#39;s drink.<br />\r\nToddlers should be supervised at all times when feeding.</p>', 1, NULL, NULL, NULL, 1000, '1718970287.jpg', '2024/06', 16, 0, 0, 0, NULL, 0, 0, 0, NULL, 3050, 0, NULL, NULL, '2024-06-21 11:44:47', '2024-06-21 11:44:47'),
(4, 1, 'Aptamil Formula Milk Stage-4 800gm', 'aptamil-formula-milk-stage-4-800gm', 'Simple', 0, 0, 0, '<h2><strong>Aptamil Stage 4 Toddler Milk</strong></h2>\r\n\r\n<p><strong>From 2 to 3 years</strong></p>', '<p>Net Content</p>\r\n\r\n<p>800&nbsp;Grams</p>\r\n\r\n<p>Allergy Advice</p>\r\n\r\n<p><strong data-auto-id=\"allergyInfo\">Contains: Fish, Milk, Soya.</strong></p>\r\n\r\n<p>Additives</p>\r\n\r\n<p>Free From: Artificial Preservatives.</p>\r\n\r\n<p>Ingredients</p>\r\n\r\n<p>Dairy-Based Blend (of which 25% is Fermented) [Skimmed&nbsp;<strong>Milk</strong>, Lactose (from&nbsp;<strong>Milk</strong>), Vegetable Oils (Rapeseed Oil, Sunflower Oil, High Oleic Sunflower Oil, Coconut Oil), Whey products (Demineralised Whey, Whey Concentrate) (from&nbsp;<strong>Milk</strong>), Calcium Phosphate,&nbsp;<strong>Fish</strong>&nbsp;Oil, Potassium Citrate, Calcium Carbonate, Sodium Citrate, Potassium Chloride, Vitamin C, Emulsifier (<strong>Soy</strong>&nbsp;Lecithin), Choline Chloride, Inositol, Magnesium Chloride, Pantothenic Acid, Vitamin E, Antioxidant (Vitamin C), Riboflavin, Nicotinamide, Vitamin B6, Thiamin, Potassium Iodide, Folic Acid, Vitamin K1, Biotin, Vitamin B12],&nbsp;Maltodextrin,&nbsp;Galacto-Oligosaccharides (GOS) (from&nbsp;<strong>Milk</strong>),&nbsp;Fructo-Oligosaccharides (FOS),&nbsp;Magnesium Hydrogen Phosphate,&nbsp;Ferrous Sulphate,&nbsp;<strong>Milk</strong>&nbsp;Flavouring,&nbsp;Zinc Sulphate,&nbsp;Vitamin A,&nbsp;Vitamin D3</p>\r\n\r\n<p>For allergens, see ingredients in bold.</p>', 1, 'Aptamil Stage 4', 'Aptamil Stage 4', 'Aptamil Stage 4', 1000, '1718970411.jpg', '2024/06', 17, 0, 0, 0, NULL, 0, 0, 0, NULL, 3050, 0, NULL, NULL, '2024-06-21 11:46:51', '2024-06-21 11:46:51'),
(5, 1, 'Cow & Gate Formula Milk Stage-1 800gm', 'cow-gate-formula-milk-stage-1-800gm', 'Simple', 0, 0, 0, '<h2><strong>Cow &amp; Gate Stage 1 First Infant Milk</strong></h2>\r\n\r\n<p><strong>From Birth to 6 Months</strong></p>', '<p>Net Content</p>\r\n\r\n<p>800&nbsp;Grams</p>\r\n\r\n<p>Allergy Advice</p>\r\n\r\n<p><strong data-auto-id=\"allergyInfo\">Contains: Fish, Milk, Soya.</strong></p>\r\n\r\n<p>Ingredients</p>\r\n\r\n<p>Lactose (from&nbsp;<strong>Milk</strong>),&nbsp;Vegetable Oils (High Oleic Sunflower Oil, Coconut Oil, Rapeseed Oil, Sunflower Oil),&nbsp;Skimmed&nbsp;<strong>Milk</strong>,&nbsp;Demineralised Whey (from&nbsp;<strong>Milk</strong>),&nbsp;Whey Concentrate (from&nbsp;<strong>Milk</strong>),&nbsp;Galacto-Oligosaccharides (GOS) (from&nbsp;<strong>Milk</strong>),&nbsp;Cow&#39;s&nbsp;<strong>Milk</strong>&nbsp;Protein,&nbsp;<strong>Fish</strong>&nbsp;Oil,&nbsp;Calcium Phosphate,&nbsp;Fructo- Oligosaccharides (FOS),&nbsp;Potassium Chloride,&nbsp;Oil from Mortierella Alpina,&nbsp;Sodium Citrate,&nbsp;Choline Chloride,&nbsp;Magnesium Hydrogen Phosphate,&nbsp;Potassium Citrate,&nbsp;Vitamin C,&nbsp;Inositol,&nbsp;Emulsifier (<strong>Soy</strong>&nbsp;Lecithin),&nbsp;Magnesium Chloride,&nbsp;Iron Sulphate,&nbsp;Zinc Sulphate,&nbsp;L-Carnitine,&nbsp;Antioxidant (Vitamin C),&nbsp;Pantothenic Acid,&nbsp;Niacin,&nbsp;Copper Sulphate,&nbsp;Vitamin E,&nbsp;Vitamin A,&nbsp;Thiamin,&nbsp;Riboflavin,&nbsp;Vitamin B6,&nbsp;Folic Acid,&nbsp;Potassium Iodide,&nbsp;Manganese Sulphate,&nbsp;Sodium Selenite,&nbsp;Vitamin K1,&nbsp;Biotin,&nbsp;Vitamin D3,&nbsp;Vitamin B12</p>\r\n\r\n<p>For allergens, see ingredients in bold.</p>', NULL, 'Cow & Gate Stage 1', 'Cow & Gate Stage 1', 'Cow & Gate Stage 1', 1000, '1718970543.jpg', '2024/06', 18, 0, 0, 0, NULL, 0, 0, 0, NULL, 3050, 0, NULL, NULL, '2024-06-21 11:49:03', '2024-06-21 11:49:03'),
(6, 1, 'Cow & Gate Formula Milk Stage-2 800gm', 'cow-gate-formula-milk-stage-2-800gm', 'Simple', 0, 0, 0, '<h1><strong><em>Cow &amp; Gate Stage 2 (6 to 12 months)</em></strong></h1>', '<p>Net Content</p>\r\n\r\n<p>800&nbsp;Grams</p>\r\n\r\n<p>Allergy Advice</p>\r\n\r\n<p><strong data-auto-id=\"allergyInfo\">Contains: Fish, Milk, Soya.</strong></p>\r\n\r\n<p>Additives</p>\r\n\r\n<p>Free From: Artificial Colours, Artificial Preservatives.</p>\r\n\r\n<p>Ingredients</p>\r\n\r\n<p>Lactose (from&nbsp;<strong>Milk</strong>),&nbsp;Vegetable Oils (High Oleic Sunflower Oil, Coconut Oil, Rapeseed Oil, Sunflower Oil),&nbsp;Skimmed&nbsp;<strong>Milk</strong>,&nbsp;Demineralised Whey (from&nbsp;<strong>Milk</strong>),&nbsp;Galacto-Oligosaccharides (GOS) (from&nbsp;<strong>Milk</strong>),&nbsp;Whey Concentrate (from&nbsp;<strong>Milk</strong>),&nbsp;Cow&#39;s&nbsp;<strong>Milk</strong>&nbsp;Protein,&nbsp;Calcium Phosphate,&nbsp;<strong>Fish</strong>&nbsp;Oil,&nbsp;Fructo-Oligosaccharides,&nbsp;Potassium Chloride,&nbsp;Sodium Citrate,&nbsp;Choline Chloride,&nbsp;Magnesium Hydrogen Phosphate,&nbsp;Vitamin C,&nbsp;Emulsifier (<strong>Soy</strong>&nbsp;Lecithin),&nbsp;Potassium Citrate,&nbsp;Inositol,&nbsp;Magnesium Chloride,&nbsp;L-Tryptophan,&nbsp;Iron Sulphate,&nbsp;L-Carnitine,&nbsp;Zinc Sulphate,&nbsp;Antioxidant (Vitamin C),&nbsp;Vitamin E,&nbsp;Pantothenic Acid,&nbsp;Niacin,&nbsp;Copper Sulphate,&nbsp;Thiamin,&nbsp;Vitamin A,&nbsp;Riboflavin,&nbsp;Vitamin B6,&nbsp;Potassium Iodide,&nbsp;Folic Acid,&nbsp;Manganese Sulphate,&nbsp;Sodium Selenite,&nbsp;Vitamin K1,&nbsp;Biotin,&nbsp;Vitamin D3,&nbsp;Vitamin B12</p>\r\n\r\n<p>For allergens, see ingredients in bold.</p>', NULL, 'Cow & Gate Stage 2', 'Cow & Gate Stage 2', 'Cow & Gate Stage 2', 1000, '1718970743.jpg', '2024/06', 19, -1, 0, 0, NULL, 0, 0, 0, NULL, 2950, 0, NULL, NULL, '2024-06-21 11:52:23', '2024-07-07 15:10:49'),
(7, 1, 'Cow & gate Formula Milk Stage-3 800gm', 'cow-gate-formula-milk-stage-3-800gm', 'Simple', 0, 0, 0, '<p>Cow &amp; Gate Stage 3 Toddler Milk (1 to 2years)</p>', '<p>Net Content</p>\r\n\r\n<p>800&nbsp;Grams</p>\r\n\r\n<p>Allergy Advice</p>\r\n\r\n<p><strong data-auto-id=\"allergyInfo\">Contains: Milk, Soya.</strong></p>\r\n\r\n<p>Ingredients</p>\r\n\r\n<p>Lactose (from&nbsp;<strong>Milk</strong>),&nbsp;Skimmed&nbsp;<strong>Milk</strong>,&nbsp;Vegetable Oils (Fully Refined Soybean Oil, Sunflower Oil, Coconut Oil, Rapeseed Oil) in varying proportions,&nbsp;Maltodextrin,&nbsp;Galacto-Oligosaccharides (GOS) (from&nbsp;<strong>Milk</strong>),&nbsp;Calcium Phosphate,&nbsp;Potassium Citrate,&nbsp;Calcium Carbonate,&nbsp;Fructo-Oligosaccharides (FOS),&nbsp;Magnesium Citrate,&nbsp;Potassium Chloride,&nbsp;Sodium Citrate,&nbsp;Vitamin C,&nbsp;Emulsifier (<strong>Soy</strong>&nbsp;Lecithin),&nbsp;Inositol,&nbsp;Iron Sulphate,&nbsp;Zinc Sulphate,&nbsp;Pantothenic Acid,&nbsp;Vitamin E,&nbsp;Antioxidant (Vitamin C),&nbsp;Niacin,&nbsp;Riboflavin,&nbsp;Thiamin,&nbsp;Vitamin A,&nbsp;Vitamin B₆,&nbsp;Potassium Iodide,&nbsp;Folic Acid,&nbsp;Vitamin K₁,&nbsp;Vitamin D₃,&nbsp;Biotin,&nbsp;Vitamin B₁₂</p>\r\n\r\n<p>For allergens, see ingredients in bold.</p>', NULL, 'Cow & Gate Stage 3', 'Cow & Gate Stage 3', 'Cow & Gate Stage 3', 1000, '1718970844.jpg', '2024/06', 20, 0, 0, 0, NULL, 0, 0, 0, NULL, 3050, 0, NULL, NULL, '2024-06-21 11:54:05', '2024-06-21 11:54:05'),
(8, 1, 'Cow & Gate Formula Milk Stage-4 800gm', 'cow-gate-formula-milk-stage-4-800gm', 'Simple', 0, 0, 0, '<p>Cow &amp; Gate Stage 4 Toddler Milk (2 to 3years)</p>', '<p>Net Content<br />\r\n800&nbsp;Grams</p>\r\n\r\n<p>Allergy Advice</p>\r\n\r\n<p><strong data-auto-id=\"allergyInfo\">Contains: Milk, Soya.</strong></p>\r\n\r\n<p>Ingredients</p>\r\n\r\n<p>Lactose (from&nbsp;<strong>Milk</strong>),&nbsp;Skimmed&nbsp;<strong>Milk</strong>,&nbsp;Vegetable Oils (Fully Refined Soybean Oil, Sunflower Oil, Coconut Oil, Rapeseed Oil) in varying proportions,&nbsp;Maltodextrin,&nbsp;Galacto-Oligosaccharides (GOS) (from&nbsp;<strong>Milk</strong>),&nbsp;Calcium Phosphate,&nbsp;Potassium Citrate,&nbsp;Fructo-Oligosaccharides (FOS),&nbsp;Calcium Carbonate,&nbsp;Magnesium Citrate,&nbsp;Potassium Chloride,&nbsp;Sodium Citrate,&nbsp;Vitamin C,&nbsp;Emulsifier (<strong>Soy</strong>&nbsp;Lecithin),&nbsp;Inositol,&nbsp;Iron Sulphate,&nbsp;<strong>Milk</strong>&nbsp;Flavouring,&nbsp;Zinc Sulphate,&nbsp;Pantothenic Acid,&nbsp;Vitamin E,&nbsp;Antioxidant (Vitamin C),&nbsp;Niacin,&nbsp;Riboflavin,&nbsp;Thiamin,&nbsp;Vitamin A,&nbsp;Vitamin B₆,&nbsp;Potassium Iodide,&nbsp;Folic Acid,&nbsp;Vitamin K₁,&nbsp;Vitamin D₃,&nbsp;Biotin,&nbsp;Vitamin B₁₂</p>\r\n\r\n<p>For allergens, see ingredients in bold.</p>', NULL, 'Cow & Gate Stage 4 Toddler Milk', 'Cow & Gate Stage 4 Toddler Milk', 'Cow & Gate Stage 4 Toddler Milk', 1000, '1718970938.jpg', '2024/06', 21, 0, 0, 0, NULL, 0, 0, 0, NULL, 3050, 0, NULL, NULL, '2024-06-21 11:55:38', '2024-06-21 11:55:38'),
(9, 1, 'Pediasure Complete Vanilla 400gm', 'pediasure-complete-vanilla-400gm', 'Simple', 0, 0, 0, '<p>Pediasure Complete Vanilla (1 to 10 Years)</p>', '<p><b>Key&nbsp;<b>benefits</b>&nbsp;of Abbott&nbsp;<b>Pediasure Complete Vanilla</b>&nbsp;:</b></p>\r\n\r\n<ul>\r\n	<li>Provide healthy growth.</li>\r\n	<li>Increase muscle build-up.</li>\r\n	<li>Helps to gain weight.</li>\r\n	<li>Makes the teeth and bones strong.</li>\r\n	<li>Improve immune system.</li>\r\n	<li>Promote physical activity.</li>\r\n	<li>Can be used as a supplement in between meals.</li>\r\n	<li>Increase the kid&#39;s appetite.</li>\r\n</ul>', NULL, 'Pediasure Complete Vanilla', 'Pediasure Complete Vanilla', 'Pediasure Complete Vanilla', 1000, '1718971416.jpg', '2024/06', 22, 0, 0, 0, NULL, 0, 0, 0, NULL, 1750, 0, NULL, NULL, '2024-06-21 12:03:36', '2024-06-21 12:03:36'),
(10, 1, 'Pediasure Complete Vanilla 900gm', 'pediasure-complete-vanilla-900gm', 'Simple', 0, 0, 0, '<p>Pediasure Complete Vanilla (1 to 10 Years)</p>', '<p><b>Key&nbsp;<b>benefits</b>&nbsp;of Abbott&nbsp;<b>Pediasure Complete Vanilla</b>&nbsp;:</b></p>\r\n\r\n<ul>\r\n	<li>Provide healthy growth.</li>\r\n	<li>Increase muscle build-up.</li>\r\n	<li>Helps to gain weight.</li>\r\n	<li>Makes the teeth and bones strong.</li>\r\n	<li>Improve immune system.</li>\r\n	<li>Promote physical activity.</li>\r\n	<li>Can be used as a supplement in between meals.</li>\r\n	<li>Increase the kid&#39;s appetite.</li>\r\n</ul>', NULL, 'Pediasure Complete Vanilla', 'Pediasure Complete Vanilla', 'Pediasure Complete Vanilla', 1000, '1718971554.jpg', '2024/06', 23, 0, 0, 0, NULL, 0, 0, 0, NULL, 3400, 0, NULL, NULL, '2024-06-21 12:05:54', '2024-06-21 12:05:54'),
(11, 1, 'Pediasure Complete Vanilla 1600gm', 'pediasure-complete-vanilla-1600gm', 'Simple', 0, 0, 0, '<p>Pediasure Complete Vanilla (1 to 10 Years)</p>', '<p><b>Key&nbsp;<b>benefits</b>&nbsp;of Abbott&nbsp;<b>Pediasure Complete Vanilla</b>&nbsp;:</b></p>\r\n\r\n<ul>\r\n	<li>Provide healthy growth.</li>\r\n	<li>Increase muscle build-up.</li>\r\n	<li>Helps to gain weight.</li>\r\n	<li>Makes the teeth and bones strong.</li>\r\n	<li>Improve immune system.</li>\r\n	<li>Promote physical activity.</li>\r\n	<li>Can be used as a supplement in between meals.</li>\r\n	<li>Increase the kid&#39;s appetite.</li>\r\n</ul>', NULL, 'Pediasure Complete Vanilla', 'Pediasure Complete Vanilla', 'Pediasure Complete Vanilla', 1000, '1718971695.jpg', '2024/06', 24, 0, 0, 0, NULL, 0, 0, 0, NULL, 5500, 0, NULL, NULL, '2024-06-21 12:08:15', '2024-06-21 12:08:15'),
(12, 1, 'Pediasure Complete Chocolate 900gm', 'pediasure-complete-chocolate-900gm', 'Simple', 0, 0, 0, '<p>Pediasure Complete Chocolate (1 to 10 Years)</p>', '<p><b><b>Pediasure Complete Chocolate</b>&nbsp;900gm</b></p>\r\n\r\n<ul>\r\n	<li>Delicious taste in&nbsp;<b>Milk</b>&nbsp;for your little Kids.</li>\r\n	<li>Full of&nbsp;<b>Benefits</b>&nbsp;with a great chocolaty taste.</li>\r\n	<li><b>PediaSure</b>&nbsp;is clinically proven to: Improve height and weight.</li>\r\n	<li>Improve appetite.</li>\r\n	<li>Improve physical activity.</li>\r\n	<li>Improve immunity (less sick days)</li>\r\n	<li>With&nbsp;<b>Chocolate</b>&nbsp;Flavor.</li>\r\n	<li>Imported from UAE.</li>\r\n</ul>', NULL, 'Pediasure Complete Chocolate', 'Pediasure Complete Chocolate', 'Pediasure Complete Chocolate', 1000, '1718971824.jpg', '2024/06', 25, 0, 0, 0, NULL, 0, 0, 0, NULL, 3550, 0, NULL, NULL, '2024-06-21 12:10:24', '2024-06-21 12:10:24'),
(13, 1, 'Similac Gold Milk Stage-1 800gm', 'similac-gold-milk-stage-1-800gm', 'Simple', 0, 0, 0, '<p>Similac Gold 1 (0 to 6 Months)</p>', '<p><b>Key&nbsp;<b>benefits</b>&nbsp;of Abbott&nbsp;<b>Similac Gold 1</b>&nbsp;Infant Formula Baby Milk:</b></p>\r\n\r\n<ul>\r\n	<li>Contains necessary nutrients.</li>\r\n	<li>Strengthen the immune system.</li>\r\n	<li>Helps with mental and physical growth.</li>\r\n	<li>Important for physical growth.</li>\r\n	<li>Reduce retinal lesions &amp; increase eye vision.</li>\r\n	<li>Helps with bone formation.</li>\r\n	<li>It builds muscle mass.</li>\r\n	<li>Contains sufficient vitamins.</li>\r\n</ul>', NULL, 'Similac Gold 1', 'Similac Gold 1', 'Similac Gold 1', 1000, '1718972058.jpg', '2024/06', 26, 0, 0, 0, NULL, 0, 0, 0, NULL, 3150, 3570, NULL, NULL, '2024-06-21 12:14:18', '2024-06-21 12:14:18'),
(14, 1, 'Similac Gold Milk Stage-2 800gm', 'similac-gold-milk-stage-2-800gm', 'Simple', 0, 0, 0, '<p>Similac Gold 2 (6 to 12 Months)</p>', '<h2><strong>Key Benefits of Abbott Similac Gold 2 Follow-On Formula Baby Milk(From 6-12 Months):</strong></h2>\r\n\r\n<ul>\r\n	<li>Comes with an advanced formula with HMO.</li>\r\n	<li>Based on cow&rsquo;s milk.</li>\r\n	<li>Breakthrough formula that enhances immunity.</li>\r\n	<li>Contains natural vitamin E, DHA, and Lutein.</li>\r\n	<li>Free from palm olein oil.</li>\r\n	<li>Clinically proven to strengthen immunity.</li>\r\n	<li>Boosts the baby&rsquo;s immunity.</li>\r\n	<li>Supports the baby&rsquo;s normal cognitive development.</li>\r\n	<li>Ensures faster brain function.</li>\r\n	<li>Brain development with Lutein, DHA, and Vitamin E.</li>\r\n	<li>Ensures the baby&rsquo;s fast nutrient absorption.</li>\r\n	<li>Contains AA, Omega 3&amp;6, Taurin, choline, zinc, and iron.</li>\r\n	<li>Easy to digest.</li>\r\n	<li>Provides the nutrients of vitamins A, C, D, B6, and B12.</li>\r\n</ul>', NULL, 'Similac Gold 2 (6 to 12 Months)', 'Similac Gold 2 (6 to 12 Months)', 'Similac Gold 2 (6 to 12 Months)', 1000, '1718972435.jpg', '2024/06', 27, 0, 0, 0, NULL, 0, 0, 0, NULL, 3180, 3570, NULL, NULL, '2024-06-21 12:20:35', '2024-06-21 12:22:37'),
(15, 1, 'Similac Gold Milk Stage-3 800gm', 'similac-gold-milk-stage-3-800gm', 'Simple', 0, 0, 0, '<p>Similac Gold 3 (1 to 3 Years)</p>', '<p><strong>Key Benefits of SIMILAC GOLD&nbsp;3 Milk For Children:</strong></p>\r\n\r\n<ul>\r\n	<li>Contributes to the protection of the child&#39;s natural immunity.</li>\r\n	<li>Contributes to the growth of beneficial bacteria (prebiotics).</li>\r\n	<li>Make milk Easy to digest. It contains Omega 3 and 6, zinc, iron, calcium and vitamin D required for bone and dental health.</li>\r\n</ul>', NULL, 'Similac Gold 3', 'Similac Gold 3', 'Similac Gold 3', 1000, '1718972779.jpg', '2024/06', 28, 0, 0, 0, NULL, 0, 0, 0, NULL, 3200, 3430, NULL, NULL, '2024-06-21 12:26:19', '2024-06-21 12:26:19'),
(16, 1, 'Similac Gold Milk Stage-4 900gm', 'similac-gold-milk-stage-4-900gm', 'Simple', 0, 0, 0, '<p>Similac Gold 4 (3 Years and Above)</p>', '<h3><strong>Key Benefits of Similac Gold 4 Formula Milk:</strong></h3>\r\n\r\n<ul>\r\n	<li>Similac Gold 4 give babies a strong start with important baby formula ingredients.</li>\r\n	<li>DHA, Lutein and Vitamin E, also found in breast milk,&nbsp;help support your baby&#39;s brain and eye development.</li>\r\n</ul>', NULL, 'Similac Gold 4', 'Similac Gold 4', 'Similac Gold 4', 1000, '1718972969.jpg', '2024/06', 29, 0, 0, 0, NULL, 0, 0, 0, NULL, 3250, 3430, NULL, NULL, '2024-06-21 12:29:29', '2024-06-21 12:29:29'),
(17, 1, 'Nestle Cerelac Mixed Fruits & Wheat with Milk 400gm', 'nestle-cerelac-mixed-fruits-wheat-with-milk-400gm', 'Simple', 0, 0, 0, NULL, '<p><strong>CERELAC&reg; </strong>Mixed Fruits and Wheat with Milk is a wheat-based fruit infant cereal containing milk powder and mixed fruits. It&#39;s been designed for infants from&nbsp;<b>7 months of age to 24 months</b>.<br />\r\nNestle Cerelac mixed fruits &amp; wheat is made with 100% natural ingredients fortified with key minerals &amp; vitamins to prevent nutritional deficiencies such as Iron, Zinc, Calcium, Vitamins A &amp; C&nbsp;helps support babies natural defenses &amp; normal growth &amp; development&nbsp;contains BIFIDUS BL which are naturally active</p>', NULL, 'Nestle Cerelac Mixed Fruits & Wheat with Milk', 'Nestle Cerelac Mixed Fruits & Wheat with Milk', 'Nestle Cerelac Mixed Fruits & Wheat with Milk', 1000, '1718973940.jpg', '2024/06', 30, 0, 0, 0, NULL, 0, 0, 0, NULL, 850, 900, NULL, NULL, '2024-06-21 12:45:40', '2024-06-21 12:45:40'),
(18, 1, 'Nestle Cerelac Mixed Fruits & Wheat with Milk 1 kg', 'nestle-cerelac-mixed-fruits-wheat-with-milk-1-kg', 'Simple', 0, 0, 0, NULL, '<p><strong>CERELAC&reg; </strong>Mixed Fruits and Wheat with Milk is a wheat-based fruit infant cereal containing milk powder and mixed fruits. It&#39;s been designed for infants from&nbsp;<b>7 months of age to 24 months</b>.<br />\r\nNestle Cerelac mixed fruits &amp; wheat is made with 100% natural ingredients fortified with key minerals &amp; vitamins to prevent nutritional deficiencies such as Iron, Zinc, Calcium, Vitamins A &amp; C&nbsp;helps support babies natural defenses &amp; normal growth &amp; development&nbsp;contains BIFIDUS BL which are naturally active</p>', NULL, 'Nestle Cerelac Mixed Fruits & Wheat with Milk', 'Nestle Cerelac Mixed Fruits & Wheat with Milk', 'Nestle Cerelac Mixed Fruits & Wheat with Milk', 1000, '1718974019.jpg', '2024/06', 31, 0, 0, 0, NULL, 0, 0, 0, NULL, 1750, 1850, NULL, NULL, '2024-06-21 12:46:59', '2024-06-21 12:46:59'),
(19, 1, 'SMA Pro Stage-1 800gm', 'sma-pro-stage-1-800gm', 'Simple', 0, 0, 0, '<p><strong>SMA PRO 1 Infant Milk From Birth</strong></p>', '<h3><strong>Weight : 800G</strong></h3>\r\n\r\n<h3><strong>Origin : UK</strong></h3>\r\n\r\n<h3><strong>Delivery Charge Inside Dhaka 80 Taka</strong></h3>\r\n\r\n<h3><strong>Outside Dhaka 180 Taka</strong></h3>', NULL, 'SMA PRO 1 Infant Milk From Birth', 'SMA PRO 1 Infant Milk From Birth', 'SMA PRO 1 Infant Milk From Birth', 1000, '1719052333.jpg', '2024/06', 40, 0, 0, 0, NULL, 0, 0, 0, NULL, 2750, 0, NULL, NULL, '2024-06-22 10:32:13', '2024-06-22 10:32:13'),
(20, 1, 'SMA Pro Stage-2 800gm', 'sma-pro-stage-2-800gm', 'Simple', 0, 0, 0, '<p><strong>SMA PRO 2 Follow-On Milk From 6+Months</strong></p>', '<p><strong>Weight : 800G</strong></p>\r\n\r\n<p><strong>Origin : UK</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'SMA PRO 2 Follow-On Milk From 6+Months', 'SMA PRO 2 Follow-On Milk From 6+Months', 'SMA PRO 2 Follow-On Milk From 6+Months', 1000, '1719052430.jpg', '2024/06', 41, 0, 0, 0, NULL, 0, 0, 0, NULL, 2950, 0, NULL, NULL, '2024-06-22 10:33:50', '2024-06-22 10:33:50'),
(21, 1, 'SMA Pro Stage-3 800gm', 'sma-pro-stage-3-800gm', 'Simple', 0, 0, 0, '<p><strong>SMA PRO 3 Growing Up Milk From 12mnths to 3years</strong></p>', '<p><strong>Weight : 800G</strong></p>\r\n\r\n<p><strong>Origin : UK</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'SMA PRO 3 Growing Up Milk From 12mnths to 3years', 'SMA PRO 3 Growing Up Milk From 12mnths to 3years', 'SMA PRO 3 Growing Up Milk From 12mnths to 3years', 1000, '1719052613.jpg', '2024/06', 42, 0, 0, 0, NULL, 0, 0, 0, NULL, 2750, 0, NULL, NULL, '2024-06-22 10:36:53', '2024-06-22 10:36:53'),
(22, 1, 'Nido Fortified Full Cream Milk Powder 900gm', 'nido-fortified-full-cream-milk-powder-900gm', 'Simple', 0, 0, 0, '<p>Nido Fortifided Full Cream Milk Powder</p>', '<p><strong>Weight : 900 gm</strong></p>\r\n\r\n<p><strong>Origin : UAE</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Nido Fortifided Full Cream Milk Powder', 'Nido Fortifided Full Cream Milk Powder', 'Nido Fortifided Full Cream Milk Powder', 1000, '1719053137.jpg', '2024/06', 43, 0, 0, 0, NULL, 0, 0, 0, NULL, 2700, 0, NULL, NULL, '2024-06-22 10:45:38', '2024-06-22 10:45:38'),
(23, 1, 'Nestle Nido Fortified Rich in Fiber Milk (Pack) 1800gm', 'nestle-nido-fortified-rich-in-fiber-milk-pack-1800gm', 'Simple', 0, 0, 0, '<p><strong>Nestle Nido Fortified Rich in Fiber Milk</strong></p>', '<p><strong>Weight : 1800G</strong></p>\r\n\r\n<p><strong>Origin : UAE</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180&nbsp;Taka</strong></p>', NULL, 'Nestle Nido Fortified Rich in Fiber Milk', 'Nestle Nido Fortified Rich in Fiber Milk', 'Nestle Nido Fortified Rich in Fiber Milk', 1000, '1719053396.jpg', '2024/06', 44, 0, 0, 0, NULL, 0, 0, 0, NULL, 2850, 2950, NULL, NULL, '2024-06-22 10:49:56', '2024-06-22 10:49:56'),
(24, 1, 'Nido Fortified Rich in Fiber Full Cream Milk Powder (Pack) 2500gm', 'nido-fortified-rich-in-fiber-full-cream-milk-powder-pack-2500gm', 'Simple', 0, 0, 0, '<p>Nido Fortified Rich in Fiber Full Cream Milk Powder</p>', '<p><strong><em>Weight : 2500G<br />\r\nOrigin : UAE<br />\r\nDelivery Charge:<br />\r\nInside Dhaka City 80 Tk<br />\r\nOut Of Dhaka City 180 Tk (for 1pc)</em></strong></p>', NULL, 'Nido Fortified Rich in Fiber Full Cream Milk Powder', 'Nido Fortified Rich in Fiber Full Cream Milk Powder', 'Nido Fortified Rich in Fiber Full Cream Milk Powder', 1000, '1719198623.jpg', '2024/06', 45, 0, 0, 0, NULL, 0, 0, 0, NULL, 3750, 0, NULL, NULL, '2024-06-24 03:10:23', '2024-06-24 03:10:23'),
(25, 1, 'Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 1+ (1-3years) 400g', 'nestle-nido-little-kids-growing-up-formula-based-on-cow-milk-1-1-3years-400g', 'Simple', 0, 0, 0, '<p>Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 1+</p>', '<p><strong>Weight : 400 gm</strong></p>\r\n\r\n<p><strong>Origin: UAE</strong></p>\r\n\r\n<p><strong>Important Notice: Breast Milk is the best nutrition for your infant.</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 1+', 'Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 1+', 'Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 1+', 1000, '1719198820.jpg', '2024/06', 46, 0, 0, 0, NULL, 0, 0, 0, NULL, 1600, 0, NULL, NULL, '2024-06-24 03:13:40', '2024-06-24 03:13:40'),
(26, 1, 'Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 1+ (1-3years) 900g', 'nestle-nido-little-kids-growing-up-formula-based-on-cow-milk-1-1-3years-900g', 'Simple', 0, 0, 0, '<p>Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 1+ (1-3years)</p>', '<p><strong>Weight : 900 gm</strong></p>\r\n\r\n<p><strong>Origin: UAE</strong></p>\r\n\r\n<p><strong>Important Notice: Breast Milk is the best nutrition for your infant.</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 1+ (1-3years)', 'Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 1+ (1-3years)', 'Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 1+ (1-3years)', 1000, '1719198897.jpg', '2024/06', 47, 0, 0, 0, NULL, 0, 0, 0, NULL, 2680, 0, NULL, NULL, '2024-06-24 03:14:57', '2024-06-24 03:14:57'),
(27, 1, 'Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 1+ (1-3years) 1800g', 'nestle-nido-little-kids-growing-up-formula-based-on-cow-milk-1-1-3years-1800g', 'Simple', 0, 0, 0, '<p>Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 1+ (1-3years)&nbsp;</p>', '<p><strong>Weight : 1800 gm</strong></p>\r\n\r\n<p><strong>Origin: UAE</strong></p>\r\n\r\n<p><strong>Important Notice: Breast Milk is the best nutrition for your infant.</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 1+ (1-3years)', 'Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 1+ (1-3years)', 'Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 1+ (1-3years)', 1000, '1719198964.jpg', '2024/06', 48, 0, 0, 0, NULL, 0, 0, 0, NULL, 4890, 0, NULL, NULL, '2024-06-24 03:16:04', '2024-06-24 03:16:04'),
(28, 1, 'Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 3+ (3-5years) 400g', 'nestle-nido-little-kids-growing-up-formula-based-on-cow-milk-3-3-5years-400g', 'Simple', 0, 0, 0, '<p>Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 3+ (3-5years)&nbsp;</p>', '<p><strong>Weight : 400gm</strong></p>\r\n\r\n<p><strong>Origin : UAE</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 3+ (3-5years)', 'Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 3+ (3-5years)', 'Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 3+ (3-5years)', 1000, '1719199100.jpg', '2024/06', 49, 0, 0, 0, NULL, 0, 0, 0, NULL, 1600, 0, NULL, NULL, '2024-06-24 03:18:20', '2024-06-24 03:18:20'),
(29, 1, 'Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 3+ (3-5years) 1800g', 'nestle-nido-little-kids-growing-up-formula-based-on-cow-milk-3-3-5years-1800g', 'Simple', 0, 0, 0, '<p>Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 3+ (3-5years)&nbsp;</p>', '<p><em><strong>NIDO 3+ is a powdered milk beverage with 13 vitamins and minerals to help support your child&rsquo;s healthy growth and brain development in the preschool years.</strong></em></p>\r\n\r\n<p><em><strong>Weight : 1800gm</strong></em></p>\r\n\r\n<p><em><strong>Origin : UAE</strong></em></p>\r\n\r\n<p><em><strong>Delivery Charge Inside Dhaka 80 Taka</strong></em></p>\r\n\r\n<p><em><strong>Outside Dhaka 180 Taka</strong></em></p>', NULL, 'Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 3+ (3-5years)', 'Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 3+ (3-5years)', 'Nestle Nido Little Kids Growing Up Formula Based On Cow Milk 3+ (3-5years)', 1000, '1719199227.jpg', '2024/06', 50, 0, 0, 0, NULL, 0, 0, 0, NULL, 4950, 0, NULL, NULL, '2024-06-24 03:20:27', '2024-06-24 03:20:27'),
(30, 1, 'Nan Optipro Formula Milk Stage-1 (Birth to 6months) 800gm', 'nan-optipro-formula-milk-stage-1-birth-to-6months-800gm', 'Simple', 0, 0, 0, '<p>Nan Optipro Formula Milk Stage-1 (Birth to 6months)</p>', '<ul>\r\n	<li><strong>Weight: 800 gm</strong></li>\r\n	<li><strong>Made In Switzerland</strong></li>\r\n	<li><strong>Imported From UAE</strong></li>\r\n</ul>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Nan Optipro Formula Milk Stage-1 (Birth to 6months)', 'Nan Optipro Formula Milk Stage-1 (Birth to 6months)', 'Nan Optipro Formula Milk Stage-1 (Birth to 6months)', 1000, '1719199492.jpg', '2024/06', 51, 0, 0, 0, NULL, 0, 0, 0, NULL, 3750, 0, NULL, NULL, '2024-06-24 03:24:52', '2024-06-24 03:24:52'),
(31, 1, 'Nan Optipro Formula Milk Stage-2 (6 to 12months) 800gm', 'nan-optipro-formula-milk-stage-2-6-to-12months-800gm', 'Simple', 0, 0, 0, '<p>Nan Optipro Formula Milk Stage-2 (6 to 12months)</p>', '<ul>\r\n	<li><strong>Weight: 800 gm</strong></li>\r\n	<li><strong>Made In Switzerland</strong></li>\r\n	<li><strong>Imported From UAE</strong></li>\r\n</ul>\r\n\r\n<p><strong>Important Notice: Breast Milk is the best nutrition for your infant</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Nan Optipro Formula Milk Stage-2 (6 to 12months)', 'Nan Optipro Formula Milk Stage-2 (6 to 12months)', 'Nan Optipro Formula Milk Stage-2 (6 to 12months)', 1000, '1719199591.jpg', '2024/06', 52, 0, 0, 0, NULL, 0, 0, 0, NULL, 3750, 0, NULL, NULL, '2024-06-24 03:26:31', '2024-06-24 03:26:31'),
(32, 1, 'Nan Optipro Formula Milk Stage-3 (1 to 3years) 800gm', 'nan-optipro-formula-milk-stage-3-1-to-3years-800gm', 'Simple', 0, 0, 0, '<p>Nan Optipro Formula Milk Stage-3 (1 to 3years)</p>', '<ul>\r\n	<li><strong>Weight: 800 gm</strong></li>\r\n	<li><strong>Made In&nbsp;Switzerland</strong></li>\r\n	<li><strong>Imported From UAE</strong></li>\r\n</ul>\r\n\r\n<p><strong>Important Notice: Breast Milk is the best nutrition for your infant</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Nan Optipro Formula Milk Stage-3 (1 to 3years) 800gm', 'Nan Optipro Formula Milk Stage-3 (1 to 3years) 800gm', 'Nan Optipro Formula Milk Stage-3 (1 to 3years) 800gm', 1000, '1719199666.jpg', '2024/06', 53, 0, 0, 0, NULL, 0, 0, 0, NULL, 3350, 0, NULL, NULL, '2024-06-24 03:27:46', '2024-06-24 03:27:46'),
(33, 1, 'Nan Optipro Formula Milk Stage-3 (1 to 3years) 400gm', 'nan-optipro-formula-milk-stage-3-1-to-3years-400gm', 'Simple', 0, 0, 0, '<p>Nan Optipro Formula Milk Stage-3 (1 to 3years)&nbsp;</p>', '<ul>\r\n	<li><strong>Weight: 400 gm</strong></li>\r\n	<li><strong>Made In Switzerland</strong></li>\r\n	<li><strong>Imported From UAE</strong></li>\r\n</ul>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Nan Optipro Formula Milk Stage-3 (1 to 3years)', 'Nan Optipro Formula Milk Stage-3 (1 to 3years)', 'Nan Optipro Formula Milk Stage-3 (1 to 3years)', 1000, '1719199721.jpg', '2024/06', 54, 0, 0, 0, NULL, 0, 0, 0, NULL, 2050, 0, NULL, NULL, '2024-06-24 03:28:41', '2024-06-24 03:28:41'),
(34, 1, 'Similac Total Comfort Optigro Infant Formula Milk Based Powder with Iron (0-12months) 357gm', 'similac-total-comfort-optigro-infant-formula-milk-based-powder-with-iron-0-12months-357gm', 'Simple', 0, 0, 0, '<p>Similac Total Comfort Optigro Infant Formula Milk Based Powder with Iron (0-12months) 357gm</p>', '<p><strong>Weight : 357G</strong></p>\r\n\r\n<p><strong>Origin : USA</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Similac Total Comfort Optigro Infant Formula Milk Based Powder with Iron (0-12months) 357gm', 'Similac Total Comfort Optigro Infant Formula Milk Based Powder with Iron (0-12months) 357gm', 'Similac Total Comfort Optigro Infant Formula Milk Based Powder with Iron (0-12months) 357gm', 1000, '1719200439.jpg', '2024/06', 55, 0, 0, 0, NULL, 0, 0, 0, NULL, 3200, 0, NULL, NULL, '2024-06-24 03:40:40', '2024-06-24 03:40:40'),
(35, 1, 'Similac Advance Formula with Iron Milk (0-12months) 352G', 'similac-advance-formula-with-iron-milk-0-12months-352g', 'Simple', 0, 0, 0, '<p>Similac Advance Formula with Iron Milk (0-12months) 352G</p>', '<h2><em><strong>Product details</strong></em></h2>\r\n\r\n<p>Similac Advance* is a nutritionally complete, milk-based, iron-fortified infant formula for baby&rsquo;s first year. It has our exclusive blend of ingredients to support baby&rsquo;s brain and eye development. Our no palm olein oil blend supports excellent calcium absorption. Similac was the first leading infant formula brand with no artificial growth hormones&dagger; and is the #1 infant formula brand fed in hospitals. * Not for infants or children with galactosemia. &dagger; No significant difference has been shown between milk derived from rbST-treated and non-rbST-treated cows</p>\r\n\r\n<ul>\r\n	<li>EASY TO DIGEST: Similac&reg; infant formulas are nutritionally complete and inspired by breast milk</li>\r\n	<li>SUPPORTS BRAIN &amp; EYE DEVELOPMENT: Features our exclusive blend of DHA, lutein, and vitamin E, ingredients found in breast milk that are important for helping support baby&rsquo;s brain and eye development</li>\r\n	<li>NO PALM OLEIN OIL: Designed to support excellent calcium absorption</li>\r\n	<li>NO ARTIFICIAL GROWTH HORMONES&dagger; : Similac was the first leading infant formula brand with no artificial growth hormones. It&rsquo;s also kosher and halal</li>\r\n	<li>PREFERRED BRAND: Similac is the #1 infant formula brand fed in hospitals</li>\r\n</ul>\r\n\r\n<h2>Specifications</h2>\r\n\r\n<p>Age Group<br />\r\nInfant</p>\r\n\r\n<h3>Container Type<br />\r\nCan</h3>\r\n\r\n<h3>Features<br />\r\nYes</h3>\r\n\r\n<h3>Brand<br />\r\nSimilac</h3>\r\n\r\n<h3>Food Allergen Statements<br />\r\nMilk</h3>\r\n\r\n<h3>Food Form<br />\r\nPowders</h3>\r\n\r\n<h3>Baby Formula Stage<br />\r\nNewborn, Baby</h3>\r\n\r\n<h3>Flavor<br />\r\nUnflavored</h3>\r\n\r\n<h3>Assembled Product Weight<br />\r\n0.96 lbs<br />\r\n&nbsp;</h3>\r\n\r\n<h3>Lifestage<br />\r\nBirth to 12 Months, Infant</h3>\r\n\r\n<h3>Nutrient Content Claims<br />\r\nOptiGro, Vitamin E, Lutein, DHA</h3>\r\n\r\n<h3>Manufacturer<br />\r\nAbbott Laboratories</h3>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Similac Advance Formula with Iron Milk (0-12months) 352G', 'Similac Advance Formula with Iron Milk (0-12months) 352G', 'Similac Advance Formula with Iron Milk (0-12months) 352G', 1000, '1719200568.jpg', '2024/06', 56, 0, 0, 0, NULL, 0, 0, 0, NULL, 4200, 0, NULL, NULL, '2024-06-24 03:42:48', '2024-06-24 03:42:48'),
(36, 1, 'Similac Soy Isomil Optigro Milk-Based Powder Infant Formula with Iron (0-12months) 352g', 'similac-soy-isomil-optigro-milk-based-powder-infant-formula-with-iron-0-12months-352g', 'Simple', 0, 0, 0, '<p>Similac Soy Isomil Optigro Milk-Based Powder Infant Formula with Iron (0-12months) 352g</p>', '<p><strong>Weight : 352G</strong></p>\r\n\r\n<p><strong>Origin : USA</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Similac Soy Isomil Optigro Milk-Based Powder Infant Formula with Iron (0-12months) 352g', 'Similac Soy Isomil Optigro Milk-Based Powder Infant Formula with Iron (0-12months) 352g', 'Similac Soy Isomil Optigro Milk-Based Powder Infant Formula with Iron (0-12months) 352g', 1000, '1719200626.jpg', '2024/06', 57, 0, 0, 0, NULL, 0, 0, 0, NULL, 3800, 0, NULL, NULL, '2024-06-24 03:43:46', '2024-06-24 03:43:47'),
(37, 1, 'Similac Sensitive Optigro Infant Formula Milk (0-12months) 354gm', 'similac-sensitive-optigro-infant-formula-milk-0-12months-354gm', 'Simple', 0, 0, 0, '<p>Similac Sensitive Optigro Infant Formula Milk (0-12months) 354gm</p>', '<p><strong>Weight : 354gm<br />\r\nOrigin : USA<br />\r\nInside Dhaka Delivery Charge- 80TK<br />\r\nOut of Dhaka City Courier Charge- 180TK</strong></p>', NULL, 'Similac Sensitive Optigro Infant Formula Milk (0-12months) 354gm', 'Similac Sensitive Optigro Infant Formula Milk (0-12months) 354gm', 'Similac Sensitive Optigro Infant Formula Milk (0-12months) 354gm', 1000, '1719200807.jpg', '2024/06', 58, 0, 0, 0, NULL, 0, 0, 0, NULL, 2800, 0, NULL, NULL, '2024-06-24 03:46:47', '2024-06-24 03:46:47'),
(38, 1, 'Similac Alimentum Milk-Based Powder Infant Formula with Iron (0-12months) 343gm', 'similac-alimentum-milk-based-powder-infant-formula-with-iron-0-12months-343gm', 'Simple', 0, 0, 0, '<p>Similac Alimentum Milk-Based Powder Infant Formula with Iron (0-12months) 343gm</p>', '<p><strong>Weight : 343G</strong></p>\r\n\r\n<p><strong>Origin : USA</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Similac Alimentum Milk-Based Powder Infant Formula with Iron (0-12months) 343gm', 'Similac Alimentum Milk-Based Powder Infant Formula with Iron (0-12months) 343gm', 'Similac Alimentum Milk-Based Powder Infant Formula with Iron (0-12months) 343gm', 1000, '1719200905.jpg', '2024/06', 59, 0, 0, 0, NULL, 0, 0, 0, NULL, 4700, 0, NULL, NULL, '2024-06-24 03:48:25', '2024-06-24 03:48:25'),
(39, 1, 'Enfagrow Premium Toddler Nutritional Drink Formula Milk Powder (1+years) 1.04gm', 'enfagrow-premium-toddler-nutritional-drink-formula-milk-powder-1-years-1-04gm', 'Simple', 0, 0, 0, '<p>Enfagrow Premium Toddler Nutritional Drink Formula Milk Powder (1+years) 1.04gm</p>', '<p><strong>Weight : 1.04G</strong></p>\r\n\r\n<p><strong>Origin : USA</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180&nbsp;Taka</strong></p>', NULL, 'Enfagrow Premium Toddler Nutritional Drink Formula Milk Powder (1+years) 1.04gm', 'Enfagrow Premium Toddler Nutritional Drink Formula Milk Powder (1+years) 1.04gm', 'Enfagrow Premium Toddler Nutritional Drink Formula Milk Powder (1+years) 1.04gm', 1000, '1719201352.jpg', '2024/06', 60, 0, 0, 0, NULL, 0, 0, 0, NULL, 8600, 0, NULL, NULL, '2024-06-24 03:55:52', '2024-06-24 03:55:52');
INSERT INTO `products` (`id`, `status`, `title`, `slug`, `type`, `featured`, `clearance_sale`, `spacial_offer`, `short_description`, `description`, `brand_id`, `meta_title`, `meta_description`, `meta_tags`, `position`, `image`, `image_path`, `media_id`, `stock`, `stock_alert_quantity`, `stock_pre_alert_quantity`, `custom_label`, `view`, `average_rating`, `total_review`, `expire_date`, `sale_price`, `regular_price`, `attribute_items_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(40, 1, 'Enfagrow Premium Toddler Gentlease Nutritional Drink Formula Milk Powder (1+years) 825G', 'enfagrow-premium-toddler-gentlease-nutritional-drink-formula-milk-powder-1-years-825g', 'Simple', 0, 0, 0, '<p>Enfagrow Premium Toddler Gentlease Nutritional Drink Formula Milk Powder (1+years) 825G</p>', '<p><strong>Weight : 825G</strong></p>\r\n\r\n<p><strong>Origin : USA</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Enfagrow Premium Toddler Gentlease Nutritional Drink Formula Milk Powder (1+years) 825G', 'Enfagrow Premium Toddler Gentlease Nutritional Drink Formula Milk Powder (1+years) 825G', 'Enfagrow Premium Toddler Gentlease Nutritional Drink Formula Milk Powder (1+years) 825G', 1000, '1719201421.jpg', '2024/06', 61, 0, 0, 0, NULL, 0, 0, 0, NULL, 8000, 0, NULL, NULL, '2024-06-24 03:57:02', '2024-06-24 03:57:02'),
(41, 1, 'Enfamil Neuro Pro Infant Formula Milk-Based Powder with Iron (0-12 Months) 802G', 'enfamil-neuro-pro-infant-formula-milk-based-powder-with-iron-0-12-months-802g', 'Simple', 0, 0, 0, '<p>Enfamil Neuro Pro Infant Formula Milk-Based Powder with Iron (0-12 Months) 802G</p>', '<p><em><strong>Weight : 802G</strong></em></p>\r\n\r\n<p><em><strong>Origin : USA</strong></em></p>\r\n\r\n<p><em><strong>Delivery Charge Inside Dhaka 80 Taka</strong></em></p>\r\n\r\n<p><em><strong>Outside Dhaka 180 Taka</strong></em></p>', NULL, 'Enfamil Neuro Pro Infant Formula Milk-Based Powder with Iron (0-12 Months) 802G', 'Enfamil Neuro Pro Infant Formula Milk-Based Powder with Iron (0-12 Months) 802G', 'Enfamil Neuro Pro Infant Formula Milk-Based Powder with Iron (0-12 Months) 802G', 1000, '1719201634.jpg', '2024/06', 62, 0, 0, 0, NULL, 0, 0, 0, NULL, 8900, 0, NULL, NULL, '2024-06-24 04:00:34', '2024-06-24 04:00:34'),
(42, 1, 'Enfamil Reguline Infant Formula Milk Based Powder with Iron (0-12months) 553G', 'enfamil-reguline-infant-formula-milk-based-powder-with-iron-0-12months-553g', 'Simple', 0, 0, 0, '<p>Enfamil Reguline Infant Formula Milk Based Powder with Iron (0-12months) 553G</p>', '<p><strong>Weight : 553gm</strong></p>\r\n\r\n<p><strong>Origin : USA</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Enfamil Reguline Infant Formula Milk Based Powder with Iron (0-12months) 553G', 'Enfamil Reguline Infant Formula Milk Based Powder with Iron (0-12months) 553G', 'Enfamil Reguline Infant Formula Milk Based Powder with Iron (0-12months) 553G', 1000, '1719201709.jpg', '2024/06', 63, 0, 0, 0, NULL, 0, 0, 0, NULL, 4500, 0, NULL, NULL, '2024-06-24 04:01:49', '2024-06-24 04:01:49'),
(43, 1, 'Enfamil Infant Formula Milk Based Powder with Iron (0-12months) 354gm', 'enfamil-infant-formula-milk-based-powder-with-iron-0-12months-354gm', 'Simple', 0, 0, 0, '<p>Enfamil Infant Formula Milk Based Powder with Iron (0-12months) 354gm</p>', '<p><strong>Weight : 354gm</strong></p>\r\n\r\n<p><strong>Origin : USA</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Enfamil Infant Formula Milk Based Powder with Iron (0-12months) 354gm', 'Enfamil Infant Formula Milk Based Powder with Iron (0-12months) 354gm', 'Enfamil Infant Formula Milk Based Powder with Iron (0-12months) 354gm', 1000, '1719201800.jpg', '2024/06', 64, 0, 0, 0, NULL, 0, 0, 0, NULL, 3500, 0, NULL, NULL, '2024-06-24 04:03:20', '2024-06-24 04:03:20'),
(44, 1, 'Enfamil Gentlease Infant Formula Milk with Iron (0-12months) 352gm', 'enfamil-gentlease-infant-formula-milk-with-iron-0-12months-352gm', 'Simple', 0, 0, 0, '<p>Enfamil Gentlease Infant Formula Milk with Iron (0-12months) 352gm</p>', '<p><strong>Weight : 352gm</strong></p>\r\n\r\n<p><strong>Origin : USA</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Enfamil Gentlease Infant Formula Milk with Iron (0-12months) 352gm', 'Enfamil Gentlease Infant Formula Milk with Iron (0-12months) 352gm', 'Enfamil Gentlease Infant Formula Milk with Iron (0-12months) 352gm', 1000, '1719201863.jpg', '2024/06', 65, 0, 0, 0, NULL, 0, 0, 0, NULL, 4200, 0, NULL, NULL, '2024-06-24 04:04:24', '2024-06-24 04:04:24'),
(45, 1, 'Enfamil Neuro Pro Gentlease Infant Formula Milk Powder (0-12months) 567G', 'enfamil-neuro-pro-gentlease-infant-formula-milk-powder-0-12months-567g', 'Simple', 0, 0, 0, '<p>Enfamil Neuro Pro Gentlease Infant Formula Milk Powder (0-12months) 567G</p>', '<p><strong>Weight : 567G<br />\r\nOrigin : USA<br />\r\nDelivery Charge:<br />\r\nInside Dhaka City 80 Tk<br />\r\nOut Of Dhaka City 180 Tk (for 1pc)</strong></p>', NULL, 'Enfamil Neuro Pro Gentlease Infant Formula Milk Powder (0-12months) 567G', 'Enfamil Neuro Pro Gentlease Infant Formula Milk Powder (0-12months) 567G', 'Enfamil Neuro Pro Gentlease Infant Formula Milk Powder (0-12months) 567G', 1000, '1719201978.jpg', '2024/06', 66, 0, 0, 0, NULL, 0, 0, 0, NULL, 6100, 0, NULL, NULL, '2024-06-24 04:06:18', '2024-06-24 04:06:18'),
(46, 1, 'Enfamil Neuro Pro Infant Formula Milk Powder (0-12months) 587G', 'enfamil-neuro-pro-infant-formula-milk-powder-0-12months-587g', 'Simple', 0, 0, 0, '<p>Enfamil Neuro Pro Infant Formula Milk Powder (0-12months) 587G</p>', '<p><strong>Weight : 587G<br />\r\nOrigin : USA<br />\r\nDelivery Charge:<br />\r\nInside Dhaka City 80 Tk<br />\r\nOut Of Dhaka City 180 Tk (for 1pc)</strong></p>', NULL, 'Enfamil Neuro Pro Infant Formula Milk Powder (0-12months) 587G', 'Enfamil Neuro Pro Infant Formula Milk Powder (0-12months) 587G', 'Enfamil Neuro Pro Infant Formula Milk Powder (0-12months) 587G', 1000, '1719202101.jpg', '2024/06', 67, 0, 0, 0, NULL, 0, 0, 0, NULL, 6000, 0, NULL, NULL, '2024-06-24 04:08:21', '2024-06-24 04:08:21'),
(47, 1, 'Cowhead Full Cream Milk Powder (Pack) 500G', 'cowhead-full-cream-milk-powder-pack-500g', 'Simple', 0, 0, 0, '<p>Cowhead Full Cream Milk Powder (Pack) 500G</p>', '<p><strong>Weight : 900 gm</strong></p>\r\n\r\n<p><strong>Origin : New Zeland</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Cowhead Full Cream Milk Powder (Pack) 500G', 'Cowhead Full Cream Milk Powder (Pack) 500G', 'Cowhead Full Cream Milk Powder (Pack) 500G', 1000, '1719203930.jpg', '2024/06', 68, 0, 0, 0, NULL, 0, 0, 0, NULL, 1100, 0, NULL, NULL, '2024-06-24 04:38:51', '2024-06-24 04:38:51'),
(48, 1, 'Cowhead Full Cream Milk Powder 900gm', 'cowhead-full-cream-milk-powder-900gm', 'Simple', 0, 0, 0, '<p>Cowhead Full Cream Milk Powder 900gm</p>', '<p><strong>Weight : 900 gm</strong></p>\r\n\r\n<p><strong>Origin : New Zeland</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Cowhead Full Cream Milk Powder 900gm', 'Cowhead Full Cream Milk Powder 900gm', 'Cowhead Full Cream Milk Powder 900gm', 1000, '1719204065.jpg', '2024/06', 69, 0, 0, 0, NULL, 0, 0, 0, NULL, 1950, 0, NULL, NULL, '2024-06-24 04:41:05', '2024-06-24 04:41:05'),
(49, 1, 'Cowhead Full Cream Milk Powder 1800gm', 'cowhead-full-cream-milk-powder-1800gm', 'Simple', 0, 0, 0, '<p>Cowhead Full Cream Milk Powder 1800gm</p>', '<p><strong>Weight : 1800gm</strong></p>\r\n\r\n<p><strong>Origin : New Zeland</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Cowhead Full Cream Milk Powder 1800gm', 'Cowhead Full Cream Milk Powder 1800gm', 'Cowhead Full Cream Milk Powder 1800gm', 1000, '1719204353.jpg', '2024/06', 70, 0, 0, 0, NULL, 0, 0, 0, NULL, 3450, 0, NULL, NULL, '2024-06-24 04:45:54', '2024-06-24 04:45:54'),
(50, 1, 'Cowhead Full Cream Milk Powder 2500gm', 'cowhead-full-cream-milk-powder-2500gm', 'Simple', 0, 0, 0, '<p>Cowhead Full Cream Milk Powder 2500gm</p>', '<p><strong>Weight : 2500gm</strong></p>\r\n\r\n<p><strong>Origin : New Zeland</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 200 Taka</strong></p>', NULL, 'Cowhead Full Cream Milk Powder 2500gm', 'Cowhead Full Cream Milk Powder 2500gm', 'Cowhead Full Cream Milk Powder 2500gm', 1000, '1719205359.jpg', '2024/06', 71, 0, 0, 0, NULL, 0, 0, 0, NULL, 4600, 0, NULL, NULL, '2024-06-24 05:02:39', '2024-06-24 05:02:39'),
(51, 1, 'Cowhead Lactose Free Pure Liquid Milk 1litre', 'cowhead-lactose-free-pure-liquid-milk-1litre', 'Simple', 0, 0, 0, '<p>Cowhead Lactose Free Pure Liquid Milk 1litre</p>', '<p><strong>Origin : Australia</strong></p>\r\n\r\n<p><strong>Weight : 1litter</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka&nbsp;</strong></p>\r\n\r\n<p><strong>Outside Dhaka 150 Taka</strong></p>', NULL, 'Cowhead Lactose Free Pure Liquid Milk 1litre', 'Cowhead Lactose Free Pure Liquid Milk 1litre', 'Cowhead Lactose Free Pure Liquid Milk 1litre', 1000, '1719205723.jpg', '2024/06', 72, 0, 0, 0, NULL, 0, 0, 0, NULL, 470, 0, NULL, NULL, '2024-06-24 05:08:43', '2024-06-24 05:08:43'),
(52, 1, 'Cowhead Pure Liquid Milk 1litre', 'cowhead-pure-liquid-milk-1litre', 'Simple', 0, 0, 0, '<p>Cowhead Pure Liquid Milk 1litre</p>', '<p>Origin : Australia</p>\r\n\r\n<p>Weight : 1litter</p>\r\n\r\n<p>Delivery Charge Inside Dhaka 80 Taka&nbsp;</p>\r\n\r\n<p>Outside Dhaka 150 Taka</p>', NULL, 'Cowhead Pure Liquid Milk 1litre', 'Cowhead Pure Liquid Milk 1litre', 'Cowhead Pure Liquid Milk 1litre', 1000, '1719205796.jpg', '2024/06', 73, 0, 0, 0, NULL, 0, 0, 0, NULL, 420, 0, NULL, NULL, '2024-06-24 05:09:56', '2024-06-24 05:09:56'),
(53, 1, 'Cowhead Slim Fat Free Pure Liquid Milk 1litre', 'cowhead-slim-fat-free-pure-liquid-milk-1litre', 'Simple', 0, 0, 0, '<p>Cowhead Slim Fat Free Pure Liquid Milk 1litre</p>', '<p>Origin : Australia</p>\r\n\r\n<p>Weight : 1litter</p>\r\n\r\n<p>Delivery Charge Inside Dhaka 80 Taka&nbsp;</p>\r\n\r\n<p>Outside Dhaka 150 Taka</p>', NULL, 'Cowhead Slim Fat Free Pure Liquid Milk 1litre', 'Cowhead Slim Fat Free Pure Liquid Milk 1litre', 'Cowhead Slim Fat Free Pure Liquid Milk 1litre', 1000, '1719205885.jpg', '2024/06', 74, 0, 0, 0, NULL, 0, 0, 0, NULL, 480, 0, NULL, NULL, '2024-06-24 05:11:26', '2024-06-24 05:11:26'),
(54, 1, 'Cowhead Lite Low Fat Pure Liquid Milk 1litre', 'cowhead-lite-low-fat-pure-liquid-milk-1litre', 'Simple', 0, 0, 0, '<p>Cowhead Lite Low Fat Pure Liquid Milk 1litre</p>', '<p>Origin : Australia</p>\r\n\r\n<p>Weight : 1litter</p>\r\n\r\n<p>Delivery Charge Inside Dhaka 80 Taka&nbsp;</p>\r\n\r\n<p>Outside Dhaka 150 Taka</p>', NULL, 'Cowhead Lite Low Fat Pure Liquid Milk 1litre', 'Cowhead Lite Low Fat Pure Liquid Milk 1litre', 'Cowhead Lite Low Fat Pure Liquid Milk 1litre', 1000, '1719205974.jpg', '2024/06', 75, 0, 0, 0, NULL, 0, 0, 0, NULL, 420, 0, NULL, NULL, '2024-06-24 05:12:54', '2024-06-24 05:12:54'),
(55, 1, 'Almarai Full Cream Milk Powder 400gm', 'almarai-full-cream-milk-powder-400gm', 'Simple', 0, 0, 0, '<p>Almarai Full Cream Milk Powder 400gm</p>', '<p><strong>Weight : 400G</strong></p>\r\n\r\n<p><strong>Origin : Saudi Arabia</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Almarai Full Cream Milk Powder 400gm', 'Almarai Full Cream Milk Powder 400gm', 'Almarai Full Cream Milk Powder 400gm', 1000, '1719210249.jpg', '2024/06', 76, 0, 0, 0, NULL, 0, 0, 0, NULL, 950, 0, NULL, NULL, '2024-06-24 06:24:09', '2024-06-24 06:24:09'),
(56, 1, 'Almarai Full Cream Milk Powder 900gm', 'almarai-full-cream-milk-powder-900gm', 'Simple', 0, 0, 0, '<p>Almarai Full Cream Milk Powder 900G</p>', '<ul>\r\n	<li><strong>Weight : 900G</strong></li>\r\n	<li><strong>Origin : Kingdom Of Saudi Arabia</strong></li>\r\n	<li><strong>Delivery Charge Inside Dhaka 80 Taka</strong></li>\r\n	<li><strong>Outside Dhaka 180 Taka</strong></li>\r\n</ul>', NULL, 'Almarai Full Cream Milk Powder 900G', 'Almarai Full Cream Milk Powder 900G', 'Almarai Full Cream Milk Powder 900G', 1000, '1719210299.jpg', '2024/06', 77, 0, 0, 0, NULL, 0, 0, 0, NULL, 2100, 0, NULL, NULL, '2024-06-24 06:24:59', '2024-06-24 06:26:44'),
(57, 1, 'Almarai Full Cream Milk Powder 2500gm', 'almarai-full-cream-milk-powder-2500gm', 'Simple', 0, 0, 0, '<p>Almarai Full Cream Milk Powder 2500gm</p>', '<p><strong>Weight : 2500gm</strong></p>\r\n\r\n<p><strong>Origin : Saudi Arabia</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka&nbsp;</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Almarai Full Cream Milk Powder 2500gm', 'Almarai Full Cream Milk Powder 2500gm', 'Almarai Full Cream Milk Powder 2500gm', 1000, '1719210345.jpg', '2024/06', 78, 0, 0, 0, NULL, 0, 0, 0, NULL, 4450, 0, NULL, NULL, '2024-06-24 06:25:45', '2024-06-24 06:25:45'),
(58, 1, 'Almarai Full Cream Milk Powder 2250gm', 'almarai-full-cream-milk-powder-2250gm', 'Simple', 0, 0, 0, '<p>Almarai Full Cream Milk Powder 2250gm</p>', '<p><strong>Weight : 2.25 kg</strong></p>\r\n\r\n<p><strong>Origin : Saudi Arabia</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka&nbsp;</strong></p>\r\n\r\n<p><strong>Outside Dhaka 180 Taka</strong></p>', NULL, 'Almarai Full Cream Milk Powder 2250gm', 'Almarai Full Cream Milk Powder 2250gm', 'Almarai Full Cream Milk Powder 2250gm', 1000, '1719210391.jpg', '2024/06', 79, 0, 0, 0, NULL, 0, 0, 0, NULL, 3350, 0, NULL, NULL, '2024-06-24 06:26:31', '2024-06-24 06:26:31'),
(59, 1, 'Nestle Lactogen Stage-1 (0 to 12 Months) 1800gm', 'nestle-lactogen-stage-1-0-to-12-months-1800gm', 'Simple', 0, 0, 0, '<p>Nestle Lactogen Stage-1 (0 to 12 Months) 1800gm</p>', '<p><strong>Weight : 1800G<br />\r\nOrigin : Malaysia<br />\r\nDelivery Charge:<br />\r\nInside Dhaka City 80 Tk<br />\r\nOut Of Dhaka City 180 Tk (for 1pc)</strong></p>', NULL, 'Nestle Lactogen Stage-1 (0 to 12 Months) 1800gm', 'Nestle Lactogen Stage-1 (0 to 12 Months) 1800gm', 'Nestle Lactogen Stage-1 (0 to 12 Months) 1800gm', 1000, '1719210821.jpg', '2024/06', 80, 0, 0, 0, NULL, 0, 0, 0, NULL, 3600, 0, NULL, NULL, '2024-06-24 06:33:41', '2024-06-24 06:33:41'),
(60, 1, 'Nestle Lactogen Stage-2 (6 to 36 Months) 1800gm', 'nestle-lactogen-stage-2-6-to-36-months-1800gm', 'Simple', 0, 0, 0, '<p>Nestle Lactogen Stage-2 (6 to 36 Months) 1800gm</p>', '<p>Weight : 1800G<br />\r\nOrigin : Malaysia<br />\r\nDelivery Charge:<br />\r\nInside Dhaka City 80 Tk<br />\r\nOut Of Dhaka City 180 Tk (for 1pc)</p>', NULL, 'Nestle Lactogen Stage-2 (6 to 36 Months) 1800gm', 'Nestle Lactogen Stage-2 (6 to 36 Months) 1800gm', 'Nestle Lactogen Stage-2 (6 to 36 Months) 1800gm', 1000, '1719210927.jpg', '2024/06', 81, 0, 0, 0, NULL, 0, 0, 0, NULL, 3750, 0, NULL, NULL, '2024-06-24 06:35:27', '2024-06-24 06:35:27'),
(61, 1, 'Nestle Lactogrow Stage-3 (1 to 3 Years) 1800gm', 'nestle-lactogrow-stage-3-1-to-3-years-1800gm', 'Simple', 0, 0, 0, '<p>Nestle Lactogrow Stage-3 (1 to 3 Years) 1800gm</p>', '<p><strong>Weight : 1800G<br />\r\nOrigin : Malaysia<br />\r\nDelivery Charge:<br />\r\nInside Dhaka City 80 Tk<br />\r\nOut Of Dhaka City 180 Tk (for 1pc)</strong></p>', NULL, 'Nestle Lactogrow Stage-3 (1 to 3 Years) 1800gm', 'Nestle Lactogrow Stage-3 (1 to 3 Years) 1800gm', 'Nestle Lactogrow Stage-3 (1 to 3 Years) 1800gm', 1000, '1719211107.jpg', '2024/06', 82, 0, 0, 0, NULL, 0, 0, 0, NULL, 3300, 0, NULL, NULL, '2024-06-24 06:38:27', '2024-07-07 15:37:12'),
(62, 1, 'Arla Dano Full Cream Milk Powder 2500gm', 'arla-dano-full-cream-milk-powder-2500gm', 'Simple', 0, 0, 0, '<p>Arla Dano Full Cream Milk Powder 2500gm</p>', '<p>Origin: Denmark</p>\r\n\r\n<p>Weight: 2500 gm</p>\r\n\r\n<p>Inside Dhaka Delivery Charge- 80 TK</p>\r\n\r\n<p>Out of Dhaka City Courier Charge- 200 TK</p>', NULL, 'Arla Dano Full Cream Milk Powder 2500gm', 'Arla Dano Full Cream Milk Powder 2500gm', 'Arla Dano Full Cream Milk Powder 2500gm', 1000, '1719211359.jpg', '2024/06', 83, 0, 0, 0, NULL, 0, 0, 0, NULL, 4350, 0, NULL, NULL, '2024-06-24 06:42:39', '2024-06-24 06:42:39'),
(63, 0, 'Heinz Veggie Pasta with Cheese Porridge (From 7+Months) 200G', 'heinz-veggie-pasta-with-cheese-porridge-from-7-months-200g', 'Simple', 0, 0, 0, '<p>Heinz Veggie Pasta with Cheese Porridge (7+Months) 200G</p>', '<p><strong>With Added Iron</strong></p>\r\n\r\n<p><strong>From 7+ Months Baby</strong></p>\r\n\r\n<p><strong>Weight : 200G</strong></p>\r\n\r\n<p><strong>Origin : UK</strong></p>\r\n\r\n<p><strong>Delivery Chgarge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130 Taka</strong></p>', NULL, 'Heinz Veggie Pasta with Cheese Porridge (From 7+Months) 200G', 'Heinz Veggie Pasta with Cheese Porridge (From 7+Months) 200G', 'Heinz Veggie Pasta with Cheese Porridge (From 7+Months) 200G', 1000, '1720003742.jpg', '2024/07', 110, -1, 0, 0, NULL, 0, 0, 0, NULL, 790, 0, NULL, NULL, '2024-06-24 10:53:02', '2024-07-03 10:49:02'),
(64, 1, 'Nestle Cerelac Wheat, Banana & Prune 250gm', 'nestle-cerelac-wheat-banana-prune-250gm', 'Simple', 0, 0, 0, '<p><strong>Nestle Cerelac Wheat, Banana &amp; Prune</strong></p>', '<p><strong>Weight : 250G</strong></p>\r\n\r\n<p><strong>Origin : Switzerland</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130 Taka</strong></p>', NULL, 'Nestle Cerelac Wheat, Banana & Prune 250gm', 'Nestle Cerelac Wheat, Banana & Prune 250gm', 'Nestle Cerelac Wheat, Banana & Prune 250gm', 1000, '1719820334.jpg', '2024/07', 85, 0, 0, 0, NULL, 0, 0, 0, NULL, 700, 0, NULL, NULL, '2024-07-01 07:52:14', '2024-07-01 07:52:14'),
(65, 1, 'Nestle Cerelac Rice & Mixed Vegetables 250gm', 'nestle-cerelac-rice-mixed-vegetables-250gm', 'Simple', 0, 0, 0, '<p>Nestle Cerelac Rice &amp; Mixed Vegetables</p>', '<p><strong>Re commanded age- from 6 to 24 months</strong></p>\r\n\r\n<p><strong>Weight : 250&nbsp;gm</strong></p>\r\n\r\n<p><strong>Origin : Malaysia</strong></p>\r\n\r\n<p><strong>Inside Dhaka Delivery Charge- 80TK</strong></p>\r\n\r\n<p><strong>Out of Dhaka City Courier Charge- 130TK</strong></p>', NULL, 'Nestle Cerelac Rice & Mixed Vegetables 250gm', 'Nestle Cerelac Rice & Mixed Vegetables 250gm', 'Nestle Cerelac Rice & Mixed Vegetables 250gm', 1000, '1719820567.jpg', '2024/07', 86, 0, 0, 0, NULL, 0, 0, 0, NULL, 650, 0, NULL, NULL, '2024-07-01 07:56:08', '2024-07-01 07:56:08'),
(66, 1, 'Nestle Cerelac Multigrain & Garden Vegetables 250gm', 'nestle-cerelac-multigrain-garden-vegetables-250gm', 'Simple', 0, 0, 0, '<p>Nestle Cerelac Multigrain &amp; Garden Vegetables</p>', '<p><strong>Re commanded age- from 12 to 36 months</strong></p>\r\n\r\n<p><strong>Weight : 250 gm</strong></p>\r\n\r\n<p><strong>Origin : Malaysia&nbsp;</strong></p>\r\n\r\n<p><strong>Inside Dhaka Delivery Charge- 80TK</strong></p>\r\n\r\n<p><strong>Out of Dhaka City Courier Charge- 130TK</strong></p>', NULL, 'Nestle Cerelac Multigrain & Garden Vegetables 250gm', 'Nestle Cerelac Multigrain & Garden Vegetables 250gm', 'Nestle Cerelac Multigrain & Garden Vegetables 250gm', 1000, '1719820676.jpg', '2024/07', 87, 0, 0, 0, NULL, 0, 0, 0, NULL, 650, 0, NULL, NULL, '2024-07-01 07:57:56', '2024-07-01 07:57:56'),
(67, 1, 'Nestle Cerelac Wheat, Honey & Dates 250gm', 'nestle-cerelac-wheat-honey-dates-250gm', 'Simple', 0, 0, 0, '<p>Nestle Cerelac Wheat, Honey &amp; Dates</p>', '<p><strong>Re commanded age- from 8 to 24 months</strong></p>\r\n\r\n<p><strong>Weight : 250 gm</strong></p>\r\n\r\n<p><strong>Origin : Malaysia</strong></p>\r\n\r\n<p><strong>Inside Dhaka Delivery Charge- 80TK</strong></p>\r\n\r\n<p><strong>Out of Dhaka City Courier Charge- 130TK</strong></p>', NULL, 'Nestle Cerelac Wheat, Honey & Dates 250gm', 'Nestle Cerelac Wheat, Honey & Dates 250gm', 'Nestle Cerelac Wheat, Honey & Dates 250gm', 1000, '1719820769.jpg', '2024/07', 88, 0, 0, 0, NULL, 0, 0, 0, NULL, 650, 0, NULL, NULL, '2024-07-01 07:59:30', '2024-07-01 07:59:30'),
(68, 1, 'Nestle Cerelac Wheat & Honey 225gm', 'nestle-cerelac-wheat-honey-225gm', 'Simple', 0, 0, 0, '<p>Nestle Cerelac Wheat &amp; Honey</p>', '<p><strong>Re commanded age- from 6 to 24 months</strong></p>\r\n\r\n<p><strong>Weight : 225 gm</strong></p>\r\n\r\n<p><strong>Origin : Malaysia</strong></p>\r\n\r\n<p><strong>Inside Dhaka Delivery Charge- 80TK</strong></p>\r\n\r\n<p><strong>Out of Dhaka City Courier Charge- 130TK</strong></p>', NULL, 'Nestle Cerelac Wheat & Honey 225gm', 'Nestle Cerelac Wheat & Honey 225gm', 'Nestle Cerelac Wheat & Honey 225gm', 1000, '1719821194.jpg', '2024/07', 89, 0, 0, 0, NULL, 0, 0, 0, NULL, 650, 0, NULL, NULL, '2024-07-01 08:06:34', '2024-07-01 08:06:34'),
(69, 1, 'Nestle Cerelac Rice & Chicken 250gm', 'nestle-cerelac-rice-chicken-250gm', 'Simple', 0, 0, 0, '<p>Nestle Cerelac Rice &amp; Chicken</p>', '<p><strong>Re commanded age- from 6&nbsp;to 24 months</strong></p>\r\n\r\n<p><strong>Weight : 250 gm</strong></p>\r\n\r\n<p><strong>Origin : Malaysia</strong></p>\r\n\r\n<p><strong>Inside Dhaka Delivery Charge- 80TK</strong></p>\r\n\r\n<p><strong>Out of Dhaka City Courier Charge- 130TK</strong></p>', NULL, 'Nestle Cerelac Rice & Chicken 250gm', 'Nestle Cerelac Rice & Chicken 250gm', 'Nestle Cerelac Rice & Chicken 250gm', 1000, '1719821365.jpg', '2024/07', 90, 0, 0, 0, NULL, 0, 0, 0, NULL, 650, 0, NULL, NULL, '2024-07-01 08:09:25', '2024-07-01 08:09:25'),
(70, 1, 'Nestle Cerelac Oat, Wheat & Prunes 250gm', 'nestle-cerelac-oat-wheat-prunes-250gm', 'Simple', 0, 0, 0, '<p>Nestle Cerelac Oat, Wheat &amp; Prunes</p>', '<p><strong>Re commanded age- from 8 to 24 months</strong></p>\r\n\r\n<p><strong>Weight : 250 gm</strong></p>\r\n\r\n<p><strong>Origin : Malaysia</strong></p>\r\n\r\n<p><strong>Inside Dhaka Delivery Charge- 80TK</strong></p>\r\n\r\n<p><strong>Out of Dhaka City Courier Charge- 130TK</strong></p>', NULL, 'Nestle Cerelac Oat, Wheat & Prunes 250gm', 'Nestle Cerelac Oat, Wheat & Prunes 250gm', 'Nestle Cerelac Oat, Wheat & Prunes 250gm', 1000, '1719821457.jpg', '2024/07', 91, 0, 0, 0, NULL, 0, 0, 0, NULL, 650, 0, NULL, NULL, '2024-07-01 08:10:58', '2024-07-01 08:10:58'),
(71, 1, 'Nestle Cerelac Rice 250gm', 'nestle-cerelac-rice-250gm', 'Simple', 0, 0, 0, '<p><strong><em>Nestle Cerelac Rice</em></strong></p>', '<p><strong>Re commanded age- from 6 to 24 months</strong></p>\r\n\r\n<p><strong>Weight : 200&nbsp;gm</strong></p>\r\n\r\n<p><strong>Origin : Malaysia</strong></p>\r\n\r\n<p><strong>Inside Dhaka Delivery Charge- 80TK</strong></p>\r\n\r\n<p><strong>Out of Dhaka City Courier Charge- 130TK</strong></p>', NULL, 'Nestle Cerelac Rice 250gm', 'Nestle Cerelac Rice 250gm', 'Nestle Cerelac Rice 250gm', 1000, '1719821556.jpg', '2024/07', 92, 0, 0, 0, NULL, 0, 0, 0, NULL, 650, 0, NULL, NULL, '2024-07-01 08:12:37', '2024-07-01 08:12:37'),
(72, 1, 'Nestle Cerelac Rice & Mixed Fruit 250gm', 'nestle-cerelac-rice-mixed-fruit-250gm', 'Simple', 0, 0, 0, '<p>Nestle Cerelac Rice &amp; Mixed Fruit</p>', '<p><strong>Can be given from 6 to 24&nbsp;months baby</strong></p>\r\n\r\n<p><strong>Weight : 250 gm</strong></p>\r\n\r\n<p><strong>Origin : Malaysia</strong></p>\r\n\r\n<p><strong>Inside Dhaka Delivery Charge- 80TK</strong></p>\r\n\r\n<p><strong>Out of Dhaka City Courier Charge- 130TK</strong></p>', NULL, 'Nestle Cerelac Rice & Mixed Fruit 250gm', 'Nestle Cerelac Rice & Mixed Fruit 250gm', 'Nestle Cerelac Rice & Mixed Fruit 250gm', 1000, '1719821717.jpg', '2024/07', 93, 0, 0, 0, NULL, 0, 0, 0, NULL, 650, 0, NULL, NULL, '2024-07-01 08:15:18', '2024-07-01 08:15:18'),
(73, 1, 'Nestle Cerelac Honey & wheat with Milk 1kg', 'nestle-cerelac-honey-wheat-with-milk-1kg', 'Simple', 0, 0, 0, '<p>Nestle Cerelac Honey &amp; wheat with Milk</p>', '<h1>&nbsp;</h1>\r\n\r\n<p>Just add water Nutrition for little tummies Suitable for vegetarians Halal Iron for cognitive development Iron contributes to normal cognitive development. Calcium and Vitamin D for bone development Calcium and vitamin D are needed for the normal growth and development of bone in children. Zinc, Iodine and Vitamins A &amp; C Goodness of cereals Infant cereal is the ideal foundation to a varied and balanced diet. Storage Close tin tightly &amp; store it in a cool, dry place. Use within 4 weeks of opening. Best Before End: See Base of Can. Safety Warning IMPORTANT INFORMATION Nestl&eacute; CERELAC is a complementary food intended for spoon feeding from 6 months. It is NOT to be used as a breast milk substitute. The Department of Health recommends exclusive breast feeding for the first 6 months. Unless otherwise advised by your health care professional, introduction of solid food should commence at around 6 months of age but not be delayed beyond 6 months, nor introduced before 4 months. For your baby&#39;s health, all preparation instructions should be followed exactly. Be mindful not to overfeed your baby; stop feeding when your baby shows signs of fullness e.g. turning their head away. Preparation And Usage Preparation Guide 1. Always wash your hands thoroughly before preparing a feed &amp; ensure all utensils are clean. 2. Boil fresh water. Allow to cool. 3. At the start of weaning use small quantities of Cerelac. The amount fed can vary according to your baby&#39;s appetite. Increase portions as needed to a full serving of 50g of Cerelac powder mixed with 150ml of pre-boiled lukewarm drinking water. 4. From 12 months use up to 2 servings of Cerelac per day. 5. Always test the temperature before serving it to baby/toddler. 6. Use immediately. 7. Throw away any unfinished portion.</p>\r\n\r\n<p>Inside Dhaka Delivery Charge- 80TK</p>\r\n\r\n<p>Out of Dhaka City Courier Charge- 180TK</p>', NULL, 'Nestle Cerelac Honey & wheat with Milk 1kg', 'Nestle Cerelac Honey & wheat with Milk 1kg', 'Nestle Cerelac Honey & wheat with Milk 1kg', 1000, '1719821929.jpg', '2024/07', 94, 0, 0, 0, NULL, 0, 0, 0, NULL, 1750, 0, NULL, NULL, '2024-07-01 08:18:49', '2024-07-01 08:18:49'),
(74, 1, 'Nestle Cerelac Honey & Wheat with Milk 400gm', 'nestle-cerelac-honey-wheat-with-milk-400gm', 'Simple', 0, 0, 0, '<p>Nestle Cerelac Honey &amp; Wheat with Milk</p>', '<h1>&nbsp;</h1>\r\n\r\n<p>Just add water Nutrition for little tummies Suitable for vegetarians Halal Iron for cognitive development Iron contributes to normal cognitive development. Calcium and Vitamin D for bone development Calcium and vitamin D are needed for the normal growth and development of bone in children. Zinc, Iodine and Vitamins A &amp; C Goodness of cereals Infant cereal is the ideal foundation to a varied and balanced diet. Storage Close tin tightly &amp; store it in a cool, dry place. Use within 4 weeks of opening. Best Before End: See Base of Can. Safety Warning IMPORTANT INFORMATION Nestl&eacute; CERELAC is a complementary food intended for spoon feeding from 6 months. It is NOT to be used as a breast milk substitute. The Department of Health recommends exclusive breast feeding for the first 6 months. Unless otherwise advised by your health care professional, introduction of solid food should commence at around 6 months of age but not be delayed beyond 6 months, nor introduced before 4 months. For your baby&#39;s health, all preparation instructions should be followed exactly. Be mindful not to overfeed your baby; stop feeding when your baby shows signs of fullness e.g. turning their head away. Preparation And Usage Preparation Guide 1. Always wash your hands thoroughly before preparing a feed &amp; ensure all utensils are clean. 2. Boil fresh water. Allow to cool. 3. At the start of weaning use small quantities of Cerelac. The amount fed can vary according to your baby&#39;s appetite. Increase portions as needed to a full serving of 50g of Cerelac powder mixed with 150ml of pre-boiled lukewarm drinking water. 4. From 12 months use up to 2 servings of Cerelac per day. 5. Always test the temperature before serving it to baby/toddler. 6. Use immediately. 7. Throw away any unfinished portion.</p>\r\n\r\n<p>Inside Dhaka Delivery Charge- 80TK</p>\r\n\r\n<p>Out of Dhaka City Courier Charge- 150TK</p>', NULL, 'Nestle Cerelac Honey & Wheat with Milk 400gm', 'Nestle Cerelac Honey & Wheat with Milk 400gm', 'Nestle Cerelac Honey & Wheat with Milk 400gm', 1000, '1719821993.jpg', '2024/07', 95, 0, 0, 0, NULL, 0, 0, 0, NULL, 850, 0, NULL, NULL, '2024-07-01 08:19:54', '2024-07-07 06:32:50'),
(75, 1, 'Aptamil Multigrain Cereal (From 7+ Months) 200gm', 'aptamil-multigrain-cereal-from-7-months-200gm', 'Simple', 0, 0, 0, '<p>Aptamil Multigrain Cereal 200gm</p>', '<h1>&nbsp;</h1>\r\n\r\n<ul>\r\n	<li>Multigrain cereals with milk, GOS/FOS and added vitamins &amp; minerals.</li>\r\n	<li>If you want to find out more about our recipes, please go to www.aptaclub.co.uk</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Our Unique Blend of Ingredients</li>\r\n	<li>With our blend of galacto- and fructo- oligosaccharides.</li>\r\n	<li>To support normal cognitive development.</li>\r\n	<li>Vitamin D for normal development of bones.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Our Unique Range of Cereals is Developed to Introduce Delicious Tastes and Varied Textures as Your Baby Progresses</li>\r\n	<li>Packaged in a protective atmosphere.</li>\r\n	<li>Contents may settle in transit.</li>\r\n	<li>Green Dot</li>\r\n</ul>\r\n\r\n<p>Nutricia Bringing Science to Early Life</p>\r\n\r\n<ul>\r\n	<li>Our unique blend</li>\r\n	<li>Just add water</li>\r\n	<li>Exploring textures</li>\r\n	<li>Delicious wholegrains</li>\r\n	<li>No added sugar or salt - contains naturally occurring sugars and salt only</li>\r\n	<li>No preservatives</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Pack size: 200G</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Vitamin D for normal development of bones</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>No added sugar or salt</li>\r\n</ul>\r\n\r\n<h2>Information</h2>\r\n\r\n<h3>Ingredients</h3>\r\n\r\n<p>Milled Cereals (40%) (Wholegrain&nbsp;<strong>Wheat</strong>&nbsp;(36%),&nbsp;<strong>Rye</strong>, Wholegrain&nbsp;<strong>Oat</strong>&nbsp;(1%), Wholegrain&nbsp;<strong>Spelt</strong>&nbsp;(1%), Wholegrain Millet (1%), Rice, Buckwheat), Skimmed&nbsp;<strong>Milk</strong>&nbsp;Powder, Vegetable Oils (Palm Oil, Rapeseed Oil, Coconut Oil, High Oleic Sunflower Oil, Emulsifier (<strong>Soy</strong>&nbsp;Lecithin)), Demineralised Whey Powder (from&nbsp;<strong>Milk</strong>), Corn Flakes (Maize, Emulsifier (Sunflower Lecithin)), Galacto-Oligosaccharides (GOS) (from&nbsp;<strong>Milk</strong>) (5%), Minerals (Calcium, Iron, Iodine), Fructo-Oligosaccharides (FOS) (0.4%), Vitamins (Vitamin C, Vitamin A, Vitamin D3, Thiamin)</p>\r\n\r\n<h3>Allergy Information</h3>\r\n\r\n<ul>\r\n	<li>Contains: Milk, Oats, Rye, Soya, Wheat</li>\r\n</ul>\r\n\r\n<h3>Storage</h3>\r\n\r\n<p>Please store this product in a cool dry place (not in the fridge) and once opened use within 28 days.</p>\r\n\r\n<h3>Preparation and Usage</h3>\r\n\r\n<ul>\r\n	<li>Preparing your baby&#39;s feed:</li>\r\n	<li>Using a clean bowl and feeding spoon...</li>\r\n	<li>Mix 1 spoonful of cereal with...</li>\r\n	<li>2 spoonfuls of warm, previously boiled water and stir.</li>\r\n	<li>If serving warm, check temperature before feeding.</li>\r\n	<li>As your baby&#39;s appetite grows, use a larger spoon to make a bigger serving.</li>\r\n	<li>This is only a guide, if you want to alter the consistency, add more or less water as required. Let your little one&#39;s appetite lead the way.</li>\r\n	<li>Carefully observe your baby; they will let you know when they have had enough.</li>\r\n</ul>\r\n\r\n<h3>Number of uses</h3>\r\n\r\n<p>Approximately eight 23g portions in this pack</p>\r\n\r\n<h3>Additives</h3>\r\n\r\n<ul>\r\n	<li>Free From Preservatives</li>\r\n</ul>\r\n\r\n<h3>Warnings</h3>\r\n\r\n<ul>\r\n	<li>Important</li>\r\n	<li>Do not leave your baby alone whilst feeding.</li>\r\n	<li>Remember to clean your baby&#39;s teeth, especially before bedtime.</li>\r\n</ul>\r\n\r\n<h3>Name and address</h3>\r\n\r\n<ul>\r\n	<li>Nutricia Ltd,</li>\r\n	<li>White Horse Business Park,</li>\r\n	<li>Trowbridge,</li>\r\n	<li>Wiltshire,</li>\r\n	<li>BA14 0XQ.</li>\r\n	<li>Nutricia Ireland,</li>\r\n</ul>\r\n\r\n<h3>Return to</h3>\r\n\r\n<ul>\r\n	<li>Quality Guarantee</li>\r\n	<li>This product should reach you in perfect condition. If it is not satisfactory, please contact us. This guarantee does not affect your statutory rights.</li>\r\n	<li>Call on our expertise</li>\r\n	<li>Nutricia Ltd,</li>\r\n	<li>White Horse Business Park,</li>\r\n	<li>Trowbridge,</li>\r\n	<li>Wiltshire,</li>\r\n	<li>BA14 0XQ.</li>\r\n	<li>UK 0800 996 1000 (24/7 service)</li>\r\n	<li>www.aptaclub.co.uk</li>\r\n	<li>Nutricia Ireland,</li>\r\n	<li>Block 1,</li>\r\n</ul>\r\n\r\n<h3>Lower age limit</h3>\r\n\r\n<p>7 Months</p>\r\n\r\n<h3>Net Contents</h3>\r\n\r\n<p>200g ℮</p>\r\n\r\n<h3>Nutrition</h3>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th>Typical Values</th>\r\n			<th>per 100g dry product</th>\r\n			<th>per portion1</th>\r\n			<th>Units</th>\r\n			<th>%LRV&dagger; per portion</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Energy</td>\r\n			<td>1719</td>\r\n			<td>397</td>\r\n			<td>kJ</td>\r\n		</tr>\r\n		<tr>\r\n			<td>-</td>\r\n			<td>409</td>\r\n			<td>94</td>\r\n			<td>kcal</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Fat</td>\r\n			<td>12</td>\r\n			<td>2.7</td>\r\n			<td>g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>saturates</td>\r\n			<td>4.7</td>\r\n			<td>1.1</td>\r\n			<td>g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Carbohydrate</td>\r\n			<td>56</td>\r\n			<td>13</td>\r\n			<td>g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>sugars*</td>\r\n			<td>23</td>\r\n			<td>5.2</td>\r\n			<td>g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Fibre</td>\r\n			<td>7.4</td>\r\n			<td>1.7</td>\r\n			<td>g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Protein</td>\r\n			<td>17</td>\r\n			<td>3.8</td>\r\n			<td>g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Salt*</td>\r\n			<td>0.28</td>\r\n			<td>0.07</td>\r\n			<td>g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamin A</td>\r\n			<td>421</td>\r\n			<td>97.0</td>\r\n			<td>&micro;g</td>\r\n			<td>24 %</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamin D3</td>\r\n			<td>6.5</td>\r\n			<td>1.5</td>\r\n			<td>&micro;g</td>\r\n			<td>15 %</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamin C</td>\r\n			<td>40</td>\r\n			<td>9.2</td>\r\n			<td>mg</td>\r\n			<td>37 %</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thiamin (B1)</td>\r\n			<td>1.2</td>\r\n			<td>0.27</td>\r\n			<td>mg</td>\r\n			<td>54 %</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Calcium</td>\r\n			<td>529</td>\r\n			<td>122</td>\r\n			<td>mg</td>\r\n			<td>31 %</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Iron</td>\r\n			<td>9.0</td>\r\n			<td>2.1</td>\r\n			<td>mg</td>\r\n			<td>35 %</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Iodine</td>\r\n			<td>98.0</td>\r\n			<td>23.0</td>\r\n			<td>&micro;g</td>\r\n			<td>33 %</td>\r\n		</tr>\r\n		<tr>\r\n			<td>of which</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamins</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Minerals</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>1 Based on a 23g serving of cereal made with 77ml of water as part of a varied, balanced diet</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>*No added sugar or salt. Contains naturally occurring sugars and salt only</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&dagger; LRV (Labelling Reference Value) is a guide to the amount of vitamins and minerals needed per day to meet the requirements of infants and young children</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Delivery Charge Inside Dhaka 80 Taka</p>\r\n\r\n<p>Outside Dhaka 130 Taka</p>', NULL, 'Aptamil Multigrain Cereal (From 7+ Months) 200gm', 'Aptamil Multigrain Cereal (From 7+ Months) 200gm', 'Aptamil Multigrain Cereal (From 7+ Months) 200gm', 1000, '1719909071.jpg', '2024/07', 98, 0, 0, 0, NULL, 0, 0, 0, NULL, 950, 0, NULL, NULL, '2024-07-02 08:31:11', '2024-07-02 08:31:11'),
(76, 1, 'Aptamil Multigrain Banana & Berry Cereal (From 7+ Months) 200gm', 'aptamil-multigrain-banana-berry-cereal-from-7-months-200gm', 'Simple', 0, 0, 0, '<p>Aptamil Multigrain Banana &amp; Berry Cereal 200G</p>', '<h1>&nbsp;</h1>\r\n\r\n<p><br />\r\n<br />\r\nMultigrain cereals with milk, banana, berries &amp; apple, GOS/FOS and added vitamins &amp; minerals.<br />\r\n<br />\r\nOur Unique Blend of Ingredients<br />\r\nWith our blend of galacto- and fructo-oligosaccharides.<br />\r\nTo support normal cognitive development.<br />\r\nVitamin D for normal development of bones.<br />\r\nOur Unique range of cereals is developed to introduce delicious tastes and varied textures as your baby progresses<br />\r\n<br />\r\nPackaged in a protective atmosphere.<br />\r\nContents may settle in transit.<br />\r\nGreen Dot<br />\r\nNutricia Bringing Science to Early Life<br />\r\n<br />\r\nOur unique blend<br />\r\nJust add water<br />\r\nExploring textures<br />\r\nDelicious wholegrains<br />\r\nNo added sugar or salt - contains naturally occurring sugars and salt only<br />\r\nNo preservatives<br />\r\nPack size: 200G<br />\r\nVitamin D for normal development of bones<br />\r\nNo added sugar or salt</p>\r\n\r\n<p><img alt=\"✅\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t33/1/16/2705.png\" />Delivery Charge Inside Dhaka 60 taka<br />\r\n<img alt=\"✅\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t33/1/16/2705.png\" />Outside Dhaka 130 taka</p>', NULL, 'Aptamil Multigrain Banana & Berry Cereal (From 7+ Months) 200gm', 'Aptamil Multigrain Banana & Berry Cereal (From 7+ Months) 200gm', 'Aptamil Multigrain Banana & Berry Cereal (From 7+ Months) 200gm', 1000, '1719909152.jpg', '2024/07', 99, 0, 0, 0, NULL, 0, 0, 0, NULL, 950, 0, NULL, NULL, '2024-07-02 08:32:32', '2024-07-02 08:32:32'),
(77, 1, 'Cow & Gate Banana Wholegrain Porridge with Buckwheat (From 7 Months) 200gm', 'cow-gate-banana-wholegrain-porridge-with-buckwheat-from-7-months-200gm', 'Simple', 0, 0, 0, '<p>Cow &amp; Gate Banana Wholegrain Porridge</p>', '<h2>Product Description</h2>\r\n\r\n<ul>\r\n	<li>Blend of milled cereals with banana flakes, corn flakes and added vitamin B1</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>For our 7 months onwards Wholegrain Banana Porridge we use our best quality natural ingredients**, grown by farmers we know and trust. We carefully combine a variety of grains, such as buckwheat, oat and millet, with real banana flakes for a delicious recipe tailored to your little one, so they can explore a new taste and exciting texture.</li>\r\n	<li>**and vitamin B1</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Over 100 years of trusted experience</li>\r\n	<li>Cow &amp; Gate are passionate about helping little ones learn to love good food.</li>\r\n	<li>Cow &amp; Gate My First Muesli from 10m onwards</li>\r\n	<li>Varied size fruits &amp; grains to help your little one explore new textures</li>\r\n	<li>Cow &amp; Gate Banana Wholegrain Porridge with Buckwheat from 7m onwards</li>\r\n	<li>Adventurous flavours &amp; thicker textures to encourage food progression</li>\r\n	<li>Cow &amp; Gate Creamy Porridge from 4-6 onwards</li>\r\n	<li>First tastes &amp; smooth textures for an easy introduction to foods</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Packaged in a protective atmosphere. Contents may settle in transit.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Just add milk</li>\r\n	<li>With natural ingredients and vitamin B1</li>\r\n	<li>Exciting texture</li>\r\n	<li>No added sugar - contains naturally occurring sugars</li>\r\n	<li>No artificial colours, flavourings or preservatives</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Pack size: 200G</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>No added sugar</li>\r\n</ul>\r\n\r\n<h2>Information</h2>\r\n\r\n<h3>Ingredients</h3>\r\n\r\n<p>Milled Cereals (83%) (Wholegrain&nbsp;<strong>Wheat</strong>&nbsp;(73%), Buckwheat (1.7%), Wholegrain&nbsp;<strong>Oat</strong>&nbsp;(1.7%), Wholegrain&nbsp;<strong>Spelt</strong>&nbsp;(1.7%), Wholegrain Millet (1.7%), Rice (1.7%),&nbsp;<strong>Rye</strong>), Banana Flakes (12%), Corn Flakes, Vitamin B1</p>\r\n\r\n<h3>Allergy Information</h3>\r\n\r\n<ul>\r\n	<li>May contain traces of Soy and Milk</li>\r\n</ul>\r\n\r\n<h3>Storage</h3>\r\n\r\n<p>Please store this product in a cool, dry place (not in the fridge) and once opened use within 28 days.</p>\r\n\r\n<h3>Produce of</h3>\r\n\r\n<p>Manufactured in the E.U.</p>\r\n\r\n<h3>Preparation and Usage</h3>\r\n\r\n<ul>\r\n	<li>Yummy porridge in 3 easy steps</li>\r\n	<li>1 For every 1 level spoonful of cereal...</li>\r\n	<li>2 Mix 3 spoonfuls of your baby&#39;s usual milk</li>\r\n	<li>3 Stir and enjoy!</li>\r\n	<li>Tips:</li>\r\n	<li>Preparation instructions are a ratio guide only.</li>\r\n	<li>Let your little one&#39;s appetite lead the way. Carefully observe your baby; they will let you know when they have had enough.</li>\r\n	<li>Add more or less liquid to alter the consistency.</li>\r\n	<li>Use a clean bowl and feeding spoon.</li>\r\n	<li>Always check the temperature before feeding.</li>\r\n</ul>\r\n\r\n<h3>Number of uses</h3>\r\n\r\n<p>There are approximately thirteen 15g portions in this pack</p>\r\n\r\n<h3>Additives</h3>\r\n\r\n<ul>\r\n	<li>Free From Artificial Colours</li>\r\n	<li>Free From Artificial Flavours</li>\r\n	<li>Free From Artificial Preservatives</li>\r\n</ul>\r\n\r\n<h3>Warnings</h3>\r\n\r\n<ul>\r\n	<li>The serious bit...</li>\r\n	<li>Do not leave your little one alone when eating and drinking.</li>\r\n	<li>For good dental hygiene, clean your baby&#39;s teeth regularly, especially before bedtime.</li>\r\n</ul>\r\n\r\n<h3>Name and address</h3>\r\n\r\n<ul>\r\n	<li>Nutricia Ltd,</li>\r\n	<li>Trowbridge,</li>\r\n	<li>BA14 0XQ.</li>\r\n	<li>Nutricia Ireland Ltd,</li>\r\n	<li>Deansgrange Business Park,</li>\r\n	<li>Deansgrange,</li>\r\n</ul>\r\n\r\n<h3>Return to</h3>\r\n\r\n<ul>\r\n	<li>Please ensure that this product and its packaging is undamaged before feeding. For any help or advice, please contact our careline.</li>\r\n	<li>We&#39;re happy to help</li>\r\n	<li>UK 0800 977 4000</li>\r\n	<li>cowandgate.co.uk</li>\r\n	<li>ROI 1-800 570 570</li>\r\n	<li>candgbabyclub.ie</li>\r\n	<li>Nutricia Ltd,</li>\r\n	<li>Trowbridge,</li>\r\n	<li>BA14 0XQ.</li>\r\n	<li>Nutricia Ireland Ltd,</li>\r\n	<li>Deansgrange Business Park,</li>\r\n	<li>Deansgrange,</li>\r\n</ul>\r\n\r\n<h3>Lower age limit</h3>\r\n\r\n<p>7 Months</p>\r\n\r\n<h3>Net Contents</h3>\r\n\r\n<p>200g ℮</p>\r\n\r\n<h3>Nutrition</h3>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th>Typical Values</th>\r\n			<th>Per 100g dry product</th>\r\n			<th>Per 15g cereal with 150ml Follow On milk1 (% LRV&dagger;)</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Energy</td>\r\n			<td>1504 kJ / 372 kcal</td>\r\n			<td>668 kJ / 159 kcal</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Fat</td>\r\n			<td>2.1 g</td>\r\n			<td>5.1 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>of which, saturates</td>\r\n			<td>0.30 g</td>\r\n			<td>2.1 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Carbohydrate</td>\r\n			<td>72.4 g</td>\r\n			<td>23.2 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>of which, sugars*</td>\r\n			<td>6.7 g</td>\r\n			<td>13.2 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Fibre</td>\r\n			<td>9.5 g</td>\r\n			<td>2.3 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Protein</td>\r\n			<td>11.2 g</td>\r\n			<td>3.8 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Salt*</td>\r\n			<td>0.01 g</td>\r\n			<td>0.09 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thiamin (B1)</td>\r\n			<td>0.84 mg</td>\r\n			<td>0.20 mg (40%)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamins</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>1 15g serving of cereal (approximately 3 tablespoons) made with 150ml Follow On milk (approximately 9 tablespoons)</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>*No added sugar. Contains naturally occurring sugars and salt only</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&dagger;Labelling Reference Value for infants and young children</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Inside Dhaka Delivery Charge- 80TK<br />\r\nOut of Dhaka City Courier Charge- 130TK</p>', NULL, 'Cow & Gate Banana Wholegrain Porridge (From 7 Months) 200gm', 'Cow & Gate Banana Wholegrain Porridge (From 7 Months) 200gm', 'Cow & Gate Banana Wholegrain Porridge (From 7 Months) 200gm', 1000, '1719983385.jpg', '2024/07', 106, 0, 0, 0, NULL, 0, 0, 0, NULL, 950, 0, NULL, NULL, '2024-07-02 09:04:44', '2024-07-03 05:09:45'),
(78, 1, 'Cow & Gate Creamy Porridge (From 4 to 6 Months) 125gm', 'cow-gate-creamy-porridge-from-4-to-6-months-125gm-2', 'Simple', 0, 0, 0, '<p>Cow &amp; Gate Creamy Porridge</p>', '<p><strong>Can be given from 4 to 6 months<br />\r\nWeight : 125 gm<br />\r\nOrigin : UK<br />\r\n<br />\r\nInside Dhaka Delivery Charge- 80TK<br />\r\nOut of Dhaka City Courier Charge- 130TK</strong></p>', NULL, 'Cow & Gate Creamy Porridge (From 6+ Months) 125gm', 'Cow & Gate Creamy Porridge (From 6+ Months) 125gm', 'Cow & Gate Creamy Porridge (From 6+ Months) 125gm', 1000, '1719911142.jpg', '2024/07', 101, 0, 0, 0, NULL, 0, 0, 0, NULL, 690, 0, NULL, NULL, '2024-07-02 09:05:45', '2024-07-02 09:05:53');
INSERT INTO `products` (`id`, `status`, `title`, `slug`, `type`, `featured`, `clearance_sale`, `spacial_offer`, `short_description`, `description`, `brand_id`, `meta_title`, `meta_description`, `meta_tags`, `position`, `image`, `image_path`, `media_id`, `stock`, `stock_alert_quantity`, `stock_pre_alert_quantity`, `custom_label`, `view`, `average_rating`, `total_review`, `expire_date`, `sale_price`, `regular_price`, `attribute_items_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(79, 1, 'Cow & Gate Banana Porridge (From 4 to 6 Months) 125gm', 'cow-gate-banana-porridge-from-4-to-6-months-125gm', 'Simple', 0, 0, 0, '<p>Cow &amp; Gate Banana Porridge</p>', '<h1>&nbsp;</h1>\r\n\r\n<p>From 4-6months</p>\r\n\r\n<h2>Product Description</h2>\r\n\r\n<ul>\r\n	<li>Milled cereals &amp; banana flakes with skimmed milk and added vitamins &amp; minerals</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Our 4-6 months onwards Banana Porridge is tailored to your little one&#39;s stage** and is a gentle way to introduce your baby to first tastes and smooth textures. We use our best quality ingredients, such as real banana flakes, grown by farmers we know and trust, to create this delicious recipe.</li>\r\n	<li>**Iron contributes to the normal cognitive development of children.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Over 100 years of trusted experience</li>\r\n	<li>Cow &amp; Gate are passionate about helping little ones learn to love good food.</li>\r\n	<li>Cow &amp; Gate My First Muesli from 10m onwards</li>\r\n	<li>Varied size fruits &amp; grains to help your little one explore new textures</li>\r\n	<li>Cow &amp; Gate Banana Wholegrain Porridge with Buckwheat from 7m onwards</li>\r\n	<li>Adventurous flavours &amp; thicker textures to encourage food progression</li>\r\n	<li>Cow &amp; Gate Creamy Porridge from 4-6m onwards</li>\r\n	<li>First tastes &amp; smooth textures for an easy introduction to foods</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Packaged in a protective atmosphere. Contents may settle in transit.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Just add water</li>\r\n	<li>Source of iron &amp; calcium</li>\r\n	<li>With banana</li>\r\n	<li>No added sugar - contains naturally occurring sugars</li>\r\n	<li>Gluten free</li>\r\n	<li>No artificial colours, flavourings or preservatives</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Pack size: 125G</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Iron contributes to the normal cognitive development of children</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Source of iron &amp; calcium</li>\r\n	<li>No added sugar</li>\r\n</ul>\r\n\r\n<h2>Information</h2>\r\n\r\n<h3>Ingredients</h3>\r\n\r\n<p>Skimmed&nbsp;<strong>Milk</strong>&nbsp;Powder, Milled Corn (20%), Banana Flakes (16%), Milled Rice (14%), Demineralised Whey Powder (from&nbsp;<strong>Milk</strong>), Vegetable Fat (Sunflower Oil, Coconut Oil, Rapeseed Oil, Palm Oil, Emulsifier (<strong>Soy</strong>&nbsp;Lecithin)), Minerals (Iodine, Iron, Calcium), Vitamins (Vitamin B1, Vitamin B6, Biotin, Vitamin D3, Vitamin A, Vitamin E, Vitamin C)</p>\r\n\r\n<h3>Allergy Information</h3>\r\n\r\n<ul>\r\n	<li>Free From: Gluten</li>\r\n	<li>Contains: Milk, Soya</li>\r\n</ul>\r\n\r\n<h3>Storage</h3>\r\n\r\n<p>Please store this product in a cool, dry place (not in the fridge) and once opened use within 28 days.</p>\r\n\r\n<h3>Produce of</h3>\r\n\r\n<p>Manufactured in the E.U.</p>\r\n\r\n<h3>Preparation and Usage</h3>\r\n\r\n<ul>\r\n	<li>Yummy porridge in 3 easy steps</li>\r\n	<li>1 For every 1 level spoonful of cereal...</li>\r\n	<li>2 Mix 2 spoonfuls of warm, previously boiled water.</li>\r\n	<li>3 Stir &amp; enjoy!</li>\r\n	<li>Tips:</li>\r\n	<li>Preparation instructions are a ratio guide only.</li>\r\n	<li>Let your little one&#39;s appetite lead the way. Carefully observe your baby; they will let you know when they have had enough.</li>\r\n	<li>Add more or less liquid to alter the consistency.</li>\r\n	<li>Use a clean bowl and feeding spoon.</li>\r\n	<li>Always check the temperature before feeding.</li>\r\n	<li>Breastfeeding is recommended for the first 6 months of life. Please speak with a healthcare professional before introducing solid foods.</li>\r\n</ul>\r\n\r\n<h3>Number of uses</h3>\r\n\r\n<p>There are approximately six 20g portions in this pack</p>\r\n\r\n<h3>Additives</h3>\r\n\r\n<ul>\r\n	<li>Free From Artificial Colours</li>\r\n	<li>Free From Artificial Flavours</li>\r\n	<li>Free From Artificial Preservatives</li>\r\n</ul>\r\n\r\n<h3>Warnings</h3>\r\n\r\n<ul>\r\n	<li>The serious bit...</li>\r\n	<li>Do not leave your little one alone when eating and drinking.</li>\r\n	<li>For good dental hygiene, clean your baby&#39;s teeth regularly especially before bedtime.</li>\r\n</ul>\r\n\r\n<h3>Name and address</h3>\r\n\r\n<ul>\r\n	<li>Nutricia Ltd,</li>\r\n	<li>Trowbridge,</li>\r\n	<li>BA14 0XQ.</li>\r\n	<li>Nutricia Ireland Ltd,</li>\r\n	<li>Deansgrange Business Park,</li>\r\n	<li>Deansgrange,</li>\r\n</ul>\r\n\r\n<h3>Return to</h3>\r\n\r\n<ul>\r\n	<li>Please ensure that this product and its packaging is undamaged before feeding. For any help or advice, please contact our careline.</li>\r\n	<li>We&#39;re happy to help</li>\r\n	<li>UK 0800 977 4000</li>\r\n	<li>cowandgate.co.uk</li>\r\n	<li>ROI 1-800 570 570</li>\r\n	<li>candgbabyclub.ie</li>\r\n	<li>Nutricia Ltd,</li>\r\n	<li>Trowbridge,</li>\r\n	<li>BA14 0XQ.</li>\r\n	<li>Nutricia Ireland Ltd,</li>\r\n	<li>Deansgrange Business Park,</li>\r\n	<li>Deansgrange,</li>\r\n</ul>\r\n\r\n<h3>Lower age limit</h3>\r\n\r\n<p>4 Months</p>\r\n\r\n<h3>Upper age limit</h3>\r\n\r\n<p>6 Months</p>\r\n\r\n<h3>Net Contents</h3>\r\n\r\n<p>125g ℮</p>\r\n\r\n<h3>Nutrition</h3>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th>Typical Values</th>\r\n			<th>Per 100g dry product</th>\r\n			<th>Per 20g cereal with 80ml of water1 (% LRV&dagger;)</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Energy</td>\r\n			<td>1790 kJ / 425 kcal</td>\r\n			<td>358 kJ / 85 kcal</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Fat</td>\r\n			<td>11.2 g</td>\r\n			<td>2.2 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>of which, saturates</td>\r\n			<td>4.6 g</td>\r\n			<td>0.9 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Carbohydrate</td>\r\n			<td>64.5 g</td>\r\n			<td>12.9 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>of which, sugars*</td>\r\n			<td>30.0 g</td>\r\n			<td>6.0 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Fibre</td>\r\n			<td>2.6 g</td>\r\n			<td>0.5 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Protein</td>\r\n			<td>14.5 g</td>\r\n			<td>2.9 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Salt*</td>\r\n			<td>0.28 g</td>\r\n			<td>0.06 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamin A</td>\r\n			<td>428 &micro;g</td>\r\n			<td>86 &micro;g (22%)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamin D3</td>\r\n			<td>6.0 &micro;g</td>\r\n			<td>1.2 &micro;g (12%)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamin E</td>\r\n			<td>6.7 mg TE</td>\r\n			<td>1.3 mg TE</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamin C</td>\r\n			<td>56.0 mg</td>\r\n			<td>11.0 mg (44%)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thiamin (B1)</td>\r\n			<td>1.1 mg</td>\r\n			<td>0.23 mg (46%)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamin B6</td>\r\n			<td>0.70 mg</td>\r\n			<td>0.14 mg (20%)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Biotin (B7)</td>\r\n			<td>23.0 &micro;g</td>\r\n			<td>4.6 &micro;g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Calcium</td>\r\n			<td>634 mg</td>\r\n			<td>127 mg (32%)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Iron</td>\r\n			<td>7.9 mg</td>\r\n			<td>1.6 mg (27%)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Iodine</td>\r\n			<td>128 &micro;g</td>\r\n			<td>26 &micro;g (37%)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamins</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Minerals</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>1 20g serving of cereal (approximately 2 1/2 tablespoons) made with 80ml of water (approximately 5 tablespoons)</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>*No added sugar. Contains naturally occurring sugars and salt only</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&dagger;Labelling Reference Value for infants and young children</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><br />\r\n<br />\r\nInside Dhaka Delivery Charge- 80TK<br />\r\nOut of Dhaka City Courier Charge- 130TK</p>', NULL, 'Cow & Gate Banana Porridge (From 4 to 6 Months) 125gm', 'Cow & Gate Banana Porridge (From 4 to 6 Months) 125gm', 'Cow & Gate Banana Porridge (From 4 to 6 Months) 125gm', 1000, '1719911947.jpg', '2024/07', 102, 0, 0, 0, NULL, 0, 0, 0, NULL, 690, 0, NULL, NULL, '2024-07-02 09:19:19', '2024-07-02 09:19:34'),
(80, 1, 'Cow & Gate Fruity Wholegrain Porridge (From 6 Months) 125gm', 'cow-gate-fruity-wholegrain-porridge-from-6-months-125gm', 'Simple', 0, 0, 0, '<p>Cow &amp; Gate Fruity Wholegrain Porridge</p>', '<h2>Product Description</h2>\r\n\r\n<ul>\r\n	<li>Blend of milled cereals with various fruits, skimmed milk and added vitamins &amp; minerals</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Our 6 months onwards Fruity Wholegrain Porridge is tailored to your little one&#39;s stage** and is a gentle way to introduce your baby to first tastes and smooth textures. We combine our best quality ingredients, such as exciting wholegrains and tasty fruits, all grown by farmers we know and trust, to create this delicious recipe.</li>\r\n	<li>**Iron contributes to the normal cognitive development of children</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Over 100 years of trusted experience</li>\r\n	<li>Cow &amp; Gate are passionate about helping little ones learn to love good food.</li>\r\n	<li>Cow &amp; Gate My First Muesli from 10m onwards</li>\r\n	<li>Varied size fruits &amp; grains to help your little one explore new textures</li>\r\n	<li>Cow &amp; Gate Banana Wholegrain Porridge with Buckwheat from 7m onwards</li>\r\n	<li>Adventurous flavours &amp; thicker textures to encourage food progression</li>\r\n	<li>Cow &amp; Gate Creamy Porridge from 4-6m onwards</li>\r\n	<li>First tastes &amp; smooth textures for an easy introduction to foods</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Packaged in a protective atmosphere. Contents may settle in transit.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Just add water</li>\r\n	<li>Source of iron &amp; calcium</li>\r\n	<li>With exciting grains</li>\r\n	<li>No added sugar - contains naturally occurring sugars</li>\r\n	<li>No artificial colours, flavourings or preservatives</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Pack size: 125G</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Iron contributes to the normal cognitive development of children</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Source of iron &amp; calcium</li>\r\n	<li>No added sugar</li>\r\n</ul>\r\n\r\n<h2>Information</h2>\r\n\r\n<h3>Ingredients</h3>\r\n\r\n<p>Milled Cereals (36%) (Wholegrain&nbsp;<strong>Wheat</strong>&nbsp;(30%), Buckwheat (1%), Wholegrain&nbsp;<strong>Spelt</strong>&nbsp;(1%), Rice (1%), Wholegrain Millet (1%), Wholegrain&nbsp;<strong>Oat</strong>&nbsp;(1%),&nbsp;<strong>Rye</strong>), Skimmed&nbsp;<strong>Milk</strong>&nbsp;Powder, Demineralised Whey Powder (from&nbsp;<strong>Milk</strong>), Vegetable Fat (Palm Oil, Rapeseed Oil, Coconut Oil, High Oleic Sunflower Oil, Emulsifier (<strong>Soy</strong>&nbsp;Lecithin)), Apple Powder (5%), Banana Flakes (2%), Pear Flakes (Pear, Rice) (2%), Minerals (Calcium, Iron, Iodine), Orange Powder (Orange, Rice Flour), Vitamins (Vitamin C, Vitamin E, Vitamin A, Vitamin D3, Biotin, Vitamin B1, Vitamin B6)</p>\r\n\r\n<h3>Allergy Information</h3>\r\n\r\n<ul>\r\n	<li>Contains: Milk, Oats, Rye, Soya, Wheat</li>\r\n</ul>\r\n\r\n<h3>Storage</h3>\r\n\r\n<p>Please store this product in a cool, dry place (not in the fridge) and once opened use within 28 days.</p>\r\n\r\n<h3>Produce of</h3>\r\n\r\n<p>Manufactured in the E.U.</p>\r\n\r\n<h3>Preparation and Usage</h3>\r\n\r\n<ul>\r\n	<li>Yummy porridge in 3 easy steps</li>\r\n	<li>1 For every 1 level spoonful of cereal...</li>\r\n	<li>2 Mix 1 1/2 spoonfuls of warm, previously boiled water.</li>\r\n	<li>3 Stir &amp; enjoy!</li>\r\n	<li>Tips:</li>\r\n	<li>Preparation instructions are a ratio guide only.</li>\r\n	<li>Let your little one&#39;s appetite lead the way. Carefully observe your baby; they will let you know when they have had enough.</li>\r\n	<li>Add more or less liquid to alter the consistency.</li>\r\n	<li>Use a clean bowl and feeding spoon.</li>\r\n	<li>Always check the temperature before feeding.</li>\r\n</ul>\r\n\r\n<h3>Number of uses</h3>\r\n\r\n<p>There are approximately five 25g portions in this pack.</p>\r\n\r\n<h3>Additives</h3>\r\n\r\n<ul>\r\n	<li>Free From Artificial Colours</li>\r\n	<li>Free From Artificial Flavours</li>\r\n	<li>Free From Artificial Preservatives</li>\r\n</ul>\r\n\r\n<h3>Warnings</h3>\r\n\r\n<ul>\r\n	<li>The serious bit...</li>\r\n	<li>Do not leave your little one alone when eating and drinking.</li>\r\n	<li>For good dental hygiene, clean your baby&#39;s teeth regularly, especially before bedtime.</li>\r\n</ul>\r\n\r\n<h3>Name and address</h3>\r\n\r\n<ul>\r\n	<li>Nutricia Ltd,</li>\r\n	<li>Trowbridge,</li>\r\n	<li>BA14 0XQ.</li>\r\n	<li>Nutricia Ireland Ltd,</li>\r\n	<li>Deansgrange Business Park,</li>\r\n	<li>Deansgrange,</li>\r\n</ul>\r\n\r\n<h3>Return to</h3>\r\n\r\n<ul>\r\n	<li>Please ensure that this product and its packaging is undamaged before feeding. For any help or advice, please contact our careline.</li>\r\n	<li>We&#39;re happy to help</li>\r\n	<li>UK 0800 977 4000</li>\r\n	<li>cowandgate.co.uk</li>\r\n	<li>ROI 1-800 570 570</li>\r\n	<li>candgbabyclub.ie</li>\r\n	<li>Nutricia Ltd,</li>\r\n	<li>Trowbridge,</li>\r\n	<li>BA14 0XQ.</li>\r\n	<li>Nutricia Ireland Ltd,</li>\r\n	<li>Deansgrange Business Park,</li>\r\n	<li>Deansgrange,</li>\r\n</ul>\r\n\r\n<h3>Lower age limit</h3>\r\n\r\n<p>6 Months</p>\r\n\r\n<h3>Net Contents</h3>\r\n\r\n<p>125g ℮</p>\r\n\r\n<h3>Nutrition</h3>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th>Typical Values</th>\r\n			<th>Per 100g dry product</th>\r\n			<th>Per 25g cereal with 75ml of water1 (% LRV&dagger;)</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Energy</td>\r\n			<td>1784 kJ / 424 kcal</td>\r\n			<td>446 kJ / 104 kcal</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Fat</td>\r\n			<td>11.7 g</td>\r\n			<td>2.9 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>of which, saturates</td>\r\n			<td>4.8 g</td>\r\n			<td>1.2 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Carbohydrate</td>\r\n			<td>60.9 g</td>\r\n			<td>15.2 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>of which, sugars*</td>\r\n			<td>30.5 g</td>\r\n			<td>7.6 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Fibre</td>\r\n			<td>5.3 g</td>\r\n			<td>1.3 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Protein</td>\r\n			<td>15.9 g</td>\r\n			<td>4.0 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Salt*</td>\r\n			<td>0.31 g</td>\r\n			<td>0.08 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamin A</td>\r\n			<td>420 &micro;g</td>\r\n			<td>105 &micro;g (26%)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamin D3</td>\r\n			<td>6.0 &micro;g</td>\r\n			<td>1.5 &micro;g (15%)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamin E</td>\r\n			<td>7.4 mg TE</td>\r\n			<td>1.8 mg TE</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamin C</td>\r\n			<td>44.0 mg</td>\r\n			<td>11.0 mg (44%)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thiamin (B1)</td>\r\n			<td>1.1 mg</td>\r\n			<td>0.28 mg (56%)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamin B6</td>\r\n			<td>0.82 mg</td>\r\n			<td>0.21 mg (30%)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Biotin (B7)</td>\r\n			<td>25.0 &micro;g</td>\r\n			<td>6.3 &micro;g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Calcium</td>\r\n			<td>609 mg</td>\r\n			<td>152 mg (38%)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Iron</td>\r\n			<td>8.8 mg</td>\r\n			<td>2.2 mg (37%)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Iodine</td>\r\n			<td>125 &micro;g</td>\r\n			<td>31 &micro;g (44%)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamins</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Minerals</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>1 25g serving of cereal (approximately 3 1/2 tablespoons) made with 75ml of water (approximately 5 tablespoons)</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>*No added sugar. Contains naturally occurring sugars and salt only</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&dagger;Labelling Reference Value for infants and young children</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Inside Dhaka Delivery Charge- 80TK<br />\r\nOut of Dhaka City Courier Charge- 130TK</p>', NULL, 'Cow & Gate Fruity Wholegrain Porridge (From 6 Months) 125gm', 'Cow & Gate Fruity Wholegrain Porridge (From 6 Months) 125gm', 'Cow & Gate Fruity Wholegrain Porridge (From 6 Months) 125gm', 1000, '1719983207.jpg', '2024/07', 104, 0, 0, 0, NULL, 0, 0, 0, NULL, 690, 0, NULL, NULL, '2024-07-03 05:06:47', '2024-07-03 05:06:47'),
(81, 1, 'Cow & Gate Red Berry Wholegrain Porridge with Spelt (From 7 Months) 200gm', 'cow-gate-red-berry-wholegrain-porridge-with-spelt-from-7-months-200gm', 'Simple', 0, 0, 0, '<p>Cow &amp; gate Red Berry Wholegrain</p>', '<p><strong>Can be given from 7months<br />\r\nWeight : 200 gm<br />\r\nOrigin : UK<br />\r\nInside Dhaka Delivery Charge- 80TK<br />\r\nOut of Dhaka City Courier Charge- 130TK</strong></p>', NULL, 'Cow & Gate Red Berry Wholegrain Porridge with Spelt (From 7 Months) 200gm', 'Cow & Gate Red Berry Wholegrain Porridge with Spelt (From 7 Months) 200gm', 'Cow & Gate Red Berry Wholegrain Porridge with Spelt (From 7 Months) 200gm', 1000, '1719983342.jpg', '2024/07', 105, 0, 0, 0, NULL, 0, 0, 0, NULL, 950, 0, NULL, NULL, '2024-07-03 05:09:02', '2024-07-03 05:09:02'),
(82, 1, 'Cow & Gate Baby Rice (From 4 to 6 Months) 100gm', 'cow-gate-baby-rice-from-4-to-6-months-100gm', 'Simple', 0, 0, 0, '<p>Cow &amp; Gate Baby Rice Cereal</p>', '<h2>Product Description</h2>\r\n\r\n<ul>\r\n	<li>Milled rice with added vitamin B1</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>For our 4-6 months onwards Baby Rice we use our best quality rice, grown by farmers we know and trust. It&#39;s a gentle way to introduce your baby to first tastes and smooth textures.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Over 100 years of trusted of experience</li>\r\n	<li>Cow &amp; Gate are passionate about helping little ones learn to love good food.</li>\r\n	<li>Cow &amp; Gate My First Muesli from 10m onwards</li>\r\n	<li>Varied size fruits &amp; grains to help your little one explore new textures</li>\r\n	<li>Cow &amp; Gate Banana Wholegrain Porridge with Buckwheat from 7m onwards</li>\r\n	<li>Adventurous flavours &amp; thicker textures to encourage food progression</li>\r\n	<li>Cow &amp; Gate Creamy Porridge from 4-6m onwards</li>\r\n	<li>First tastes &amp; smooth textures for an easy introduction to foods</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Packaged in a protective atmosphere. Contents may settle in transit.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Just add milk</li>\r\n	<li>With natural ingredients and vitamin B1</li>\r\n	<li>Smooth texture</li>\r\n	<li>No added sugar - contains naturally occurring sugars</li>\r\n	<li>Gluten free</li>\r\n	<li>No artificial colours, flavourings or preservatives</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Pack size: 100G</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>No added sugar</li>\r\n</ul>\r\n\r\n<h2>Information</h2>\r\n\r\n<h3>Ingredients</h3>\r\n\r\n<p>Milled Rice (100%), Vitamin B1</p>\r\n\r\n<h3>Allergy Information</h3>\r\n\r\n<ul>\r\n	<li>May contain traces of Milk and Soy</li>\r\n</ul>\r\n\r\n<h3>Storage</h3>\r\n\r\n<p>Please store this product in a cool, dry place (not in the fridge) and once opened use within 28 days.</p>\r\n\r\n<h3>Produce of</h3>\r\n\r\n<p>Manufactured in the E.U.</p>\r\n\r\n<h3>Preparation and Usage</h3>\r\n\r\n<ul>\r\n	<li>Yummy baby rice in 3 easy steps</li>\r\n	<li>1 For every 1 level spoonful of cereal...</li>\r\n	<li>2 Mix 3 1/2 spoonfuls of your baby&#39;s usual milk</li>\r\n	<li>3 Stir &amp; enjoy!</li>\r\n	<li>Tips:</li>\r\n	<li>Preparation instructions are a ratio guide only.</li>\r\n	<li>Let your little one&#39;s appetite lead the way. Carefully observe your baby; they will let you know when they have had enough.</li>\r\n	<li>Add more or less liquid to alter the consistency.</li>\r\n	<li>Use a clean bowl and feeding spoon.</li>\r\n	<li>Always check the temperature before feeding.</li>\r\n	<li>Breastfeeding is recommended for the first 6 months of life. Please speak with a healthcare professional before introducing solid foods.</li>\r\n</ul>\r\n\r\n<h3>Additives</h3>\r\n\r\n<ul>\r\n	<li>Free From Artificial Colours</li>\r\n	<li>Free From Artificial Flavours</li>\r\n	<li>Free From Artificial Preservatives</li>\r\n</ul>\r\n\r\n<h3>Warnings</h3>\r\n\r\n<ul>\r\n	<li>The serious bit...</li>\r\n	<li>Do not leave your little one alone when eating and drinking.</li>\r\n	<li>For good dental hygiene, clean your baby&#39;s teeth regularly, especially before bedtime.</li>\r\n</ul>\r\n\r\n<h3>Name and address</h3>\r\n\r\n<ul>\r\n	<li>Nutricia Ltd,</li>\r\n	<li>Trowbridge,</li>\r\n	<li>BA14 0XQ.</li>\r\n	<li>Nutricia Ireland Ltd,</li>\r\n	<li>Deansgrange Business Park,</li>\r\n	<li>Deansgrange,</li>\r\n</ul>\r\n\r\n<h3>Return to</h3>\r\n\r\n<ul>\r\n	<li>Please ensure that this product and its packaging is undamaged before feeding. For any help or advice, please contact our careline.</li>\r\n	<li>We&#39;re happy to help</li>\r\n	<li>UK 0800 977 4000</li>\r\n	<li>cowandgate.co.uk</li>\r\n	<li>ROI 1-800 570 570</li>\r\n	<li>candgbabyclub.ie</li>\r\n	<li>Nutricia Ltd,</li>\r\n	<li>Trowbridge,</li>\r\n	<li>BA14 0XQ.</li>\r\n	<li>Nutricia Ireland Ltd,</li>\r\n	<li>Deansgrange Business Park,</li>\r\n	<li>Deansgrange,</li>\r\n</ul>\r\n\r\n<h3>Lower age limit</h3>\r\n\r\n<p>4 Months</p>\r\n\r\n<h3>Upper age limit</h3>\r\n\r\n<p>6 Months</p>\r\n\r\n<h3>Net Contents</h3>\r\n\r\n<p>100g ℮</p>\r\n\r\n<h3>Nutrition</h3>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th>Typical Values</th>\r\n			<th>Per 100g dry product (% LRV&dagger;)</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Energy</td>\r\n			<td>1634 kJ / 385 kcal</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Fat</td>\r\n			<td>1.2 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>of which, saturates</td>\r\n			<td>0.2 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Carbohydrate</td>\r\n			<td>85.6 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>of which, sugars*</td>\r\n			<td>0.4 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Fibre</td>\r\n			<td>0.5 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Protein</td>\r\n			<td>7.7 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Salt*</td>\r\n			<td>0.02 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thiamin (B1)</td>\r\n			<td>0.9 mg (180%)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamins</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>*No added sugar. Contains naturally occurring sugars and salt only</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&dagger;Labelling Reference Value for infants and young children</td>\r\n			<td>-</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Delivery Charge Inside Dhaka 80 Taka</p>\r\n\r\n<p>Outside Dhaka 130 Taka</p>', NULL, 'Cow & Gate Baby Rice (From 4 to 6 Months) 100gm', 'Cow & Gate Baby Rice (From 4 to 6 Months) 100gm', 'Cow & Gate Baby Rice (From 4 to 6 Months) 100gm', 1000, '1719984092.jpg', '2024/07', 107, 0, 0, 0, NULL, 0, 0, 0, NULL, 690, 0, NULL, NULL, '2024-07-03 05:21:32', '2024-07-03 05:21:33'),
(83, 0, 'Heinz Summer Fruit Porridge (From 7+months) 220G', 'heinz-summer-fruit-porridge-from-7-months-220g', 'Simple', 0, 0, 0, '<p>Heinz Summer Fruit Porridge (7+months) 220G</p>', '<p><strong>From 7+months Baby</strong></p>\r\n\r\n<p><strong>Weight : 220G</strong></p>\r\n\r\n<p><strong>Origin : UK</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130 Taka</strong></p>', NULL, 'Heinz Summer Fruit Porridge (From 7+months) 220G', 'Heinz Summer Fruit Porridge (From 7+months) 220G', 'Heinz Summer Fruit Porridge (From 7+months) 220G', 1000, '1720001393.jpg', '2024/07', 108, 0, 0, 0, NULL, 0, 0, 0, NULL, 790, 0, NULL, NULL, '2024-07-03 10:09:53', '2024-07-03 10:09:53'),
(84, 1, 'Heinz Banana Oat Porridge (From 7+Months) 220G', 'heinz-banana-oat-porridge-from-7-months-220g', 'Simple', 0, 0, 0, '<p>Heinz Banana Oat Porridge (7+Months) 220G</p>', '<p><strong>From 7+ Months Baby</strong></p>\r\n\r\n<p><strong>Weight : 220G</strong></p>\r\n\r\n<p><strong>Origin : UK</strong></p>\r\n\r\n<p><strong>Delivery Chgarge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130 Taka</strong></p>', NULL, 'Heinz Banana Oat Porridge (From 7+Months) 220G', 'Heinz Banana Oat Porridge (From 7+Months) 220G', 'Heinz Banana Oat Porridge (From 7+Months) 220G', 1000, '1720002332.jpg', '2024/07', 109, 0, 0, 0, NULL, 0, 0, 0, NULL, 850, 0, NULL, NULL, '2024-07-03 10:25:33', '2024-07-07 06:32:16'),
(85, 0, 'Heinz Blueberry Multigrain Porridge (From 7+Months) 220G', 'heinz-blueberry-multigrain-porridge-from-7-months-220g', 'Simple', 0, 0, 0, '<p>Heinz Blueberry Multigrain Porridge (7+Months) 220G</p>', '<p><strong>With Added Iron</strong></p>\r\n\r\n<p><strong>For 7+ Months Baby</strong></p>\r\n\r\n<p><strong>Weight : 220G</strong></p>\r\n\r\n<p><strong>Origin : UK</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130 Taka</strong></p>', NULL, 'Heinz Blueberry Multigrain Porridge (From 7+Months) 220G', 'Heinz Blueberry Multigrain Porridge (From 7+Months) 220G', 'Heinz Blueberry Multigrain Porridge (From 7+Months) 220G', 1000, '1720063982.jpg', '2024/07', 111, 0, 0, 0, NULL, 0, 0, 0, NULL, 790, 0, NULL, NULL, '2024-07-04 03:33:02', '2024-07-04 03:33:02'),
(86, 0, 'Heinz Peach Multigrain Porridge (From 7+Months) 220G', 'heinz-peach-multigrain-porridge-from-7-months-220g', 'Simple', 0, 0, 0, '<p>Heinz Peach Multigrain Porridge (From 7+Months) 220G</p>', '<p><strong>With Added Iron</strong></p>\r\n\r\n<p><strong>For 7+ Months Baby</strong></p>\r\n\r\n<p><strong>Weight : 220G</strong></p>\r\n\r\n<p><strong>Origin : UK</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130 Taka</strong></p>', NULL, 'Heinz Peach Multigrain Porridge', 'Heinz Peach Multigrain Porridge', 'Heinz Peach Multigrain Porridge', 1000, '1720064042.jpg', '2024/07', 112, 0, 0, 0, NULL, 0, 0, 0, NULL, 790, 0, NULL, NULL, '2024-07-04 03:34:02', '2024-07-04 03:34:02'),
(87, 0, 'Heinz Pumpkin, Carrot & Sweetcorn Porridge (From 7+Months) 200G', 'heinz-pumpkin-carrot-sweetcorn-porridge-from-7-months-200g', 'Simple', 0, 0, 0, '<p>Heinz Pumpkin, Carrot &amp; Sweetcorn Porridge (7+Months) 200G</p>', '<p><strong>With Added Iron</strong></p>\r\n\r\n<p><strong>Fro 7+ Months Baby</strong></p>\r\n\r\n<p><strong>Weight : 200G</strong></p>\r\n\r\n<p><strong>Origin : UK</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130 Taka</strong></p>', NULL, 'Heinz Pumpkin, Carrot & Sweetcorn Porridge', 'Heinz Pumpkin, Carrot & Sweetcorn Porridge', 'Heinz Pumpkin, Carrot & Sweetcorn Porridge', 1000, '1720064207.jpg', '2024/07', 113, 0, 0, 0, NULL, 0, 0, 0, NULL, 850, 0, NULL, NULL, '2024-07-04 03:36:47', '2024-07-07 06:31:54'),
(88, 1, 'Heinz Baby Rice Porridge (From 6+mnth) 200G', 'heinz-baby-rice-porridge-from-6-mnth-200g', 'Simple', 0, 0, 0, '<p>Heinz Baby Rice Porridge (6+mnth) 200G</p>', '<p><strong>Can be given from 6+ months<br />\r\nWeight : 200 gm<br />\r\nOrigin: UK</strong></p>\r\n\r\n<p><strong>Inside Dhaka Delivery Charge- 80TK<br />\r\nOut of Dhaka City Courier Charge- 130TK</strong></p>', NULL, 'Heinz Baby Rice Porridge', 'Heinz Baby Rice Porridge', 'Heinz Baby Rice Porridge', 1000, '1720064300.jpg', '2024/07', 114, 0, 0, 0, NULL, 0, 0, 0, NULL, 850, 0, NULL, NULL, '2024-07-04 03:38:20', '2024-07-07 06:31:41'),
(89, 1, 'Heinz First Steps Baby Rice with Garden Veg (From 6+ Months) 200G', 'heinz-first-steps-baby-rice-with-garden-veg-from-6-months-200g', 'Simple', 0, 0, 0, '<p>Heinz First Steps Baby Rice with Garden Veg 6+months 200G</p>', '<p><strong>Gluten Free</strong></p>\r\n\r\n<p><strong>Can be given from 6+ months</strong></p>\r\n\r\n<p><strong>Weight : 200 gm</strong></p>\r\n\r\n<p><strong>Origin : UK</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 taka&nbsp;</strong></p>\r\n\r\n<p><strong>Outside Dhaka City 130 taka</strong></p>', NULL, 'Heinz First Steps Baby Rice with Garden Veg', 'Heinz First Steps Baby Rice with Garden Veg', 'Heinz First Steps Baby Rice with Garden Veg', 1000, '1720064378.jpg', '2024/07', 115, 0, 0, 0, NULL, 0, 0, 0, NULL, 850, 0, NULL, NULL, '2024-07-04 03:39:39', '2024-07-07 06:31:30'),
(90, 0, 'Heinz First Steps Multigrain with Carrot, Sweetcorn & Cheese Dinner (From 7+ Months) 200G', 'heinz-first-steps-multigrain-with-carrot-sweetcorn-cheese-dinner-from-7-months-200g', 'Simple', 0, 0, 0, '<p>Heinz First Steps Multigrain with Carrot, Sweetcorn &amp; Cheese Dinner 7+months 200G</p>', '<h3><strong>Description</strong></h3>\r\n\r\n<p>Mixed cereal, pumpkin, carrot, sweetcorn and cheese with fortified milk.</p>\r\n\r\n<p>Easy Peasy Dinnertime. Easy to prepare and with more texture, perfect for a 7+ month baby. With 12 key vitamins and minerals tailored for your little one!<br />\r\nHEINZ FIRST STEPS.<br />\r\n<br />\r\nUse as part of a varied weaning diet.</p>\r\n\r\n<p>With a handy scoop inside.<br />\r\nGluten free.<br />\r\n<br />\r\nWITH IRON WHICH SUPPORTS NORMAL COGNITIVE DEVELOPMENT.<br />\r\nNO ARTIFICIAL FLAVOURS, COLOURS OR PRESERVATIVES.<br />\r\nLITTLE LUMPS.<br />\r\n<br />\r\nSuitable for vegetarians.<br />\r\n<br />\r\nContents are liable to settle after packing. Packaged in a protective atmosphere.</p>\r\n\r\n<h3>Nutrition</h3>\r\n\r\n<p><strong>Table of Nutritional Information</strong></p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">&nbsp;</th>\r\n			<th scope=\"col\">Per 100g</th>\r\n			<th scope=\"col\">Per 30g cereal</th>\r\n			<th scope=\"col\">% LRV* per serving</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th rowspan=\"2\" scope=\"row\">Energy</th>\r\n			<td>1730kJ</td>\r\n			<td>519kJ</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>410kcal</td>\r\n			<td>123kcal</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Fat</th>\r\n			<td>7.9g</td>\r\n			<td>2.4g</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">- of which saturates</th>\r\n			<td>3.5g</td>\r\n			<td>1.1g</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Carbohydrate</th>\r\n			<td>69.2g</td>\r\n			<td>20.8g</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">- of which sugars</th>\r\n			<td>7.5g</td>\r\n			<td>2.3g</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Fibre</th>\r\n			<td>5.3g</td>\r\n			<td>1.6g</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Protein</th>\r\n			<td>12.9g</td>\r\n			<td>3.9g</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Salt</th>\r\n			<td>1.0g</td>\r\n			<td>0.30g</td>\r\n			<td>-</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Table of Vitamins and Minerals Information</strong></p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">&nbsp;</th>\r\n			<th scope=\"col\">Per 100g</th>\r\n			<th scope=\"col\">Per 30g cereal</th>\r\n			<th scope=\"col\">% LRV* per serving</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">Vitamin A</th>\r\n			<td>450&micro;g</td>\r\n			<td>135&micro;g</td>\r\n			<td>34%</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Vitamin D</th>\r\n			<td>11&micro;g</td>\r\n			<td>3.3&micro;g</td>\r\n			<td>33%</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Vitamin E</th>\r\n			<td>11mg</td>\r\n			<td>3.3mg</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Vitamin C</th>\r\n			<td>30mg</td>\r\n			<td>9.0mg</td>\r\n			<td>36%</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Thiamin</th>\r\n			<td>0.6mg</td>\r\n			<td>0.18mg</td>\r\n			<td>36%</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Riboflavin</th>\r\n			<td>0.9mg</td>\r\n			<td>0.27mg</td>\r\n			<td>34%</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Niacin</th>\r\n			<td>10mg</td>\r\n			<td>3.0mg</td>\r\n			<td>33%</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Vitamin B6</th>\r\n			<td>0.8mg</td>\r\n			<td>0.24mg</td>\r\n			<td>34%</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Folic Acid</th>\r\n			<td>110&micro;g</td>\r\n			<td>33&micro;g</td>\r\n			<td>33%</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Vitamin B12</th>\r\n			<td>0.8&micro;g</td>\r\n			<td>0.12&micro;g</td>\r\n			<td>34%</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Calcium</th>\r\n			<td>470mg</td>\r\n			<td>141mg</td>\r\n			<td>35%</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Iron</th>\r\n			<td>7.0mg</td>\r\n			<td>2.1mg</td>\r\n			<td>35%</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Zinc</th>\r\n			<td>4.5mg</td>\r\n			<td>1.4mg</td>\r\n			<td>34%</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h3>Ingredients</h3>\r\n\r\n<ul>\r\n	<li>Vegetables (Pumpkin, Carrot, Sweetcorn),</li>\r\n	<li>&nbsp;</li>\r\n	<li>Flours (58%, Rice, Maize, Millet),</li>\r\n	<li>&nbsp;</li>\r\n	<li>Maltodextrin,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Sustainable Palm Oil,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Cheese (5%, contains&nbsp;Milk),</li>\r\n	<li>&nbsp;</li>\r\n	<li>Skimmed&nbsp;Milk&nbsp;Powder,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Milk&nbsp;Protein,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Natural Flavourings (contain&nbsp;Milk),</li>\r\n	<li>&nbsp;</li>\r\n	<li>Inulin,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Calcium Carbonate,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Yeast Extract,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Vitamin C,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Vitamin E,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Zinc Sulphate,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Niacin,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Iron,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Riboflavin,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Vitamin B6,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Thiamin,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Vitamin A,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Folic Acid,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Vitamin D,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Vitamin B12,</li>\r\n	<li>&nbsp;</li>\r\n	<li>Prepared with 77g Vegetables per 100g Dry Cereal, including 43g Pumpkin, 17g Carrot and 17g Sweetcorn</li>\r\n</ul>\r\n\r\n<h3>Information</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Suitable for Vegetarians</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Free From Gluten</p>\r\n\r\n<p>Contains Milk</p>\r\n\r\n<p>Free From Artificial Colours</p>\r\n\r\n<p>Free From Artificial Flavours</p>\r\n\r\n<p>Free From Artificial Preservatives</p>\r\n\r\n<h3>Preparation</h3>\r\n\r\n<p>Easy prep: JUST ADD WATER. Add 3 spoons of just boiled water to 1 spoon of cereal in a bowl and stir. Allow to stand for approximately 2 minutes so pieces soften. Check the temperature before serving. This is only a guide, you can prepare Heinz cereals to the texture and quantity your baby loves.</p>\r\n\r\n<p>No artificial flavours, colours or preservatives</p>\r\n\r\n<h3>Storage</h3>\r\n\r\n<p>Store in a cool dry place away from odours. Use within 6 weeks of opening.<br />\r\nBest before: see base of pack.</p>\r\n\r\n<p>Delivery Charge Inside Dhaka 80 Taka</p>\r\n\r\n<p>Outside Dhaka 130 Taka</p>', NULL, 'Heinz First Steps Multigrain with Carrot, Sweetcorn & Cheese Dinner', 'Heinz First Steps Multigrain with Carrot, Sweetcorn & Cheese Dinner', 'Heinz First Steps Multigrain with Carrot, Sweetcorn & Cheese Dinner', 1000, '1720064619.jpg', '2024/07', 116, 0, 0, 0, NULL, 0, 0, 0, NULL, 790, 0, NULL, '2024-07-07 06:33:14', '2024-07-04 03:43:46', '2024-07-07 06:33:14'),
(91, 0, 'Heinz Cauliflower, Broccoli & Cheese Multigrain Porridge (From 6+months) 200G', 'heinz-cauliflower-broccoli-cheese-multigrain-porridge-from-6-months-200g', 'Simple', 0, 0, 0, '<p>Heinz Cauliflower Broccoli &amp; Cheese Multigrain Porridge (6+months) 200G</p>', '<h2><strong>Product Description</strong></h2>\r\n\r\n<ul>\r\n	<li>Vegetables, cereals and cheese with fortified milk</li>\r\n	<li>Use as part of a varied weaning diet.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Easy Peasy Dinnertime.</li>\r\n	<li>Heinz savoury meals are easy to prepare and perfect for the first step into weaning, With 12 key vitamins and minerals tailored to your little one!</li>\r\n	<li>Heinz First Steps</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Packaged in a protective atmosphere.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>10 yummy servings</li>\r\n	<li>With a handy scoop inside</li>\r\n	<li>With Iron Which Supports Normal Cognitive Development</li>\r\n	<li>Smooth</li>\r\n	<li>Gluten Free</li>\r\n	<li>No Artificial Flavours, Colours or Preservatives</li>\r\n	<li>Suitable for vegetarians</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Pack size: 200G</li>\r\n</ul>\r\n\r\n<h2><strong>Information</strong></h2>\r\n\r\n<h3><strong>Ingredients</strong></h3>\r\n\r\n<p>Flours (52%, Rice, Maize), Vegetables (Cauliflower, Broccoli, Spinach, Onion), Skimmed&nbsp;<strong>Milk</strong>&nbsp;Powder, Maltodextrin, Sustainable Palm Oil, Cheese (4%, contains&nbsp;<strong>Milk</strong>), Natural Flavourings (contain&nbsp;<strong>Milk</strong>),&nbsp;<strong>Milk</strong>&nbsp;Protein, Inulin, Calcium Carbonate, Vitamin C, Zinc Sulphate, Niacin, Vitamin E, Iron, Riboflavin, Vitamin B6, Thiamin, Vitamin A, Folic Acid, Vitamin D, Vitamin B12</p>\r\n\r\n<h3>Storage</h3>\r\n\r\n<p>Best before: see base of packStore In a cool dry place away from odours. Use within 6 weeks of opening. Contents are liable to settle after packing.</p>\r\n\r\n<h3><strong>Preparation and Usage</strong></h3>\r\n\r\n<ul>\r\n	<li>Easy prep: Just Add Water. Add 3 spoons of warm previously boiled water to 1 spoon of cereal in a bowl and stir. Check temperature before serving. This is only a guide, you can prepare Heinz cereals to the texture and quantity your baby loves.</li>\r\n	<li>Prepared with 47g vegetables per 100g dry cereal, including 29g cauliflower and 13g broccoli.</li>\r\n	<li>\r\n	<h3><strong>Additives</strong></h3>\r\n	</li>\r\n	<li>Free From Artificial Colours</li>\r\n	<li>Free From Artificial Flavours</li>\r\n	<li>Free From Artificial Preservatives</li>\r\n</ul>\r\n\r\n<h3><strong>Lower age limit</strong></h3>\r\n\r\n<p>6 Months</p>\r\n\r\n<h3>Nutrition</h3>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th>Typical Values</th>\r\n			<th>Per 100g</th>\r\n			<th>Per 20g cereal</th>\r\n			<th>LRV* per serving</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>Energy</td>\r\n			<td>1763kJ</td>\r\n			<td>349kJ</td>\r\n		</tr>\r\n		<tr>\r\n			<td>-</td>\r\n			<td>418kcal</td>\r\n			<td>83kcal</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Fat</td>\r\n			<td>7.1g</td>\r\n			<td>1.4g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>-of which saturales</td>\r\n			<td>3.2g</td>\r\n			<td>0.6g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Carbohydrate</td>\r\n			<td>71g</td>\r\n			<td>14g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>-of which sugars</td>\r\n			<td>10.6g</td>\r\n			<td>2.1g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Fibre</td>\r\n			<td>4.2g</td>\r\n			<td>0.8g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Protein</td>\r\n			<td>15.3g</td>\r\n			<td>3.1g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Salt</td>\r\n			<td>0.78g</td>\r\n			<td>0.16g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamin A</td>\r\n			<td>480&micro;g</td>\r\n			<td>96&micro;g</td>\r\n			<td>24%</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamin D</td>\r\n			<td>8&micro;g</td>\r\n			<td>1.6&micro;g</td>\r\n			<td>16%</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamin E</td>\r\n			<td>8mg</td>\r\n			<td>1.6mg</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamin C</td>\r\n			<td>35mg</td>\r\n			<td>7.0mg</td>\r\n			<td>28%</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thiamin</td>\r\n			<td>0.7mg</td>\r\n			<td>0.14mg</td>\r\n			<td>28%</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Riboflavin</td>\r\n			<td>1.0mg</td>\r\n			<td>0.20mg</td>\r\n			<td>25%</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Niacin</td>\r\n			<td>11mg</td>\r\n			<td>2.2mg</td>\r\n			<td>24%</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamin B6</td>\r\n			<td>0.8mg</td>\r\n			<td>0.16mg</td>\r\n			<td>23%</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Folic Acid</td>\r\n			<td>110&micro;g</td>\r\n			<td>22&micro;g</td>\r\n			<td>22%</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Vitamin B12</td>\r\n			<td>0.8&micro;g</td>\r\n			<td>0.16&micro;g</td>\r\n			<td>23%</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Calcium</td>\r\n			<td>490mg</td>\r\n			<td>98mg</td>\r\n			<td>25%</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Iron</td>\r\n			<td>5.5mg</td>\r\n			<td>1.1mg</td>\r\n			<td>18%</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Zinc</td>\r\n			<td>4.5mg</td>\r\n			<td>0.9mg</td>\r\n			<td>23%</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Approximately 10 x 20g servings per pack</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n		<tr>\r\n			<td>*The LRV (Labelling Reference Value) is the amount of vitamin or mineral needed per day to meet the requirements of Infants and young children</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n			<td>-</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>View all Stage 1 (4-6+ months)</p>\r\n\r\n<p>#Origin: UK</p>\r\n\r\n<p>Delivery Charge Inside Dhaka 80 Taka&nbsp;</p>\r\n\r\n<p>Outside Dhaka 130 Taka</p>', NULL, 'Heinz First Steps Multigrain with Carrot, Sweetcorn & Cheese DinnerHeinz Cauliflower, Broccoli & Cheese Multigrain Porridge', 'Heinz Cauliflower, Broccoli & Cheese Multigrain Porridge', 'Heinz Cauliflower, Broccoli & Cheese Multigrain Porridge', 1000, '1720070446.jpg', '2024/07', 119, 0, 0, 0, NULL, 0, 0, 0, NULL, 790, 0, NULL, NULL, '2024-07-04 03:43:54', '2024-07-04 05:20:46'),
(92, 1, 'Sunsilk Hair Fall Solution Conditioning Smoothies 300ml', 'sunsilk-hair-fall-solution-conditioning-smoothies-300ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Hair Fall Solution Conditioning Smoothies</strong></p>', '<h2>&nbsp;</h2>\r\n\r\n<ul>\r\n	<li><strong>Almond Oil, Soy Protein And Vitamin E</strong></li>\r\n	<li><strong>Up to 9x Less Hair Fall</strong></li>\r\n	<li><strong>48H Perfume Touch</strong></li>\r\n</ul>\r\n\r\n<p><strong>Weight : 300ml</strong></p>\r\n\r\n<p><strong>Manufacture In Thailand</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130 Taka</strong></p>', NULL, 'Sunsilk Hair Fall Solution Conditioning Smoothies', 'Sunsilk Hair Fall Solution Conditioning Smoothies', 'Sunsilk Hair Fall Solution Conditioning Smoothies', 1000, '1720337364.jpg', '2024/07', 122, 0, 0, 0, NULL, 0, 0, 0, NULL, 850, 0, NULL, NULL, '2024-07-07 07:29:34', '2024-07-07 07:29:38'),
(93, 1, 'Sunsilk Damage Restore Conditioning Smoothies 300ml', 'sunsilk-damage-restore-conditioning-smoothies-300ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Damage Restore Conditioning Smoothies</strong></p>', '<ul>\r\n	<li><strong>Avocado Oil, Goji Berry+Protein And Multi-Vitamins</strong></li>\r\n	<li><strong>Repairs The Signs of Damage from The 1st Wash</strong></li>\r\n	<li><strong>48H Perfume Touch</strong></li>\r\n</ul>\r\n\r\n<p><strong>Weight : 300ml</strong></p>\r\n\r\n<p><strong>Manufacture In Thailand</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130 Taka</strong></p>', NULL, 'Sunsilk Damage Restore Conditioning Smoothies', 'Sunsilk Damage Restore Conditioning Smoothies', 'Sunsilk Damage Restore Conditioning Smoothies', 1000, '1720337497.jpg', '2024/07', 123, 0, 0, 0, NULL, 0, 0, 0, NULL, 850, 0, NULL, NULL, '2024-07-07 07:31:39', '2024-07-07 07:31:40'),
(94, 1, 'Sunsilk Lively Clean & Fresh Conditioning Smoothies 300ml', 'sunsilk-lively-clean-fresh-conditioning-smoothies-300ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Lively Clean &amp; Fresh Conditioning Smoothies</strong></p>', '<ul>\r\n	<li><strong>Citrus Oil, Aloe Vera Protein And Vitamin C</strong></li>\r\n	<li><strong>Detoxify Scalp And Long Lasting Freshness</strong></li>\r\n	<li><strong>48H Perfume Touch</strong></li>\r\n</ul>\r\n\r\n<p><strong>Weight : 300ml</strong></p>\r\n\r\n<p><strong>Manufacture In Thailand</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130 Taka</strong></p>', NULL, 'Sunsilk Lively Clean & Fresh Conditioning Smoothies', 'Sunsilk Lively Clean & Fresh Conditioning Smoothies', 'Sunsilk Lively Clean & Fresh Conditioning Smoothies', 1000, '1720337557.jpg', '2024/07', 124, 0, 0, 0, NULL, 0, 0, 0, NULL, 850, 0, NULL, NULL, '2024-07-07 07:32:37', '2024-07-07 07:32:37'),
(95, 1, 'Sunsilk Smooth & Manageable Conditioning Smoothies 300ml', 'sunsilk-smooth-manageable-conditioning-smoothies-300ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Smooth &amp; Manageable Conditioning Smoothies</strong></p>', '<ul>\r\n	<li><strong>Argan Oil, Raspberry+Protein And Vitamin E</strong></li>\r\n	<li><strong>More Manageable And Fragrant All Day</strong></li>\r\n	<li><strong>48H Perfume Touch</strong></li>\r\n</ul>\r\n\r\n<p><strong>Weight : 300ml</strong></p>\r\n\r\n<p><strong>Manufacture In Thailand</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130 Taka</strong></p>', NULL, 'Sunsilk Smooth & Manageable Conditioning Smoothies', 'Sunsilk Smooth & Manageable Conditioning Smoothies', 'Sunsilk Smooth & Manageable Conditioning Smoothies', 1000, '1720337632.jpg', '2024/07', 125, 0, 0, 0, NULL, 0, 0, 0, NULL, 850, 0, NULL, NULL, '2024-07-07 07:33:52', '2024-07-07 07:33:52'),
(96, 1, 'Sunsilk Soft & Smooth Conditioning Smoothies 300ml', 'sunsilk-soft-smooth-conditioning-smoothies-300ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Soft &amp; Smooth Conditioning Smoothies</strong></p>', '<ul>\r\n	<li><strong>Light Natural Oil, Almond+Protein And Vitamin E</strong></li>\r\n	<li><strong>5X Smoother And Softer Hair</strong></li>\r\n	<li><strong>48H Perfume Touch</strong></li>\r\n</ul>\r\n\r\n<p><strong>Weight : 300ml</strong></p>\r\n\r\n<p><strong>Manufacture In Thailand</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130 Taka</strong></p>', NULL, 'Sunsilk Soft & Smooth Conditioning Smoothies', 'Sunsilk Soft & Smooth Conditioning Smoothies', 'Sunsilk Soft & Smooth Conditioning Smoothies', 1000, '1720337695.jpg', '2024/07', 126, 0, 0, 0, NULL, 0, 0, 0, NULL, 850, 0, NULL, NULL, '2024-07-07 07:34:56', '2024-07-07 07:34:56'),
(97, 1, 'Sunsilk Colore Vibrante Shampoo 400ml', 'sunsilk-colore-vibrante-shampoo-400ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Colore Vibrante Shampoo</strong></p>', '<ul>\r\n	<li><strong>Weight 400ml</strong></li>\r\n	<li><strong>Origin : Italy</strong></li>\r\n	<li><strong>Delivery Charge Inside Dhaka 80 Taka</strong></li>\r\n	<li><strong>Outiside Dhaka 130 Taka</strong></li>\r\n</ul>', NULL, 'Sunsilk Colore Vibrante Shampoo', 'Sunsilk Colore Vibrante Shampoo', 'Sunsilk Colore Vibrante Shampoo', 1000, '1720337771.jpg', '2024/07', 127, 0, 0, 0, NULL, 0, 0, 0, NULL, 950, 0, NULL, NULL, '2024-07-07 07:36:11', '2024-07-07 07:36:11'),
(98, 1, 'Sunsilk Ricarica Naturale Olio D\' Argan & Di Mandorle Shampoo 400ml', 'sunsilk-ricarica-naturale-olio-d-argan-di-mandorle-shampoo-400ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Ricarica Naturale Olio D&#39; Argan &amp; Di Mandorle Shampoo</strong></p>', '<ul>\r\n	<li><strong>Weight 400ml</strong></li>\r\n	<li><strong>Origin : Italy</strong></li>\r\n	<li><strong>Delivery Charge Inside Dhaka 80 Taka</strong></li>\r\n	<li><strong>Outiside Dhaka 130 Taka</strong></li>\r\n</ul>', NULL, 'Sunsilk Ricarica Naturale Olio D\' Argan & Di Mandorle Shampoo', 'Sunsilk Ricarica Naturale Olio D\' Argan & Di Mandorle Shampoo', 'Sunsilk Ricarica Naturale Olio D\' Argan & Di Mandorle Shampoo', 1000, '1720337850.jpg', '2024/07', 128, 0, 0, 0, NULL, 0, 0, 0, NULL, 950, 0, NULL, NULL, '2024-07-07 07:37:30', '2024-07-07 07:37:30'),
(99, 1, 'Sunsilk Soft & Smooth Shampoo 350ml', 'sunsilk-soft-smooth-shampoo-350ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Soft &amp; Smooth Shampoo</strong></p>', '<p><strong>Weight : 350ml</strong></p>\r\n\r\n<p><strong>Origin : UAE</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130&nbsp;Taka</strong></p>', NULL, 'Sunsilk Soft & Smooth Shampoo', 'Sunsilk Soft & Smooth Shampoo', 'Sunsilk Soft & Smooth Shampoo', 1000, '1720337964.jpg', '2024/07', 129, 0, 0, 0, NULL, 0, 0, 0, NULL, 890, 0, NULL, NULL, '2024-07-07 07:39:24', '2024-07-07 07:39:24'),
(100, 1, 'Sunsilk Healthier & Long Shampoo 280ml', 'sunsilk-healthier-long-shampoo-280ml', 'Simple', 0, 0, 0, '<p>Sunsilk Healthier &amp; Long Shampoo</p>', '<p><strong>Weight : 280ml</strong></p>\r\n\r\n<p><strong>Origin : Thailand</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130 Taka</strong></p>', NULL, 'Sunsilk Healthier & Long Shampoo', 'Sunsilk Healthier & Long Shampoo', 'Sunsilk Healthier & Long Shampoo', 1000, '1720338310.jpg', '2024/07', 130, 0, 0, 0, NULL, 0, 0, 0, NULL, 750, 0, NULL, NULL, '2024-07-07 07:45:10', '2024-07-07 07:45:12'),
(101, 1, 'Sunsilk Hair Fall Solution Shampoo 625ml', 'sunsilk-hair-fall-solution-shampoo-625ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Hair Fall Solution Shampoo</strong></p>', '<p><strong>Up To 9X Less Hair Fall</strong></p>\r\n\r\n<ul>\r\n	<li><strong>Almond Oil, Soy Protein and Vitamin E</strong></li>\r\n</ul>\r\n\r\n<p><strong>Weight : 625ml</strong></p>\r\n\r\n<p><strong>Origin : Thailand</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130 Taka</strong></p>', NULL, 'Sunsilk Hair Fall Solution Shampoo', 'Sunsilk Hair Fall Solution Shampoo', 'Sunsilk Hair Fall Solution Shampoo', 1000, '1720338398.jpg', '2024/07', 131, 0, 0, 0, NULL, 0, 0, 0, NULL, 1300, 0, NULL, NULL, '2024-07-07 07:46:38', '2024-07-07 07:46:39');
INSERT INTO `products` (`id`, `status`, `title`, `slug`, `type`, `featured`, `clearance_sale`, `spacial_offer`, `short_description`, `description`, `brand_id`, `meta_title`, `meta_description`, `meta_tags`, `position`, `image`, `image_path`, `media_id`, `stock`, `stock_alert_quantity`, `stock_pre_alert_quantity`, `custom_label`, `view`, `average_rating`, `total_review`, `expire_date`, `sale_price`, `regular_price`, `attribute_items_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(102, 1, 'Sunsilk Black Shine Shampoo 625ml', 'sunsilk-black-shine-shampoo-625ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Black Shine Shampoo</strong></p>', '<p><strong>For Shiny Dark, Black Hair</strong></p>\r\n\r\n<ul>\r\n	<li><strong>Henna + Oil, Pear &amp; Vitamin E</strong></li>\r\n</ul>\r\n\r\n<p><strong>Weight : 625ml</strong></p>\r\n\r\n<p><strong>Origin : Thailand</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130 Taka</strong></p>', NULL, 'Sunsilk Black Shine Shampoo', 'Sunsilk Black Shine Shampoo', 'Sunsilk Black Shine Shampoo', 1000, '1720338494.jpg', '2024/07', 132, 0, 0, 0, NULL, 0, 0, 0, NULL, 1300, 0, NULL, NULL, '2024-07-07 07:48:21', '2024-07-07 07:48:23'),
(103, 1, 'Sunsilk Instant Repair Shampoo 600ml', 'sunsilk-instant-repair-shampoo-600ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Instant Repair Shampoo</strong></p>', '<ul>\r\n	<li><strong>Active-Infusion + Keratin, Almond Oil &amp; Vitamin C</strong></li>\r\n</ul>\r\n\r\n<p><strong>Weight : 600ml</strong></p>\r\n\r\n<p><strong>Origin : Saudi Arabia</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130 Taka</strong></p>', NULL, 'Sunsilk Instant Repair Shampoo 600ml', 'Sunsilk Instant Repair Shampoo 600ml', 'Sunsilk Instant Repair Shampoo 600ml', 1000, '1720338624.jpg', '2024/07', 133, 0, 0, 0, NULL, 0, 0, 0, NULL, 1050, 0, NULL, NULL, '2024-07-07 07:50:26', '2024-07-07 07:51:04'),
(104, 1, 'Sunsilk Hairfall Solution Shampoo 700ml', 'sunsilk-hairfall-solution-shampoo-700ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Hairfall Solution Shampoo</strong></p>', '<ul>\r\n	<li><strong>Active-Infusion + Vitamin B3, Soy Protein &amp; Castor Oil</strong></li>\r\n</ul>\r\n\r\n<p><strong>Weight : 700ml</strong></p>\r\n\r\n<p><strong>Origin : Saudi Arabia</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130 Taka</strong></p>', NULL, 'Sunsilk Hairfall Solution Shampoo', 'Sunsilk Hairfall Solution Shampoo', 'Sunsilk Hairfall Solution Shampoo', 1000, '1720338756.jpg', '2024/07', 134, 0, 0, 0, NULL, 0, 0, 0, NULL, 1250, 0, NULL, NULL, '2024-07-07 07:52:45', '2024-07-07 08:00:28'),
(105, 1, 'Sunsilk Instant Restore Shampoo 700ml', 'sunsilk-instant-restore-shampoo-700ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Co-Creation Instant Restore Shampoo</strong></p>', '<p><strong>helps repair signs of damage from the 1st wash</strong></p>\r\n\r\n<p><strong>Weight : 700ml</strong></p>\r\n\r\n<p><strong>Origin : Saudi Arabia</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 150 Taka</strong></p>', NULL, 'Sunsilk Instant Restore Shampoo', 'Sunsilk Instant Restore Shampoo', 'Sunsilk Instant Restore Shampoo', 1000, '1720338891.jpg', '2024/07', 135, 0, 0, 0, NULL, 0, 0, 0, NULL, 1250, 0, NULL, NULL, '2024-07-07 07:54:56', '2024-07-07 07:59:58'),
(106, 1, 'Sunsilk Strength & Shine Shampoo 600ml', 'sunsilk-strength-shine-shampoo-600ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Strength &amp; Shine&nbsp;Shampoo</strong></p>', '<p><strong>with provitamin B5, argenine &amp; coconut oil</strong></p>\r\n\r\n<p><strong>Weight : 600ml</strong></p>\r\n\r\n<p><strong>Origin : Saudi Arabia</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 150 Taka</strong></p>', NULL, 'Sunsilk Strength & Shine Shampoo', 'Sunsilk Strength & Shine Shampoo', 'Sunsilk Strength & Shine Shampoo', 1000, '1720339655.jpg', '2024/07', 136, 0, 0, 0, NULL, 0, 0, 0, NULL, 1050, 0, NULL, NULL, '2024-07-07 08:07:58', '2024-07-07 08:08:05'),
(107, 1, 'Sunsilk Stunning Black Shine Shampoo 600ml', 'sunsilk-stunning-black-shine-shampoo-600ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Stunning Black Shine Shampoo</strong></p>', '<p><strong>with amla, pearl protein &amp; vitamin E</strong></p>\r\n\r\n<p><strong>Weight : 600ml</strong></p>\r\n\r\n<p><strong>Origin : Saudi Arabia</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 150 Taka</strong></p>', NULL, 'Sunsilk Stunning Black Shine Shampoo', 'Sunsilk Stunning Black Shine Shampoo', 'Sunsilk Stunning Black Shine Shampoo', 1000, '1720339910.jpg', '2024/07', 137, 0, 0, 0, NULL, 0, 0, 0, NULL, 1050, 0, NULL, NULL, '2024-07-07 08:11:53', '2024-07-07 08:12:18'),
(108, 1, 'Sunsilk Soft & Smooth Shampoo 700ml', 'sunsilk-soft-smooth-shampoo-700ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Soft &amp; Smooth Shampoo</strong></p>', '<p><strong>with argan oil &amp; vitamin C</strong></p>\r\n\r\n<p><strong>Weight : 700ml</strong></p>\r\n\r\n<p><strong>Origin : Saudi Arabia</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130 Taka</strong></p>', NULL, 'Sunsilk Soft & Smooth Shampoo', 'Sunsilk Soft & Smooth Shampoo', 'Sunsilk Soft & Smooth Shampoo', 1000, '1720340010.jpg', '2024/07', 138, 0, 0, 0, NULL, 0, 0, 0, NULL, 1250, 0, NULL, NULL, '2024-07-07 08:13:31', '2024-07-07 08:13:40'),
(109, 1, 'Sunsilk Natural Recharge Thick & Long Shampoo 600ml', 'sunsilk-natural-recharge-thick-long-shampoo-600ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Natural Recharge Thick &amp; Long Shampoo</strong></p>', '<p><strong>with biotin &amp; castor oil</strong></p>\r\n\r\n<p><strong>Weight : 600ml</strong></p>\r\n\r\n<p><strong>Origin : Saudi Arabia</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 150 Taka</strong></p>', NULL, 'Sunsilk by Noor Star Thick & Long Shampoo', 'Sunsilk by Noor Star Thick & Long Shampoo', 'Sunsilk by Noor Star Thick & Long Shampoo', 1000, '1720340594.jpg', '2024/07', 139, 0, 0, 0, NULL, 0, 0, 0, NULL, 1050, 0, NULL, NULL, '2024-07-07 08:23:19', '2024-07-07 08:23:38'),
(110, 1, 'Sunsilk Soft & Smooth Conditioning Smoothies 625ml', 'sunsilk-soft-smooth-conditioning-smoothies-625ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Soft &amp; Smooth Conditioning Smoothies</strong></p>', '<ul>\r\n	<li><strong>Weight : 625ml</strong></li>\r\n	<li><strong>Origin : Thailand</strong></li>\r\n	<li><strong>Delivery Charge Inside Dhaka 80 Taka</strong></li>\r\n	<li><strong>Outside Dhaka 130 Taka</strong></li>\r\n</ul>', NULL, 'Sunsilk Soft & Smooth Conditioning Smoothies', 'Sunsilk Soft & Smooth Conditioning Smoothies', 'Sunsilk Soft & Smooth Conditioning Smoothies', 1000, '1720340821.jpg', '2024/07', 140, 0, 0, 0, NULL, 0, 0, 0, NULL, 1350, 0, NULL, NULL, '2024-07-07 08:27:01', '2024-07-07 08:27:02'),
(111, 1, 'Sunsilk Smooth & Manageable Conditioning Smoothies 625ml', 'sunsilk-smooth-manageable-conditioning-smoothies-625ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Smooth &amp; Manageable Conditioning Smoothies</strong></p>', '<ul>\r\n	<li><strong>Weight : 625ml</strong></li>\r\n	<li><strong>Origin : Thailand</strong></li>\r\n	<li><strong>Delivery Charge Inside Dhaka 80 Taka</strong></li>\r\n	<li><strong>Outside Dhaka 130 Taka</strong></li>\r\n</ul>', NULL, 'Sunsilk Smooth & Manageable Conditioning Smoothies', 'Sunsilk Smooth & Manageable Conditioning Smoothies', 'Sunsilk Smooth & Manageable Conditioning Smoothies', 1000, '1720340879.jpg', '2024/07', 141, 0, 0, 0, NULL, 0, 0, 0, NULL, 1350, 0, NULL, NULL, '2024-07-07 08:28:00', '2024-07-07 08:28:00'),
(112, 1, 'Sunsilk Co-Creations Ricostruzione Intensiva Shampoo 400ml', 'sunsilk-co-creations-ricostruzione-intensiva-shampoo-400ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Co-Creations Ricostruzione Intensiva Shampoo</strong>&nbsp;</p>', '<ul>\r\n	<li><strong>Weight : 400ml</strong></li>\r\n	<li><strong>Origin : Italy</strong></li>\r\n	<li><strong>Delivery Charge Inside Dhaka 80 Taka</strong></li>\r\n	<li><strong>Outside Dhaka 130 Taka</strong></li>\r\n</ul>', NULL, 'Sunsilk Co-Creations Ricostruzione Intensiva Shampoo', 'Sunsilk Co-Creations Ricostruzione Intensiva Shampoo', 'Sunsilk Co-Creations Ricostruzione Intensiva Shampoo', 1000, '1720341074.jpg', '2024/07', 142, 0, 0, 0, NULL, 0, 0, 0, NULL, 950, 0, NULL, NULL, '2024-07-07 08:31:14', '2024-07-07 08:31:15'),
(113, 1, 'Sunsilk Hijab Refresh Shampoo 300ml', 'sunsilk-hijab-refresh-shampoo-300ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Hijab Refresh Shampoo</strong></p>', '<p><strong>Weight : 300ml</strong></p>\r\n\r\n<p><strong>Origin : Thailand</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130&nbsp;Taka</strong></p>', NULL, 'Sunsilk Hijab Refresh Shampoo', 'Sunsilk Hijab Refresh Shampoo', 'Sunsilk Hijab Refresh Shampoo', 1000, '1720341511.jpg', '2024/07', 143, 0, 0, 0, NULL, 0, 0, 0, NULL, 850, 0, NULL, NULL, '2024-07-07 08:38:32', '2024-07-07 08:38:32'),
(114, 1, 'Sunsilk Coconut Moisture Shampoo 400ml', 'sunsilk-coconut-moisture-shampoo-400ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Coconut Moisture Shampoo</strong></p>', '<p><strong>Weight : 400ml</strong></p>\r\n\r\n<p><strong>Origin : Saudi Arabia</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130&nbsp;Taka</strong></p>', NULL, 'Sunsilk Coconut Moisture Shampoo', 'Sunsilk Coconut Moisture Shampoo', 'Sunsilk Coconut Moisture Shampoo', 1000, '1720341994.jpg', '2024/07', 144, 0, 0, 0, NULL, 0, 0, 0, NULL, 950, 0, NULL, NULL, '2024-07-07 08:46:35', '2024-07-07 08:46:35'),
(115, 1, 'Sunsilk Instant Repair Serum Conditioner 350ml', 'sunsilk-instant-repair-serum-conditioner-350ml', 'Simple', 0, 0, 0, '<p>Sunsilk Instant Repair Serum Conditioner</p>', '<p><strong>Weight : 350ml</strong></p>\r\n\r\n<p><strong>Origin : Saudi Arabia</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130&nbsp;Taka</strong></p>', NULL, 'Sunsilk Instant Repair Serum Conditioner', 'Sunsilk Instant Repair Serum Conditioner', 'Sunsilk Instant Repair Serum Conditioner', 1000, '1720343272.jpg', '2024/07', 145, 0, 0, 0, NULL, 0, 0, 0, NULL, 950, 0, NULL, NULL, '2024-07-07 09:07:53', '2024-07-07 09:07:53'),
(116, 1, 'Sunsilk Soft & Smooth Serum Conditioner 350ml', 'sunsilk-soft-smooth-serum-conditioner-350ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Soft &amp; Smooth Serum Conditioner</strong></p>', '<p><strong>Weight : 350ml</strong></p>\r\n\r\n<p><strong>Origin : Saudi Arabia</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130&nbsp;Taka</strong></p>', NULL, 'Sunsilk Soft & Smooth Serum Conditioner', 'Sunsilk Soft & Smooth Serum Conditioner', 'Sunsilk Soft & Smooth Serum Conditioner', 1000, '1720343363.jpg', '2024/07', 146, 0, 0, 0, NULL, 0, 0, 0, NULL, 950, 0, NULL, NULL, '2024-07-07 09:09:24', '2024-07-07 09:09:24'),
(117, 1, 'Sunsilk Strength & Shine Serum Conditioner 350ml', 'sunsilk-strength-shine-serum-conditioner-350ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Strength &amp; Shine Serum Conditioner</strong></p>', '<p><strong>Weight : 350ml</strong></p>\r\n\r\n<p><strong>Origin : Saudi Arabia</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130&nbsp;Taka</strong></p>', NULL, 'Sunsilk Strength & Shine Serum Conditioner', 'Sunsilk Strength & Shine Serum Conditioner', 'Sunsilk Strength & Shine Serum Conditioner', 1000, '1720343640.jpg', '2024/07', 147, 0, 0, 0, NULL, 0, 0, 0, NULL, 950, 0, NULL, NULL, '2024-07-07 09:14:01', '2024-07-07 09:14:01'),
(118, 1, 'Sunsilk Natural Recharge Shea Butter Nourishment Conditioner 350ml', 'sunsilk-natural-recharge-shea-butter-nourishment-conditioner-350ml', 'Simple', 0, 0, 0, '<p><strong>Sunsilk Natural Recharge Shea Butter Nourishment Conditioner</strong></p>', '<p><strong>Weight : 350ml</strong></p>\r\n\r\n<p><strong>Origin : Saudi Arabia</strong></p>\r\n\r\n<p><strong>Delivery Charge Inside Dhaka 80 Taka</strong></p>\r\n\r\n<p><strong>Outside Dhaka 130&nbsp;Taka</strong></p>', NULL, 'Sunsilk Natural Recharge Shea Butter Nourishment Conditioner', 'Sunsilk Natural Recharge Shea Butter Nourishment Conditioner', 'Sunsilk Natural Recharge Shea Butter Nourishment Conditioner', 1000, '1720343707.jpg', '2024/07', 148, 0, 0, 0, NULL, 0, 0, 0, NULL, 950, 0, NULL, NULL, '2024-07-07 09:15:07', '2024-07-07 09:15:07'),
(119, 1, 'Sunsilk Natural Coconut Hydration Shampoo 450ml', 'sunsilk-natural-coconut-hydration-shampoo-450ml', 'Simple', 0, 0, 0, '<p>Sunsilk Natural Coconut Hydration Shampoo</p>', '<p>Quantity- 450 ml</p>\r\n\r\n<p>Made in- Thailand</p>\r\n\r\n<p>Delivery Charge: Dhaka City: 80tk (Home Delivery)</p>\r\n\r\n<p>Out of Dhaka: 150tk (courier charge)&nbsp;</p>', NULL, 'Sunsilk Natural Coconut Hydration Shampoo', 'Sunsilk Natural Coconut Hydration Shampoo', 'Sunsilk Natural Coconut Hydration Shampoo', 1000, '1720343773.jpg', '2024/07', 149, 0, 0, 0, NULL, 0, 0, 0, NULL, 1150, 0, NULL, NULL, '2024-07-07 09:16:13', '2024-07-07 09:16:13');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `attribute_id` bigint UNSIGNED NOT NULL,
  `type` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Simple',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_id`, `category_id`, `created_at`, `updated_at`) VALUES
(3, 2, 5, '2024-06-21 10:44:02', '2024-06-21 10:44:02'),
(4, 1, 5, '2024-06-21 10:45:04', '2024-06-21 10:45:04'),
(5, 3, 5, '2024-06-21 11:44:47', '2024-06-21 11:44:47'),
(6, 4, 5, '2024-06-21 11:46:51', '2024-06-21 11:46:51'),
(7, 5, 6, '2024-06-21 11:49:03', '2024-06-21 11:49:03'),
(8, 6, 6, '2024-06-21 11:52:23', '2024-06-21 11:52:23'),
(9, 7, 6, '2024-06-21 11:54:05', '2024-06-21 11:54:05'),
(10, 8, 6, '2024-06-21 11:55:38', '2024-06-21 11:55:38'),
(11, 9, 7, '2024-06-21 12:03:36', '2024-06-21 12:03:36'),
(12, 10, 7, '2024-06-21 12:05:54', '2024-06-21 12:05:54'),
(13, 11, 7, '2024-06-21 12:08:15', '2024-06-21 12:08:15'),
(14, 12, 7, '2024-06-21 12:10:24', '2024-06-21 12:10:24'),
(15, 13, 8, '2024-06-21 12:14:18', '2024-06-21 12:14:18'),
(16, 14, 8, '2024-06-21 12:20:35', '2024-06-21 12:20:35'),
(17, 15, 8, '2024-06-21 12:26:19', '2024-06-21 12:26:19'),
(18, 16, 8, '2024-06-21 12:29:29', '2024-06-21 12:29:29'),
(19, 17, 9, '2024-06-21 12:45:40', '2024-06-21 12:45:40'),
(20, 18, 9, '2024-06-21 12:46:59', '2024-06-21 12:46:59'),
(21, 19, 25, '2024-06-22 10:32:13', '2024-06-22 10:32:13'),
(22, 20, 25, '2024-06-22 10:33:50', '2024-06-22 10:33:50'),
(23, 21, 25, '2024-06-22 10:36:53', '2024-06-22 10:36:53'),
(24, 22, 26, '2024-06-22 10:45:38', '2024-06-22 10:45:38'),
(25, 23, 26, '2024-06-22 10:49:56', '2024-06-22 10:49:56'),
(26, 24, 26, '2024-06-24 03:10:23', '2024-06-24 03:10:23'),
(27, 25, 26, '2024-06-24 03:13:40', '2024-06-24 03:13:40'),
(28, 26, 26, '2024-06-24 03:14:57', '2024-06-24 03:14:57'),
(29, 27, 26, '2024-06-24 03:16:04', '2024-06-24 03:16:04'),
(30, 28, 26, '2024-06-24 03:18:20', '2024-06-24 03:18:20'),
(31, 29, 26, '2024-06-24 03:20:27', '2024-06-24 03:20:27'),
(32, 30, 27, '2024-06-24 03:24:52', '2024-06-24 03:24:52'),
(33, 31, 27, '2024-06-24 03:26:31', '2024-06-24 03:26:31'),
(34, 32, 27, '2024-06-24 03:27:46', '2024-06-24 03:27:46'),
(35, 33, 27, '2024-06-24 03:28:41', '2024-06-24 03:28:41'),
(36, 34, 8, '2024-06-24 03:40:40', '2024-06-24 03:40:40'),
(37, 35, 8, '2024-06-24 03:42:48', '2024-06-24 03:42:48'),
(38, 36, 8, '2024-06-24 03:43:47', '2024-06-24 03:43:47'),
(39, 37, 8, '2024-06-24 03:46:47', '2024-06-24 03:46:47'),
(40, 38, 8, '2024-06-24 03:48:25', '2024-06-24 03:48:25'),
(41, 39, 28, '2024-06-24 03:55:52', '2024-06-24 03:55:52'),
(42, 40, 28, '2024-06-24 03:57:02', '2024-06-24 03:57:02'),
(43, 41, 28, '2024-06-24 04:00:34', '2024-06-24 04:00:34'),
(44, 42, 28, '2024-06-24 04:01:49', '2024-06-24 04:01:49'),
(45, 43, 28, '2024-06-24 04:03:20', '2024-06-24 04:03:20'),
(46, 44, 28, '2024-06-24 04:04:24', '2024-06-24 04:04:24'),
(47, 45, 28, '2024-06-24 04:06:18', '2024-06-24 04:06:18'),
(48, 46, 28, '2024-06-24 04:08:21', '2024-06-24 04:08:21'),
(49, 47, 29, '2024-06-24 04:38:51', '2024-06-24 04:38:51'),
(50, 48, 29, '2024-06-24 04:41:05', '2024-06-24 04:41:05'),
(51, 49, 29, '2024-06-24 04:45:54', '2024-06-24 04:45:54'),
(52, 50, 29, '2024-06-24 05:02:39', '2024-06-24 05:02:39'),
(53, 51, 29, '2024-06-24 05:08:43', '2024-06-24 05:08:43'),
(54, 52, 29, '2024-06-24 05:09:56', '2024-06-24 05:09:56'),
(55, 53, 29, '2024-06-24 05:11:26', '2024-06-24 05:11:26'),
(56, 54, 29, '2024-06-24 05:12:54', '2024-06-24 05:12:54'),
(57, 55, 30, '2024-06-24 06:24:09', '2024-06-24 06:24:09'),
(58, 56, 30, '2024-06-24 06:24:59', '2024-06-24 06:24:59'),
(59, 57, 30, '2024-06-24 06:25:45', '2024-06-24 06:25:45'),
(60, 58, 30, '2024-06-24 06:26:31', '2024-06-24 06:26:31'),
(61, 59, 31, '2024-06-24 06:33:41', '2024-06-24 06:33:41'),
(62, 60, 31, '2024-06-24 06:35:27', '2024-06-24 06:35:27'),
(63, 61, 31, '2024-06-24 06:38:27', '2024-06-24 06:38:27'),
(64, 62, 32, '2024-06-24 06:42:39', '2024-06-24 06:42:39'),
(65, 63, 3, '2024-06-24 10:53:02', '2024-06-24 10:53:02'),
(66, 64, 9, '2024-07-01 07:52:14', '2024-07-01 07:52:14'),
(67, 65, 9, '2024-07-01 07:56:08', '2024-07-01 07:56:08'),
(68, 66, 9, '2024-07-01 07:57:56', '2024-07-01 07:57:56'),
(69, 67, 9, '2024-07-01 07:59:30', '2024-07-01 07:59:30'),
(70, 68, 9, '2024-07-01 08:06:34', '2024-07-01 08:06:34'),
(71, 69, 9, '2024-07-01 08:09:25', '2024-07-01 08:09:25'),
(72, 70, 9, '2024-07-01 08:10:58', '2024-07-01 08:10:58'),
(73, 71, 9, '2024-07-01 08:12:37', '2024-07-01 08:12:37'),
(74, 72, 9, '2024-07-01 08:15:18', '2024-07-01 08:15:18'),
(75, 73, 9, '2024-07-01 08:18:49', '2024-07-01 08:18:49'),
(76, 74, 9, '2024-07-01 08:19:54', '2024-07-01 08:19:54'),
(77, 75, 3, '2024-07-02 08:31:11', '2024-07-02 08:31:11'),
(78, 76, 3, '2024-07-02 08:32:32', '2024-07-02 08:32:32'),
(79, 77, 3, '2024-07-02 09:04:47', '2024-07-02 09:04:47'),
(80, 78, 3, '2024-07-02 09:05:50', '2024-07-02 09:05:50'),
(81, 79, 3, '2024-07-02 09:19:26', '2024-07-02 09:19:26'),
(82, 80, 3, '2024-07-03 05:06:47', '2024-07-03 05:06:47'),
(83, 81, 3, '2024-07-03 05:09:02', '2024-07-03 05:09:02'),
(84, 82, 3, '2024-07-03 05:21:33', '2024-07-03 05:21:33'),
(85, 83, 3, '2024-07-03 10:09:53', '2024-07-03 10:09:53'),
(86, 84, 3, '2024-07-03 10:25:33', '2024-07-03 10:25:33'),
(87, 85, 3, '2024-07-04 03:33:02', '2024-07-04 03:33:02'),
(88, 86, 3, '2024-07-04 03:34:02', '2024-07-04 03:34:02'),
(89, 87, 3, '2024-07-04 03:36:47', '2024-07-04 03:36:47'),
(90, 88, 3, '2024-07-04 03:38:20', '2024-07-04 03:38:20'),
(91, 89, 3, '2024-07-04 03:39:43', '2024-07-04 03:39:43'),
(92, 90, 3, '2024-07-04 03:44:00', '2024-07-04 03:44:00'),
(93, 91, 3, '2024-07-04 03:44:07', '2024-07-04 03:44:07'),
(94, 92, 34, '2024-07-07 07:29:36', '2024-07-07 07:29:36'),
(95, 93, 34, '2024-07-07 07:31:40', '2024-07-07 07:31:40'),
(96, 94, 34, '2024-07-07 07:32:37', '2024-07-07 07:32:37'),
(97, 95, 34, '2024-07-07 07:33:52', '2024-07-07 07:33:52'),
(98, 96, 34, '2024-07-07 07:34:56', '2024-07-07 07:34:56'),
(99, 97, 34, '2024-07-07 07:36:11', '2024-07-07 07:36:11'),
(100, 98, 34, '2024-07-07 07:37:30', '2024-07-07 07:37:30'),
(101, 99, 34, '2024-07-07 07:39:24', '2024-07-07 07:39:24'),
(102, 100, 34, '2024-07-07 07:45:11', '2024-07-07 07:45:11'),
(103, 101, 34, '2024-07-07 07:46:39', '2024-07-07 07:46:39'),
(104, 102, 34, '2024-07-07 07:48:22', '2024-07-07 07:48:22'),
(105, 103, 34, '2024-07-07 07:50:30', '2024-07-07 07:50:30'),
(106, 104, 34, '2024-07-07 07:52:47', '2024-07-07 07:52:47'),
(107, 105, 34, '2024-07-07 07:55:01', '2024-07-07 07:55:01'),
(108, 106, 34, '2024-07-07 08:08:01', '2024-07-07 08:08:01'),
(109, 107, 34, '2024-07-07 08:12:07', '2024-07-07 08:12:07'),
(110, 108, 34, '2024-07-07 08:13:36', '2024-07-07 08:13:36'),
(111, 109, 34, '2024-07-07 08:23:34', '2024-07-07 08:23:34'),
(112, 110, 34, '2024-07-07 08:27:02', '2024-07-07 08:27:02'),
(113, 111, 34, '2024-07-07 08:28:00', '2024-07-07 08:28:00'),
(114, 112, 34, '2024-07-07 08:31:15', '2024-07-07 08:31:15'),
(115, 113, 34, '2024-07-07 08:38:32', '2024-07-07 08:38:32'),
(116, 114, 34, '2024-07-07 08:46:35', '2024-07-07 08:46:35'),
(117, 115, 34, '2024-07-07 09:07:53', '2024-07-07 09:07:53'),
(118, 116, 34, '2024-07-07 09:09:24', '2024-07-07 09:09:24'),
(119, 117, 34, '2024-07-07 09:14:01', '2024-07-07 09:14:01'),
(120, 118, 34, '2024-07-07 09:15:07', '2024-07-07 09:15:07'),
(121, 119, 34, '2024-07-07 09:16:13', '2024-07-07 09:16:13');

-- --------------------------------------------------------

--
-- Table structure for table `product_data`
--

CREATE TABLE `product_data` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Simple',
  `product_id` bigint UNSIGNED NOT NULL,
  `attribute_item_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `regular_price` double DEFAULT NULL,
  `sale_price` double NOT NULL,
  `cost` double DEFAULT NULL,
  `discount_percent` double DEFAULT NULL,
  `promotion_price` double DEFAULT NULL,
  `promotion_start_date` timestamp NULL DEFAULT NULL,
  `promotion_end_date` timestamp NULL DEFAULT NULL,
  `sku_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_weight` double DEFAULT NULL,
  `shipping_width` double DEFAULT NULL,
  `shipping_height` double DEFAULT NULL,
  `shipping_length` double DEFAULT NULL,
  `rack_number` int DEFAULT NULL,
  `unit` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_amount` double DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` bigint UNSIGNED DEFAULT NULL,
  `stock` bigint NOT NULL DEFAULT '0',
  `tax_id` bigint UNSIGNED DEFAULT NULL,
  `tax_amount` double NOT NULL DEFAULT '0',
  `tax_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_data`
--

INSERT INTO `product_data` (`id`, `type`, `product_id`, `attribute_item_ids`, `regular_price`, `sale_price`, `cost`, `discount_percent`, `promotion_price`, `promotion_start_date`, `promotion_end_date`, `sku_code`, `shipping_weight`, `shipping_width`, `shipping_height`, `shipping_length`, `rack_number`, `unit`, `unit_amount`, `image`, `image_path`, `media_id`, `stock`, `tax_id`, `tax_amount`, `tax_type`, `tax_method`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Simple', 1, NULL, NULL, 3050, 0, NULL, NULL, '2024-06-21 10:45:03', '2024-06-21 10:45:03', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, 'Fixed', '', NULL, '2024-06-19 07:55:12', '2024-06-21 10:45:03'),
(2, 'Simple', 2, NULL, NULL, 3050, 0, NULL, NULL, '2024-06-21 10:44:10', '2024-06-21 10:44:10', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, 'Fixed', '', NULL, '2024-06-20 05:24:28', '2024-06-21 10:44:10'),
(3, 'Simple', 3, NULL, NULL, 3050, 0, NULL, NULL, '2024-06-21 11:44:47', '2024-06-21 11:44:47', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-21 11:44:47', '2024-06-21 11:44:47'),
(4, 'Simple', 4, NULL, NULL, 3050, 0, NULL, NULL, '2024-06-21 11:46:51', '2024-06-21 11:46:51', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-21 11:46:51', '2024-06-21 11:46:51'),
(5, 'Simple', 5, NULL, NULL, 3050, 0, NULL, NULL, '2024-06-21 11:49:03', '2024-06-21 11:49:03', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-21 11:49:03', '2024-06-21 11:49:03'),
(6, 'Simple', 6, NULL, NULL, 2950, 0, NULL, NULL, '2024-07-07 15:07:15', '2024-07-07 15:07:15', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, -1, NULL, 0, 'Fixed', '', NULL, '2024-06-21 11:52:23', '2024-07-07 15:10:49'),
(7, 'Simple', 7, NULL, NULL, 3050, 0, NULL, NULL, '2024-06-21 11:54:05', '2024-06-21 11:54:05', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-21 11:54:05', '2024-06-21 11:54:05'),
(8, 'Simple', 8, NULL, NULL, 3050, 0, NULL, NULL, '2024-06-21 11:55:38', '2024-06-21 11:55:38', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-21 11:55:38', '2024-06-21 11:55:38'),
(9, 'Simple', 9, NULL, NULL, 1750, 0, NULL, NULL, '2024-06-21 12:03:36', '2024-06-21 12:03:36', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-21 12:03:36', '2024-06-21 12:03:36'),
(10, 'Simple', 10, NULL, NULL, 3400, 0, NULL, NULL, '2024-06-21 12:05:54', '2024-06-21 12:05:54', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-21 12:05:54', '2024-06-21 12:05:54'),
(11, 'Simple', 11, NULL, NULL, 5500, 0, NULL, NULL, '2024-06-21 12:08:15', '2024-06-21 12:08:15', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-21 12:08:15', '2024-06-21 12:08:15'),
(12, 'Simple', 12, NULL, NULL, 3550, 0, NULL, NULL, '2024-06-21 12:10:24', '2024-06-21 12:10:24', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-21 12:10:24', '2024-06-21 12:10:24'),
(13, 'Simple', 13, NULL, 3570, 3150, 0, NULL, NULL, '2024-06-21 12:14:18', '2024-06-21 12:14:18', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-21 12:14:18', '2024-06-21 12:14:18'),
(14, 'Simple', 14, NULL, 3570, 3180, 0, 10, NULL, '2024-06-21 12:22:37', '2024-06-21 12:22:37', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, 'Fixed', '', NULL, '2024-06-21 12:20:35', '2024-06-21 12:22:37'),
(15, 'Simple', 15, NULL, 3430, 3200, 0, NULL, NULL, '2024-06-21 12:26:19', '2024-06-21 12:26:19', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-21 12:26:19', '2024-06-21 12:26:19'),
(16, 'Simple', 16, NULL, 3430, 3250, 0, NULL, NULL, '2024-06-21 12:29:29', '2024-06-21 12:29:29', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-21 12:29:29', '2024-06-21 12:29:29'),
(17, 'Simple', 17, NULL, 900, 850, 0, NULL, NULL, '2024-06-21 12:45:40', '2024-06-21 12:45:40', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-21 12:45:40', '2024-06-21 12:45:40'),
(18, 'Simple', 18, NULL, 1850, 1750, 0, NULL, NULL, '2024-06-21 12:46:59', '2024-06-21 12:46:59', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-21 12:46:59', '2024-06-21 12:46:59'),
(19, 'Simple', 19, NULL, NULL, 2750, 0, NULL, NULL, '2024-06-22 10:32:13', '2024-06-22 10:32:13', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-22 10:32:13', '2024-06-22 10:32:13'),
(20, 'Simple', 20, NULL, NULL, 2950, 0, NULL, NULL, '2024-06-22 10:33:50', '2024-06-22 10:33:50', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-22 10:33:50', '2024-06-22 10:33:50'),
(21, 'Simple', 21, NULL, NULL, 2750, 0, NULL, NULL, '2024-06-22 10:36:53', '2024-06-22 10:36:53', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-22 10:36:53', '2024-06-22 10:36:53'),
(22, 'Simple', 22, NULL, NULL, 2700, 0, NULL, NULL, '2024-06-22 10:45:38', '2024-06-22 10:45:38', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-22 10:45:38', '2024-06-22 10:45:38'),
(23, 'Simple', 23, NULL, 2950, 2850, 0, NULL, NULL, '2024-06-22 10:49:56', '2024-06-22 10:49:56', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-22 10:49:56', '2024-06-22 10:49:56'),
(24, 'Simple', 24, NULL, NULL, 3750, 0, NULL, NULL, '2024-06-24 03:10:23', '2024-06-24 03:10:23', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 03:10:23', '2024-06-24 03:10:23'),
(25, 'Simple', 25, NULL, NULL, 1600, 0, NULL, NULL, '2024-06-24 03:13:40', '2024-06-24 03:13:40', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 03:13:40', '2024-06-24 03:13:40'),
(26, 'Simple', 26, NULL, NULL, 2680, 0, NULL, NULL, '2024-06-24 03:14:57', '2024-06-24 03:14:57', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 03:14:57', '2024-06-24 03:14:57'),
(27, 'Simple', 27, NULL, NULL, 4890, 0, NULL, NULL, '2024-06-24 03:16:04', '2024-06-24 03:16:04', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 03:16:04', '2024-06-24 03:16:04'),
(28, 'Simple', 28, NULL, NULL, 1600, 0, NULL, NULL, '2024-06-24 03:18:20', '2024-06-24 03:18:20', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 03:18:20', '2024-06-24 03:18:20'),
(29, 'Simple', 29, NULL, NULL, 4950, 0, NULL, NULL, '2024-06-24 03:20:27', '2024-06-24 03:20:27', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 03:20:27', '2024-06-24 03:20:27'),
(30, 'Simple', 30, NULL, NULL, 3750, 0, NULL, NULL, '2024-06-24 03:24:52', '2024-06-24 03:24:52', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 03:24:52', '2024-06-24 03:24:52'),
(31, 'Simple', 31, NULL, NULL, 3750, 0, NULL, NULL, '2024-06-24 03:26:31', '2024-06-24 03:26:31', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 03:26:31', '2024-06-24 03:26:31'),
(32, 'Simple', 32, NULL, NULL, 3350, 0, NULL, NULL, '2024-06-24 03:27:46', '2024-06-24 03:27:46', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 03:27:46', '2024-06-24 03:27:46'),
(33, 'Simple', 33, NULL, NULL, 2050, 0, NULL, NULL, '2024-06-24 03:28:41', '2024-06-24 03:28:41', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 03:28:41', '2024-06-24 03:28:41'),
(34, 'Simple', 34, NULL, NULL, 3200, 0, NULL, NULL, '2024-06-24 03:40:40', '2024-06-24 03:40:40', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 03:40:40', '2024-06-24 03:40:40'),
(35, 'Simple', 35, NULL, NULL, 4200, 0, NULL, NULL, '2024-06-24 03:42:48', '2024-06-24 03:42:48', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 03:42:48', '2024-06-24 03:42:48'),
(36, 'Simple', 36, NULL, NULL, 3800, 0, NULL, NULL, '2024-06-24 03:43:46', '2024-06-24 03:43:46', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 03:43:46', '2024-06-24 03:43:46'),
(37, 'Simple', 37, NULL, NULL, 2800, 0, NULL, NULL, '2024-06-24 03:46:47', '2024-06-24 03:46:47', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 03:46:47', '2024-06-24 03:46:47'),
(38, 'Simple', 38, NULL, NULL, 4700, 0, NULL, NULL, '2024-06-24 03:48:25', '2024-06-24 03:48:25', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 03:48:25', '2024-06-24 03:48:25'),
(39, 'Simple', 39, NULL, NULL, 8600, 0, NULL, NULL, '2024-06-24 03:55:52', '2024-06-24 03:55:52', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 03:55:52', '2024-06-24 03:55:52'),
(40, 'Simple', 40, NULL, NULL, 8000, 0, NULL, NULL, '2024-06-24 03:57:02', '2024-06-24 03:57:02', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 03:57:02', '2024-06-24 03:57:02'),
(41, 'Simple', 41, NULL, NULL, 8900, 0, NULL, NULL, '2024-06-24 04:00:34', '2024-06-24 04:00:34', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 04:00:34', '2024-06-24 04:00:34'),
(42, 'Simple', 42, NULL, NULL, 4500, 0, NULL, NULL, '2024-06-24 04:01:49', '2024-06-24 04:01:49', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 04:01:49', '2024-06-24 04:01:49'),
(43, 'Simple', 43, NULL, NULL, 3500, 0, NULL, NULL, '2024-06-24 04:03:20', '2024-06-24 04:03:20', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 04:03:20', '2024-06-24 04:03:20'),
(44, 'Simple', 44, NULL, NULL, 4200, 0, NULL, NULL, '2024-06-24 04:04:24', '2024-06-24 04:04:24', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 04:04:24', '2024-06-24 04:04:24'),
(45, 'Simple', 45, NULL, NULL, 6100, 0, NULL, NULL, '2024-06-24 04:06:18', '2024-06-24 04:06:18', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 04:06:18', '2024-06-24 04:06:18'),
(46, 'Simple', 46, NULL, NULL, 6000, 0, NULL, NULL, '2024-06-24 04:08:21', '2024-06-24 04:08:21', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 04:08:21', '2024-06-24 04:08:21'),
(47, 'Simple', 47, NULL, NULL, 1100, 0, NULL, NULL, '2024-06-24 04:38:51', '2024-06-24 04:38:51', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 04:38:51', '2024-06-24 04:38:51'),
(48, 'Simple', 48, NULL, NULL, 1950, 0, NULL, NULL, '2024-06-24 04:41:05', '2024-06-24 04:41:05', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 04:41:05', '2024-06-24 04:41:05'),
(49, 'Simple', 49, NULL, NULL, 3450, 0, NULL, NULL, '2024-06-24 04:45:54', '2024-06-24 04:45:54', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 04:45:54', '2024-06-24 04:45:54'),
(50, 'Simple', 50, NULL, NULL, 4600, 0, NULL, NULL, '2024-06-24 05:02:39', '2024-06-24 05:02:39', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 05:02:39', '2024-06-24 05:02:39'),
(51, 'Simple', 51, NULL, NULL, 470, 0, NULL, NULL, '2024-06-24 05:08:43', '2024-06-24 05:08:43', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 05:08:43', '2024-06-24 05:08:43'),
(52, 'Simple', 52, NULL, NULL, 420, 0, NULL, NULL, '2024-06-24 05:09:56', '2024-06-24 05:09:56', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 05:09:56', '2024-06-24 05:09:56'),
(53, 'Simple', 53, NULL, NULL, 480, 0, NULL, NULL, '2024-06-24 05:11:26', '2024-06-24 05:11:26', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 05:11:26', '2024-06-24 05:11:26'),
(54, 'Simple', 54, NULL, NULL, 420, 0, NULL, NULL, '2024-06-24 05:12:54', '2024-06-24 05:12:54', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 05:12:54', '2024-06-24 05:12:54'),
(55, 'Simple', 55, NULL, NULL, 950, 0, NULL, NULL, '2024-06-24 06:24:09', '2024-06-24 06:24:09', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 06:24:09', '2024-06-24 06:24:09'),
(56, 'Simple', 56, NULL, NULL, 2100, 0, NULL, NULL, '2024-06-24 06:26:44', '2024-06-24 06:26:44', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, 'Fixed', '', NULL, '2024-06-24 06:24:59', '2024-06-24 06:26:44'),
(57, 'Simple', 57, NULL, NULL, 4450, 0, NULL, NULL, '2024-06-24 06:25:45', '2024-06-24 06:25:45', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 06:25:45', '2024-06-24 06:25:45'),
(58, 'Simple', 58, NULL, NULL, 3350, 0, NULL, NULL, '2024-06-24 06:26:31', '2024-06-24 06:26:31', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 06:26:31', '2024-06-24 06:26:31'),
(59, 'Simple', 59, NULL, NULL, 3600, 0, NULL, NULL, '2024-06-24 06:33:41', '2024-06-24 06:33:41', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 06:33:41', '2024-06-24 06:33:41'),
(60, 'Simple', 60, NULL, NULL, 3750, 0, NULL, NULL, '2024-06-24 06:35:27', '2024-06-24 06:35:27', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 06:35:27', '2024-06-24 06:35:27'),
(61, 'Simple', 61, NULL, NULL, 3300, 0, NULL, NULL, '2024-07-07 15:37:12', '2024-07-07 15:37:12', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, 'Fixed', '', NULL, '2024-06-24 06:38:27', '2024-07-07 15:37:12'),
(62, 'Simple', 62, NULL, NULL, 4350, 0, NULL, NULL, '2024-06-24 06:42:39', '2024-06-24 06:42:39', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-06-24 06:42:39', '2024-06-24 06:42:39'),
(63, 'Simple', 63, NULL, NULL, 790, 0, NULL, NULL, '2024-07-03 10:49:02', '2024-07-03 10:49:02', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, -1, NULL, 0, 'Fixed', '', NULL, '2024-06-24 10:53:02', '2024-07-03 10:49:02'),
(64, 'Simple', 64, NULL, NULL, 700, 0, NULL, NULL, '2024-07-01 07:52:14', '2024-07-01 07:52:14', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-01 07:52:14', '2024-07-01 07:52:14'),
(65, 'Simple', 65, NULL, NULL, 650, 0, NULL, NULL, '2024-07-01 07:56:08', '2024-07-01 07:56:08', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-01 07:56:08', '2024-07-01 07:56:08'),
(66, 'Simple', 66, NULL, NULL, 650, 0, NULL, NULL, '2024-07-01 07:57:56', '2024-07-01 07:57:56', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-01 07:57:56', '2024-07-01 07:57:56'),
(67, 'Simple', 67, NULL, NULL, 650, 0, NULL, NULL, '2024-07-01 07:59:30', '2024-07-01 07:59:30', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-01 07:59:30', '2024-07-01 07:59:30'),
(68, 'Simple', 68, NULL, NULL, 650, 0, NULL, NULL, '2024-07-01 08:06:34', '2024-07-01 08:06:34', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-01 08:06:34', '2024-07-01 08:06:34'),
(69, 'Simple', 69, NULL, NULL, 650, 0, NULL, NULL, '2024-07-01 08:09:25', '2024-07-01 08:09:25', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-01 08:09:25', '2024-07-01 08:09:25'),
(70, 'Simple', 70, NULL, NULL, 650, 0, NULL, NULL, '2024-07-01 08:10:58', '2024-07-01 08:10:58', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-01 08:10:58', '2024-07-01 08:10:58'),
(71, 'Simple', 71, NULL, NULL, 650, 0, NULL, NULL, '2024-07-01 08:12:37', '2024-07-01 08:12:37', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-01 08:12:37', '2024-07-01 08:12:37'),
(72, 'Simple', 72, NULL, NULL, 650, 0, NULL, NULL, '2024-07-01 08:15:18', '2024-07-01 08:15:18', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-01 08:15:18', '2024-07-01 08:15:18'),
(73, 'Simple', 73, NULL, NULL, 1750, 0, NULL, NULL, '2024-07-01 08:18:49', '2024-07-01 08:18:49', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-01 08:18:49', '2024-07-01 08:18:49'),
(74, 'Simple', 74, NULL, NULL, 850, 0, NULL, NULL, '2024-07-07 06:32:50', '2024-07-07 06:32:50', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, 'Fixed', '', NULL, '2024-07-01 08:19:54', '2024-07-07 06:32:50'),
(75, 'Simple', 75, NULL, NULL, 950, 0, NULL, NULL, '2024-07-02 08:31:11', '2024-07-02 08:31:11', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-02 08:31:11', '2024-07-02 08:31:11'),
(76, 'Simple', 76, NULL, NULL, 950, 0, NULL, NULL, '2024-07-02 08:32:32', '2024-07-02 08:32:32', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-02 08:32:32', '2024-07-02 08:32:32'),
(77, 'Simple', 77, NULL, NULL, 950, 0, NULL, NULL, '2024-07-03 05:09:45', '2024-07-03 05:09:45', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, 'Fixed', '', NULL, '2024-07-02 09:04:45', '2024-07-03 05:09:45'),
(78, 'Simple', 78, NULL, NULL, 690, 0, NULL, NULL, '2024-07-02 09:05:47', '2024-07-02 09:05:47', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-02 09:05:47', '2024-07-02 09:05:47'),
(79, 'Simple', 79, NULL, NULL, 690, 0, NULL, NULL, '2024-07-02 09:19:23', '2024-07-02 09:19:23', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-02 09:19:23', '2024-07-02 09:19:23'),
(80, 'Simple', 80, NULL, NULL, 690, 0, NULL, NULL, '2024-07-03 05:06:47', '2024-07-03 05:06:47', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-03 05:06:47', '2024-07-03 05:06:47'),
(81, 'Simple', 81, NULL, NULL, 950, 0, NULL, NULL, '2024-07-03 05:09:02', '2024-07-03 05:09:02', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-03 05:09:02', '2024-07-03 05:09:02'),
(82, 'Simple', 82, NULL, NULL, 690, 0, NULL, NULL, '2024-07-03 05:21:33', '2024-07-03 05:21:33', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-03 05:21:33', '2024-07-03 05:21:33'),
(83, 'Simple', 83, NULL, NULL, 790, 0, NULL, NULL, '2024-07-03 10:09:53', '2024-07-03 10:09:53', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-03 10:09:53', '2024-07-03 10:09:53'),
(84, 'Simple', 84, NULL, NULL, 850, 0, NULL, NULL, '2024-07-07 06:32:16', '2024-07-07 06:32:16', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, 'Fixed', '', NULL, '2024-07-03 10:25:33', '2024-07-07 06:32:16'),
(85, 'Simple', 85, NULL, NULL, 790, 0, NULL, NULL, '2024-07-04 03:33:02', '2024-07-04 03:33:02', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-04 03:33:02', '2024-07-04 03:33:02'),
(86, 'Simple', 86, NULL, NULL, 790, 0, NULL, NULL, '2024-07-04 03:34:02', '2024-07-04 03:34:02', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-04 03:34:02', '2024-07-04 03:34:02'),
(87, 'Simple', 87, NULL, NULL, 850, 0, NULL, NULL, '2024-07-07 06:31:54', '2024-07-07 06:31:54', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, 'Fixed', '', NULL, '2024-07-04 03:36:47', '2024-07-07 06:31:54'),
(88, 'Simple', 88, NULL, NULL, 850, 0, NULL, NULL, '2024-07-07 06:31:41', '2024-07-07 06:31:41', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, 'Fixed', '', NULL, '2024-07-04 03:38:20', '2024-07-07 06:31:41'),
(89, 'Simple', 89, NULL, NULL, 850, 0, NULL, NULL, '2024-07-07 06:31:30', '2024-07-07 06:31:30', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, 'Fixed', '', NULL, '2024-07-04 03:39:40', '2024-07-07 06:31:30'),
(90, 'Simple', 90, NULL, NULL, 790, 0, NULL, NULL, '2024-07-04 03:43:54', '2024-07-04 03:43:54', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-04 03:43:54', '2024-07-04 03:43:54'),
(91, 'Simple', 91, NULL, NULL, 790, 0, NULL, NULL, '2024-07-04 05:20:46', '2024-07-04 05:20:46', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, 'Fixed', '', NULL, '2024-07-04 03:44:00', '2024-07-04 05:20:46'),
(92, 'Simple', 92, NULL, NULL, 850, 0, NULL, NULL, '2024-07-07 07:29:34', '2024-07-07 07:29:34', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 07:29:34', '2024-07-07 07:29:34'),
(93, 'Simple', 93, NULL, NULL, 850, 0, NULL, NULL, '2024-07-07 07:31:40', '2024-07-07 07:31:40', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 07:31:40', '2024-07-07 07:31:40'),
(94, 'Simple', 94, NULL, NULL, 850, 0, NULL, NULL, '2024-07-07 07:32:37', '2024-07-07 07:32:37', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 07:32:37', '2024-07-07 07:32:37'),
(95, 'Simple', 95, NULL, NULL, 850, 0, NULL, NULL, '2024-07-07 07:33:52', '2024-07-07 07:33:52', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 07:33:52', '2024-07-07 07:33:52'),
(96, 'Simple', 96, NULL, NULL, 850, 0, NULL, NULL, '2024-07-07 07:34:56', '2024-07-07 07:34:56', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 07:34:56', '2024-07-07 07:34:56'),
(97, 'Simple', 97, NULL, NULL, 950, 0, NULL, NULL, '2024-07-07 07:36:11', '2024-07-07 07:36:11', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 07:36:11', '2024-07-07 07:36:11'),
(98, 'Simple', 98, NULL, NULL, 950, 0, NULL, NULL, '2024-07-07 07:37:30', '2024-07-07 07:37:30', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 07:37:30', '2024-07-07 07:37:30'),
(99, 'Simple', 99, NULL, NULL, 890, 0, NULL, NULL, '2024-07-07 07:39:24', '2024-07-07 07:39:24', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 07:39:24', '2024-07-07 07:39:24'),
(100, 'Simple', 100, NULL, NULL, 750, 0, NULL, NULL, '2024-07-07 07:45:10', '2024-07-07 07:45:10', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 07:45:10', '2024-07-07 07:45:10'),
(101, 'Simple', 101, NULL, NULL, 1300, 0, NULL, NULL, '2024-07-07 07:46:39', '2024-07-07 07:46:39', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 07:46:39', '2024-07-07 07:46:39'),
(102, 'Simple', 102, NULL, NULL, 1300, 0, NULL, NULL, '2024-07-07 07:48:22', '2024-07-07 07:48:22', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 07:48:22', '2024-07-07 07:48:22'),
(103, 'Simple', 103, NULL, NULL, 1050, 0, NULL, NULL, '2024-07-07 07:50:27', '2024-07-07 07:50:27', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 07:50:27', '2024-07-07 07:50:27'),
(104, 'Simple', 104, NULL, NULL, 1250, 0, NULL, NULL, '2024-07-07 08:00:25', '2024-07-07 08:00:25', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, 'Fixed', '', NULL, '2024-07-07 07:52:46', '2024-07-07 08:00:25'),
(105, 'Simple', 105, NULL, NULL, 1250, 0, NULL, NULL, '2024-07-07 07:59:46', '2024-07-07 07:59:46', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, 'Fixed', '', NULL, '2024-07-07 07:54:57', '2024-07-07 07:59:46'),
(106, 'Simple', 106, NULL, NULL, 1050, 0, NULL, NULL, '2024-07-07 08:08:01', '2024-07-07 08:08:01', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 08:08:01', '2024-07-07 08:08:01'),
(107, 'Simple', 107, NULL, NULL, 1050, 0, NULL, NULL, '2024-07-07 08:11:55', '2024-07-07 08:11:55', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 08:11:55', '2024-07-07 08:11:55'),
(108, 'Simple', 108, NULL, NULL, 1250, 0, NULL, NULL, '2024-07-07 08:13:32', '2024-07-07 08:13:32', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 08:13:32', '2024-07-07 08:13:32'),
(109, 'Simple', 109, NULL, NULL, 1050, 0, NULL, NULL, '2024-07-07 08:23:20', '2024-07-07 08:23:20', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 08:23:20', '2024-07-07 08:23:20'),
(110, 'Simple', 110, NULL, NULL, 1350, 0, NULL, NULL, '2024-07-07 08:27:01', '2024-07-07 08:27:01', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 08:27:01', '2024-07-07 08:27:01'),
(111, 'Simple', 111, NULL, NULL, 1350, 0, NULL, NULL, '2024-07-07 08:28:00', '2024-07-07 08:28:00', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 08:28:00', '2024-07-07 08:28:00'),
(112, 'Simple', 112, NULL, NULL, 950, 0, NULL, NULL, '2024-07-07 08:31:14', '2024-07-07 08:31:14', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 08:31:14', '2024-07-07 08:31:14'),
(113, 'Simple', 113, NULL, NULL, 850, 0, NULL, NULL, '2024-07-07 08:38:32', '2024-07-07 08:38:32', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 08:38:32', '2024-07-07 08:38:32'),
(114, 'Simple', 114, NULL, NULL, 950, 0, NULL, NULL, '2024-07-07 08:46:35', '2024-07-07 08:46:35', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 08:46:35', '2024-07-07 08:46:35'),
(115, 'Simple', 115, NULL, NULL, 950, 0, NULL, NULL, '2024-07-07 09:07:53', '2024-07-07 09:07:53', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 09:07:53', '2024-07-07 09:07:53'),
(116, 'Simple', 116, NULL, NULL, 950, 0, NULL, NULL, '2024-07-07 09:09:24', '2024-07-07 09:09:24', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 09:09:24', '2024-07-07 09:09:24'),
(117, 'Simple', 117, NULL, NULL, 950, 0, NULL, NULL, '2024-07-07 09:14:01', '2024-07-07 09:14:01', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 09:14:01', '2024-07-07 09:14:01'),
(118, 'Simple', 118, NULL, NULL, 950, 0, NULL, NULL, '2024-07-07 09:15:07', '2024-07-07 09:15:07', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 09:15:07', '2024-07-07 09:15:07'),
(119, 'Simple', 119, NULL, NULL, 1150, 0, NULL, NULL, '2024-07-07 09:16:13', '2024-07-07 09:16:13', NULL, NULL, NULL, NULL, NULL, NULL, 'Pcs', 1, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2024-07-07 09:16:13', '2024-07-07 09:16:13');

-- --------------------------------------------------------

--
-- Table structure for table `product_media`
--

CREATE TABLE `product_media` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `media_id` bigint UNSIGNED NOT NULL,
  `position` int NOT NULL DEFAULT '1000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_quotes`
--

CREATE TABLE `product_quotes` (
  `id` bigint UNSIGNED NOT NULL,
  `status` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `admin_read` tinyint(1) NOT NULL DEFAULT '2',
  `product_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_form` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pushes`
--

CREATE TABLE `pushes` (
  `id` bigint UNSIGNED NOT NULL,
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '2',
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `rating` int NOT NULL,
  `review` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `group`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'general', 'title', 'chocolateandbabyfoods.com', NULL, NULL),
(2, 'general', 'mobile_number', '8801763593264', NULL, NULL),
(3, 'general', 'email', 'chocolateandbabyfoods@gmail.com', NULL, NULL),
(4, 'general', 'copyright', '&copy; 2024 All Rights Reserved By chocolateandbabyfoods.com', NULL, NULL),
(5, 'general', 'slogan', 'chocolateandbabyfoods.com', NULL, NULL),
(6, 'general', 'city', 'Dhaka', NULL, NULL),
(7, 'general', 'state', 'Dhaka', NULL, NULL),
(8, 'general', 'country', 'Canada', NULL, NULL),
(9, 'general', 'zip', '1100', NULL, NULL),
(10, 'general', 'street', 'Dhaka', NULL, NULL),
(11, 'general', 'tel', '8801919104994', NULL, NULL),
(12, 'general', 'tax', NULL, NULL, NULL),
(13, 'general', 'tax_type', NULL, NULL, NULL),
(14, 'general', 'currency_name', 'BDT', NULL, NULL),
(15, 'general', 'currency_symbol', '৳', NULL, NULL),
(16, 'general', 'free_shipping_after', NULL, NULL, NULL),
(18, 'general', 'primary_color', '#1b1415', NULL, NULL),
(19, 'general', 'primary_light_color', '#dc3737', NULL, NULL),
(20, 'general', 'secondary_color', '#c08b27', NULL, NULL),
(21, 'general', 'secondary_dark_color', '#251b08', NULL, NULL),
(22, 'general', 'footer_color', NULL, NULL, NULL),
(23, 'general', 'font_color_light', NULL, NULL, NULL),
(24, 'general', 'font_color_dark', NULL, NULL, NULL),
(27, 'general', 'special_offer_text_1', NULL, NULL, NULL),
(28, 'general', 'special_offer_text_2', NULL, NULL, NULL),
(29, 'general', 'special_offer_button_text', NULL, NULL, NULL),
(30, 'general', 'special_offer_button_url', NULL, NULL, NULL),
(31, 'home_banner', 'hb_link_1', NULL, NULL, NULL),
(32, 'home_banner', 'hb_link_2', NULL, NULL, NULL),
(33, 'home_banner', 'hb_link_3', NULL, NULL, NULL),
(34, 'home_banner', 'hb_link_4', NULL, NULL, NULL),
(35, 'home_banner', 'hb_link_5', NULL, NULL, NULL),
(36, 'social', 'facebook', 'https://www.facebook.com/cnbfoods', NULL, NULL),
(37, 'social', 'twitter', '#', NULL, NULL),
(38, 'social', 'youtube', '#', NULL, NULL),
(39, 'social', 'instagram', '#', NULL, NULL),
(40, 'social', 'linkedin', '#', NULL, NULL),
(53, 'general', 'custom_footer_code', NULL, NULL, NULL),
(92, 'general', 'headline', 'chocolateandbabyfoods.com', NULL, NULL),
(93, 'general', 'whatsapp_number', '123456789', NULL, NULL),
(94, 'general', 'messenger_link', '#', NULL, NULL),
(96, 'general', 'custom_head_code', NULL, NULL, NULL),
(97, 'general', 'custom_body_code', NULL, NULL, NULL),
(104, 'social', 'tiktok', '#', NULL, NULL),
(130, 'general', 'short_description', 'chocolateandbabyfoods.com', NULL, NULL),
(131, 'general', 'meta_description', NULL, NULL, NULL),
(132, 'general', 'keywords', NULL, NULL, NULL),
(133, 'general', 'logo', 'logo.png', NULL, NULL),
(134, 'general', 'footer_logo', 'footer_logo.png', NULL, NULL),
(135, 'general', 'favicon', 'favicon.png', NULL, NULL),
(136, 'general', 'og_image', 'og_image.png', NULL, NULL),
(137, 'fb_api', 'track', 'No', NULL, NULL),
(138, 'fb_api', 'pixel_id', NULL, NULL, NULL),
(139, 'fb_api', 'access_token', NULL, NULL, NULL),
(140, 'courier', 'enable_courier', 'Yes', NULL, NULL),
(141, 'courier', 'pathao_enabled', 'Yes', NULL, NULL),
(142, 'courier', 'pathao_client_id', NULL, NULL, NULL),
(143, 'courier', 'pathao_client_secret', NULL, NULL, NULL),
(144, 'courier', 'pathao_username', NULL, NULL, NULL),
(145, 'courier', 'pathao_password', NULL, NULL, NULL),
(146, 'courier', 'redx_enabled', 'Yes', NULL, NULL),
(147, 'courier', 'redx_api_token', NULL, NULL, NULL),
(148, 'courier', 'steadfast_enabled', 'Yes', NULL, NULL),
(149, 'courier', 'steadfast_api_key', NULL, NULL, NULL),
(150, 'courier', 'steadfast_secret_key', NULL, NULL, NULL),
(151, 'courier', 'ecourier_enabled', 'No', NULL, NULL),
(152, 'courier', 'ecourier_api_key', NULL, NULL, NULL),
(153, 'courier', 'ecourier_secret_key', NULL, NULL, NULL),
(154, 'courier', 'ecourier_user_id', NULL, NULL, NULL),
(155, 'courier', 'paperfly_enabled', 'No', NULL, NULL),
(156, 'courier', 'paperfly_api_key', NULL, NULL, NULL),
(157, 'courier', 'paperfly_username', NULL, NULL, NULL),
(158, 'courier', 'paperfly_password', NULL, NULL, NULL),
(159, 'courier', 'pidex_enabled', 'No', NULL, NULL),
(160, 'courier', 'pidex_merchant_id', NULL, NULL, NULL),
(161, 'courier', 'pidex_api_token', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apartment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_charges`
--

CREATE TABLE `shipping_charges` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Canada',
  `amount` double DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `position` int NOT NULL DEFAULT '1000',
  `text_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_1_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_1_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_2_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_2_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text_align` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` bigint UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `status`, `position`, `text_1`, `text_2`, `text_3`, `button_1_text`, `button_1_url`, `button_2_text`, `button_2_url`, `short_description`, `description`, `text_align`, `image`, `image_path`, `media_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1000, 'Buy Sharee', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1718441226.jpeg', '2024/06', 1, '2024-06-15 14:43:52', '2024-06-15 08:47:06', '2024-06-15 14:43:52'),
(2, 1, 1, 'Food Gallery Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1718441249.jpeg', '2024/06', 2, '2024-06-19 07:44:40', '2024-06-15 08:47:29', '2024-06-19 07:44:40'),
(3, 1, 2, 'Unique gifts for women', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1718441288.jpeg', '2024/06', 3, '2024-06-19 07:44:36', '2024-06-15 08:48:08', '2024-06-19 07:44:36'),
(4, 1, 4, 'Gerber Puree', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1718462581.png', '2024/06', 4, NULL, '2024-06-15 14:43:02', '2024-07-04 05:07:52'),
(5, 1, 3, 'Froot Loops', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1718968174.png', '2024/06', 10, NULL, '2024-06-21 11:09:35', '2024-07-04 05:07:52'),
(6, 1, 2, 'Froot Loops', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1718968193.jpg', '2024/06', 11, '2024-06-21 11:19:29', '2024-06-21 11:10:03', '2024-06-21 11:19:29'),
(7, 1, 1000, 'Froot Loops', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1718968202.jpg', '2024/06', 12, '2024-06-21 11:15:23', '2024-06-21 11:10:36', '2024-06-21 11:15:23'),
(8, 1, 5, 'Gerber Cereal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1718968788.jpg', '2024/06', 13, NULL, '2024-06-21 11:19:48', '2024-07-04 05:07:52'),
(9, 1, 6, 'Cereals', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1718968802.jpg', '2024/06', 14, NULL, '2024-06-21 11:20:03', '2024-07-04 05:07:52'),
(10, 1, 7, 'Sauces', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1718969006.png', '2024/06', 15, NULL, '2024-06-21 11:23:27', '2024-07-04 05:07:52'),
(11, 1, 0, 'Formula Milk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1719822715.jpg', '2024/07', 96, NULL, '2024-07-01 08:31:55', '2024-07-01 08:32:03'),
(12, 1, 1, 'Gerber Cereal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1719908847.jpg', '2024/07', 97, NULL, '2024-07-02 08:27:27', '2024-07-02 08:27:34'),
(13, 1, 2, 'Heinz Cereal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1720069666.jpg', '2024/07', 118, NULL, '2024-07-04 05:07:46', '2024-07-04 05:07:52');

-- --------------------------------------------------------

--
-- Table structure for table `special_offers`
--

CREATE TABLE `special_offers` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `product_id` bigint UNSIGNED NOT NULL,
  `position` int DEFAULT '1000',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `product_id` bigint UNSIGNED NOT NULL,
  `product_data_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `purchase_quantity` int NOT NULL,
  `current_quantity` int NOT NULL,
  `purchase_price` double NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `adjustment_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_histories`
--

CREATE TABLE `stock_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `product_data_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `previous_quantity` int NOT NULL,
  `current_quantity` int NOT NULL,
  `purchase_sale_price` double NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `added_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_histories`
--

INSERT INTO `stock_histories` (`id`, `type`, `product_id`, `product_data_id`, `quantity`, `previous_quantity`, `current_quantity`, `purchase_sale_price`, `note`, `added_by`, `created_at`, `updated_at`) VALUES
(1, 'Subtraction', 63, 63, -1, 0, -1, 790, 'Product order from admin panel.', ' Shohag', '2024-06-28 11:19:42', '2024-06-28 11:19:42'),
(2, 'Subtraction', 6, 6, -1, 0, -1, 2950, 'Product order from admin panel.', ' Shohag', '2024-07-07 15:10:49', '2024-07-07 15:10:49');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `testimonial` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int DEFAULT '1000',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `text_sliders`
--

CREATE TABLE `text_sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL DEFAULT '1000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `admin_read` tinyint(1) NOT NULL DEFAULT '2',
  `type` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer',
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gander` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order_submitted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `status`, `admin_read`, `type`, `first_name`, `last_name`, `designation`, `company_name`, `username`, `mobile_number`, `email`, `street`, `apartment`, `city`, `state`, `zip`, `country`, `profile`, `email_verified_at`, `password`, `bio`, `gander`, `address`, `order_submitted_at`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'admin', NULL, 'Admin', 'CEO', NULL, NULL, '123456789', 'admin@me.com', 'farmview market', NULL, 'Dhaka', NULL, '1216', NULL, NULL, NULL, '$2y$10$66R1f3226DcQHL4QzeMQ5.6/1vjK/kSNQr/DmK5S2PS3mwhSsBsjK', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-17 12:09:44', '2024-06-03 16:40:36'),
(2, 1, 1, 'customer', NULL, 'Dola Shikder', NULL, NULL, NULL, '01581769044', 'abcd@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$pUKZ8/lrjfAzmtC6m2s3hOCciXIX2cyXynf2OEOmt6iRKsL98154e', NULL, NULL, '58/59/A Dino Nath Sen Road, Gendaria, Ghuntighar, Dhaka-1204. Sheltech Grand Palace, Flat. 33B', NULL, NULL, NULL, '2024-06-15 14:47:41', '2024-06-15 14:47:41'),
(3, 1, 1, 'admin', NULL, 'Shohag', 'Admin', NULL, NULL, '01980112210', 'shohagblink019@gmail.com', 'Dhaka', NULL, 'Dhaka', NULL, '1212', NULL, NULL, NULL, '$2y$10$R40U0BRTA2JX3DuLESRqvOZjA/XbftcPmQiHMao5zHFYMFDIbOmkS', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-21 10:41:30', '2024-06-22 05:47:22');

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `placement` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` bigint NOT NULL DEFAULT '1000',
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `menu_id` bigint UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_items`
--
ALTER TABLE `attribute_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_items_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_categories_blog_id_foreign` (`blog_id`),
  ADD KEY `blog_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_product_data_id_foreign` (`product_data_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `compare_products`
--
ALTER TABLE `compare_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compare_products_user_id_foreign` (`user_id`),
  ADD KEY `compare_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_user_id_foreign` (`user_id`),
  ADD KEY `favorites_product_id_foreign` (`product_id`),
  ADD KEY `favorites_product_data_id_foreign` (`product_data_id`);

--
-- Indexes for table `feature_ads`
--
ALTER TABLE `feature_ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `landing_builders`
--
ALTER TABLE `landing_builders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_payments`
--
ALTER TABLE `order_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_products_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_product_stocks`
--
ALTER TABLE `order_product_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_stocks_order_product_id_foreign` (`order_product_id`),
  ADD KEY `order_product_stocks_stock_id_foreign` (`stock_id`);

--
-- Indexes for table `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_statuses_order_id_foreign` (`order_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pre_users`
--
ALTER TABLE `pre_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attributes_product_id_foreign` (`product_id`),
  ADD KEY `product_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_categories_product_id_foreign` (`product_id`),
  ADD KEY `product_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_data`
--
ALTER TABLE `product_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_data_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_media`
--
ALTER TABLE `product_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_media_product_id_foreign` (`product_id`),
  ADD KEY `product_media_media_id_foreign` (`media_id`);

--
-- Indexes for table `product_quotes`
--
ALTER TABLE `product_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_quotes_product_id_foreign` (`product_id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pushes`
--
ALTER TABLE `pushes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipping_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `shipping_charges`
--
ALTER TABLE `shipping_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `special_offers`
--
ALTER TABLE `special_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `special_offers_product_id_foreign` (`product_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stocks_adjustment_id_foreign` (`adjustment_id`);

--
-- Indexes for table `stock_histories`
--
ALTER TABLE `stock_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `text_sliders`
--
ALTER TABLE `text_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_mobile_number_unique` (`mobile_number`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widgets_menu_id_foreign` (`menu_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_items`
--
ALTER TABLE `attribute_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `compare_products`
--
ALTER TABLE `compare_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_ads`
--
ALTER TABLE `feature_ads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `landing_builders`
--
ALTER TABLE `landing_builders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_payments`
--
ALTER TABLE `order_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_product_stocks`
--
ALTER TABLE `order_product_stocks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_statuses`
--
ALTER TABLE `order_statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_users`
--
ALTER TABLE `pre_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `product_data`
--
ALTER TABLE `product_data`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `product_media`
--
ALTER TABLE `product_media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_quotes`
--
ALTER TABLE `product_quotes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pushes`
--
ALTER TABLE `pushes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_charges`
--
ALTER TABLE `shipping_charges`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `special_offers`
--
ALTER TABLE `special_offers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_histories`
--
ALTER TABLE `stock_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `text_sliders`
--
ALTER TABLE `text_sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_items`
--
ALTER TABLE `attribute_items`
  ADD CONSTRAINT `attribute_items_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD CONSTRAINT `blog_categories_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_data_id_foreign` FOREIGN KEY (`product_data_id`) REFERENCES `product_data` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `compare_products`
--
ALTER TABLE `compare_products`
  ADD CONSTRAINT `compare_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `compare_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_product_data_id_foreign` FOREIGN KEY (`product_data_id`) REFERENCES `product_data` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_payments`
--
ALTER TABLE `order_payments`
  ADD CONSTRAINT `order_payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_product_stocks`
--
ALTER TABLE `order_product_stocks`
  ADD CONSTRAINT `order_product_stocks_order_product_id_foreign` FOREIGN KEY (`order_product_id`) REFERENCES `order_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_product_stocks_stock_id_foreign` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD CONSTRAINT `order_statuses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pre_users`
--
ALTER TABLE `pre_users`
  ADD CONSTRAINT `pre_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `product_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_data`
--
ALTER TABLE `product_data`
  ADD CONSTRAINT `product_data_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_media`
--
ALTER TABLE `product_media`
  ADD CONSTRAINT `product_media_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_media_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_quotes`
--
ALTER TABLE `product_quotes`
  ADD CONSTRAINT `product_quotes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD CONSTRAINT `shipping_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `special_offers`
--
ALTER TABLE `special_offers`
  ADD CONSTRAINT `special_offers_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_adjustment_id_foreign` FOREIGN KEY (`adjustment_id`) REFERENCES `adjustments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `widgets_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
