-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sql_abogado`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abogado`
--

CREATE TABLE `abogado` (
  `id` bigint(20) NOT NULL,
  `especialidad` varchar(255) DEFAULT NULL,
  `experiencia` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casos`
--

CREATE TABLE `casos` (
  `id` bigint(20) NOT NULL,
  `nombre_caso` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_inicio` datetime(6) DEFAULT NULL,
  `fecha_fin` datetime(6) DEFAULT NULL,
  `estado` enum('Abierto','En Proceso','Cerrado') DEFAULT 'Abierto',
  `id_abogado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `casos`
--

INSERT INTO `casos` (`id`, `nombre_caso`, `descripcion`, `fecha_inicio`, `fecha_fin`, `estado`, `id_abogado`) VALUES
(7, 'Caso Test', 'Descripción del caso de prueba', '2024-11-01 00:00:00.000000', '2024-12-01 00:00:00.000000', 'Abierto', 1),
(9, 'Caso Comercial', 'Detalles específicos del caso.', '2024-06-30 00:00:00.000000', '2024-12-03 00:00:00.000000', 'En Proceso', 4),
(10, 'Litigio Civil', 'Descripción breve del caso.', '2024-03-27 00:00:00.000000', '2024-04-21 00:00:00.000000', 'En Proceso', 4),
(11, 'Defensa Penal', 'Revisión de la defensa.', '2024-06-17 00:00:00.000000', '2024-07-17 00:00:00.000000', 'Abierto', 3),
(12, 'Arbitraje Internacional', 'Detalles específicos del caso.', '2024-02-28 00:00:00.000000', '2024-10-04 00:00:00.000000', 'Abierto', 4),
(13, 'Propiedad Intelectual', 'Detalles específicos del caso.', '2024-10-10 00:00:00.000000', '2024-12-23 00:00:00.000000', 'Abierto', 5),
(14, 'Caso Laboral', 'Análisis del litigio.', '2024-10-06 00:00:00.000000', '2024-11-02 00:00:00.000000', 'Cerrado', 4),
(15, 'Contrato Corporativo', 'Detalles específicos del caso.', '2024-01-27 00:00:00.000000', '2024-02-20 00:00:00.000000', 'Abierto', 3),
(16, 'Negociación Inmobiliaria', 'Revisión de la defensa.', '2024-02-06 00:00:00.000000', '2024-07-18 00:00:00.000000', 'Abierto', 3),
(17, 'Caso Actualizado', 'Descripción actualizada del caso', '2024-11-01 00:00:00.000000', '2024-12-01 00:00:00.000000', 'En Proceso', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `ruta` varchar(255) NOT NULL,
  `fecha_subida` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_caso` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_usuario` int(11) DEFAULT NULL,
  `leido` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observaciones`
--

CREATE TABLE `observaciones` (
  `id` int(11) NOT NULL,
  `contenido` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_caso` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`) VALUES
(1, 'Admin'),
(2, 'Abogado'),
(3, 'Secretario'),
(4, 'General');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `fecha_registro` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `contraseña`, `rol_id`, `fecha_registro`) VALUES
(1, 'Abogado Test', 'abogado@example.com', 'password123', 2, '2024-11-10'),
(2, 'Admin Test', 'admin@example.com', 'admin123', 1, '2024-11-10'),
(3, 'Abogado 3', 'abogado3@example.com', 'password3', 2, '2024-01-03'),
(4, 'Abogado 4', 'abogado4@example.com', 'password4', 2, '2024-01-04'),
(5, 'Abogado 5', 'abogado5@example.com', 'password5', 2, '2024-01-05');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abogado`
--
ALTER TABLE `abogado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `casos`
--
ALTER TABLE `casos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_abogado` (`id_abogado`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_caso` (`id_caso`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `observaciones`
--
ALTER TABLE `observaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_caso` (`id_caso`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `rol_id` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abogado`
--
ALTER TABLE `abogado`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `casos`
--
ALTER TABLE `casos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `observaciones`
--
ALTER TABLE `observaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `casos`
--
ALTER TABLE `casos`
  ADD CONSTRAINT `casos_ibfk_1` FOREIGN KEY (`id_abogado`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD CONSTRAINT `documentos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `observaciones`
--
ALTER TABLE `observaciones`
  ADD CONSTRAINT `observaciones_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
