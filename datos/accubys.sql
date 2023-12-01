-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2023 a las 19:45:24
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `accubys`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ast_actividads`
--

CREATE TABLE `ast_actividads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sprint_id` bigint(20) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `prefijo` varchar(10) NOT NULL DEFAULT 'AST',
  `id_tarea` varchar(10) DEFAULT NULL,
  `id_sec` varchar(10) NOT NULL DEFAULT '1 - 1',
  `nombre` varchar(200) DEFAULT NULL,
  `horas` int(11) DEFAULT NULL,
  `concepto` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ast_actividads`
--

INSERT INTO `ast_actividads` (`id`, `sprint_id`, `fecha`, `prefijo`, `id_tarea`, `id_sec`, `nombre`, `horas`, `concepto`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, '2023-09-18', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Presenciales', '2023-10-02 07:13:59', '2023-10-02 07:13:59', NULL),
(2, NULL, '2023-09-19', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Trabajo Remoto', '2023-10-02 07:14:20', '2023-10-06 07:20:38', NULL),
(3, NULL, '2023-09-20', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Presenciales', '2023-10-02 07:14:41', '2023-10-02 07:14:41', NULL),
(4, NULL, '2023-09-21', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Trabajo Remoto', '2023-10-02 07:15:06', '2023-10-02 07:15:06', NULL),
(5, NULL, '2023-09-22', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Trabajo Remoto', '2023-10-02 07:15:26', '2023-10-02 07:15:26', NULL),
(6, NULL, '2023-09-25', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Presenciales', '2023-10-02 07:17:01', '2023-10-02 07:17:01', NULL),
(7, NULL, '2023-09-26', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Trabajo Remoto', '2023-10-02 07:17:19', '2023-10-02 07:17:19', NULL),
(8, NULL, '2023-09-27', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Presenciales', '2023-10-02 07:18:22', '2023-10-02 07:18:22', NULL),
(9, NULL, '2023-09-28', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Trabajo Remoto', '2023-10-02 07:18:49', '2023-10-02 07:18:49', NULL),
(10, NULL, '2023-09-29', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Trabajo Remoto', '2023-10-02 07:19:10', '2023-10-02 07:19:10', NULL),
(11, NULL, '2023-10-02', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Presenciales', '2023-10-02 20:37:55', '2023-10-02 20:37:55', NULL),
(12, NULL, '2023-10-03', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Trabajo Remoto', '2023-10-06 07:21:32', '2023-10-06 07:21:32', NULL),
(13, NULL, '2023-10-04', 'AST', '101594', '1 - 1', 'BM - PROY.CAP.COBIS-EA-DOC.EA ACCUSYS', 1, 'Hs_Presenciales', '2023-10-06 07:24:56', '2023-10-06 07:24:56', NULL),
(14, NULL, '2023-10-04', 'AST', '103542', '1 - 1', 'REUNIONES GERENCIA - EQUIPO TRABAJO', 1, 'Hs_Presenciales', '2023-10-06 07:26:39', '2023-10-06 17:54:43', NULL),
(15, NULL, '2023-10-04', 'AST', '59446', '1 - 1', 'INDUCCION', 6, 'Hs_Presenciales', '2023-10-06 07:26:59', '2023-10-06 07:26:59', NULL),
(16, NULL, '2023-10-05', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Trabajo Remoto', '2023-10-10 21:33:46', '2023-10-10 21:33:46', NULL),
(17, NULL, '2023-10-06', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Trabajo Remoto', '2023-10-10 21:34:18', '2023-10-10 21:34:18', NULL),
(18, NULL, '2023-10-09', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Presenciales', '2023-10-10 21:35:17', '2023-10-13 18:47:06', NULL),
(19, NULL, '2023-10-10', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Trabajo Remoto', '2023-10-13 18:51:43', '2023-10-13 18:51:43', NULL),
(20, NULL, '2023-10-11', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Presenciales', '2023-10-17 05:17:18', '2023-10-17 05:17:18', NULL),
(21, NULL, '2023-10-12', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Trabajo Remoto', '2023-10-17 05:17:54', '2023-10-17 05:17:54', NULL),
(22, NULL, '2023-10-17', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Trabajo Remoto', '2023-10-20 21:54:02', '2023-10-20 21:54:02', NULL),
(23, NULL, '2023-10-18', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Presenciales', '2023-10-21 01:55:02', '2023-10-21 01:55:02', NULL),
(24, NULL, '2023-10-19', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Trabajo Remoto', '2023-10-21 01:55:48', '2023-10-21 01:55:48', NULL),
(25, NULL, '2023-10-20', 'AST', '59446', '1 - 1', 'INDUCCION', 8, 'Hs_Trabajo Remoto', '2023-10-23 22:00:34', '2023-10-23 22:00:34', NULL),
(26, NULL, '2023-10-23', 'AST', '103549', '1 - 1', 'BH - Cotizacion Desarrollo funcionalidad de informe de Mora y datos generales de Cajas de Seguridad', 8, 'Hs_Presenciales', '2023-10-23 22:02:26', '2023-10-23 22:02:26', NULL),
(27, NULL, '2023-10-24', 'AST', '103549', '1 - 1', 'BH - Cotizacion Desarrollo funcionalidad de informe de Mora y datos generales de Cajas de Seguridad', 8, 'Hs_Trabajo Remoto', '2023-10-31 15:01:14', '2023-10-31 15:01:14', NULL),
(28, NULL, '2023-10-25', 'AST', '103549', '1 - 1', 'BH - Cotizacion Desarrollo funcionalidad de informe de Mora y datos generales de Cajas de Seguridad', 8, 'Hs_Presenciales', '2023-10-31 15:01:38', '2023-10-31 15:01:38', NULL),
(29, NULL, '2023-10-26', 'AST', '103549', '1 - 1', 'BH - Cotizacion Desarrollo funcionalidad de informe de Mora y datos generales de Cajas de Seguridad (Problemas VDI)', 8, 'Hs_Trabajo Remoto', '2023-10-31 15:02:12', '2023-11-04 01:43:03', NULL),
(30, NULL, '2023-10-27', 'AST', '103549', '1 - 1', 'BH - Cotizacion Desarrollo funcionalidad de informe de Mora y datos generales de Cajas de Seguridad (problemas VDI)', 8, 'Hs_Trabajo Remoto', '2023-10-31 15:02:59', '2023-11-04 01:42:33', NULL),
(31, NULL, '2023-10-30', 'AST', '103549', '1 - 1', 'BH - Cotizacion Desarrollo funcionalidad de informe de Mora y datos generales de Cajas de Seguridad (problemas VDI)', 8, 'Hs_Presenciales', '2023-11-02 21:19:14', '2023-11-04 01:42:24', NULL),
(32, NULL, '2023-10-31', 'AST', '103549', '1 - 1', 'BH - Cotizacion Desarrollo funcionalidad de informe de Mora y datos generales de Cajas de Seguridad (Problemas VDI)', 8, 'Hs_Trabajo Remoto', '2023-11-02 21:19:49', '2023-11-04 01:43:33', NULL),
(33, NULL, '2023-11-01', 'AST', '103549', '1 - 1', 'BH - Cotizacion Desarrollo funcionalidad de informe de Mora y datos generales de Cajas de Seguridad', 7, 'Hs_Presenciales', '2023-11-02 21:20:13', '2023-11-04 01:43:47', NULL),
(34, NULL, '2023-11-01', 'AST', '101171', '1 - 1', 'Capacitacion - Introduccion al SGSI', 1, 'Hs_Presenciales', '2023-11-04 01:45:29', '2023-11-04 01:45:29', NULL),
(35, NULL, '2023-11-02', 'AST', '103549', '1 - 1', 'BH - Cotizacion Desarrollo funcionalidad de informe de Mora y datos generales de Cajas de Seguridad', 6, 'Hs_Trabajo Remoto', '2023-11-04 01:48:26', '2023-11-04 01:48:26', NULL),
(36, NULL, '2023-11-02', 'AST', '101652', '1 - 1', 'Capacitacion - CEN', 2, 'Hs_Trabajo Remoto', '2023-11-04 01:49:12', '2023-11-04 01:50:07', NULL),
(37, NULL, '2023-11-03', 'AST', '103549', '1 - 1', 'BH - Cotizacion Desarrollo funcionalidad de informe de Mora y datos generales de Cajas de Seguridad', 8, 'Hs_Trabajo Remoto', '2023-11-04 01:49:37', '2023-11-04 01:49:37', NULL),
(38, NULL, '2023-11-07', 'AST', '103549', '1 - 1', 'BH - Cotizacion Desarrollo funcionalidad de informe de Mora y datos generales de Cajas de Seguridad', 6, 'Hs_Trabajo Remoto', '2023-11-08 01:59:51', '2023-11-08 01:59:51', NULL),
(39, NULL, '2023-11-07', 'AST', '101652', '1 - 1', 'Capacitacion - CEN', 2, 'Hs_Trabajo Remoto', '2023-11-08 02:00:17', '2023-11-08 02:00:17', NULL),
(40, NULL, '2023-11-08', 'AST', '103549', '1 - 1', 'BH - Cotizacion Desarrollo funcionalidad de informe de Mora y datos generales de Cajas de Seguridad', 6, 'Hs_Presenciales', '2023-11-08 22:36:04', '2023-11-09 23:05:26', NULL),
(41, NULL, '2023-11-08', 'AST', '102170', '1 - 1', 'CAPACITACIÓN-TALLER TRAINING SOFT SKILLS', 2, 'Hs_Presenciales', '2023-11-08 22:36:27', '2023-11-09 23:05:43', NULL),
(42, NULL, '2023-11-09', 'AST', '103549', '1 - 1', 'BH - Cotizacion Desarrollo funcionalidad de informe de Mora y datos generales de Cajas de Seguridad', 6, 'Hs_Trabajo Remoto', '2023-11-09 23:04:25', '2023-11-09 23:04:25', NULL),
(43, NULL, '2023-11-09', 'AST', '101652', '1 - 1', 'Capacitacion - CEN', 2, 'Hs_Trabajo Remoto', '2023-11-09 23:04:51', '2023-11-09 23:06:08', NULL),
(44, NULL, '2023-11-10', 'AST', '103549', '1 - 1', 'BH - Cotizacion Desarrollo funcionalidad de informe de Mora y datos generales de Cajas de Seguridad', 8, 'Hs_Trabajo Remoto', '2023-11-11 01:40:48', '2023-11-11 01:40:48', NULL),
(45, NULL, '2023-11-10', 'AST', '103806', '1 - 1', 'BCBA_PROYECTO_JUBILACIONES_FALLECIDOS_RECLAMOS  MAN-IMPAGOS E INTERFAZ EMERIX', 2, 'Hs_Trabajo Remoto', '2023-11-15 14:38:46', '2023-11-15 14:38:46', NULL),
(46, NULL, '2023-11-13', 'AST', '103549', '1 - 1', 'BH - Cotizacion Desarrollo funcionalidad de informe de Mora y datos generales de Cajas de Seguridad', 8, 'Hs_Presenciales', '2023-11-15 14:39:19', '2023-11-15 14:39:19', NULL),
(47, NULL, '2023-11-14', 'AST', '103549', '1 - 1', 'BH - Cotizacion Desarrollo funcionalidad de informe de Mora y datos generales de Cajas de Seguridad', 6, 'Hs_Trabajo Remoto', '2023-11-15 14:39:44', '2023-11-15 14:39:44', NULL),
(48, NULL, '2023-11-14', 'AST', '101652', '1 - 1', 'Capacitacion - CEN', 2, 'Hs_Trabajo Remoto', '2023-11-15 14:40:04', '2023-11-15 14:40:04', NULL),
(49, NULL, '2023-11-15', 'AST', '103549', '1 - 1', 'BH - Cotizacion Desarrollo funcionalidad de informe de Mora y datos generales de Cajas de Seguridad', 8, 'Hs_Presenciales', '2023-11-19 04:31:25', '2023-11-30 17:36:20', NULL),
(50, NULL, '2023-11-16', 'AST', '101299', '1 - 1', 'BCBA - Proyecto Migración Jubilaciones a Cobis - Interfases a generar por Adelantos', 6, 'Hs_Trabajo Remoto', '2023-11-19 04:31:47', '2023-11-30 17:49:51', NULL),
(51, NULL, '2023-11-16', 'AST', '101652', '1 - 1', 'Capacitacion - CEN', 2, 'Hs_Trabajo Remoto', '2023-11-19 04:32:10', '2023-11-19 04:32:10', NULL),
(52, NULL, '2023-11-17', 'AST', '101299', '1 - 1', 'BCBA - Proyecto Migración Jubilaciones a Cobis - Interfases a generar por Adelantos', 8, 'Hs_Trabajo Remoto', '2023-11-19 04:33:02', '2023-11-30 17:50:39', NULL),
(53, NULL, '2023-11-20', 'AST', '101299', '1 - 1', 'BCBA - Proyecto Migración Jubilaciones a Cobis - Interfases a generar por Adelantos', 8, 'Hs_Presenciales', '2023-11-21 23:06:58', '2023-11-30 17:52:21', NULL),
(54, NULL, '2023-11-21', 'AST', '101652', '1 - 1', 'Capacitacion - CEN', 2, 'Hs_Trabajo Remoto', '2023-11-21 23:07:11', '2023-11-21 23:07:11', NULL),
(55, NULL, '2023-11-21', 'AST', '101299', '1 - 1', 'BCBA - Proyecto Migración Jubilaciones a Cobis - Interfases a generar por Adelantos', 6, 'Hs_Trabajo Remoto', '2023-11-23 15:31:24', '2023-11-30 17:53:17', NULL),
(56, NULL, '2023-11-22', 'AST', '101299', '1 - 1', 'BCBA - Proyecto Migración Jubilaciones a Cobis - Interfases a generar por Adelantos', 4, 'Hs_Presenciales', '2023-11-30 17:58:01', '2023-11-30 17:58:01', NULL),
(57, NULL, '2023-11-22', 'AST', '103806', '1 - 1', 'BCBA_PROYECTO JUBILACIONES_FALLECIDOS_RECLAMOS MAN -IMPAGOS E INTERFAZ EMERIX', 4, 'Hs_Presenciales', '2023-11-30 17:58:33', '2023-11-30 17:58:33', NULL),
(58, NULL, '2023-11-23', 'AST', '103806', '1 - 1', 'BCBA_PROYECTO JUBILACIONES_FALLECIDOS_RECLAMOS MAN -IMPAGOS E INTERFAZ EMERIX', 6, 'Hs_Trabajo Remoto', '2023-11-30 18:02:35', '2023-11-30 18:02:35', NULL),
(59, NULL, '2023-11-23', 'AST', '101652', '1 - 1', 'Capacitacion - CEN', 2, 'Hs_Trabajo Remoto', '2023-11-30 18:03:17', '2023-11-30 18:03:17', NULL),
(60, NULL, '2023-11-24', 'AST', '103806', '1 - 1', 'BCBA_PROYECTO JUBILACIONES_FALLECIDOS_RECLAMOS MAN -IMPAGOS E INTERFAZ EMERIX', 6, 'Hs_Trabajo Remoto', '2023-11-30 18:04:05', '2023-11-30 18:04:05', NULL),
(61, NULL, '2023-11-24', 'AST', '101299', '1 - 1', 'BCBA - Proyecto Migración Jubilaciones a Cobis - Interfases a generar por Adelantos', 2, 'Hs_Trabajo Remoto', '2023-11-30 18:04:34', '2023-11-30 18:04:34', NULL),
(62, NULL, '2023-11-27', 'AST', '104040', '1 - 1', 'BH - ADAPTACIONES PARA EL FUNCIONAMIENTO DEL TRANSACTION LOG - BCRA-DGI', 8, 'Hs_Presenciales', '2023-11-30 18:29:25', '2023-11-30 18:29:25', NULL),
(63, NULL, '2023-11-28', 'AST', '104040', '1 - 1', 'BH - ADAPTACIONES PARA EL FUNCIONAMIENTO DEL TRANSACTION LOG - BCRA-DGI', 6, 'Hs_Trabajo Remoto', '2023-11-30 18:30:39', '2023-11-30 18:30:39', NULL),
(64, NULL, '2023-11-28', 'AST', '101652', '1 - 1', 'Capacitacion - CEN', 2, 'Hs_Trabajo Remoto', '2023-11-30 18:31:45', '2023-11-30 18:31:45', NULL),
(65, NULL, '2023-11-29', 'AST', '104040', '1 - 1', 'BH - ADAPTACIONES PARA EL FUNCIONAMIENTO DEL TRANSACTION LOG - BCRA-DGI', 8, 'Hs_Presenciales', '2023-11-30 18:32:22', '2023-11-30 18:32:22', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ast_sprints`
--

CREATE TABLE `ast_sprints` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `hora_creacion` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `imagen` varchar(40) DEFAULT 'categoria_generica.svg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 'Escritorio Remoto', 'escritorio_remoto.svg', '2023-10-23 18:04:21', '2023-10-23 18:04:21'),
(2, 'ISQL/w (Sybase)', 'isql_w.svg', '2023-10-23 18:04:45', '2023-10-23 18:04:45'),
(3, 'Notebook', 'notebook_asignada.svg', '2023-10-23 18:05:21', '2023-10-23 18:05:21'),
(4, 'FORTI', 'forti_client.svg', '2023-10-23 20:23:54', '2023-10-23 20:23:54'),
(5, 'TREND Vision', 'trend_vision_one_zero.svg', '2023-10-23 20:24:30', '2023-10-23 20:24:30'),
(6, 'SharePoint', 'share_point.svg', '2023-10-25 18:36:27', '2023-10-25 18:36:27'),
(7, 'AST - Activities Manager', 'categoria_generica.svg', '2023-10-27 16:53:36', '2023-10-27 16:53:36'),
(8, 'GLPI', 'glpi.svg', '2023-10-30 17:50:03', '2023-10-30 17:50:03'),
(9, 'Plataforma Educativa', 'plataforma_educativa.svg', '2023-10-30 17:56:27', '2023-10-30 17:56:27'),
(10, 'E-Mail Corporativo', 'mail.svg', '2023-10-30 20:25:42', '2023-10-30 20:25:42'),
(11, 'Citrix (Escritorio Remoto)', 'categoria_generica.svg', '2023-11-27 17:05:50', '2023-11-27 17:05:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credenciales`
--

CREATE TABLE `credenciales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `categoria_id` bigint(20) NOT NULL DEFAULT 1 COMMENT 'Uso: Escritorio remoto, ISQLW, etc.',
  `institucion_id` bigint(20) DEFAULT 1,
  `descripcion` varchar(250) NOT NULL,
  `tipo` varchar(1) DEFAULT 'u' COMMENT 'U: unico, no comparte clave // S: Slave, comparte.',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `credenciales`
--

INSERT INTO `credenciales` (`id`, `user`, `password`, `categoria_id`, `institucion_id`, `descripcion`, `tipo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'exequiel.polito', 'EP-4ccu2023', 3, 1, 'Notebook asignada (fisica)', 's', '2023-10-25 15:07:47', '2023-10-25 15:07:47', NULL),
(2, 'C05320', 'Banco123', 2, 2, 'de_pruebas', 'u', '2023-10-25 17:46:17', '2023-10-25 17:46:17', NULL),
(3, 'exequiel.polito', 'FTRAdMACkP', 4, 1, 'vpn.accusys.com.ar', 'u', '2023-10-25 17:50:56', '2023-10-25 17:50:56', NULL),
(4, 'exequiel.polito', 'EP-4ccu2023', 6, 1, 'https://accusys.sharepoint.com/sites/Centrales.Verde/Documentos%20compartidos', 's', '2023-10-25 18:37:08', '2023-10-25 18:37:08', NULL),
(5, 'kranemau', 'Columbia4000*', 1, 3, '10.253.2.34', 'u', '2023-10-27 22:56:34', '2023-10-27 22:56:34', NULL),
(6, 'epacosta', 'Viernes+1202AM', 2, 1, '192.168.50.121', 'u', '2023-10-30 17:40:45', '2023-10-30 17:40:45', NULL),
(7, 'exequiel.polito', 'EP-4ccu2023', 8, 1, 'https://helpdesk2.accusys.com.ar/', 's', '2023-10-30 17:50:19', '2023-10-30 17:50:19', NULL),
(8, 'exequiel.polito', 'Cyber2884', 9, 1, 'https://accusys.ejecutiva.com/portal/portal-general/', 'u', '2023-10-30 17:56:55', '2023-10-30 17:56:55', NULL),
(9, 'exequiel.polito@accusys.com.ar', 'EP-4ccu2023', 10, 1, 'https://outlook.office.com/mail/', 's', '2023-10-30 20:26:52', '2023-10-30 20:26:52', NULL),
(10, 'exequiel.polito', 'EP-4ccu2023', 1, 5, 'VWKS-TL246CEN64', 's', '2023-11-09 16:28:35', '2023-11-09 16:28:35', NULL),
(11, 'exequiel.polito@accusys.com.ar', 'EP-4ccu202', 5, 1, 'Programa por el que salgo a internet', 's', '2023-11-27 14:59:17', '2023-11-27 14:59:17', NULL),
(12, 'C04209', 'LGHcm4O6', 11, 2, 'https://vdi.hipotecario.com.ar/vpn/index.html [Sistema: AD]', 'u', '2023-11-27 17:07:10', '2023-11-27 17:07:10', NULL),
(13, 'C06461', 'Hfiy89q2', 11, 2, 'https://vdi.hipotecario.com.ar/vpn/index.html', 'u', '2023-12-01 17:32:12', '2023-12-01 17:32:12', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
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
-- Estructura de tabla para la tabla `fuentes`
--

CREATE TABLE `fuentes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `lenguaje_id` bigint(20) UNSIGNED NOT NULL,
  `categoria_id` bigint(20) DEFAULT NULL,
  `etiqueta` varchar(250) DEFAULT NULL,
  `desarrollo` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `fuentes`
--

INSERT INTO `fuentes` (`id`, `nombre`, `lenguaje_id`, `categoria_id`, `etiqueta`, `desarrollo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Inicio de un SP', 18, NULL, NULL, 'use [nombre_otro_sp]\ngo\n\nif exists (select 1\n         from sysobjects\n         where name = \'sp_a_crear\')\nbegin\n  drop proc sp_a_crear\nend\ngo\n/*\n<summary>\nCARGA MASIVA DE FATCA\n\nNombre Físico: bc_ocde_afip_masiva.sp\n</summary>\n\n<historylog>\n<log LogType=\"Refactor\" revision=\"1.1\" date=\"18/09/2023\" email=\"jose.barrera@accusys.com.ar\">AST 101066</log>\n</historylog>\n*/\ncreate proc sp_a_crear (\n--<parameters>\n@s_user                 varchar(8)     = null, --<param required =\"no\" description=\"LO QUE SIGNIFIQUE EL VALOR.\"/>\n@s_ssn                  int            = null, --<param required =\"no\" description=\"LO QUE SIGNIFIQUE EL VALOR\"/>\n--</parameters>\n)\nas\ndeclare\n@w_d_sp_name            varchar(30),\n@w_d_msg                varchar(132)\n\nselect\n   @w_d_sp_name   = \'sp_a_crear\',\n   @w_d_dato      = \'\',\n   @w_d_msg       = \'\',\n   @w_n_error     = 0\n\nif @s_date is null\nbegin\n   select @s_date = fp_fecha\n   from [base_de_datos]..[tabla_de_la_base]\nend', '2023-10-09 01:25:41', '2023-10-17 02:29:57', NULL),
(2, 'script_cajas_de_seguridad_mora', 18, NULL, 'Es un ejemplo para las cajas de seguridad', 'use cob_remesas                                                               \ngo                                                                           \n                                                                             \ndeclare \n@i_fecha_hasta   datetime,\n@w_codigo_tabla  smallint                                          \n                                                                             \nselect @i_fecha_hasta =  fp_fecha\nfrom cobis..ba_fecha_proceso                                       \n                                                                             \nselect 	@w_codigo_tabla = codigo\nfrom	cobis..cl_tabla\nwhere	tabla = \'cs_estado_contrato_c_segur\'\n                                                                      \nselect                                                                                                                 \ncs_oficina as Sucursal,                                                       \n(select of_nombre                                                           \n from cobis..cl_oficina                                       \n where of_oficina = S.cs_oficina)   as Nombre_Sucursal,                                    \nit_documento as Nro_Documento, \nit_cliente as Nro_cliente_Cobis,                                                       \nit_nombre_autorizado as Nombre_Apellido,  \ncs_descripcion as Numero_Caja,\n(select	mc_descripcion \nfrom cob_remesas..cs_modelo_caja \nwhere mc_codigo = S.cs_modelo \nand mc_fecha  = (select max (mc_fecha)\n                 from cs_modelo_caja\n                 where S.cs_modelo = mc_codigo) ) as Modelo,                                         \ncn_secuencial as Nro_Contrato,     \n(select valor from cobis..cl_catalogo where tabla = @w_codigo_tabla and C.cn_estado = codigo ) as Estado,\n(case when  C.cn_estado in  (\'B\', \'L\')  then \'SI\' else \'NO\' end) as Mora,   \n(select isnull(datediff(dd, pe_fecha_pago, @i_fecha_hasta), 0 )                      \n from cs_periodos                                                         \n where pe_estado = \'V\'                                                                                            \n   and pe_contrato = C.cn_secuencial\n     ) as Dias_Mora,                      \n(select sum(pe_valor_contrat )                            \nfrom cs_periodos                                                          \n where pe_estado = \'V\'                                                       \n   and pe_fecha_pago < @i_fecha_hasta                                        \n   and pe_contrato = C.cn_secuencial\n   ) as Importe_Mora,\n (case when  p_tipo_persona in (\'EM\',\'FU\') then \'S\' else \'N\' end) as Empleado                          \nfrom cs_contrato C, \n     cs_caja_seguridad S, \n     cs_integrantes,\n     cobis..cl_ente                     \nwhere cn_caja     = cs_secuencial                                                                                           \n  and cn_secuencial = it_secuencial                                           \n  and it_rol =\'T\'                                                            \n  and it_estado = \'V\'  \n  and en_ente  =  it_cliente    \n  and cn_estado <> \'T\'                                           \norder by cs_oficina ', '2023-10-10 15:40:21', '2023-10-10 15:40:21', NULL),
(3, 'Redirecciona_el_ENTER', 8, NULL, 'Atrapa y redirecciona el Keyup de ENTER', 'Private Sub cboTipoCuenta_KeyPress(KeyAscii As Integer)\n    If KeyAscii% = 13 Then \'Enter\n        SendKeys \"{TAB}\"\n        Exit Sub\n    End If\n\nEnd Sub', '2023-10-10 19:18:18', '2023-11-18 19:53:18', NULL),
(4, 'Funcion salir de Form', 8, NULL, 'jghjhgkhgkh', 'Private Sub PLSalir()\n    Unload NOMBREFORMU\nEnd Sub', '2023-10-10 19:36:23', '2023-10-11 15:02:20', NULL),
(5, 'Boton Buscar', 8, NULL, 'Buscar, por ejemplo, datos de cliente', 'Private Sub cmdBoton_Click(Index As Integer)\n \n    Select Case Index%\n    Case 0\n         PLBuscar\n    Case 1\n         PLPagar\n    Case 2\n         PLSimular\n    Case 3\n         PLLimpiar 0\n         txtCampo(0).SetFocus\n    Case 4\n         PLSalir\n    End Select\nEnd Sub', '2023-10-11 14:39:39', '2023-10-11 14:39:39', NULL),
(6, 'Esqueleto de SQR (Jubilaciones)', 7, NULL, 'archivo a modo \"template\" con el esqueleto de un SQR de jubilaciones', '#include \"definic.sqr\"\n\nBegin-Setup\nuse cob_jubi\nEnd-Setup\n\n#include \"log.sqr\"\n#include \"jubila.sqr\"\n#include \"validar.sqr\"\n\n!-- .\n!-- INICIO DE PROGRAMA\n!-- INGRESO DE PARAMEROS Y VALIDACION\n!-- .\n\nBegin-Program\ndo Inicializar_Programa\nlet $Nombre_Programa = \'<nombre del archivo>.sqr\'\n\n! .\n! PARAMETROS DE ENTRADA\n! .\n\ndo ParamS(1,$i_f_proceso, \'\', \'\', \'\')\nif rtrim($i_f_proceso,\' \') = \'\'\n   show \'DEBE INGRESAR LA FECHA PROCESO\'\n   do Abortar\nend-if\n\ndo Main\n\ndo Finalizar_Programa\nEnd-Program\n\n\n!-- .\n!-- M A I N   P R O C E D U R E\n!-- .\n\nBegin-Procedure Main\nshow \'MAIN PROCEDURE\'\nend-Procedure\n\n!-- .\n!-- INFORME DE ERRORES.\n!-- .\n\nBegin-Procedure PLErrorSP\nshow \'--------------------------------------------------------\'\nshow \'ERROR AL EJECUTAR EL SP\'\nshow \'--------------------------------------------------------\'\nshow $sql-error\nshow \'--------------------------------------------------------\'\ndo Abortar\nEnd-Procedure', '2023-10-11 20:05:13', '2023-11-18 19:53:38', NULL),
(7, 'Script de busqueda', 8, NULL, 'Se declara y luego invoca en la declaracion de Click de boton', 'Private Sub PLBuscar()\nDim VTValores(200) As String\nDim VTValores1(1) As String\n\n   If FLValBusqueda() Then\n      For i = 1 To grdResultados.Rows - 1\n         grdResultados.Row = i\n         PLElegir\n      Next i\n      \n      PMPasoValores SqlConn&, \"@t_trn\", 0, SQLINT2&, \"30357\"\n      PMPasoValores SqlConn&, \"@i_operacion\", 0, SQLVARCHAR, \"Q\"\n      PMPasoValores SqlConn&, \"@i_contrato\", 0, SQLINT4&, txtCampo(0).Text\n      PMPasoValores SqlConn&, \"@i_cliente\", 0, SQLINT4&, txtCampo(1).Text\n      PMPasoValores SqlConn&, \"@i_cuerpo\", 0, SQLVARCHAR&, txtCampo(2).Text\n      PMPasoValores SqlConn&, \"@i_caja\", 0, SQLVARCHAR&, txtCampo(3).Text\n      PMPasoValores SqlConn&, \"@i_oficina\", 0, SQLINT2&, txtCampo(4).Text\n      PMPasoValores SqlConn&, \"@i_formato_fecha\", 0, SQLINT2&, VGFormatoFechaNum$\n      \n      If FMTransmitirRPC(SqlConn&, ServerName$, \"cob_csegur\", \"sp_cs_cancelacion_contrato\", True, \"OK...Consulta de Pagos\") Then\n         PMMapeaGrid SqlConn&, grdResultados, VTModo%\n         VTR1% = FMMapeaArreglo(SqlConn&, VTValores1())\n         PMChequea SqlConn&\n         grdResultados.Row = 1\n         grdResultados_click\n         PLLimpiar 1\n         VLMarcados% = 0\n         cmdBoton(0).Enabled = False\n         For i = 1 To grdResultados.Rows - 1\n            grdResultados.Row = i\n            PLElegir\n         Next i\n         \'INFORMACION DEL CLIENTE TITULAR\n         If VTValores1(1) <> \"\" Then\n             txtCampo(6).Text = VTValores(1)\n             PMPasoValores SqlConn&, \"@i_en_ente\", 0, SQLINT4&, VTValores1(1)\n             PMPasoValores SqlConn&, \"@t_trn\", 0, SQLINT4&, \"132\"\n             PMPasoValores SqlConn&, \"@i_operacion\", 0, SQLCHAR&, \"Q\"\n             PMPasoValores SqlConn&, \"@i_opcion\", 0, SQLINT1&, \"4\"\n             If FMTransmitirRPC(SqlConn&, ServerName$, \"cobis\", \"sp_ente\", True, \" Ok...Consulta del ente [\" & txtCampo(1).Text & \"]\") Then\n                 a% = FMMapeaArreglo(SqlConn&, VTValores())\n                 PMChequea SqlConn&\n                 txtCampo(6).Text = VTValores(135)\n                 lblente.Caption = VTValores(134)\n             Else\n                 txtCampo(6).Text = \"\"\n                 lblente.Caption = \"\"\n             End If\n         End If\n      End If\n   End If\nEnd Sub', '2023-10-11 20:42:10', '2023-10-11 20:42:10', NULL),
(8, 'drop/create tablas temporales en .sp', 2, NULL, 'para correcta compilación', 'use tempdb\n\ngo\n\n if exists (select 1 from tempdb..sysobjects where name = \'bc_impuesto_credito\')\n\nbegin\n   exec (\"drop table tempdb..bc_impuesto_credito\")\nend\ngo\n \n\ncreate table tempdb..bc_impuesto_credito (\n   ci_fecha             datetime                       not null,\n   ci_grupo_trx         varchar(10)                    not null,\n   ci_producto          smallint                       not null,\n   ci_cta_banco         varchar(24)                    not null,\n   ci_cliente           int                            not null,\n   ci_codigo_trx        smallint                       not null,\n   ci_causal            varchar(5)                     null,\n   ci_signo             char(1)                        not null,\n   ci_signo_trx_orig    char(1)                        not null,\n   ci_base_imponible    money                          not null,\n   ci_alicuota          float                          not null,\n   ci_reducida          char(1)                        not null,\n   ci_valor             money                          not null,\n   ci_valor_conv_pesos  money                          not null,\n   ci_moneda            tinyint                        not null,\n   ci_estado            char(1)                        not null,\n   ci_sec_trx_orig      int                            not null,\n   ci_fecha_fv          datetime                       not null,\n   ci_fecha_liquidacion datetime                       null,\n   ci_cbu               varchar(22)                    null,\n   ci_ajuste            varchar(1)                     null,\n   ci_impuesto          char(10)                       not null,\n   ci_categoria         char(10)                       not null,\n   ci_prod_banc         smallint                       not null,\n   ci_referencia        char(1)                        null,\n   ci_identity          int                            not null,\n   ci_region            int                            null,\n   ci_sucursal          smallint                       null,\n   ci_cod_alterno       int                            null,\n   ci_cotizacion        money                          null,\n   ci_trx_orig          smallint                       null,\n   ci_causal_orig       varchar(5)                     null,\n   ci_trx_fin           smallint                       null,\n   ci_causal_fin        varchar(5)                     null,\n   ci_secuencial_bcra   int                            null\n)\ngo\n \n/*================================*/\n/* Index: bc_impuesto_credito_key */\n/*================================*/\ncreate index bc_impuesto_credito_key on tempdb..bc_impuesto_credito (ci_fecha_fv ASC,ci_impuesto ASC,ci_estado ASC,ci_grupo_trx ASC)\ngo', '2023-10-12 22:53:21', '2023-10-12 22:53:21', NULL),
(9, 'Funcion print() para PDF', 1, NULL, 'Imprimir un doc PDF con LARAVEL [use Barryvdh\\DomPDF\\Facade\\Pdf]', 'public function print($quotation_id){\n        $quotation = Quotation::find($quotation_id);\n\n        //return view(\'admin.quotation.print\', compact(\'quotation\'));\n        $pdf = PDF::loadView(\'admin.quotation.print\', compact(\'quotation\'));\n        return $pdf->stream(\'cotizacion.pdf\');\n\n        return view(\'admin.quotation.print\', compact(\'quotation\'));\n    }', '2023-10-13 17:58:22', '2023-10-13 17:58:22', NULL),
(10, 'Forma de BCP OUT', 2, NULL, 'para hacer un BCP correctamente', '!*************************************************\nBegin-Procedure Ejecucion_BCP\n!*************************************************\n!SE GENERA LA FECHA PARA EL NOMBRE DEL ARCHIVO DE SALIDA\nBegin-Select\nsubstring(convert(char(4),datepart(yy,getdate())),1,4)   &w_f_ani\nconvert(char(2),datepart(mm,getdate()))                  &w_f_mes\nconvert(char(2),datepart(dd,getdate()))                  &w_f_dia\n \n   move &w_f_ani  to $w_f_aaaa    \'0000\'\n   move &w_f_mes  to $w_f_mes     \'00\'\n   move &w_f_dia  to $w_f_dia     \'00\'\nEnd-Select\n \n \n!SETEO DE VARIABLES DE TRABAJO NECESARIAS PARA LA EJECUCION DEL BCP OUT\nlet $w_d_path           = \'../datos/\'\nlet $w_d_archivo        = \'ATMNOV3D_\'\nlet $w_d_vista          = \'cob_atm..tm_v_batch_3d_secure\'\nlet $w_d_error          = \'ATMNOV3D_err.txt\'\nlet $w_d_extension      = \'.txt\'\nlet $w_f_archivo        = $w_f_aaaa    || $w_f_mes       || $w_f_dia\nlet $w_d_archivo_final  = $w_d_archivo || $w_f_archivo   || $w_d_extension\nlet #w_n_retorno        = 0\n \n \n!GENERACION DEL BCP OUT A PARTIR DE TABLA DE ID PROPIETARIOS\nlet $w_d_comando = \'bcp \' || $w_d_vista || \' out \' || $w_d_path || $w_d_archivo_final || \' -eerror_\' || $w_d_error || \' -c -t \"|\" -U$login -P$pwd  >../datos/tm_atmseg_\' || $w_f_archivo || \'.log\'\n \ncall system using $w_d_comando #w_n_retorno\n \nif #w_n_retorno <> 0\n   let $mensaje = \'ERROR - FALLO AL GENERAR ARCHIVO DE SALIDA : \' || $w_d_path || $w_d_archivo_final\n \n   show $mensaje\n \n   do Abortar\nEnd-if\nEnd-Procedure  !Ejecucion_BCP', '2023-10-18 20:26:03', '2023-10-18 20:26:03', NULL),
(11, 'Ejecucion de SQR', 7, NULL, 'Ejecutar un archivo SQR', '--[14:25] Justet, Diego--\n\ntime sqr -debug -TB nombre_sqr.sqr usuariodb/passdb', '2023-10-18 20:32:17', '2023-10-18 20:32:17', NULL),
(12, 'Ejemplos de consultas ISQL/W', 2, NULL, 'averiguar datos de tablas para un SP', 'sp_help cs_caja_seguridad\nsp_help cs_contrato\ncob_csegur..sp_help\n\n \n\nselect * from cob_csegur..cs_modelo_caja\nselect top 50 * from cob_csegur..cs_integrantes\nselect * from cob_csegur..cs_modelo_caja\n\n \n\nselect top 50 * from cs_caja_seguridad\n\n \n\nselect * from cob_csegur..cs_contrato\nwhere cn_cuenta = 101445\n \n\nselect cn_cuenta, count(1) from cob_csegur..cs_contrato\ngroup by cn_cuenta\nhaving count(1) > 5\n \n\nselect top 50 * from cob_csegur..cs_contrato, cob_csegur..cs_caja_seguridad\nwhere cn_secuencial = cs_secuencial', '2023-10-19 16:14:33', '2023-10-19 16:14:33', NULL),
(13, 'Funcion PLSelValCliente', 8, NULL, 'Seleccionar desde la BD los clientes', 'Private Sub PLSelValCliente(ByVal Index As Integer)\n    Dim VTValores(35) As String\n    Dim VTTipoEnte$\n    \n    Select Case Index\n    Case 0\n         txtCampo(0).Text = \"\"\n         FBuscarCliente.Show vbModal\n         If VGBusqueda(1) <> \"\" Then\n            txtCampo(0).Text = VGBusqueda(1)\n            SendKeys \"{TAB}\"\n         End If\n    Case 1\n         If txtCampo(0).Text <> \"\" Then\n            PMPasoValores SqlConn&, \"@i_operacion\", 0, SQLCHAR, \"Q\"\n            PMPasoValores SqlConn&, \"@i_cliente\", 0, SQLINT4, (txtCampo(0).Text)\n            PMPasoValores SqlConn&, \"@t_trn\", 0, SQLINT2, \"2543\"\n            PMPasoValores SqlConn&, \"@i_producto\", 0, SQLINT1, \"3\"\n            PMPasoValores SqlConn&, \"@i_formato_fecha\", 0, SQLINT1&, VGFormatoFechaNum$\n            If FMTransmitirRPC(SqlConn&, ServerName$, \"cobis\", \"sp_desc_cliente_cc\", True, \" Ok... Consulta del cliente\") Then\n               VTR1% = FMMapeaArreglo(SqlConn&, VTValores())\n               VTTipoEnte$ = VTValores(3)\n               PMChequea SqlConn&\n               \n               PMPasoValores SqlConn&, \"@t_trn\", 0, SQLINT2, \"1182\"\n               PMPasoValores SqlConn&, \"@i_subtipo\", 0, SQLCHAR&, VTTipoEnte$\n               PMPasoValores SqlConn&, \"@i_tipo\", 0, SQLINT1&, \"1\"\n               PMPasoValores SqlConn&, \"@i_ente\", 0, SQLINT4, txtCampo(0).Text\n               PMPasoValores SqlConn&, \"@i_modo\", 0, SQLINT1&, \"2\"     \'Busqueda Específica\n               If FMTransmitirRPC(SqlConn&, ServerName$, \"cobis\", \"sp_se_ente\", True, \" Ok... Consulta del cliente \" & \"[\" & txtCampo(0).Text & \"]\") Then\n                  VTR1% = FMMapeaArreglo(SqlConn&, VTValores())\n                  PMChequea SqlConn&\n                  If VTValores(1) = \"\" Then\n                     MsgBox \"Cliente no tiene Documento Tributario\", 0 + 16, \"Mensaje de Error\"\n                     txtCampo(0).SetFocus\n                     Exit Sub\n                  End If\n                  txtCampo(1).Text = VTValores(2)\n                  lblDescripcion(0).Caption = IIf(VTTipoEnte$ = \"P\", \"Persona\", \"Compañia\")\n                  txtCampo(0).Text = VTValores(1)\n                  txtCampo(1).Text = Trim$(VTValores(2)) & \" \" & Trim$(VTValores(3))\n                  txtCampo(2).Text = IIf(VTTipoEnte$ = \"P\", VTValores(7), VTValores(3))\n                  txtCampo(3).Text = IIf(VTTipoEnte$ = \"P\", VTValores(9), VTValores(5))\n                  txtCampo_LostFocus (2)\n                  \'Capturados los datos de un Cliente, no se\n                  \'permite modificar Nombre, Apellido, Tipo Doc.,\n                  \'Nro.Doc.\n               Else\n                  txtCampo(0).Text = \"\"\n                  txtCampo(0).SetFocus\n                  lblDescripcion(0).Caption = \"\"\n               End If\n            End If\n         End If\n    End Select\nEnd Sub', '2023-10-20 00:45:20', '2023-10-20 00:45:20', NULL),
(14, 'Manejo de options', 8, NULL, 'Manejar una matriz de options', 'Private Sub optBusqueda_Click(Index As Integer)\n    txtCampo(0).Enabled = True\n    Select Case Index\n        Case 0 \'Busqueda por Cliente\n        chkMorosidad.Visible = True\n        \n        Case 1 \'Busqueda por contrato\n        chkMorosidad.Visible = False\n        \n        Case 2 \'Busqueda por caja\n        chkMorosidad.Visible = False\n        \n    End Select\nEnd Sub', '2023-10-31 21:09:51', '2023-10-31 21:09:51', NULL),
(15, 'Compilar SP en ambiente banco', 8, NULL, 'No solo compilar sino instalar el SP', 'cob_remesas..sp_helptext nombre_del_sp, null, null, showsql', '2023-10-31 22:34:42', '2023-10-31 22:34:42', NULL),
(16, 'transacciones_roles', 2, NULL, 'Asociar las transacciones a los roles', 'use cobis\ngo\n\nprint \'************************************************************\'\nprint \'*** AST 101066 - CREAR TRANSACCION PARA STORED PROCEDURE ***\'\nprint \'************************************************************\'\nprint \'\'\ndeclare @w_cod_proc int,\n        @w_des_proc varchar(30),\n        @w_des_file varchar(30),\n        @w_cod_trn  int,\n        @w_des_trn  varchar(30),\n        @w_mne_trn  varchar(10)\n\nselect  @w_cod_proc = 29224,\n        @w_des_proc = \'sp_fatca_ocde_carga_masiva\',\n        @w_des_file = \'bc_ocde_afip_masiva.sp\',\n        @w_cod_trn  = 29473,\n        @w_des_trn  = \'CARGA MASIVA FATCA/OCDE\',\n        @w_mne_trn  = \'CMFO\'\n\ninsert into ad_procedure\n(pd_procedure,  pd_stored_procedure,  pd_base_datos,  pd_estado,  pd_fecha_ult_mod, pd_archivo)\nvalues\n(@w_cod_proc,   @w_des_proc,          \'cob_bcradgi\',  \'V\',        getDate(),        @w_des_file)\n\nif @@error = 0\n   print \'SE INSERTO CON EXITO EN LA TABLA cobis..ad_procedure\'\nelse\n   print \'ERROR AL INSERTAR EN LA TABLA cobis..ad_procedure\'\n\ninsert into ad_pro_transaccion\n(pt_producto, pt_tipo,  pt_moneda,  pt_transaccion, pt_estado,  pt_fecha_ult_mod, pt_procedure, pt_especial)\nvalues\n(29,          \'R\',      80,         @w_cod_trn,     \'V\',        getDate(),        @w_cod_proc,  null)\n\nif @@error = 0\n   print \'SE INSERTO CON EXITO EN LA TABLA cobis..ad_pro_transaccion\'\nelse\n   print \'ERROR AL INSERTAR EN LA TABLA cobis..ad_pro_transaccion\'\n\ninsert into cl_ttransaccion\n(tn_trn_code, tn_descripcion, tn_nemonico,  tn_desc_larga)\nvalues\n(@w_cod_trn,  @w_des_trn,     @w_mne_trn,   @w_des_trn)\n\nif @@error = 0\n   print \'SE INSERTO CON EXITO EN LA TABLA cobis..cl_ttransaccion\'\nelse\n   print \'ERROR AL INSERTAR EN LA TABLA cobis..cl_ttransaccion\'\n\nprint \'FIN DE CREACION DE TRANSACCIONES PROCESO FATCA\'\ngo', '2023-11-01 17:47:35', '2023-11-01 17:56:31', NULL),
(17, 'MSSqlConnect_To_SYBSRV2_VLAN60', 19, NULL, 'Para reconfigurar el cliconfig de 64bit', 'Windows Registry Editor Version 5.00\n\n; ACTIVA DISCONNECT AFTER EXEC\n[HKEY_CURRENT_USER\\Software\\Microsoft\\MSSQLServer\\ISQL/w]\n\"AutoDisconnect\"=dword:00000001\n\n; VUELVE A CREAR ALIAS EN 32 BITS\n[HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\MSSQLServer\\Client\\ConnectTo]\n\"BRSRV7\"=\"DBMSSOCN,192.168.60.127,7000\"\n\"COBISSRV2\"=\"DBMSSOCN,172.31.84.39,7500\"\n\"SQLSRV2\"=\"DBMSSOCN,192.168.60.127,1433\"\n\"SYBSRV2\"=\"DBMSSOCN,172.31.84.39,7410\"\n\n; VUELVE A CREAR ALIAS EN 64 BITS\n[HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Microsoft\\MSSQLServer\\Client\\ConnectTo]\n\"BRSRV7\"=\"DBMSSOCN,192.168.60.127,7000\"\n\"COBISSRV2\"=\"DBMSSOCN,172.31.84.39,7500\"\n\"SQLSRV2\"=\"DBMSSOCN,192.168.60.127,1433\"\n\"SYBSRV2\"=\"DBMSSOCN,172.31.84.39,7410\"', '2023-11-03 15:00:36', '2023-11-03 15:00:55', NULL),
(18, 'PuTTY_To_SYBSRV2_VLAN60', 19, NULL, 'Reconfigurar los valores para VLAN60', 'Windows Registry Editor Version 5.00\n\n[HKEY_CURRENT_USER\\Software\\SimonTatham\\PuTTY\\Sessions\\SYBSRV2]\n\"Present\"=dword:00000001\n\"HostName\"=\"172.31.84.39\"\n\"LogFileName\"=\"putty.log\"\n\"LogType\"=dword:00000000\n\"LogFileClash\"=dword:ffffffff\n\"LogFlush\"=dword:00000001\n\"SSHLogOmitPasswords\"=dword:00000001\n\"SSHLogOmitData\"=dword:00000000\n\"Protocol\"=\"ssh\"\n\"PortNumber\"=dword:00000016\n\"CloseOnExit\"=dword:00000001\n\"WarnOnClose\"=dword:00000001\n\"PingInterval\"=dword:00000000\n\"PingIntervalSecs\"=dword:00000000\n\"TCPNoDelay\"=dword:00000001\n\"TCPKeepalives\"=dword:00000000\n\"TerminalType\"=\"xterm\"\n\"TerminalSpeed\"=\"38400,38400\"\n\"TerminalModes\"=\"CS7=A,CS8=A,DISCARD=A,DSUSP=A,ECHO=A,ECHOCTL=A,ECHOE=A,ECHOK=A,ECHOKE=A,ECHONL=A,EOF=A,EOL=A,EOL2=A,ERASE=A,FLUSH=A,ICANON=A,ICRNL=A,IEXTEN=A,IGNCR=A,IGNPAR=A,IMAXBEL=A,INLCR=A,INPCK=A,INTR=A,ISIG=A,ISTRIP=A,IUCLC=A,IXANY=A,IXOFF=A,IXON=A,KILL=A,LNEXT=A,NOFLSH=A,OCRNL=A,OLCUC=A,ONLCR=A,ONLRET=A,ONOCR=A,OPOST=A,PARENB=A,PARMRK=A,PARODD=A,PENDIN=A,QUIT=A,REPRINT=A,START=A,STATUS=A,STOP=A,SUSP=A,SWTCH=A,TOSTOP=A,WERASE=A,XCASE=A\"\n\"AddressFamily\"=dword:00000000\n\"ProxyExcludeList\"=\"\"\n\"ProxyDNS\"=dword:00000001\n\"ProxyLocalhost\"=dword:00000000\n\"ProxyMethod\"=dword:00000000\n\"ProxyHost\"=\"proxy\"\n\"ProxyPort\"=dword:00000050\n\"ProxyUsername\"=\"\"\n\"ProxyPassword\"=\"\"\n\"ProxyTelnetCommand\"=\"connect %host %port\\\\n\"\n\"Environment\"=\"\"\n\"UserName\"=\"czanelli\"\n\"UserNameFromEnvironment\"=dword:00000000\n\"LocalUserName\"=\"\"\n\"NoPTY\"=dword:00000000\n\"Compression\"=dword:00000000\n\"TryAgent\"=dword:00000001\n\"AgentFwd\"=dword:00000000\n\"GssapiFwd\"=dword:00000000\n\"ChangeUsername\"=dword:00000000\n\"Cipher\"=\"aes,blowfish,3des,WARN,arcfour,des\"\n\"KEX\"=\"dh-gex-sha1,dh-group14-sha1,dh-group1-sha1,rsa,WARN\"\n\"RekeyTime\"=dword:0000003c\n\"RekeyBytes\"=\"1G\"\n\"SshNoAuth\"=dword:00000000\n\"SshBanner\"=dword:00000001\n\"AuthTIS\"=dword:00000000\n\"AuthKI\"=dword:00000001\n\"AuthGSSAPI\"=dword:00000001\n\"GSSLibs\"=\"gssapi32,sspi,custom\"\n\"GSSCustom\"=\"\"\n\"SshNoShell\"=dword:00000000\n\"SshProt\"=dword:00000003\n\"LogHost\"=\"\"\n\"SSH2DES\"=dword:00000000\n\"PublicKeyFile\"=\"\"\n\"RemoteCommand\"=\"\"\n\"RFCEnviron\"=dword:00000000\n\"PassiveTelnet\"=dword:00000000\n\"BackspaceIsDelete\"=dword:00000001\n\"RXVTHomeEnd\"=dword:00000000\n\"LinuxFunctionKeys\"=dword:00000000\n\"NoApplicationKeys\"=dword:00000000\n\"NoApplicationCursors\"=dword:00000000\n\"NoMouseReporting\"=dword:00000000\n\"NoRemoteResize\"=dword:00000000\n\"NoAltScreen\"=dword:00000000\n\"NoRemoteWinTitle\"=dword:00000000\n\"RemoteQTitleAction\"=dword:00000001\n\"NoDBackspace\"=dword:00000000\n\"NoRemoteCharset\"=dword:00000000\n\"ApplicationCursorKeys\"=dword:00000000\n\"ApplicationKeypad\"=dword:00000000\n\"NetHackKeypad\"=dword:00000000\n\"AltF4\"=dword:00000001\n\"AltSpace\"=dword:00000000\n\"AltOnly\"=dword:00000000\n\"ComposeKey\"=dword:00000000\n\"CtrlAltKeys\"=dword:00000001\n\"TelnetKey\"=dword:00000000\n\"TelnetRet\"=dword:00000001\n\"LocalEcho\"=dword:00000002\n\"LocalEdit\"=dword:00000002\n\"Answerback\"=\"PuTTY\"\n\"AlwaysOnTop\"=dword:00000000\n\"FullScreenOnAltEnter\"=dword:00000000\n\"HideMousePtr\"=dword:00000000\n\"SunkenEdge\"=dword:00000000\n\"WindowBorder\"=dword:00000001\n\"CurType\"=dword:00000001\n\"BlinkCur\"=dword:00000001\n\"Beep\"=dword:00000000\n\"BeepInd\"=dword:00000000\n\"BellWaveFile\"=\"\"\n\"BellOverload\"=dword:00000001\n\"BellOverloadN\"=dword:00000005\n\"BellOverloadT\"=dword:000007d0\n\"BellOverloadS\"=dword:00001388\n\"ScrollbackLines\"=dword:000007d0\n\"DECOriginMode\"=dword:00000000\n\"AutoWrapMode\"=dword:00000001\n\"LFImpliesCR\"=dword:00000000\n\"CRImpliesLF\"=dword:00000000\n\"DisableArabicShaping\"=dword:00000000\n\"DisableBidi\"=dword:00000000\n\"WinNameAlways\"=dword:00000001\n\"WinTitle\"=\"172.31.84.39 - PuTTY\"\n\"TermWidth\"=dword:00000063\n\"TermHeight\"=dword:00000027\n\"Font\"=\"Courier New\"\n\"FontIsBold\"=dword:00000000\n\"FontCharSet\"=dword:00000000\n\"FontHeight\"=dword:0000000b\n\"FontQuality\"=dword:00000000\n\"FontVTMode\"=dword:00000004\n\"UseSystemColours\"=dword:00000000\n\"TryPalette\"=dword:00000000\n\"ANSIColour\"=dword:00000001\n\"Xterm256Colour\"=dword:00000001\n\"BoldAsColour\"=dword:00000001\n\"Colour0\"=\"187,187,187\"\n\"Colour1\"=\"255,255,255\"\n\"Colour2\"=\"0,0,0\"\n\"Colour3\"=\"85,85,85\"\n\"Colour4\"=\"0,0,0\"\n\"Colour5\"=\"0,255,0\"\n\"Colour6\"=\"0,0,0\"\n\"Colour7\"=\"85,85,85\"\n\"Colour8\"=\"187,0,0\"\n\"Colour9\"=\"255,85,85\"\n\"Colour10\"=\"0,187,0\"\n\"Colour11\"=\"85,255,85\"\n\"Colour12\"=\"187,187,0\"\n\"Colour13\"=\"255,255,85\"\n\"Colour14\"=\"0,0,187\"\n\"Colour15\"=\"85,85,255\"\n\"Colour16\"=\"187,0,187\"\n\"Colour17\"=\"255,85,255\"\n\"Colour18\"=\"0,187,187\"\n\"Colour19\"=\"85,255,255\"\n\"Colour20\"=\"187,187,187\"\n\"Colour21\"=\"255,255,255\"\n\"RawCNP\"=dword:00000000\n\"PasteRTF\"=dword:00000000\n\"MouseIsXterm\"=dword:00000000\n\"RectSelect\"=dword:00000000\n\"MouseOverride\"=dword:00000001\n\"Wordness0\"=\"0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0\"\n\"Wordness32\"=\"0,1,2,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1\"\n\"Wordness64\"=\"1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2\"\n\"Wordness96\"=\"1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1\"\n\"Wordness128\"=\"1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1\"\n\"Wordness160\"=\"1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1\"\n\"Wordness192\"=\"2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2\"\n\"Wordness224\"=\"2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2\"\n\"LineCodePage\"=\"UTF-8\"\n\"CJKAmbigWide\"=dword:00000000\n\"UTF8Override\"=dword:00000001\n\"Printer\"=\"\"\n\"CapsLockCyr\"=dword:00000000\n\"ScrollBar\"=dword:00000001\n\"ScrollBarFullScreen\"=dword:00000000\n\"ScrollOnKey\"=dword:00000000\n\"ScrollOnDisp\"=dword:00000001\n\"EraseToScrollback\"=dword:00000001\n\"LockSize\"=dword:00000000\n\"BCE\"=dword:00000001\n\"BlinkText\"=dword:00000000\n\"X11Forward\"=dword:00000000\n\"X11Display\"=\"\"\n\"X11AuthType\"=dword:00000001\n\"X11AuthFile\"=\"\"\n\"LocalPortAcceptAll\"=dword:00000000\n\"RemotePortAcceptAll\"=dword:00000000\n\"PortForwardings\"=\"\"\n\"BugIgnore1\"=dword:00000000\n\"BugPlainPW1\"=dword:00000000\n\"BugRSA1\"=dword:00000000\n\"BugIgnore2\"=dword:00000000\n\"BugHMAC2\"=dword:00000000\n\"BugDeriveKey2\"=dword:00000000\n\"BugRSAPad2\"=dword:00000000\n\"BugPKSessID2\"=dword:00000000\n\"BugRekey2\"=dword:00000000\n\"BugMaxPkt2\"=dword:00000000\n\"BugOldGex2\"=dword:00000000\n\"BugWinadj\"=dword:00000000\n\"BugChanReq\"=dword:00000000\n\"StampUtmp\"=dword:00000001\n\"LoginShell\"=dword:00000001\n\"ScrollbarOnLeft\"=dword:00000000\n\"BoldFont\"=\"\"\n\"BoldFontIsBold\"=dword:00000000\n\"BoldFontCharSet\"=dword:00000000\n\"BoldFontHeight\"=dword:00000000\n\"WideFont\"=\"\"\n\"WideFontIsBold\"=dword:00000000\n\"WideFontCharSet\"=dword:00000000\n\"WideFontHeight\"=dword:00000000\n\"WideBoldFont\"=\"\"\n\"WideBoldFontIsBold\"=dword:00000000\n\"WideBoldFontCharSet\"=dword:00000000\n\"WideBoldFontHeight\"=dword:00000000\n\"ShadowBold\"=dword:00000000\n\"ShadowBoldOffset\"=dword:00000001\n\"SerialLine\"=\"COM1\"\n\"SerialSpeed\"=dword:00002580\n\"SerialDataBits\"=dword:00000008\n\"SerialStopHalfbits\"=dword:00000002\n\"SerialParity\"=dword:00000000\n\"SerialFlowControl\"=dword:00000001\n\"WindowClass\"=\"\"\n\"ConnectionSharing\"=dword:00000000\n\"ConnectionSharingUpstream\"=dword:00000001\n\"ConnectionSharingDownstream\"=dword:00000001\n\"SSHManualHostKeys\"=\"\"\n', '2023-11-03 15:04:06', '2023-11-03 15:05:55', NULL),
(19, 'Select de distintos tipos', 2, NULL, 'Seleccionar los diferentes tipos de valores', 'select distinct [campo] from [base_de_datos]..[tabla] group by [campo] order by [campo] asc', '2023-11-03 16:57:55', '2023-11-03 16:57:55', NULL),
(20, 'Estructura_PMPasoValores_y_FMTransmitir', 8, NULL, 'configurar arreglo y mandarlo a transmitir mapenado grilla', 'PMPasoValores SqlConn&, \"@t_trn\", 0, SQLINT4&, \"30324\"\n    PMPasoValores SqlConn&, \"@i_operacion\", 0, SQLVARCHAR, \"B3\"\n    If txtCampo(0).Text <> \"\" Then\n       PMPasoValores SqlConn&, \"@i_cliente\", 0, SQLINT4&, txtCampo(0).Text\n    End If\n    PMPasoValores SqlConn&, \"@i_formato_fecha\", 0, SQLINT1&, VGFormatoFechaNum$\n    PMPasoValores SqlConn&, \"@i_perdida_llaves\", 0, SQLVARCHAR, VTPerdidaLlaves$\n    PMPasoValores SqlConn&, \"@i_secuencial_ant\", 0, SQLINT4&, VTCodigoAnt\n        \n    If FMTransmitirRPC(SqlConn&, ServerName$, \"cob_remesas\", \"sp_cs_contrato\", True, \"OK...Consulta de Contratos\") Then\n       PMMapeaGrid SqlConn&, grdResultados, VTModo%\n       PMChequea SqlConn&\n       txtCampo(0).Enabled = False\n       cmdBoton(1).Enabled = (Val(grdResultados.Tag) >= (VGMaximoRows% - 1))\n       With grdResultados\n            VTRow% = .Row\n            VTCol% = .Col\n            If .Rows >= 0 Then\n               .Row = 1\n               .Col = 1\n               If .Text <> \"\" Then\n                  PLLimpiar 1\n               End If\n               .Row = 0\n            End If\n            .Row = VTRow%\n            .Col = VTCol%\n       End With\n    End If', '2023-11-07 16:17:31', '2023-11-07 16:17:31', NULL),
(21, 'Delaracion y uso de funciones', 8, NULL, 'Construir una funcion y ejecutarla con parametros', 'Private Sub NombreFuncion (Parametro As tipo)\nDim DeclaracionVariable As tipo\n\nIf condicion Then\n    \'Desarrollo del IF\nEnd If\nEnd Sub\n\nPrivate Sub boton_Click()\nNombreFuncion parametro\nEnd Sub', '2023-11-08 03:13:03', '2023-11-08 03:13:03', NULL),
(22, 'Scripts_consulta_limpieza_usuario', 2, NULL, 'limpiar y resetear usuarios por el Login fallido', 'update cobis..in_login \nset lo_fecha_out = getdate()\nwhere lo_login = \'epacosta\'\nand lo_fecha_out = null\n \nupdate cobis..ad_usuario\nset us_fecha_asig = dateadd(dd,-1,getdate()),\nus_fecha_ult_mod = dateadd(yy,1,getdate()),\nus_fecha_ult_pwd = dateadd(yy,1,getdate()),\nus_estado = \'V\'\nwhere us_login =\'epacosta\'\n \nselect * from cobis..in_login\nwhere lo_login = \'epacosta\'\n \nselect * from cobis..ad_usuario\nwhere us_login = \'epacosta\'\n \nselect * from cobis..in_login\nwhere lo_login = \'jbarrera\'\n \nselect * from cobis..ad_usuario\nwhere us_login = \'jbarrera\'\nand   us_oficina = 540\n \ninsert into cobis..ad_usuario\nvalues (1,540,107,\'epacosta\',getdate(),18210,\'N\',\'V\',getdate(),getdate())', '2023-11-09 16:38:37', '2023-11-09 16:38:37', NULL),
(23, 'Ejemplo_FOREACH', 8, NULL, 'FORECHEar', 'For Each packageFolder in subFolders\n	\'Armar path completo de un archivo VBS de instalación/actualización\n	vbsPath=packageFolder & \"\\\" & VGVBSName\n        \n	If fso.FileExists(vbsPath) Then\n				VGPackageName=packageFolder.Name\n\n		If VGMSIAction=\"Install\" Then\n			\'Crear directorio y copiar vbs a la carpeta de scripts\n			CopyFile vbsPath,packageScriptsTarget & \"\\\" & VGPackageName & \"\\\"\n		End If\n\n		WriteLog \"Paquete encontrado << \" & VGPackageName & \" >>\"\n		WriteLog \"Inicio de ejecucion de paquete: \" & VGPackageName & \" ===========================================\"\n		\'Ejecutar VBS\n		ExecuteVBS vbsPath\n		WriteLog \"Fin de ejecucion de paquete: \" & VGPackageName & \" =======================================\" & vbCrLf\n	Else\n		WriteLog \"El directorio: \" & packageFolder.Name & \" no es un paquete de instalacion/actualizacion o no contiene el archivo \" & VGVBSName & vbCrLf\n	End If\nNext', '2023-11-09 22:51:14', '2023-11-09 22:51:14', NULL),
(24, 'exportar_archivo_XLS_HTML', 8, NULL, 'exportar archivos en formato XML o HTML', 'Sub PMExportarArchivo(grd As Control, iFormato As Integer, sTitulo As String, Optional sSubTitulo1 As String, Optional sSubTitulo2 As String, Optional bPrecanMasiva As Boolean = False)\n \nOn Error GoTo ErrorGeneracionArchivo\n \n    Dim I As Long\n    Dim j As Long\n    Dim iArchivoLibre As Integer\n    Dim sNombreDelArchivo As String\n \n    FPrincipal!CMDialogo.CancelError = -1\n \n    sNombreDelArchivo = \"\"\n    FPrincipal!CMDialogo.FileName = \"\"\n    Select Case iFormato\n        Case XLS\n            FPrincipal!CMDialogo.DialogTitle = \"Selección de archivo para armado de xls\"\n            FPrincipal!CMDialogo.Filter = \"Archivo EXCEL (*.xls)|*.xls|Todos los archivos (*.*)|*.*\"\n        Case HTML\n            FPrincipal!CMDialogo.DialogTitle = \"Selección de archivo para armado de html\"\n            FPrincipal!CMDialogo.Filter = \"Archivo HTML (*.html)|*.html|Todos los archivos (*.*)|*.*\"\n    End Select\n    FPrincipal!CMDialogo.Flags = &H800& + &H2&\n \n    FPrincipal!CMDialogo.FileName = grd.Parent.Caption\n    \'SACO LOS CARACTERES INVALIDOS\n    FPrincipal!CMDialogo.FileName = Replace(FPrincipal!CMDialogo.FileName, \"/\", \"-\")\n    FPrincipal!CMDialogo.FileName = Replace(FPrincipal!CMDialogo.FileName, \"?\", \" \")\n    FPrincipal!CMDialogo.FileName = Replace(FPrincipal!CMDialogo.FileName, \"\\\", \" \")\n    FPrincipal!CMDialogo.FileName = Replace(FPrincipal!CMDialogo.FileName, \"*\", \" \")\n    FPrincipal!CMDialogo.FileName = Replace(FPrincipal!CMDialogo.FileName, \"|\", \" \")\n    FPrincipal!CMDialogo.FileName = Replace(FPrincipal!CMDialogo.FileName, Chr(34), \" \")\n \n    FPrincipal!CMDialogo.Action = 2 \'Save\n    sNombreDelArchivo = FPrincipal!CMDialogo.FileName\n    If sNombreDelArchivo = \"\" Then Exit Sub\n    Select Case iFormato\n        Case XLS, HTML\n            Dim iArchivoLibreTMP As Integer\n            Dim sCabeceraBanco As String\n            Dim sCabeceraFecha As String\n            iArchivoLibre = FreeFile\n            Open sNombreDelArchivo For Output As #iArchivoLibre\n            Dim AnchosCol() As Double\n            Dim UnitType As Integer\n            grd.Visible = False\n            \'ESTO REDIMENSIONA LAS COLUMNAS PARA QUE SALGA TODO EL TEXTO\n            ReDim AnchosCol(grd.MaxCols)\n            grd.Row = 0\n            If bPrecanMasiva = True Then\n             grd.ColWidth(0) = 8\n             AnchosCol(0) = 8\n             AnchosCol(1) = 17\n             AnchosCol(2) = 7\n             AnchosCol(3) = 19\n             AnchosCol(4) = 8\n             grd.ColWidth(4) = 8\n             AnchosCol(5) = 9\n             AnchosCol(6) = 9\n            Else\n                For I = 0 To grd.MaxCols\n                    AnchosCol(I) = grd.ColWidth(I)\n                    grd.Col = I\n                    grd.ColWidth(I) = IIf(I <> 0, grd.MaxTextColWidth(I) + 500, grd.MaxTextColWidth(I))\n                Next I\n            End If\n            UnitType = grd.UnitType\n            grd.ExportToHTML \" .t\", False, \"\"\n            iArchivoLibreTMP = FreeFile\n            Open \" .t\" For Input As #iArchivoLibreTMP\n            sCabeceraBanco = \"BANCO HIPOTECARIO\" & \" - USUARIO: \" & VGLogin$ & \" - SUCURSAL: \" & VGDescOficina$ & \"(\" & VGOficina$ & \")\"\n            sCabeceraFecha = \"Fecha Hora: \" & Format$(Now, \"dd/mm/yyyy hh:mm:ss\")\n            Print #iArchivoLibre, \"<body>\"\n            Print #iArchivoLibre, \"<p></p>\"\n            Print #iArchivoLibre, \"<b><font size=\" + Chr(34) + \"+2\" + Chr(34) + \">\" + sTitulo + \"</font></b>\"\n            Print #iArchivoLibre, \"<br><font size=\" + Chr(34) + \"+1\" + Chr(34) + \">\" + sSubTitulo1 + \"</font></br>\"\n            Print #iArchivoLibre, \"<br>\" + sSubTitulo2 + \"</font></br>\"\n            Print #iArchivoLibre, \"<p></p>\"\n            \'ACA SE COPIA EL CONTENIDO DEL TXT\n            Dim slinea\n            Do While Not EOF(iArchivoLibreTMP)\n                Line Input #iArchivoLibreTMP, slinea\n                    Print #iArchivoLibre, slinea\n            Loop\n            \'ACA SE COPIA EL CONTENIDO DEL TXT\n            Print #iArchivoLibre, \"<br><font size=\" + Chr(34) + \"-2\" + Chr(34) + \">\" + sCabeceraBanco + \"</font></br>\"\n            Print #iArchivoLibre, \"<br><font size=\" + Chr(34) + \"-2\" + Chr(34) + \">\" + sCabeceraFecha + \"</font></br>\"\n            Print #iArchivoLibre, \"<br><font size=\" + Chr(34) + \"-2\" + Chr(34) + \">\" + \"</font></br>\"\n            Print #iArchivoLibre, \"</body>\"\n            Close iArchivoLibre\n            Close iArchivoLibreTMP\n            Kill \" .t\"\n            grd.UnitType = UnitType\n            For I = 0 To grd.MaxCols\n                grd.ColWidth(I) = AnchosCol(I)\n            Next I\n            grd.Visible = True\n    End Select\n    MsgBox \"Archivo generado\", 0 + 64, \"Proceso terminado\"\n \nExit Sub\n \nErrorGeneracionArchivo:\n \n    grd.Visible = True\n    Screen.MousePointer = 0\n \n    MsgBox \"Error en la Generación del archivo. Verifique que no este abierto y que tenga permisos de lectura\", 16, \"Generación Cancelada\"\n    Exit Sub\nEnd Sub', '2023-11-14 19:04:23', '2023-11-14 19:04:23', NULL),
(25, 'Archivo_Excel_copiando_portapapeles', 8, NULL, 'setear el portapaeles e interactuar con un archivo de excel', 'Dim sData As String    \nsData = \"FirstName\" & vbTab & \"LastName\" & vbTab & \"Birthdate\" & vbCr _            & \"Bill\" & vbTab & \"Brown\" & vbTab & \"2/5/85\" & vbCr _            \n    & \"Joe\" & vbTab & \"Thomas\" & vbTab & \"1/1/91\"    \nClipboard.Clear     \nClipboard.SetText sData        \n\n\'Create a new workbook in Excel    \nDim oExcel As Object    \nDim oBook As Object    \nSet oExcel = CreateObject(\"Excel.Application\")    \nSet oBook = oExcel.Workbooks.Add         \n\n\'Paste the data    \noBook.Worksheets(1).Range(\"A1\").Select    \noBook.Worksheets(1).Paste        \n\n\'Save the Workbook and Quit Excel    \noBook.SaveAs \"C:\\Book1.xls\"    \noExcel.Quit', '2023-11-14 20:37:26', '2023-11-14 20:37:26', NULL),
(26, 'abrir_archivo_excel_modificar_guardar', 8, NULL, 'instanciar archivo de excel, modificarlo y guardarlo', '\'Create a new instance of Excel    \nDim oExcel As Object    \nDim oBook As Object    \nDim oSheet As Object    \nSet oExcel = CreateObject(\"Excel.Application\")            \n\n\'Open the text file   \n Set oBook = oExcel.Workbooks.Open(\"C:\\Test.txt\")        \n\n\'Save as Excel workbook and Quit Excel    \noBook.SaveAs \"C:\\Book1.xls\", xlWorkbookNormal    \noExcel.Quit', '2023-11-14 23:42:31', '2023-11-14 23:42:31', NULL),
(27, 'PMConviertoMayuscula', 8, NULL, 'Convertir el caracter que se presiona, a Mayúscula', 'Sub PMConviertoMayuscula(Tecla As Integer)\n\'**********************************************************************************************\n\'Objetivo:  Esta rutina se pone en el evento KeyPress\n            \'Convierte el caracter a Mayúscula\n            \'Si se ingresa Enter se pasa el foco al siguiente control en la lista de\n            \'los TabIndex (esto no es un standard de Windows pero viene bien)\n\'Input:     Tecla: el valor ASCII de la tecla presionada\n\'Output:    Tecla: el nuevo valor ASCII de la tecla\n\'**********************************************************************************************\n    \'MODIFICACIONES\n\'FECHA                  AUTOR                       RAZON\n\'22/01/1998         Máximo Battist              Emisión Inicail\n\'**********************************************************************************************\n    Select Case Tecla%\n        Case 13 \'Enter\n            SendKeys \"{TAB}\"\n        Case Else \'Tecla no válida\n            Tecla% = Asc(UCase$(Chr$(Tecla%)))\n    End Select\nEnd Sub', '2023-11-16 21:49:32', '2023-11-16 21:49:32', NULL),
(28, 'querido_programador', 8, NULL, 'Comentar Codigo', '\'*********************************************************\n\'   QUERIDO PROGRAMADOR:\n\'\n\'   Cuando escribi el codigo, solo Dios y yo sabíamos como\n\'   funcionaba...\n\'\n\'   Hoy solo Dios lo sabe!\n\'\n\'   Asi que si durante tu tarea de intentar mantenerlo\n\'   tuviste un problema que no puedes resolver y por eso\n\'   falla, por favor, incrementa el contador aqui abajo\n\'   para que sirva como advertencia al próximo que se\n\'   anime\n\'\n    total_de_horas_desperdiciadas_aca = 153\n\'\n\'\n\'*********************************************************', '2023-11-16 22:15:34', '2023-11-16 22:15:34', NULL),
(29, 'Esporta_a_XLS_o_HTML', 8, NULL, 'Exportar informacion a un archivo de Excel o HTML', 'Sub PMExportarArchivo(grd As Control, iFormato As Integer, sTitulo As String, Optional sSubTitulo1 As String, Optional sSubTitulo2 As String, Optional bPrecanMasiva As Boolean = False)\n \nOn Error GoTo ErrorGeneracionArchivo\n \n    Dim I As Long\n    Dim j As Long\n    Dim iArchivoLibre As Integer\n    Dim sNombreDelArchivo As String\n \n    FPrincipal!CMDialogo.CancelError = -1\n \n    sNombreDelArchivo = \"\"\n    FPrincipal!CMDialogo.FileName = \"\"\n    Select Case iFormato\n        Case XLS\n            FPrincipal!CMDialogo.DialogTitle = \"Selección de archivo para armado de xls\"\n            FPrincipal!CMDialogo.Filter = \"Archivo EXCEL (*.xls)|*.xls|Todos los archivos (*.*)|*.*\"\n        Case HTML\n            FPrincipal!CMDialogo.DialogTitle = \"Selección de archivo para armado de html\"\n            FPrincipal!CMDialogo.Filter = \"Archivo HTML (*.html)|*.html|Todos los archivos (*.*)|*.*\"\n    End Select\n    FPrincipal!CMDialogo.Flags = &H800& + &H2&\n \n    FPrincipal!CMDialogo.FileName = grd.Parent.Caption\n    \'SACO LOS CARACTERES INVALIDOS\n    FPrincipal!CMDialogo.FileName = Replace(FPrincipal!CMDialogo.FileName, \"/\", \"-\")\n    FPrincipal!CMDialogo.FileName = Replace(FPrincipal!CMDialogo.FileName, \"?\", \" \")\n    FPrincipal!CMDialogo.FileName = Replace(FPrincipal!CMDialogo.FileName, \"\\\", \" \")\n    FPrincipal!CMDialogo.FileName = Replace(FPrincipal!CMDialogo.FileName, \"*\", \" \")\n    FPrincipal!CMDialogo.FileName = Replace(FPrincipal!CMDialogo.FileName, \"|\", \" \")\n    FPrincipal!CMDialogo.FileName = Replace(FPrincipal!CMDialogo.FileName, Chr(34), \" \")\n \n    FPrincipal!CMDialogo.Action = 2 \'Save\n    sNombreDelArchivo = FPrincipal!CMDialogo.FileName\n    If sNombreDelArchivo = \"\" Then Exit Sub\n    Select Case iFormato\n        Case XLS, HTML\n            Dim iArchivoLibreTMP As Integer\n            Dim sCabeceraBanco As String\n            Dim sCabeceraFecha As String\n            iArchivoLibre = FreeFile\n            Open sNombreDelArchivo For Output As #iArchivoLibre\n            Dim AnchosCol() As Double\n            Dim UnitType As Integer\n            grd.Visible = False\n            \'ESTO REDIMENSIONA LAS COLUMNAS PARA QUE SALGA TODO EL TEXTO\n            ReDim AnchosCol(grd.MaxCols)\n            grd.Row = 0\n            If bPrecanMasiva = True Then\n             grd.ColWidth(0) = 8\n             AnchosCol(0) = 8\n             AnchosCol(1) = 17\n             AnchosCol(2) = 7\n             AnchosCol(3) = 19\n             AnchosCol(4) = 8\n             grd.ColWidth(4) = 8\n             AnchosCol(5) = 9\n             AnchosCol(6) = 9\n            Else\n                For I = 0 To grd.MaxCols\n                    AnchosCol(I) = grd.ColWidth(I)\n                    grd.Col = I\n                    grd.ColWidth(I) = IIf(I <> 0, grd.MaxTextColWidth(I) + 500, grd.MaxTextColWidth(I))\n                Next I\n            End If\n            UnitType = grd.UnitType\n            grd.ExportToHTML \" .t\", False, \"\"\n            iArchivoLibreTMP = FreeFile\n            Open \" .t\" For Input As #iArchivoLibreTMP\n            sCabeceraBanco = \"BANCO HIPOTECARIO\" & \" - USUARIO: \" & VGLogin$ & \" - SUCURSAL: \" & VGDescOficina$ & \"(\" & VGOficina$ & \")\"\n            sCabeceraFecha = \"Fecha Hora: \" & Format$(Now, \"dd/mm/yyyy hh:mm:ss\")\n            Print #iArchivoLibre, \"<body>\"\n            Print #iArchivoLibre, \"<p></p>\"\n            Print #iArchivoLibre, \"<b><font size=\" + Chr(34) + \"+2\" + Chr(34) + \">\" + sTitulo + \"</font></b>\"\n            Print #iArchivoLibre, \"<br><font size=\" + Chr(34) + \"+1\" + Chr(34) + \">\" + sSubTitulo1 + \"</font></br>\"\n            Print #iArchivoLibre, \"<br>\" + sSubTitulo2 + \"</font></br>\"\n            Print #iArchivoLibre, \"<p></p>\"\n            \'ACA SE COPIA EL CONTENIDO DEL TXT\n            Dim slinea\n            Do While Not EOF(iArchivoLibreTMP)\n                Line Input #iArchivoLibreTMP, slinea\n                    Print #iArchivoLibre, slinea\n            Loop\n            \'ACA SE COPIA EL CONTENIDO DEL TXT\n            Print #iArchivoLibre, \"<br><font size=\" + Chr(34) + \"-2\" + Chr(34) + \">\" + sCabeceraBanco + \"</font></br>\"\n            Print #iArchivoLibre, \"<br><font size=\" + Chr(34) + \"-2\" + Chr(34) + \">\" + sCabeceraFecha + \"</font></br>\"\n            Print #iArchivoLibre, \"<br><font size=\" + Chr(34) + \"-2\" + Chr(34) + \">\" + \"</font></br>\"\n            Print #iArchivoLibre, \"</body>\"\n            Close iArchivoLibre\n            Close iArchivoLibreTMP\n            Kill \" .t\"\n            grd.UnitType = UnitType\n            For I = 0 To grd.MaxCols\n                grd.ColWidth(I) = AnchosCol(I)\n            Next I\n            grd.Visible = True\n    End Select\n    MsgBox \"Archivo generado\", 0 + 64, \"Proceso terminado\"\n \nExit Sub\n \nErrorGeneracionArchivo:\n \n    grd.Visible = True\n    Screen.MousePointer = 0\n \n    MsgBox \"Error en la Generación del archivo. Verifique que no este abierto y que tenga permisos de lectura\", 16, \"Generación Cancelada\"\n    Exit Sub\nEnd Sub', '2023-11-17 15:17:20', '2023-11-17 15:17:20', NULL),
(30, 'Estructura FOR', 8, NULL, 'Iterar con estructura For', 'For X = 0 To UBound(VTValores())\n    If VTValores(X) <> \"\" Then\n        ListaContratos.AddItem (VTValores(X))\n    End If\nNext', '2023-11-17 17:42:07', '2023-11-17 17:42:07', NULL);
INSERT INTO `fuentes` (`id`, `nombre`, `lenguaje_id`, `categoria_id`, `etiqueta`, `desarrollo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(31, 'Ciclar_Valores_en_Grilla_Spread', 8, NULL, 'Iterar y completar grillas a partir de un ultimo ID', 'Sub PLCiclarGrilla(grilla As Control, i_n_opcion As Integer, columna_secuencial As Integer, mensaje As String)\n\'Esta funcion solo puede utilizarse con el componente fpSpread, es un tipo de grilla con formato Excel\n    Dim UltimoId As Integer \'Para mandarle al BE el ultimo id procesado\n    \n    UltimoId = 0\n    CGMaximoRowsCE% = 20\n    grilla.Tag = CGMaximoRowsCE \'usamos la etiqueta de la grilla, la cual ponemos en 0\n    VTBuscar% = False\n    \n    \'Empezamos el ciclo preguntando si la etiqueta tiene el el mismo valor que CGMaximo (que es 20)\n    Do While (grilla.Tag = CGMaximoRowsCE) \'Or VTBuscar% = False)\n        \'Pasa el numero de opcion que viene como parametro que va a tener que manejar el SP\n        PMPasoValores SqlConn&, \"@i_n_opcion\", 0, SQLINT2, i_n_opcion\n        \'Enviamos la cant. de filas maximas a procesar (siempre son 20)\n        PMPasoValores SqlConn&, \"@i_n_filas\", 0, SQLINT2, CGMaximoRowsCE\n        \'Se le manda el el UltimoId como @i_n_siguiente para que traiga los que siguen a partir de él\n        PMPasoValores SqlConn&, \"@i_n_siguiente\", 0, SQLINT4&, UltimoId\n        \'Pasamos el ID de transaccion que autorizamos para esto\n        PMPasoValores SqlConn&, \"@t_trn\", 0, SQLINT2, \"30340\"\n        \n        \'Transmitimos para mapear esta vez los resultados en la grilla, junto con el Mensaje\n        If FMTransmitirRPC(SqlConn&, ServerName$, \"cob_remesas\", \"sp_cs_consulta_cajas_fe\", True, mensaje) Then\n            \'Mapeamos en la grilla que asignamos, con el valor FALSE para que haga un Append\n            PMMapeaGrid SqlConn&, grilla, VTBuscar%\n            \'Y por ultimo trapeamos la conexion\n            PMChequea SqlConn&\n            \n            \'Nos posicionamos en la ultima fila y la ultima columna\n            grilla.Row = grilla.MaxRows\n            grilla.Col = columna_secuencial\n            \'Y asignamos ese valor al UltimoId de esa celda seleccionada\n            UltimoId = Val(grilla.Text)\n            \n            \'Ponemos en True el valor de devolucion\n            VTBuscar% = True\n            \n            \'Cuando la etiqueta de la grilla sea menor al maximo establecido, la pone en 0 para que salga\n            If (grilla.Tag < CGMaximoRowsCE) Then\n                grilla.Tag = 0\n                VTBuscar% = True\n            End If\n        Else\n            \'Cuando ya no transmite, trapea la grilla\n            PMLimpiaGrillasSpread grilla\n            Exit Sub\n        End If\n        \'Ocultamos la columna que trae el secuencial, poniendo su ancho en 0\n        grilla.ColWidth(columna_secuencial) = 0\n    Loop\nEnd Sub', '2023-11-21 16:07:00', '2023-11-21 16:07:00', NULL),
(32, 'reemplazar_insert_into_1', 18, NULL, 'Reemplazar la sentencia insert into con un exec', '--> A REEMPLAZAR\n	select distinct oc_ente \n	into bc_lista_ocde_tran_tran\n	from cob_bcradgi..bc_ocde_clientes\n\n--> TOMAR COMO REFERENCIA\n    if not exists(select 1 from sysobjects where id=object_id(\'bc_lista_ocde_tran_tran\') and type = \'U\')\n        begin\n            select @w_comando = \'create table bc_lista_ocde_tran_tran (oc_ente int not null)\'\n            print \'COMANDO CREAMOS TABLA [ %1! ]\', @w_comando\n            exec ( @w_comando )\n\n            select @w_numeroerror = @@error\n            if @w_numeroerror != 0\n                begin\n                    select @w_descripcion = \'ERROR EN LA CREACION DE LA TABLA bc_lista_ocde_tran_tran\'\n                    goto ERROR\n                end\n        end\n    \n    insert into bc_lista_ocde_tran_tran\n	select distinct oc_ente\n	from cob_bcradgi..bc_ocde_clientes\n\n    return 0', '2023-11-27 15:13:58', '2023-11-27 16:38:31', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glosarios`
--

CREATE TABLE `glosarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `glosarios`
--

INSERT INTO `glosarios` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Pruebas Cruzadas', '[viernes 12:13] Zabala, Pablo Alberto\n\nuna prueba cruzada es simplemente una prueba....es cruzada porque Ivan hizo la suya y vos haces la tuya.\nEs para Columbia.', '2023-10-05 22:49:52', '2023-10-09 15:05:24'),
(2, 'Metodologia Agile (Scrum)', 'Es un framework pensado para construir productos, potenciando el rabajo en equipo.\n\nEl equipo Scrum incluye 3 roles:\n_El Product Owner\n_El Scrum Master\n_Los miembros del equipo de desarrollo.', '2023-10-05 23:36:06', '2023-10-05 23:36:06'),
(3, 'Deliver IC', 'Solicitar Integracion Continua de la elaboracion y/o modificacion de un AST.', '2023-10-06 07:06:59', '2023-10-06 07:06:59'),
(4, 'Quemar Codigo', 'Escribir valores fijos dentro de un procedimiento en vez de recibir los valores a traves de un parámetro.', '2023-10-06 07:08:40', '2023-10-06 07:08:40'),
(5, 'Lane (EA)', 'Primero tiene que estar dentro de un pool. Es un clasificador de la instancia de un modulo. Los módulos son los que nos van a ordenar para saber por donde entro a la especificación. Es responsabilidad de cada Lane, cumplir con lo que le vamos a poner adentro.', '2023-10-06 19:04:44', '2023-10-06 19:13:41'),
(6, 'Pool (EA)', 'Representa el nombre de un proceso. es como una pileta, y los lanes son las calles por las que puede nadar uno (andariveles).', '2023-10-06 19:07:29', '2023-10-06 19:22:14'),
(7, 'Casos de Uso (EA)', 'Permiten definir otro tipo de cosas, o representar información de una especificación, desde otro lugar.El nombre del caso de uso que se va a poner, tiene que ver con lo que queremos representar con ese caso de uso. Debe ser lo suficientemente representativo para describir la interacción entre el sistema y el usuario, pero siempre desde la percepción del usuario. Que es lo que quiere hacer el usuario con nuestro sistema. Cada CU puede tener una actividad o varias (Lanes). No hay manera de que yo me pueda equivocar, porque siempre tiene que haber un responsable, un limite, y ese limite es en un Lane (en este caso COE central). es desde el punto de vista del que espera ese resultado de valor.', '2023-10-06 20:30:05', '2023-10-06 20:54:30'),
(8, 'Proceso de Negocio (EA)', 'Lo que se trata de representar es el flujo por el que transita todo un proceso, una unidad o una prestación de negocio que tiene la compañía. Por más que tiene un gran objetivo en si, puede ir pasando por diferentes situaciones (intervienen mas de un rol, mas de un modulo, mas de un responsable para llevar a cabo el complemento general). Un proceso fluye, y yo lo puedo seguir desde que comienza, hasta que termina. Son todos aquellos procesos que la empresa brinda como servicios (Proceso de débitos, extracción, padrón de pagos, etc).', '2023-10-06 20:48:20', '2023-10-06 23:17:50'),
(9, 'Detalle de actividad (EA)', 'Es para que cuando vamos navegando el proceso, utilizarlo en aquellas actividades que necesitan generar más especificaciones. En un proceso puede haber mas de una, por lo tanto la podemos instanciar esta pequeña estructura tantas veces como necesitemos para nuestras actividades.', '2023-10-06 22:43:44', '2023-10-06 22:43:44'),
(10, 'Procesos de Trabajo (EA)', 'Es el conjunto de procesos y actividades que llevamos adelante en nuestro día a día para poder entregar un desarrollo un proceso evolutivo, o un cambio o lo que sea.', '2023-10-06 23:19:06', '2023-10-06 23:20:14'),
(11, 'Modelar (EA)', 'Es la acción de realizar diferentes tipos de diagrama lógico para representar el origen, funcionamiento y ciclo de vida (entre otras características) de un sistema.', '2023-10-07 05:45:30', '2023-10-07 05:46:15'),
(12, 'Microservicios', 'Son un enfoque arquitectónico y organizativo para el desarrollo de software donde el software está compuesto por pequeños servicios independientes que se comunican a través de API bien definidas. Los propietarios de estos servicios son equipos pequeños independientes.', '2023-10-09 00:49:36', '2023-10-09 00:49:36'),
(13, 'Deploy', 'El despliegue de software son todas las actividades que hacen que un sistema de software esté disponible para su uso.​ El proceso de implantación general consiste en varias actividades interrelacionadas con posibles transiciones entre ellas.', '2023-10-09 02:53:24', '2023-10-09 02:53:24'),
(14, 'Stake Holders', '\n\nPor buscarle una equivalencia en castellano, podríamos decir que son las partes interesadas en el negocio o grupos de interés. Eso sí, hay que tener en cuenta que siempre hablamos tanto de terceros como del núcleo del propio negocio. \n\nAlrededor de una empresa hay mucho más que el empresario: gira todo un ecosistema compuesto por personas, proveedores e industrias auxiliares a las que les afecta de manera directa e indirecta cualquier acción o decisión que se lleve a cabo.\n\nTrabajadores, proveedores, socios como los de tipo logístico… y los clientes, por supuesto, forman parte de los stake holders de una empresa.', '2023-10-09 15:09:26', '2023-10-09 15:09:26'),
(15, 'Formulario A10', 'Es el documento en el cual vienen todas las especificaciones del requerimiento funcional del sistema. En el 99% de los casos, lo genera la gente del banco.', '2023-10-09 15:14:20', '2023-10-09 21:26:22'),
(16, 'Formulario C01', 'Es la devolución de un A10. En este caso, este documento especifica las actividades que se realizaron para cumplimentar los requerimientos especificados en el formulario A10, previo.', '2023-10-09 15:16:38', '2023-10-09 21:27:46'),
(17, 'Branch', 'Una rama o branch es una versión del código del proyecto sobre el que estás trabajando. Estas ramas ayudan a mantener el orden en el control de versiones y manipular el código de forma segura.', '2023-10-09 15:29:57', '2023-10-09 15:29:57'),
(18, 'Tablas Temporales (temp_db)', 'Pablo Zabala 12/10/2023, 08:24hs ~ Día soleado\n\nA los princeso(a)s nuevo(a)s:\n\n \n\n          Cuando en un proceso necesitamos tablas de apoyo en la tempdb, auxiliar, etc......estas tablas se crean al principio del SQR en la sección de Begin-setup End-setup y al inicio del SP asociado.\n\n[8:27] Barrera, Jose\nademás se deben agregar los respectivos drop/create en los .sp que las utilizan', '2023-10-12 15:20:42', '2023-10-12 15:30:47'),
(19, 'Declaracion de variables en VB', '$ después del nombre de variable significa que el tipo de esa variable va a ser String. \n\nDim VTTipoEnte$\n\nExisten mas métodos abreviados para declarar los tipos de las variables:\n\n$ = para String\n% = para Integer\n& = para Long\n@ = para Currency\n! = para Single\n# = para Double\ny nada es para Variant', '2023-10-20 19:20:09', '2023-10-20 19:20:09'),
(20, 'Ambiente', 'Es un entorno controlado que debiera contener DLLs, base de datos, códigos fuentes y ejecutables de la aplicación de una institución. Siempre se trata de que sea lo más parecido al entorno oficial para poder replicar errores y funcionalidades.', '2023-10-24 16:42:47', '2023-10-24 16:42:47'),
(21, 'Guardar como PC ANSI en BE', 'En la parte inferior del VSCode, en el Encoding donde normalmente dice UTF-8, se clickea y se elige Windows_1252.', '2023-11-24 18:25:21', '2023-11-24 18:25:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instituciones`
--

CREATE TABLE `instituciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `imagen` varchar(30) NOT NULL DEFAULT 'insti_generica.svg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `instituciones`
--

INSERT INTO `instituciones` (`id`, `nombre`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 'Accusys', 'insti_generica.svg', '2023-10-23 17:50:32', '2023-10-23 17:50:32'),
(2, 'Banco Hipotecario', 'insti_generica.svg', '2023-10-23 17:50:45', '2023-10-23 17:50:45'),
(3, 'Banco Columbia', 'insti_generica.svg', '2023-10-23 17:51:00', '2023-10-23 17:51:00'),
(4, 'Banco Ciudad', 'insti_generica.svg', '2023-10-23 17:51:05', '2023-10-23 17:51:05'),
(5, 'Banco Macro', 'insti_generica.svg', '2023-10-23 17:51:21', '2023-10-23 17:51:21'),
(6, 'Banco Virtual', 'insti_generica.svg', '2023-10-23 18:03:24', '2023-10-23 18:03:24'),
(7, 'BST', 'insti_generica.svg', '2023-10-23 18:03:33', '2023-10-23 18:03:33'),
(8, 'FaceBank', 'insti_generica.svg', '2023-10-23 18:03:58', '2023-10-23 18:03:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lenguajes`
--

CREATE TABLE `lenguajes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(1500) DEFAULT NULL,
  `imagen` varchar(40) DEFAULT 'lenguaje_generico.svg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `lenguajes`
--

INSERT INTO `lenguajes` (`id`, `nombre`, `descripcion`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 'PHP', 'Es un lenguaje de backend utilizado para desarrollos web.', 'php.svg', '2023-10-05 17:44:56', '2023-10-06 06:40:15'),
(2, 'SQL', 'Se utiliza para realizar consultas a una base de datos.', 'sql.svg', '2023-10-05 17:46:59', '2023-10-05 17:46:59'),
(3, 'Javascript', 'Es el lenguaje para toda actividad que se requiera en el navegador del usuario, en una estructura cliente-servidor.', 'javascript.svg', '2023-10-05 20:50:33', '2023-10-05 20:50:33'),
(4, 'C#', 'C Sharp, es un lenguaje de programación multiparadigma desarrollado y estandarizado por la empresa Microsoft como parte de su plataforma .NET, que después fue aprobado como un estándar por la ECMA e ISO. C# es uno de los lenguajes de programación diseñados para la infraestructura de lenguaje común.', 'c_sharp.svg', '2023-10-05 22:51:49', '2023-10-08 06:11:58'),
(5, '.NET', 'Lenguaje de Microsoft', 'punto_net.svg', '2023-10-05 22:52:18', '2023-10-05 22:52:18'),
(6, 'JAVA', 'Es un lenguaje de programación y una plataforma informática que fue comercializada por primera vez en 1995 por Sun Microsystems.​​ Su sintaxis deriva en gran medida de C y C++, pero tiene menos utilidades de bajo nivel que cualquiera de ellos. Las aplicaciones de Java son compiladas a bytecode (clase Java), que puede ejecutarse en cualquier máquina virtual Java (JVM) sin importar la arquitectura de la computadora subyacente. ', 'java.svg', '2023-10-05 22:53:48', '2023-10-05 22:53:48'),
(7, 'SQR', 'Structured Query Report: Lenguaje de programación diseñado para generar informes/reportes a partir de sistemas de gestión de bases de datos. El nombre es una abreviatura de Structured Query Reporter, lo que sugiere su relación con SQL. Cualquier declaración de SQL se puede incrustar en un programa SQR.', 'sqr.svg', '2023-10-05 22:55:15', '2023-10-06 06:40:43'),
(8, 'Visual Basic', 'Visual Basic (VB) es un lenguaje de programación dirigido por eventos. Desarrollado por Alan Cooper para Microsoft, este lenguaje de programación es un dialecto de BASIC con importantes agregados.', 'visual_basic.svg', '2023-10-05 23:07:06', '2023-10-05 23:07:06'),
(9, 'CSS', 'en español «Hojas de estilo en cascada», es un lenguaje de diseño gráfico para definir y crear la presentación de un documento estructurado escrito en HTML.​', 'css_3.svg', '2023-10-05 23:08:21', '2023-10-05 23:08:21'),
(10, 'HTML', 'siglas en inglés de HyperText Markup Language, hace referencia al lenguaje de marcado para la elaboración de páginas web.', 'html_5.svg', '2023-10-05 23:09:11', '2023-10-05 23:09:11'),
(11, 'ASP', 'Active Server Pages, ​ también conocido como ASP clásico, es una tecnología de Microsoft del lado del servidor para páginas web generadas dinámicamente, que ha sido comercializada como un anexo a Internet Information Services.', 'asp.svg', '2023-10-06 07:28:02', '2023-10-06 07:28:02'),
(12, 'Python', 'es un lenguaje de alto nivel de programación interpretado cuya filosofía hace hincapié en la legibilidad de su código, se utiliza para desarrollar aplicaciones de todo tipo, por ejemplo: Instagram, Netflix, Spotify, Panda3D, entre otros.​', 'python.svg', '2023-10-07 03:45:33', '2023-10-07 03:45:33'),
(13, 'FORTRAN', 'es un lenguaje de programación de alto nivel de propósito general, ​ procedural​ e imperativo, que está especialmente adaptado al cálculo numérico y a la computación científica y se usa para medir la eficiencia de los supercomputadores más rápidos del mundo.', 'fortran.svg', '2023-10-07 16:31:16', '2023-10-07 16:31:44'),
(14, 'COBOL', 'Creado hace más de 70 años, es un lenguaje de programación bastante común en programas y softwares que utilizan las entidades e instituciones financieras. Su nombre es un acrónimo para Commom Business-Oriented Language, que se traduce como “Lenguaje común orientado a las empresas”.', 'cobol.svg', '2023-10-07 16:54:34', '2023-10-07 16:54:34'),
(15, 'Assembler', 'Es un lenguaje de programación que se usa en los microprocesadores. Es usado para traducir sentencias al código del computador objetivo. Realiza una traducción.as o menos isomorfa (un mapeo de uno a uno) desde las sentencias mnemonicas, a las instrucciones y datos de máquina.', 'assembler.svg', '2023-10-08 02:00:39', '2023-10-08 02:00:39'),
(16, 'C', 'es un lenguaje de programación de propósito general​ originalmente desarrollado por Dennis Ritchie entre 1969 y 1972 en los Laboratorios Bell, ​ como evolución del anterior lenguaje B, a su vez basado en BCPL.​​​ Al igual que B, es un lenguaje orientado a la implementación de sistemas operativos, concretamente Unix.', 'c.svg', '2023-10-08 06:09:47', '2023-10-08 06:09:47'),
(17, 'C++', 'es un lenguaje de programación diseñado en 1979 por Bjarne Stroustrup. La intención de su creación fue extender al lenguaje de programación C y añadir mecanismos que permiten la manipulación de objetos. En ese sentido, desde el punto de vista de los lenguajes orientados a objetos, C++ es un lenguaje híbrido', 'c_mas_mas.svg', '2023-10-08 06:10:45', '2023-10-08 06:10:45'),
(18, 'T-SQL', 'es una extensión al SQL de Microsoft y Sybase. SQL, que frecuentemente se dice ser un Lenguaje de Búsquedas Estructurado, es un lenguaje de cómputo estandarizado, desarrollado originalmente por IBM para realizar búsquedas, alterar y definir bases de datos relacionales utilizando sentencias declarativas.', 'tsql.svg', '2023-10-09 01:22:36', '2023-10-09 01:22:36'),
(19, 'BAT_REG', 'Son archivos batch que usualmente también conforman una clave de registro', 'bat_reg.svg', '2023-11-02 21:51:51', '2023-11-02 21:51:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(5, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '2023_09_22_230303_create_sessions_table', 1),
(8, '2023_09_23_235348_create_ast_sprints_table', 1),
(9, '2023_09_24_001241_create_ast_actividads_table', 1),
(14, '2023_10_03_211742_create_categorias_table', 2),
(15, '2023_10_03_213035_create_lenguajes_table', 2),
(16, '2023_10_03_214741_create_fuentes_table', 2),
(17, '2023_10_04_172340_create_glosarios_table', 2),
(18, '2023_10_13_021432_create_credenciales_table', 3),
(20, '2023_10_23_025536_create_instituciones_table', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
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
-- Estructura de tabla para la tabla `sessions`
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
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('25whXsoV1RqyD5528LbSodRtYlVKsMVGEvoWHb96', NULL, '157.230.105.158', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSW01cUNQdGlOaWFFR3dua1lQdGFxOUNobml0cVkzZ2dQRFNwYzhiUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly91cGxvLmFkLz9pcD0xODEuODkuMTQzLjIzNyZwb3J0PTgwODAmdj0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1701436990),
('3THic9kTFqPqbCvX2q7DjPVcbNFkvMINbh5xGiGR', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiWUYyYldDV2xjSEZzdk9pWExWNFV6V2pZTUswMEh4ejZXWGpVU0ZYTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI4OiJodHRwOi8vc2Vydmlkb3IubG9jYWwvY2xhdmVzIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCQ5ZEpudi53STEyVjNGTmlZTkxtUFZ1YjYwNVQ1bHVIRE1ORzZyaGFiQ0t2b2s1RU9vSC9QdSI7fQ==', 1701452785),
('6bVfhmMIahfBCJckXcGgDjHQ5OqOVyRavgQ9iUGg', NULL, '192.168.5.238', 'HomeNet/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1hFRFZHcElaWlBwbXlOQ0ZzZDNkNjhnRnZkRExkOTc1Y1o2dUlubSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xOTIuMTY4LjUuMTkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1701443624),
('6LFawhxDRcrxpKcVy3wzOQHbOEzHBladhbhT0OUE', NULL, '192.168.5.238', 'HomeNet/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkJaNDV5TkliZ3RRZFVXS3BLNTREV0IyREhEeEUwcHNKSG5uNHd6TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xOTIuMTY4LjUuMTkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1701436365),
('cfwjtXG0296Jh4yGAK5ZW1FYHBOkuift7lsva53H', NULL, '192.168.5.238', 'HomeNet/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1BkS29FM3hEYnp0RHZ6RkFTaXhZalZiaGxqdDZnbkc2blNXUjhTUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xOTIuMTY4LjUuMTkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1701454511),
('J5cHvi3DBWMYQNKOX7x2YIFaiOKZPlOnSaPNY37h', NULL, '162.142.125.223', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianJ6QU9CdDVadVYza2FKUElyaExtdHNVdWJtWENyUmgwMjA1MGxJNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xODEuODkuMTQzLjIzNzo4MDgwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1701440142),
('JTMULOSFNrQumZ6HqSr5UpchspZ5NRB0YwzyFRrh', NULL, '192.168.5.238', 'HomeNet/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHQ3RUxKYjIzMTBHdG90S09DV1BsR3hZZzZBWWVmRmtCWXlPSWFsVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xOTIuMTY4LjUuMTkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1701447245),
('t16o8kqcA2fF3LDf97xn6vi7kf1AEf3gdhRqRp9s', NULL, '192.168.5.238', 'HomeNet/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzR1T094eDRSRVA5UFBzWWJkWEtLaEo1UHRvZlI4aGZuejB3R0NZdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xOTIuMTY4LjUuMTkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1701450875),
('wWyA037G72uj1f5GY1PFTThtlW9MIkd4A2BfCXS3', NULL, '192.168.5.238', 'HomeNet/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODRnb2ZUeHNvQ0FkR09rc1liM1Z4TUZhdGR5VHJucnpVbk1KdXhDZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xOTIuMTY4LjUuMTkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1701440000),
('Y5ExD79E3O97X9wbtR7yloR4nNxisJGZH6QRDbJY', NULL, '162.142.125.223', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTVkb3pqdFNkbHFkUGNOcTQyZnhFcm5UWkVvcUx6d3ZjUUdCNHlSNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xODEuODkuMTQzLjIzNzo4MDgwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1701440146);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `apellido`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Exequiel', NULL, 'exequiel.polito@accusys.com.ar', NULL, '$2y$10$9dJnv.wI12V3FNiYNLmPVub605T5luHDMNG6rhabCKvok5EOoH/Pu', NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-01 19:39:02', '2023-10-01 19:39:02');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ast_actividads`
--
ALTER TABLE `ast_actividads`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ast_sprints`
--
ALTER TABLE `ast_sprints`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `credenciales`
--
ALTER TABLE `credenciales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `fuentes`
--
ALTER TABLE `fuentes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `glosarios`
--
ALTER TABLE `glosarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `instituciones`
--
ALTER TABLE `instituciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lenguajes`
--
ALTER TABLE `lenguajes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ast_actividads`
--
ALTER TABLE `ast_actividads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `ast_sprints`
--
ALTER TABLE `ast_sprints`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `credenciales`
--
ALTER TABLE `credenciales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fuentes`
--
ALTER TABLE `fuentes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `glosarios`
--
ALTER TABLE `glosarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `instituciones`
--
ALTER TABLE `instituciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `lenguajes`
--
ALTER TABLE `lenguajes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
