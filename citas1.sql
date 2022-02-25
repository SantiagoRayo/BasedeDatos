-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-02-2022 a las 19:57:40
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `citas1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `citNumero` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'numero de cita',
  `citFecha` date NOT NULL COMMENT 'fecha de cita',
  `citHora` time NOT NULL COMMENT 'hora de la cita',
  `citPaciente` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'cita del paciente',
  `citMedico` int(20) NOT NULL COMMENT 'cita dle medico',
  `citConsultorio` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'cita consultorio',
  `citEstado` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'estado de cita',
  `citObservaciones` text NOT NULL COMMENT 'observaciones de la cita'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorios`
--

CREATE TABLE `consultorios` (
  `conNumero` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'numero de consultorio',
  `conNombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'nombre del consultorio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `consultorios`
--

INSERT INTO `consultorios` (`conNumero`, `conNombre`) VALUES
(0000000001, 'Consultas1'),
(0000000002, 'Tratamientos2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `medIdentifcacion` int(11) NOT NULL,
  `medNombres` varchar(50) NOT NULL,
  `medApellidos` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`medIdentifcacion`, `medNombres`, `medApellidos`) VALUES
(12345, 'Camilo', 'Robledo'),
(67890, 'Esteban', 'Salgado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `pacIdentificacion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'identificacio del paciente',
  `pacNombres` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'nombre del paciente',
  `pacApellidos` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'apellido del paciente',
  `pacFechaNacimiento` date NOT NULL COMMENT 'fecha de nacimiento del paciente',
  `pacSexo` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'sexo del paciente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`pacIdentificacion`, `pacNombres`, `pacApellidos`, `pacFechaNacimiento`, `pacSexo`) VALUES
('102030', 'Jose', 'Perez', '1978-08-14', 'm'),
('708090', 'Rosa', 'Diaz', '1978-08-14', 'f');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamientos`
--

CREATE TABLE `tratamientos` (
  `traNumero` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'numero de tratamiento',
  `traFechaAsignada` date NOT NULL COMMENT 'fecha asignaa del tratamiento',
  `traDescripcion` text NOT NULL COMMENT 'descripcion del tratamiento',
  `traFechaInicio` date NOT NULL COMMENT 'fecha de inicio del tratamiento',
  `traFechafin` date NOT NULL COMMENT 'fecha fin del tratamiento',
  `traObservaciones` text NOT NULL COMMENT 'observaciones del tratamiento',
  `traPaciente` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'tratyamiento del paciente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`citNumero`),
  ADD KEY `citPaciente` (`citPaciente`),
  ADD KEY `citConsultorio` (`citConsultorio`),
  ADD KEY `citMedico` (`citMedico`);

--
-- Indices de la tabla `consultorios`
--
ALTER TABLE `consultorios`
  ADD PRIMARY KEY (`conNumero`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`medIdentifcacion`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`pacIdentificacion`);

--
-- Indices de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD PRIMARY KEY (`traNumero`),
  ADD KEY `traPaciente` (`traPaciente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `citNumero` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'numero de cita';

--
-- AUTO_INCREMENT de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  MODIFY `traNumero` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'numero de tratamiento';

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`citPaciente`) REFERENCES `pacientes` (`pacIdentificacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`citConsultorio`) REFERENCES `consultorios` (`conNumero`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`citMedico`) REFERENCES `medicos` (`medIdentifcacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD CONSTRAINT `tratamientos_ibfk_1` FOREIGN KEY (`traPaciente`) REFERENCES `pacientes` (`pacIdentificacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
