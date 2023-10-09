-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-10-2023 a las 20:28:49
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
  `etiqueta` int(150) DEFAULT NULL,
  `desarrollo` varchar(6000) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `fuentes`
--

INSERT INTO `fuentes` (`id`, `nombre`, `lenguaje_id`, `categoria_id`, `etiqueta`, `desarrollo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Inicio de un SP', 18, NULL, NULL, 'use [nombre_otro_sp]\ngo\n\nif exists (select 1\n         from sysobjects\n         where name = \'sp_a_crear\')\nbegin\n  drop proc sp_a_crear\nend\ngo\n/*\n<summary>\nCARGA MASIVA DE FATCA\n\nNombre Físico: bc_ocde_afip_masiva.sp\n</summary>\n\n<historylog>\n<log LogType=\"Refactor\" revision=\"1.1\" date=\"18/09/2023\" email=\"jose.barrera@accusys.com.ar\">AST 101066</log>\n</historylog>\n*/\ncreate proc sp_a_crear (\n--<parameters>\n@s_user                 varchar(8)     = null, --<param required =\"no\" description=\"LO QUE SIGNIFIQUE EL VALOR.\"/>\n@s_ssn                  int            = null, --<param required =\"no\" description=\"LO QUE SIGNIFIQUE EL VALOR\"/>\n--</parameters>\n)\nas\ndeclare\n@w_d_sp_name            varchar(30),\n@w_d_msg                varchar(132)\n\nselect\n   @w_d_sp_name   = \'sp_a_crear\',\n   @w_d_dato      = \'\',\n   @w_d_msg       = \'\',\n   @w_n_error     = 0\n\nif @s_date is null\nbegin\n   select @s_date = fp_fecha\n   from [base_de_datos]..[tabla_de_la_base]\nend', '2023-10-09 01:25:41', '2023-10-09 01:25:41', NULL);

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
(17, 'Branch', 'Una rama o branch es una versión del código del proyecto sobre el que estás trabajando. Estas ramas ayudan a mantener el orden en el control de versiones y manipular el código de forma segura.', '2023-10-09 15:29:57', '2023-10-09 15:29:57');

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
(4, 'C#', 'C Sharp, es un lenguaje de programación multiparadigma desarrollado y estandarizado por la empresa Microsoft como parte de su plataforma .NET, que después fue aprobado como un estándar por la ECMA e ISO. C# es uno de los lenguajes de programación diseñados para la infraestructura de lenguaje común.', '2023-10-05 22:51:49', '2023-10-08 06:11:58'),
(5, '.NET', 'Lenguaje de Microsoft', '2023-10-05 22:52:18', '2023-10-05 22:52:18'),
(6, 'JAVA', 'Es un lenguaje de programación y una plataforma informática que fue comercializada por primera vez en 1995 por Sun Microsystems.​​ Su sintaxis deriva en gran medida de C y C++, pero tiene menos utilidades de bajo nivel que cualquiera de ellos. Las aplicaciones de Java son compiladas a bytecode (clase Java), que puede ejecutarse en cualquier máquina virtual Java (JVM) sin importar la arquitectura de la computadora subyacente. ', '2023-10-05 22:53:48', '2023-10-05 22:53:48'),
(7, 'SQR', 'Structured Query Report: Lenguaje de programación diseñado para generar informes/reportes a partir de sistemas de gestión de bases de datos. El nombre es una abreviatura de Structured Query Reporter, lo que sugiere su relación con SQL. Cualquier declaración de SQL se puede incrustar en un programa SQR.', '2023-10-05 22:55:15', '2023-10-06 06:40:43'),
(8, 'Visual Basic', 'Visual Basic (VB) es un lenguaje de programación dirigido por eventos. Desarrollado por Alan Cooper para Microsoft, este lenguaje de programación es un dialecto de BASIC con importantes agregados.', '2023-10-05 23:07:06', '2023-10-05 23:07:06'),
(9, 'CSS', 'en español «Hojas de estilo en cascada», es un lenguaje de diseño gráfico para definir y crear la presentación de un documento estructurado escrito en HTML.​', '2023-10-05 23:08:21', '2023-10-05 23:08:21'),
(10, 'HTML', 'siglas en inglés de HyperText Markup Language, hace referencia al lenguaje de marcado para la elaboración de páginas web.', '2023-10-05 23:09:11', '2023-10-05 23:09:11'),
(11, 'ASP', 'Active Server Pages, ​ también conocido como ASP clásico, es una tecnología de Microsoft del lado del servidor para páginas web generadas dinámicamente, que ha sido comercializada como un anexo a Internet Information Services.', '2023-10-06 07:28:02', '2023-10-06 07:28:02'),
(12, 'Python', 'es un lenguaje de alto nivel de programación interpretado cuya filosofía hace hincapié en la legibilidad de su código, se utiliza para desarrollar aplicaciones de todo tipo, por ejemplo: Instagram, Netflix, Spotify, Panda3D, entre otros.​', '2023-10-07 03:45:33', '2023-10-07 03:45:33'),
(13, 'FORTRAN', 'es un lenguaje de programación de alto nivel de propósito general, ​ procedural​ e imperativo, que está especialmente adaptado al cálculo numérico y a la computación científica y se usa para medir la eficiencia de los supercomputadores más rápidos del mundo.', '2023-10-07 16:31:16', '2023-10-07 16:31:44'),
(14, 'COBOL', 'Creado hace más de 70 años, es un lenguaje de programación bastante común en programas y softwares que utilizan las entidades e instituciones financieras. Su nombre es un acrónimo para Commom Business-Oriented Language, que se traduce como “Lenguaje común orientado a las empresas”.', '2023-10-07 16:54:34', '2023-10-07 16:54:34'),
(15, 'Assembler', 'Es un lenguaje de programación que se usa en los microprocesadores. Es usado para traducir sentencias al código del computador objetivo. Realiza una traducción.as o menos isomorfa (un mapeo de uno a uno) desde las sentencias mnemonicas, a las instrucciones y datos de máquina.', '2023-10-08 02:00:39', '2023-10-08 02:00:39'),
(16, 'C', 'es un lenguaje de programación de propósito general​ originalmente desarrollado por Dennis Ritchie entre 1969 y 1972 en los Laboratorios Bell, ​ como evolución del anterior lenguaje B, a su vez basado en BCPL.​​​ Al igual que B, es un lenguaje orientado a la implementación de sistemas operativos, concretamente Unix.', '2023-10-08 06:09:47', '2023-10-08 06:09:47'),
(17, 'C++', 'es un lenguaje de programación diseñado en 1979 por Bjarne Stroustrup. La intención de su creación fue extender al lenguaje de programación C y añadir mecanismos que permiten la manipulación de objetos. En ese sentido, desde el punto de vista de los lenguajes orientados a objetos, C++ es un lenguaje híbrido', '2023-10-08 06:10:45', '2023-10-08 06:10:45'),
(18, 'T-SQL', 'es una extensión al SQL de Microsoft y Sybase. SQL, que frecuentemente se dice ser un Lenguaje de Búsquedas Estructurado, es un lenguaje de cómputo estandarizado, desarrollado originalmente por IBM para realizar búsquedas, alterar y definir bases de datos relacionales utilizando sentencias declarativas.', '2023-10-09 01:22:36', '2023-10-09 01:22:36');

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
('0f1bIz4x1CH1KxGGcxQdb9s7XetmBq3tMJ4GNYMs', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/118.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiY0RGcDZIVDMwQnhvZHI3dGdZSjV5cVNyTWx0a0dFM1FVRE1MS2ozeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9zZXJ2aWRvci5sb2NhbC9nbG9zYXJpbyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkOWRKbnYud0kxMlYzRk5pWU5MbVBWdWI2MDVUNWx1SERNTkc2cmhhYkNLdm9rNUVPb0gvUHUiO30=', 1696876066),
('5U5La4tbDeHEBjcy5prDCHEEpAEZ7QVGwJqPYyJE', NULL, '192.168.5.19', 'HomeNet/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2xmcVk4dXBSZ2dSYXd0OVNPaTdUWWVwRzZOQW56M3JyT0NaRk1oNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xOTIuMTY4LjUuMTkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1696871539),
('70tAZhMFjTPhtEzAahoRFDZUF2qWcweI0CJNsfh9', NULL, '192.168.5.19', 'HomeNet/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkZJMnlKUmd3ZDZlU2IwTnBoR1doU2VtWUcwekxvajIzRDkydGl5dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xOTIuMTY4LjUuMTkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1696854250),
('COwQWDWPvHeYBI9egP9ankaV7L7cbLNaJ0dNz3V4', NULL, '116.212.159.94', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjV2ZFE5Y2Y3eGljanZ1TUVZNk5mbDEzZkhHT0NCcGhXelFzQ2NrWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xOTAuMjI5LjE5MC4yNDg6ODA4MCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1696856016),
('EjPMD8bziEjrYTCnXh22n1QMbPdYiqxi5eWUSRHr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/118.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVHdJSE1YS0pQakhmS1NCM2w0V2hSYVdtM2FhcnNMallTeXBVbE1XbSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMDoiaHR0cDovL3NlcnZpZG9yLmxvY2FsL2dsb3NhcmlvIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9zZXJ2aWRvci5sb2NhbC9nbG9zYXJpbyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1696860326),
('H5ix4c5SkWSM8N2xSw2X1br1GGEvhmUAzV8pMJ2i', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/118.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUlMc1M4UjNrQzN4RFoycnMxaEdFOWQwYWRaakd4d0xkYkg3R1d4UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9zZXJ2aWRvci5sb2NhbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1696870695),
('kNhZOLVPdeIOkEEOcLzM2OVZ5CIiLU5K6RA1064t', NULL, '192.168.5.238', 'HomeNet/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1BIYVFlN3RiQWt4NG53NkExcjEwWmUwZ3E4UEM3U2UzaWhOUW9VQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xOTIuMTY4LjUuMTkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1696871385),
('KXNYvqLJiaoHLjGHV2BPonMw3T5c6FGExvzhHgfN', NULL, '192.168.5.238', 'HomeNet/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkoyN2pRczJJSTJ3OWhPbG1wdlB2RWdkZHVMcVNyWWZxcVIwc2xJaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xOTIuMTY4LjUuMTkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1696875885),
('M16ObojFmdxVzdXplIwiJZji4zWGVpWaQJQUgMWD', NULL, '192.168.5.238', 'HomeNet/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjJSb01mTWxZR1BDazJiVHBxV1pGRnJ3Ym9MQU9QalI3RFUwbDNYNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xOTIuMTY4LjUuMTkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1696857885),
('pSMP0oPH0xFdQza1zGs2t8cwlCrqrypRuzYPZbTB', NULL, '152.32.159.79', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUZuWnpyYnhOeXZhNjFQQ09PbVl0Mms5aW1lOG02Z0R1TkljSE1KUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xOTAuMjI5LjE5MC4yNDg6ODA4MCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1696856317),
('PwmAFjEpWVevRyJDfBUDZNKWmSeOEtEI30XVz0YU', NULL, '62.210.90.211', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmROWDRJbERyZ2h4bjRtNERESlllSHk5ZDdGN1RjYldBNHduY0RKOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xOTAuMjI5LjE5MC4yNDg6ODA4MCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1696873701),
('scG2mX0C61Che8CcsVMIJnFR9S0YUexgS3AcbK0e', NULL, '192.168.5.238', 'HomeNet/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTM4RU9hdG9Tam9NSDNQcWdLY3VocXM4NVFZWXFtT0g2emMxR2taNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xOTIuMTY4LjUuMTkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1696866885),
('SIniwumbIVA7Zua64i0ThFbjXkqiue8U7pPoskiS', NULL, '192.168.5.238', 'HomeNet/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3J3N0xXamJtRkdlb0Ftc0ZGUlF0Wk50MHYxSXRjdmpJUG4zTEZKVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xOTIuMTY4LjUuMTkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1696862384),
('TyXs4oKHJKfwgutBhwJPIo1y92uc6HhXFyY91bwh', NULL, '62.210.90.211', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicDhwMTlDanlhUk1ySEtlSjM4YW9wSXpmdDhNYlljb2ZvM0ZraUVkcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xOTAuMjI5LjE5MC4yNDg6ODA4MCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1696873703),
('V3X0zvRUVAcDEHi5Aiu9XkfgpNaKVKUPVTOKRqey', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/118.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicklyWUpJWFZKRHhQT2s1MFFzd25VZFZUSGRaWFVFQlROSnVJbjlLSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9zZXJ2aWRvci5sb2NhbC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1696860326),
('WJ1n51wjwCJPxDrucOjR28gQaQeDVFmSqVTtx9bY', NULL, '62.210.90.211', 'curl/7.81.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiM3RlQ3NLNnliZzBoRzdrVU5GVWdvMldNNUVkenZYbzZCMzE5ZFRFTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1696873700),
('XbE1tGavsHGvZyLifQfK1DgvhSGnsxlrrDCiIexA', NULL, '192.168.5.238', 'HomeNet/1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDBFazlqZ2dzS2QySFJTcVJhcEx0Mmd3TnRXNTJVUWhhTFlkNlBXNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xOTIuMTY4LjUuMTkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1696854157);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `glosarios`
--
ALTER TABLE `glosarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `lenguajes`
--
ALTER TABLE `lenguajes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
