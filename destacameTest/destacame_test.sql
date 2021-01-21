-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-01-2021 a las 05:08:37
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `destacame_test`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `auth_permission`
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
(25, 'Can add auth group', 7, 'add_authgroup'),
(26, 'Can change auth group', 7, 'change_authgroup'),
(27, 'Can delete auth group', 7, 'delete_authgroup'),
(28, 'Can view auth group', 7, 'view_authgroup'),
(29, 'Can add auth group permissions', 8, 'add_authgrouppermissions'),
(30, 'Can change auth group permissions', 8, 'change_authgrouppermissions'),
(31, 'Can delete auth group permissions', 8, 'delete_authgrouppermissions'),
(32, 'Can view auth group permissions', 8, 'view_authgrouppermissions'),
(33, 'Can add auth permission', 9, 'add_authpermission'),
(34, 'Can change auth permission', 9, 'change_authpermission'),
(35, 'Can delete auth permission', 9, 'delete_authpermission'),
(36, 'Can view auth permission', 9, 'view_authpermission'),
(37, 'Can add auth user', 10, 'add_authuser'),
(38, 'Can change auth user', 10, 'change_authuser'),
(39, 'Can delete auth user', 10, 'delete_authuser'),
(40, 'Can view auth user', 10, 'view_authuser'),
(41, 'Can add auth user groups', 11, 'add_authusergroups'),
(42, 'Can change auth user groups', 11, 'change_authusergroups'),
(43, 'Can delete auth user groups', 11, 'delete_authusergroups'),
(44, 'Can view auth user groups', 11, 'view_authusergroups'),
(45, 'Can add auth user user permissions', 12, 'add_authuseruserpermissions'),
(46, 'Can change auth user user permissions', 12, 'change_authuseruserpermissions'),
(47, 'Can delete auth user user permissions', 12, 'delete_authuseruserpermissions'),
(48, 'Can view auth user user permissions', 12, 'view_authuseruserpermissions'),
(49, 'Can add buses', 13, 'add_buses'),
(50, 'Can change buses', 13, 'change_buses'),
(51, 'Can delete buses', 13, 'delete_buses'),
(52, 'Can view buses', 13, 'view_buses'),
(53, 'Can add choferes', 14, 'add_choferes'),
(54, 'Can change choferes', 14, 'change_choferes'),
(55, 'Can delete choferes', 14, 'delete_choferes'),
(56, 'Can view choferes', 14, 'view_choferes'),
(57, 'Can add django admin log', 15, 'add_djangoadminlog'),
(58, 'Can change django admin log', 15, 'change_djangoadminlog'),
(59, 'Can delete django admin log', 15, 'delete_djangoadminlog'),
(60, 'Can view django admin log', 15, 'view_djangoadminlog'),
(61, 'Can add django content type', 16, 'add_djangocontenttype'),
(62, 'Can change django content type', 16, 'change_djangocontenttype'),
(63, 'Can delete django content type', 16, 'delete_djangocontenttype'),
(64, 'Can view django content type', 16, 'view_djangocontenttype'),
(65, 'Can add django migrations', 17, 'add_djangomigrations'),
(66, 'Can change django migrations', 17, 'change_djangomigrations'),
(67, 'Can delete django migrations', 17, 'delete_djangomigrations'),
(68, 'Can view django migrations', 17, 'view_djangomigrations'),
(69, 'Can add django session', 18, 'add_djangosession'),
(70, 'Can change django session', 18, 'change_djangosession'),
(71, 'Can delete django session', 18, 'delete_djangosession'),
(72, 'Can view django session', 18, 'view_djangosession'),
(73, 'Can add pasajeros', 19, 'add_pasajeros'),
(74, 'Can change pasajeros', 19, 'change_pasajeros'),
(75, 'Can delete pasajeros', 19, 'delete_pasajeros'),
(76, 'Can view pasajeros', 19, 'view_pasajeros'),
(77, 'Can add pasajeros asientos', 20, 'add_pasajerosasientos'),
(78, 'Can change pasajeros asientos', 20, 'change_pasajerosasientos'),
(79, 'Can delete pasajeros asientos', 20, 'delete_pasajerosasientos'),
(80, 'Can view pasajeros asientos', 20, 'view_pasajerosasientos'),
(81, 'Can add trayecto', 21, 'add_trayecto'),
(82, 'Can change trayecto', 21, 'change_trayecto'),
(83, 'Can delete trayecto', 21, 'delete_trayecto'),
(84, 'Can view trayecto', 21, 'view_trayecto'),
(85, 'Can add viajes', 22, 'add_viajes'),
(86, 'Can change viajes', 22, 'change_viajes'),
(87, 'Can delete viajes', 22, 'delete_viajes'),
(88, 'Can view viajes', 22, 'view_viajes'),
(89, 'Can add courses', 23, 'add_courses'),
(90, 'Can change courses', 23, 'change_courses'),
(91, 'Can delete courses', 23, 'delete_courses'),
(92, 'Can view courses', 23, 'view_courses'),
(93, 'Can add drivers', 24, 'add_drivers'),
(94, 'Can change drivers', 24, 'change_drivers'),
(95, 'Can delete drivers', 24, 'delete_drivers'),
(96, 'Can view drivers', 24, 'view_drivers'),
(97, 'Can add passengers', 25, 'add_passengers'),
(98, 'Can change passengers', 25, 'change_passengers'),
(99, 'Can delete passengers', 25, 'delete_passengers'),
(100, 'Can view passengers', 25, 'view_passengers'),
(101, 'Can add passenger seats', 26, 'add_passengerseats'),
(102, 'Can change passenger seats', 26, 'change_passengerseats'),
(103, 'Can delete passenger seats', 26, 'delete_passengerseats'),
(104, 'Can view passenger seats', 26, 'view_passengerseats'),
(105, 'Can add trips', 27, 'add_trips'),
(106, 'Can change trips', 27, 'change_trips'),
(107, 'Can delete trips', 27, 'delete_trips'),
(108, 'Can view trips', 27, 'view_trips');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(150) COLLATE utf8_bin NOT NULL,
  `email` varchar(254) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$LIOrfX2lPcf7$jxYLx29WIVsSngfcxwr9LhL7mR2koAYM7zVU0nJ/2uQ=', NULL, 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2021-01-13 18:54:35.732657');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buses`
--

CREATE TABLE `buses` (
  `bus_id` int(11) NOT NULL,
  `seats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `buses`
--

INSERT INTO `buses` (`bus_id`, `seats`) VALUES
(50, 10),
(53, 10),
(54, 10),
(55, 10),
(56, 10),
(57, 10),
(58, 10),
(59, 10),
(60, 10),
(61, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `origin` varchar(30) COLLATE utf8_bin NOT NULL,
  `destination` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `courses`
--

INSERT INTO `courses` (`course_id`, `origin`, `destination`) VALUES
(1, 'Santiago', 'La Serena'),
(4, 'Santiago', 'Concepción');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_bin DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'bus_management', 'authgroup'),
(8, 'bus_management', 'authgrouppermissions'),
(9, 'bus_management', 'authpermission'),
(10, 'bus_management', 'authuser'),
(11, 'bus_management', 'authusergroups'),
(12, 'bus_management', 'authuseruserpermissions'),
(13, 'bus_management', 'buses'),
(14, 'bus_management', 'choferes'),
(23, 'bus_management', 'courses'),
(15, 'bus_management', 'djangoadminlog'),
(16, 'bus_management', 'djangocontenttype'),
(17, 'bus_management', 'djangomigrations'),
(18, 'bus_management', 'djangosession'),
(24, 'bus_management', 'drivers'),
(19, 'bus_management', 'pasajeros'),
(20, 'bus_management', 'pasajerosasientos'),
(25, 'bus_management', 'passengers'),
(26, 'bus_management', 'passengerseats'),
(21, 'bus_management', 'trayecto'),
(27, 'bus_management', 'trips'),
(22, 'bus_management', 'viajes'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-01-11 19:09:21.429143'),
(2, 'auth', '0001_initial', '2021-01-11 19:09:21.621860'),
(3, 'admin', '0001_initial', '2021-01-11 19:09:22.209754'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-01-11 19:09:22.348340'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-01-11 19:09:22.357070'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-01-11 19:09:22.447860'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-01-11 19:09:22.504646'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-01-11 19:09:22.606425'),
(9, 'auth', '0004_alter_user_username_opts', '2021-01-11 19:09:22.614419'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-01-11 19:09:22.689162'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-01-11 19:09:22.692161'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-01-11 19:09:22.701034'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-01-11 19:09:22.719968'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-01-11 19:09:22.741153'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-01-11 19:09:22.808021'),
(16, 'auth', '0011_update_proxy_permissions', '2021-01-11 19:09:22.815035'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-01-11 19:09:22.835022'),
(18, 'sessions', '0001_initial', '2021-01-11 19:09:22.861393'),
(19, 'bus_management', '0001_initial', '2021-01-13 01:32:07.533420'),
(20, 'bus_management', '0002_auto_20210119_2357', '2021-01-20 02:57:36.633102');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `drivers`
--

CREATE TABLE `drivers` (
  `name` varchar(30) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(30) COLLATE utf8_bin NOT NULL,
  `rut` int(11) NOT NULL,
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `drivers`
--

INSERT INTO `drivers` (`name`, `lastname`, `rut`, `birthday`) VALUES
('Felipe', 'Vasques', 1234567, '1992-05-08'),
('Juan', 'Toledo', 8666459, '1990-01-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `passengers`
--

CREATE TABLE `passengers` (
  `rut` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(30) COLLATE utf8_bin NOT NULL,
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `passengers`
--

INSERT INTO `passengers` (`rut`, `name`, `lastname`, `birthday`) VALUES
(12456, 'Test', 'De Form', '1990-01-01'),
(124545, '32132112', 'asda', '1990-01-01'),
(1238745, 'Francisco', 'Saavedra', '1984-01-01'),
(18640995, 'Franco', 'Zalavari', '1994-05-20'),
(18645489, 'Hade', 'Ramos', '1997-05-05'),
(18974727, 'Javier', 'Ramos', '1994-10-08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `passenger_seats`
--

CREATE TABLE `passenger_seats` (
  `id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `passenger_rut` int(11) NOT NULL,
  `seat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `passenger_seats`
--

INSERT INTO `passenger_seats` (`id`, `trip_id`, `passenger_rut`, `seat`) VALUES
(53, 7, 18640995, 3),
(54, 7, 18640995, 2),
(55, 7, 18640995, 4),
(56, 7, 18640995, 5),
(57, 9, 18640995, 5),
(58, 9, 18640995, 7),
(59, 9, 18640995, 3),
(60, 9, 18640995, 3),
(61, 9, 18640995, 3),
(62, 9, 18640995, 9),
(63, 9, 18640995, 9),
(64, 9, 18640995, 1),
(65, 9, 18640995, 4),
(66, 9, 18640995, 2),
(67, 9, 18640995, 0),
(68, 9, 18640995, 6),
(69, 9, 18640995, 8),
(70, 10, 18640995, 5),
(71, 10, 18640995, 4),
(72, 10, 18640995, 3),
(73, 10, 18640995, 7),
(74, 10, 18640995, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trips`
--

CREATE TABLE `trips` (
  `trip_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `departure_date` date NOT NULL,
  `bus_id` int(11) NOT NULL,
  `departure_time` time NOT NULL,
  `seats_taken` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `trips`
--

INSERT INTO `trips` (`trip_id`, `driver_id`, `course_id`, `departure_date`, `bus_id`, `departure_time`, `seats_taken`) VALUES
(1, 1234567, 1, '2021-01-01', 50, '01:17:00', 0),
(2, 1234567, 4, '2021-01-19', 50, '03:24:00', 0),
(3, 1234567, 4, '2021-01-19', 50, '04:39:00', 0),
(4, 1234567, 1, '2021-01-12', 53, '16:21:11', 0),
(5, 1234567, 4, '2021-01-22', 50, '21:04:00', 0),
(6, 1234567, 4, '2021-01-20', 53, '15:55:00', 0),
(7, 1234567, 1, '2021-01-20', 50, '01:23:00', 4),
(8, 1234567, 1, '2021-01-21', 53, '03:55:00', 0),
(9, 8666459, 4, '2021-01-24', 60, '09:00:00', 14),
(10, 1234567, 1, '2021-01-23', 50, '10:00:00', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`bus_id`);

--
-- Indices de la tabla `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`rut`);

--
-- Indices de la tabla `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`rut`);

--
-- Indices de la tabla `passenger_seats`
--
ALTER TABLE `passenger_seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trip` (`trip_id`),
  ADD KEY `passenger` (`passenger_rut`);

--
-- Indices de la tabla `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`trip_id`),
  ADD KEY `bus` (`bus_id`),
  ADD KEY `driver` (`driver_id`),
  ADD KEY `course` (`course_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `buses`
--
ALTER TABLE `buses`
  MODIFY `bus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `passenger_seats`
--
ALTER TABLE `passenger_seats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `trips`
--
ALTER TABLE `trips`
  MODIFY `trip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `passenger_seats`
--
ALTER TABLE `passenger_seats`
  ADD CONSTRAINT `passenger` FOREIGN KEY (`passenger_rut`) REFERENCES `passengers` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trip` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`trip_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `bus` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`bus_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `id` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`rut`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
