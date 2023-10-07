-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-10-2023 a las 19:51:32
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
  `nombre` varchar(100) DEFAULT NULL,
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
(15, NULL, '2023-10-04', 'AST', '59446', '1 - 1', 'INDUCCION', 6, 'Hs_Presenciales', '2023-10-06 07:26:59', '2023-10-06 07:26:59', NULL);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `nombre` varchar(40) NOT NULL,
  `lenguaje_id` bigint(20) NOT NULL,
  `categoria_id` bigint(20) DEFAULT NULL,
  `desarrollo` varchar(6000) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Puebas Cruzadas', '[viernes 12:13] Zabala, Pablo Alberto\n\nuna prueba cruzada es simplemente una prueba....es cruzada porque Ivan hizo la suya y vos haces la tuya.', '2023-10-05 22:49:52', '2023-10-06 06:39:40'),
(2, 'Metodologia Agile (Scrum)', 'Es un framework pensado para construir productos, potenciando el rabajo en equipo.\n\nEl equipo Scrum incluye 3 roles:\n_El Product Owner\n_El Scrum Master\n_Los miembros del equipo de desarrollo.', '2023-10-05 23:36:06', '2023-10-05 23:36:06'),
(3, 'Deliver IC', 'Solicitar Integracion Continua de la elaboracion y/o modificacion de un AST.', '2023-10-06 07:06:59', '2023-10-06 07:06:59'),
(4, 'Quemar Codigo', 'Escribir valores fijos dentro de un procedimiento en vez de recibir los valores a traves de un parámetro.', '2023-10-06 07:08:40', '2023-10-06 07:08:40'),
(5, 'Lane (EA)', 'Primero tiene que estar dentro de un pool. Es un clasificador de la instancia de un modulo. Los módulos son los que nos van a ordenar para saber por donde entro a la especificación. Es responsabilidad de cada Lane, cumplir con lo que le vamos a poner adentro.', '2023-10-06 19:04:44', '2023-10-06 19:13:41'),
(6, 'Pool (EA)', 'Representa el nombre de un proceso. es como una pileta, y los lanes son las calles por las que puede nadar uno (andariveles).', '2023-10-06 19:07:29', '2023-10-06 19:22:14'),
(7, 'Casos de Uso (EA)', 'Permiten definir otro tipo de cosas, o representar información de una especificación, desde otro lugar.El nombre del caso de uso que se va a poner, tiene que ver con lo que queremos representar con ese caso de uso. Debe ser lo suficientemente representativo para describir la interacción entre el sistema y el usuario, pero siempre desde la percepción del usuario. Que es lo que quiere hacer el usuario con nuestro sistema. Cada CU puede tener una actividad o varias (Lanes). No hay manera de que yo me pueda equivocar, porque siempre tiene que haber un responsable, un limite, y ese limite es en un Lane (en este caso COE central).', '2023-10-06 20:30:05', '2023-10-06 20:50:16'),
(8, 'Proceso de Negocio (EA)', 'Lo que se trata de representar es el flujo por el que transita todo un proceso, una unidad o una prestación de negocio que tiene la compañía. Por más que tiene un gran objetivo en si, puede ir pasando por diferentes situaciones (intervienen mas de un rol, mas de un modulo, mas de un responsable para llevar a cabo el complemento general).', '2023-10-06 20:48:20', '2023-10-06 20:49:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lenguajes`
--

CREATE TABLE `lenguajes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(1500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `lenguajes`
--

INSERT INTO `lenguajes` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'PHP', 'Es un lenguaje de backend utilizado para desarrollos web.', '2023-10-05 17:44:56', '2023-10-06 06:40:15'),
(2, 'SQL', 'Se utiliza para realizar consultas a una base de datos.', '2023-10-05 17:46:59', '2023-10-05 17:46:59'),
(3, 'Javascript', 'Es el lenguaje para toda actividad que se requiera en el navegador del usuario, en una estructura cliente-servidor.', '2023-10-05 20:50:33', '2023-10-05 20:50:33'),
(4, 'C#', 'Es un lenguaje de programación multiparadigma desarrollado y estandarizado por la empresa Microsoft como parte de su plataforma .NET, que después fue aprobado como un estándar por la ECMA e ISO. C# es uno de los lenguajes de programación diseñados para la infraestructura de lenguaje común.', '2023-10-05 22:51:49', '2023-10-05 22:51:49'),
(5, '.NET', 'Lenguaje de Microsoft', '2023-10-05 22:52:18', '2023-10-05 22:52:18'),
(6, 'JAVA', 'Es un lenguaje de programación y una plataforma informática que fue comercializada por primera vez en 1995 por Sun Microsystems.​​ Su sintaxis deriva en gran medida de C y C++, pero tiene menos utilidades de bajo nivel que cualquiera de ellos. Las aplicaciones de Java son compiladas a bytecode (clase Java), que puede ejecutarse en cualquier máquina virtual Java (JVM) sin importar la arquitectura de la computadora subyacente. ', '2023-10-05 22:53:48', '2023-10-05 22:53:48'),
(7, 'SQR', 'Structured Query Report: Lenguaje de programación diseñado para generar informes/reportes a partir de sistemas de gestión de bases de datos. El nombre es una abreviatura de Structured Query Reporter, lo que sugiere su relación con SQL. Cualquier declaración de SQL se puede incrustar en un programa SQR.', '2023-10-05 22:55:15', '2023-10-06 06:40:43'),
(8, 'Visual Basic', 'Visual Basic (VB) es un lenguaje de programación dirigido por eventos. Desarrollado por Alan Cooper para Microsoft, este lenguaje de programación es un dialecto de BASIC con importantes agregados.', '2023-10-05 23:07:06', '2023-10-05 23:07:06'),
(9, 'CSS', 'en español «Hojas de estilo en cascada», es un lenguaje de diseño gráfico para definir y crear la presentación de un documento estructurado escrito en HTML.​', '2023-10-05 23:08:21', '2023-10-05 23:08:21'),
(10, 'HTML', 'siglas en inglés de HyperText Markup Language, hace referencia al lenguaje de marcado para la elaboración de páginas web.', '2023-10-05 23:09:11', '2023-10-05 23:09:11'),
(11, 'ASP', 'Active Server Pages, ​ también conocido como ASP clásico, es una tecnología de Microsoft del lado del servidor para páginas web generadas dinámicamente, que ha sido comercializada como un anexo a Internet Information Services.', '2023-10-06 07:28:02', '2023-10-06 07:28:02');

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
(17, '2023_10_04_172340_create_glosarios_table', 2);

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
('789xQavjXdzfdXKWlDvZm4x7GyBA5ytTzL9iqIoB', NULL, '192.168.5.238', 'HomeNet/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibk0xV05XbUlqaHd4ZWdXNDNETGM2ZkttR2FOdUloSEttVk5RWkR1bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xOTIuMTY4LjUuMTkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1696613848),
('BzqF0VIff4uCqtcGWKqjrbstAIuZT6851A3fyfwx', NULL, '192.168.5.5', 'HomeNet/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1E5WWNXd0lkUUVCa0lYdXRWUklKUU02a2hnbEVPUm14QTE0dlhaTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xOTIuMTY4LjUuMTkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1696613846),
('jCu0lHr3vlK4lBwiQ1lzOaNglOjS8CeD7xNKtlaS', NULL, '192.168.5.5', 'HomeNet/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEhnS1RuQkE3ZU1ualhXeFVPVGt2OGlvODhMZGFIT0JtN2FYZ2t2cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xOTIuMTY4LjUuMTkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1696609431),
('omuuuuHXerdl7IK1r0j2kZohTvY9Kma2SyaCRiwq', NULL, '192.168.5.5', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVNhYWV0TUNxenJrSG9vcnc5cVZ4YzJhcm1UNzNVVEFWMWJ0ekFBTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xOTIuMTY4LjUuMTkiO319', 1696609429),
('qYpVtzSdjSM4IPud2ZnxBvmVDqS6wKaVcNyaP5Hp', NULL, '192.168.5.238', 'HomeNet/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEpqeU9lbnhuc3AyWmNtY2gyMkRORkVYb1V3YjFGMnRGdDhvNlV5NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xOTIuMTY4LjUuMTkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1696610232),
('svLQpcAsMCBQIGbcxRRwkdsBQSduZVx2MTXUezM8', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/118.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiNEE3NXJsOU5iajJ1Nzl2UE5Wb1FHZHlGV21xS3hUcm9CTTRiS0NZTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vc2Vydmlkb3IubG9jYWwvZGFzaGJvYXJkIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCQ5ZEpudi53STEyVjNGTmlZTkxtUFZ1YjYwNVQ1bHVIRE1ORzZyaGFiQ0t2b2s1RU9vSC9QdSI7fQ==', 1696608390),
('tv800afr9fq7OXM5TFsUXkLqYCJ1t7EQ67nGUzPC', 1, '192.168.5.26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoianZWT1d3UVVPQ0JQYzdycnZMdldOUDI3MXk2azFJSlpGbkU4MzBNYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xOTIuMTY4LjUuMTkvZ2xvc2FyaW8iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJDlkSm52LndJMTJWM0ZOaVlOTG1QVnViNjA1VDVsdUhETU5HNnJoYWJDS3ZvazVFT29IL1B1Ijt9', 1696614623);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
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

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Exequiel', 'exequiel.polito@accusys.com.ar', NULL, '$2y$10$9dJnv.wI12V3FNiYNLmPVub605T5luHDMNG6rhabCKvok5EOoH/Pu', NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-01 19:39:02', '2023-10-01 19:39:02');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `ast_sprints`
--
ALTER TABLE `ast_sprints`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fuentes`
--
ALTER TABLE `fuentes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `glosarios`
--
ALTER TABLE `glosarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `lenguajes`
--
ALTER TABLE `lenguajes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
