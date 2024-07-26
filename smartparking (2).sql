-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2022 at 09:16 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartparking`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add login', 7, 'add_login'),
(26, 'Can change login', 7, 'change_login'),
(27, 'Can delete login', 7, 'delete_login'),
(28, 'Can view login', 7, 'view_login'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add provider', 9, 'add_provider'),
(34, 'Can change provider', 9, 'change_provider'),
(35, 'Can delete provider', 9, 'delete_provider'),
(36, 'Can view provider', 9, 'view_provider'),
(37, 'Can add plot', 10, 'add_plot'),
(38, 'Can change plot', 10, 'change_plot'),
(39, 'Can delete plot', 10, 'delete_plot'),
(40, 'Can view plot', 10, 'view_plot'),
(41, 'Can add feedback', 11, 'add_feedback'),
(42, 'Can change feedback', 11, 'change_feedback'),
(43, 'Can delete feedback', 11, 'delete_feedback'),
(44, 'Can view feedback', 11, 'view_feedback'),
(45, 'Can add complaint', 12, 'add_complaint'),
(46, 'Can change complaint', 12, 'change_complaint'),
(47, 'Can delete complaint', 12, 'delete_complaint'),
(48, 'Can view complaint', 12, 'view_complaint'),
(49, 'Can add slot', 13, 'add_slot'),
(50, 'Can change slot', 13, 'change_slot'),
(51, 'Can delete slot', 13, 'delete_slot'),
(52, 'Can view slot', 13, 'view_slot'),
(53, 'Can add booking', 14, 'add_booking'),
(54, 'Can change booking', 14, 'change_booking'),
(55, 'Can delete booking', 14, 'delete_booking'),
(56, 'Can view booking', 14, 'view_booking'),
(57, 'Can add district', 15, 'add_district'),
(58, 'Can change district', 15, 'change_district'),
(59, 'Can delete district', 15, 'delete_district'),
(60, 'Can view district', 15, 'view_district'),
(61, 'Can add locations', 16, 'add_locations'),
(62, 'Can change locations', 16, 'change_locations'),
(63, 'Can delete locations', 16, 'delete_locations'),
(64, 'Can view locations', 16, 'view_locations'),
(65, 'Can add bank', 17, 'add_bank'),
(66, 'Can change bank', 17, 'change_bank'),
(67, 'Can delete bank', 17, 'delete_bank'),
(68, 'Can view bank', 17, 'view_bank'),
(69, 'Can add vehicle slot', 18, 'add_vehicleslot'),
(70, 'Can change vehicle slot', 18, 'change_vehicleslot'),
(71, 'Can delete vehicle slot', 18, 'delete_vehicleslot'),
(72, 'Can view vehicle slot', 18, 'view_vehicleslot');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(17, 'smart', 'bank'),
(14, 'smart', 'booking'),
(12, 'smart', 'complaint'),
(15, 'smart', 'district'),
(11, 'smart', 'feedback'),
(16, 'smart', 'locations'),
(7, 'smart', 'login'),
(10, 'smart', 'plot'),
(9, 'smart', 'provider'),
(13, 'smart', 'slot'),
(8, 'smart', 'user'),
(18, 'smart', 'vehicleslot');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-09-24 09:51:37.286876'),
(2, 'auth', '0001_initial', '2022-09-24 09:51:37.818301'),
(3, 'admin', '0001_initial', '2022-09-24 09:51:37.943339'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-09-24 09:51:37.974602'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-09-24 09:51:37.990229'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-09-24 09:51:38.068380'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-09-24 09:51:38.130895'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-09-24 09:51:38.177787'),
(9, 'auth', '0004_alter_user_username_opts', '2022-09-24 09:51:38.193422'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-09-24 09:51:38.255934'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-09-24 09:51:38.255934'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-09-24 09:51:38.287176'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-09-24 09:51:38.318452'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-09-24 09:51:38.365324'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-09-24 09:51:38.396601'),
(16, 'auth', '0011_update_proxy_permissions', '2022-09-24 09:51:38.439109'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-09-24 09:51:38.474892'),
(18, 'sessions', '0001_initial', '2022-09-24 09:51:38.521786'),
(19, 'smart', '0001_initial', '2022-09-24 09:51:38.553062'),
(20, 'smart', '0002_user', '2022-09-24 09:51:38.615582'),
(21, 'smart', '0003_auto_20220730_2241', '2022-09-24 09:51:38.678080'),
(22, 'smart', '0004_provider', '2022-09-24 09:51:38.756228'),
(23, 'smart', '0005_complaint_feedback_plot', '2022-09-24 09:51:38.975104'),
(24, 'smart', '0006_auto_20220804_1217', '2022-09-24 09:51:39.022018'),
(25, 'smart', '0007_provider_status', '2022-09-24 09:51:39.068883'),
(26, 'smart', '0008_auto_20220805_1025', '2022-09-24 09:51:39.256441'),
(27, 'smart', '0009_auto_20220805_1112', '2022-09-24 09:51:39.428383'),
(28, 'smart', '0010_slot', '2022-09-24 09:51:39.522156'),
(29, 'smart', '0011_alter_slot_slotname', '2022-09-24 09:51:39.600310'),
(30, 'smart', '0012_auto_20220809_1353', '2022-09-24 09:51:39.740959'),
(31, 'smart', '0013_booking_plot', '2022-09-24 09:51:39.803478'),
(32, 'smart', '0014_booking_providers', '2022-09-24 09:51:39.866083'),
(33, 'smart', '0015_auto_20220927_1952', '2022-10-09 17:43:01.549651'),
(34, 'smart', '0016_auto_20220927_2001', '2022-10-09 17:43:01.690257'),
(35, 'smart', '0017_booking_slot', '2022-10-09 17:43:01.737127'),
(36, 'smart', '0018_auto_20220930_1028', '2022-10-09 17:43:01.846490'),
(37, 'smart', '0019_auto_20220930_1147', '2022-10-09 17:43:01.908984'),
(38, 'smart', '0020_bank', '2022-10-09 17:43:01.940302'),
(39, 'smart', '0021_booking_status', '2022-10-09 17:43:01.955854'),
(40, 'smart', '0022_alter_login_username', '2022-10-09 17:43:01.971551'),
(41, 'smart', '0023_auto_20221001_1103', '2022-10-09 17:43:02.033971'),
(42, 'smart', '0024_auto_20221001_1126', '2022-10-09 17:43:02.080839'),
(43, 'smart', '0025_slot_amt', '2022-10-09 17:43:02.096464'),
(44, 'smart', '0026_slot_commission_amt', '2022-10-09 17:43:02.127710'),
(45, 'smart', '0027_auto_20221004_1259', '2022-10-09 17:43:02.330826'),
(46, 'smart', '0028_feedback_sub', '2022-10-09 17:43:02.346438'),
(47, 'smart', '0029_vehicleslot', '2022-10-09 17:43:02.377684'),
(48, 'smart', '0030_alter_booking_slot', '2022-10-09 18:06:31.415337');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2mb90p7xacnz7qos42eli7v43d0yjiw0', 'eyJ1c2VybmFtZSI6ImNoYXJsaSIsInJvbGUiOiJ1c2VyIiwiaWQiOjF9:1oc1xI:2BURwfRQwlkOhK7TbGnkbMg6-QghQsco7RdVcf9SfiE', '2022-10-08 10:00:16.007898'),
('jwf2ilt70bsdplxci1o668xfz41ofn6e', 'eyJ1c2VybmFtZSI6ImFtaXRoYSIsInJvbGUiOiJwcm92aWRlciIsImlkIjoyfQ:1ohbSD:-OoLcfbP6g_urhsWM-kICeCP-D4avzvsv3N2VdF2O08', '2022-10-23 18:55:13.498874');

-- --------------------------------------------------------

--
-- Table structure for table `smart_bank`
--

CREATE TABLE `smart_bank` (
  `bank_id` int(11) NOT NULL,
  `holder` varchar(100) NOT NULL,
  `card` varchar(100) NOT NULL,
  `cvv` varchar(100) NOT NULL,
  `exp` varchar(100) NOT NULL,
  `bal` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_booking`
--

CREATE TABLE `smart_booking` (
  `bookingid` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `slot_id` bigint(20) DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  `plot_id` int(11) DEFAULT NULL,
  `providers_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `smart_booking`
--

INSERT INTO `smart_booking` (`bookingid`, `user_id`, `slot_id`, `status`, `plot_id`, `providers_id`) VALUES
(1, 1, 1, 'approved', NULL, NULL),
(8, 1, 2, 'approved', NULL, NULL),
(9, 1, 2, 'approved', NULL, NULL),
(10, 1, 1, 'approved', NULL, NULL),
(11, 1, 1, 'approved', NULL, NULL),
(12, 1, 1, 'approved', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `smart_complaint`
--

CREATE TABLE `smart_complaint` (
  `complaint_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `msg` varchar(500) NOT NULL,
  `reply` varchar(500) NOT NULL,
  `sub` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `smart_district`
--

CREATE TABLE `smart_district` (
  `district_id` int(11) NOT NULL,
  `district` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_feedback`
--

CREATE TABLE `smart_feedback` (
  `feedback_id` int(11) NOT NULL,
  `feedback` varchar(500) NOT NULL,
  `reply` varchar(500) NOT NULL,
  `userid_id` int(11) DEFAULT NULL,
  `sub` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `smart_locations`
--

CREATE TABLE `smart_locations` (
  `location_id` int(11) NOT NULL,
  `location` varchar(100) NOT NULL,
  `district_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_login`
--

CREATE TABLE `smart_login` (
  `logid` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `role` varchar(25) NOT NULL,
  `temp` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `smart_login`
--

INSERT INTO `smart_login` (`logid`, `username`, `password`, `role`, `temp`) VALUES
(1, 'charli', '1234', 'user', ''),
(2, 'amitha', '1234', 'provider', 'provider'),
(3, 'admin', 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `smart_plot`
--

CREATE TABLE `smart_plot` (
  `plotid` int(11) NOT NULL,
  `district` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `totalarea` varchar(50) NOT NULL,
  `plan` varchar(100) NOT NULL,
  `twowheeler` varchar(50) NOT NULL,
  `tworate` varchar(50) NOT NULL,
  `twocapacity` varchar(50) NOT NULL,
  `twocommission` varchar(50) NOT NULL,
  `threewheeler` varchar(50) NOT NULL,
  `fourwheeler` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `fourcapacity` varchar(50) NOT NULL,
  `fourcommission` varchar(50) NOT NULL,
  `fourrate` varchar(50) NOT NULL,
  `threecapacity` varchar(50) NOT NULL,
  `threecommission` varchar(50) NOT NULL,
  `threerate` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `smart_plot`
--

INSERT INTO `smart_plot` (`plotid`, `district`, `location`, `totalarea`, `plan`, `twowheeler`, `tworate`, `twocapacity`, `twocommission`, `threewheeler`, `fourwheeler`, `status`, `provider_id`, `fourcapacity`, `fourcommission`, `fourrate`, `threecapacity`, `threecommission`, `threerate`) VALUES
(1, 'kollam', 'anchal', '500', 'images/pexels-jacob-morch-457418.jpg', 'yes', '20', '5', '20', 'yes', 'yes', 'approved', 1, '1', '1', '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `smart_provider`
--

CREATE TABLE `smart_provider` (
  `providerid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  `contact1` varchar(50) NOT NULL,
  `contact2` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `login_id` int(11) DEFAULT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `smart_provider`
--

INSERT INTO `smart_provider` (`providerid`, `name`, `address`, `contact1`, `contact2`, `district`, `location`, `login_id`, `status`) VALUES
(1, 'Amitha', 'ge,fjdvwh', '9900887766', '9911223344', 'kollam', 'anchal', 2, 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `smart_slot`
--

CREATE TABLE `smart_slot` (
  `slotid` int(11) NOT NULL,
  `slotname` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `slotplotid_id` int(11) DEFAULT NULL,
  `amt` varchar(100) NOT NULL,
  `commission_amt` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `smart_slot`
--

INSERT INTO `smart_slot` (`slotid`, `slotname`, `status`, `slotplotid_id`, `amt`, `commission_amt`) VALUES
(1, '1', '0', 1, '1', '1'),
(2, '2', '0', 1, '1', '1'),
(3, '3', '0', 1, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `smart_user`
--

CREATE TABLE `smart_user` (
  `userid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `age` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `licenseno` varchar(50) NOT NULL,
  `license` varchar(50) NOT NULL,
  `phoneno` varchar(50) NOT NULL,
  `mailid` varchar(50) NOT NULL,
  `login_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `smart_user`
--

INSERT INTO `smart_user` (`userid`, `name`, `gender`, `address`, `age`, `district`, `location`, `licenseno`, `license`, `phoneno`, `mailid`, `login_id`) VALUES
(1, 'Charli S', 'male', 'gvhufdgvbhufbvh', '20', 'kollam', 'anchal', '23455678', 'images/pexels-mentatdgt-1266152.jpg', '9988776655', 'charli@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `smart_vehicleslot`
--

CREATE TABLE `smart_vehicleslot` (
  `id` bigint(20) NOT NULL,
  `vehicle_type` varchar(100) NOT NULL,
  `capacity` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `commission` int(11) NOT NULL,
  `available` int(11) NOT NULL,
  `plot_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `smart_vehicleslot`
--

INSERT INTO `smart_vehicleslot` (`id`, `vehicle_type`, `capacity`, `rate`, `commission`, `available`, `plot_id_id`) VALUES
(1, 'Four wheeler', 20, 30, 10, 0, 1),
(2, 'Two wheeler', 10, 40, 10, 4, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `smart_bank`
--
ALTER TABLE `smart_bank`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `smart_booking`
--
ALTER TABLE `smart_booking`
  ADD PRIMARY KEY (`bookingid`),
  ADD KEY `smart_booking_user_id_f1e6c169_fk_smart_user_userid` (`user_id`),
  ADD KEY `smart_booking_plot_id_bece9ea7_fk_smart_plot_plotid` (`plot_id`),
  ADD KEY `smart_booking_providers_id_0051c6fd_fk_smart_provider_providerid` (`providers_id`),
  ADD KEY `smart_booking_slot_id_bc3aac82_fk_smart_vehicleslot_id` (`slot_id`);

--
-- Indexes for table `smart_complaint`
--
ALTER TABLE `smart_complaint`
  ADD PRIMARY KEY (`complaint_id`),
  ADD KEY `smart_complaint_provider_id_6d662678_fk_smart_pro` (`staff_id`);

--
-- Indexes for table `smart_district`
--
ALTER TABLE `smart_district`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `smart_feedback`
--
ALTER TABLE `smart_feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `smart_feedback_userid_id_7b9f30ff_fk_smart_user_userid` (`userid_id`);

--
-- Indexes for table `smart_locations`
--
ALTER TABLE `smart_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `smart_locations_district_id_be4f24c5_fk_smart_dis` (`district_id`);

--
-- Indexes for table `smart_login`
--
ALTER TABLE `smart_login`
  ADD PRIMARY KEY (`logid`);

--
-- Indexes for table `smart_plot`
--
ALTER TABLE `smart_plot`
  ADD PRIMARY KEY (`plotid`),
  ADD KEY `smart_plot_provider_id_d9174807_fk_smart_provider_providerid` (`provider_id`);

--
-- Indexes for table `smart_provider`
--
ALTER TABLE `smart_provider`
  ADD PRIMARY KEY (`providerid`),
  ADD KEY `smart_provider_login_id_722f550f_fk_smart_login_logid` (`login_id`);

--
-- Indexes for table `smart_slot`
--
ALTER TABLE `smart_slot`
  ADD PRIMARY KEY (`slotid`),
  ADD KEY `smart_slot_slotplotid_id_15312c77_fk_smart_plot_plotid` (`slotplotid_id`);

--
-- Indexes for table `smart_user`
--
ALTER TABLE `smart_user`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `smart_user_login_id_ed12528e_fk_smart_login_logid` (`login_id`);

--
-- Indexes for table `smart_vehicleslot`
--
ALTER TABLE `smart_vehicleslot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `smart_vehicleslot_plot_id_id_76b2d03e_fk_smart_plot_plotid` (`plot_id_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `smart_bank`
--
ALTER TABLE `smart_bank`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `smart_booking`
--
ALTER TABLE `smart_booking`
  MODIFY `bookingid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `smart_complaint`
--
ALTER TABLE `smart_complaint`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `smart_district`
--
ALTER TABLE `smart_district`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `smart_feedback`
--
ALTER TABLE `smart_feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `smart_locations`
--
ALTER TABLE `smart_locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `smart_login`
--
ALTER TABLE `smart_login`
  MODIFY `logid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `smart_plot`
--
ALTER TABLE `smart_plot`
  MODIFY `plotid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `smart_provider`
--
ALTER TABLE `smart_provider`
  MODIFY `providerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `smart_slot`
--
ALTER TABLE `smart_slot`
  MODIFY `slotid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `smart_user`
--
ALTER TABLE `smart_user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `smart_vehicleslot`
--
ALTER TABLE `smart_vehicleslot`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `smart_booking`
--
ALTER TABLE `smart_booking`
  ADD CONSTRAINT `smart_booking_plot_id_bece9ea7_fk_smart_plot_plotid` FOREIGN KEY (`plot_id`) REFERENCES `smart_plot` (`plotid`),
  ADD CONSTRAINT `smart_booking_providers_id_0051c6fd_fk_smart_provider_providerid` FOREIGN KEY (`providers_id`) REFERENCES `smart_provider` (`providerid`),
  ADD CONSTRAINT `smart_booking_slot_id_bc3aac82_fk_smart_vehicleslot_id` FOREIGN KEY (`slot_id`) REFERENCES `smart_vehicleslot` (`id`),
  ADD CONSTRAINT `smart_booking_user_id_f1e6c169_fk_smart_user_userid` FOREIGN KEY (`user_id`) REFERENCES `smart_user` (`userid`);

--
-- Constraints for table `smart_complaint`
--
ALTER TABLE `smart_complaint`
  ADD CONSTRAINT `smart_complaint_staff_id_88c90eae_fk_smart_provider_providerid` FOREIGN KEY (`staff_id`) REFERENCES `smart_provider` (`providerid`);

--
-- Constraints for table `smart_feedback`
--
ALTER TABLE `smart_feedback`
  ADD CONSTRAINT `smart_feedback_userid_id_7b9f30ff_fk_smart_user_userid` FOREIGN KEY (`userid_id`) REFERENCES `smart_user` (`userid`);

--
-- Constraints for table `smart_locations`
--
ALTER TABLE `smart_locations`
  ADD CONSTRAINT `smart_locations_district_id_be4f24c5_fk_smart_dis` FOREIGN KEY (`district_id`) REFERENCES `smart_district` (`district_id`);

--
-- Constraints for table `smart_plot`
--
ALTER TABLE `smart_plot`
  ADD CONSTRAINT `smart_plot_provider_id_d9174807_fk_smart_provider_providerid` FOREIGN KEY (`provider_id`) REFERENCES `smart_provider` (`providerid`);

--
-- Constraints for table `smart_provider`
--
ALTER TABLE `smart_provider`
  ADD CONSTRAINT `smart_provider_login_id_722f550f_fk_smart_login_logid` FOREIGN KEY (`login_id`) REFERENCES `smart_login` (`logid`);

--
-- Constraints for table `smart_slot`
--
ALTER TABLE `smart_slot`
  ADD CONSTRAINT `smart_slot_slotplotid_id_15312c77_fk_smart_plot_plotid` FOREIGN KEY (`slotplotid_id`) REFERENCES `smart_plot` (`plotid`);

--
-- Constraints for table `smart_user`
--
ALTER TABLE `smart_user`
  ADD CONSTRAINT `smart_user_login_id_ed12528e_fk_smart_login_logid` FOREIGN KEY (`login_id`) REFERENCES `smart_login` (`logid`);

--
-- Constraints for table `smart_vehicleslot`
--
ALTER TABLE `smart_vehicleslot`
  ADD CONSTRAINT `smart_vehicleslot_plot_id_id_76b2d03e_fk_smart_plot_plotid` FOREIGN KEY (`plot_id_id`) REFERENCES `smart_plot` (`plotid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
