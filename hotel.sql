-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2015 a las 01:52:43
-- Versión del servidor: 5.6.25
-- Versión de PHP: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `address` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `name`, `email`, `phone`, `password`, `address`, `created`) VALUES
(187, 'adriana', 'rubi.adriana.chan@gmail.com', '1234509878', '$2a$10$ac66dee71450fa4bf9c36uBT3yspGzz/wIGzZkVBVLC66/wX5S/km', 'morelos', '2015-11-14 01:29:42'),
(188, 'adriana', 'rubi.adriana.chan@gmail.comm', '123434444444', '$2a$10$f0123e7dada28a3876645utzw0Qqy5OC5XRr9wknyEwmSmgj3BfHi', 'ertt', '2015-11-14 01:34:43'),
(189, 'holas', 'rubi.adriana.chan@gmail.commmm', '123456787889989898', '$2a$10$0ff8b8e3c14f824a11013usePjfvymZItvP0FQAMMdGd4xGEUV5Ii', 'hyyy', '2015-11-14 01:43:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE IF NOT EXISTS `eventos` (
  `id` int(10) NOT NULL DEFAULT '0',
  `nombre` varchar(100) NOT NULL,
  `fechaInicio` date NOT NULL,
  `horaInicio` time(6) NOT NULL,
  `fechaTerminacion` date NOT NULL,
  `horaTerminacion` time(6) NOT NULL,
  `lugar` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id`, `nombre`, `fechaInicio`, `horaInicio`, `fechaTerminacion`, `horaTerminacion`, `lugar`) VALUES
(0, 'hallowen', '2015-11-02', '09:00:00.000000', '2015-11-16', '16:00:00.000000', 'la concha acustica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gimnasio`
--

CREATE TABLE IF NOT EXISTS `gimnasio` (
  `id` int(10) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `dias` varchar(60) NOT NULL,
  `horaApertura` time(6) NOT NULL,
  `horaCierre` time(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `gimnasio`
--

INSERT INTO `gimnasio` (`id`, `nombre`, `dias`, `horaApertura`, `horaCierre`) VALUES
(1, 'yoga', 'lunes-viernes', '08:00:00.000000', '17:00:00.000000'),
(2, 'fisicoculturismo', 'lunes-viernes', '09:00:00.000000', '18:00:00.000000'),
(3, 'box', 'lunes-miercoles', '08:00:00.000000', '13:00:00.000000'),
(4, 'fitness', 'sabado-domingo', '08:00:00.000000', '13:00:00.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE IF NOT EXISTS `habitacion` (
  `id` int(10) NOT NULL,
  `tipo` varchar(40) NOT NULL,
  `numeroP` int(2) NOT NULL,
  `precio` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`id`, `tipo`, `numeroP`, `precio`) VALUES
(1, 'suite', 2, 2000),
(2, 'sencillas', 1, 1000),
(3, 'matrimoniales', 2, 5000),
(4, 'dobles', 2, 4600),
(5, 'estudio', 1, 4560);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `huesped`
--

CREATE TABLE IF NOT EXISTS `huesped` (
  `id` int(10) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `usuario` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `fechaIngreso` date NOT NULL,
  `horaIngreso` time(6) NOT NULL,
  `fechaSalida` date NOT NULL,
  `horaSalida` time(6) NOT NULL,
  `habitacion` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `huesped`
--

INSERT INTO `huesped` (`id`, `nombre`, `apellido`, `usuario`, `password`, `telefono`, `fechaIngreso`, `horaIngreso`, `fechaSalida`, `horaSalida`, `habitacion`) VALUES
(1, 'alejandro', 'cordova', 'alex', 'elcamino', '9831134568', '2015-11-03', '06:00:00.000000', '2015-11-13', '18:00:00.000000', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaciones_eventos`
--

CREATE TABLE IF NOT EXISTS `reservaciones_eventos` (
  `id` int(10) NOT NULL,
  `evento` int(10) NOT NULL,
  `huesped` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reservaciones_eventos`
--

INSERT INTO `reservaciones_eventos` (`id`, `evento`, `huesped`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaciones_servicios`
--

CREATE TABLE IF NOT EXISTS `reservaciones_servicios` (
  `id` int(10) NOT NULL,
  `huesped` int(10) NOT NULL,
  `reservacion` int(10) NOT NULL,
  `fechaInicial` date NOT NULL,
  `horaInicial` time(6) NOT NULL,
  `fechaTerminacion` date NOT NULL,
  `horaTerminacion` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurante`
--

CREATE TABLE IF NOT EXISTS `restaurante` (
  `id` int(10) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `dias` varchar(60) NOT NULL,
  `horaApertura` time(6) NOT NULL,
  `horaCierre` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE IF NOT EXISTS `servicios` (
  `id` int(10) NOT NULL,
  `servicio` varchar(40) NOT NULL,
  `tipo` varchar(40) NOT NULL,
  `horario` varchar(40) NOT NULL,
  `horaApertura` time(6) NOT NULL,
  `horaCierre` time(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `servicio`, `tipo`, `horario`, `horaApertura`, `horaCierre`) VALUES
(1, 'gimnasio', 'yoga', 'lunes-viernes', '09:00:00.000000', '15:00:00.000000'),
(2, 'gimnasio', 'box', 'lunes-miercoles', '05:00:00.000000', '15:00:00.000000'),
(3, 'gimnasio', 'fisicoculturismo', 'lunes-jueves', '06:00:00.000000', '12:00:00.000000'),
(4, 'gimnasio', 'fitness', 'sabado-domingo', '04:00:00.000000', '13:00:00.000000'),
(5, 'vehiculo', 'particular', 'lunes-domingo', '08:00:00.000000', '19:00:00.000000'),
(6, 'vehiculo', 'grupal', 'lunes-domingo', '06:00:00.000000', '15:00:00.000000'),
(7, 'vehiculo', 'familiar', 'lunes-domingo', '07:00:00.000000', '15:00:00.000000'),
(8, 'restaurante', 'lobby', 'lunes-sabado', '06:00:00.000000', '15:00:00.000000'),
(9, 'restaurante', 'aireLibre', 'lunes-viernes', '09:00:00.000000', '16:00:00.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taxi`
--

CREATE TABLE IF NOT EXISTS `taxi` (
  `id` int(10) NOT NULL,
  `tipo` varchar(40) NOT NULL,
  `cantidadP` int(2) NOT NULL,
  `matricula` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gimnasio`
--
ALTER TABLE `gimnasio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `huesped`
--
ALTER TABLE `huesped`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservaciones_eventos`
--
ALTER TABLE `reservaciones_eventos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservaciones_servicios`
--
ALTER TABLE `reservaciones_servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `taxi`
--
ALTER TABLE `taxi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=190;
--
-- AUTO_INCREMENT de la tabla `gimnasio`
--
ALTER TABLE `gimnasio`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `huesped`
--
ALTER TABLE `huesped`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `reservaciones_eventos`
--
ALTER TABLE `reservaciones_eventos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `reservaciones_servicios`
--
ALTER TABLE `reservaciones_servicios`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `taxi`
--
ALTER TABLE `taxi`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
