-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-10-2021 a las 21:03:28
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `administracion1`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `listacampani` (`comnit` VARCHAR(11), `comnombre` VARCHAR(30), `comfundado` INT, `comreplegal` VARCHAR(100))  insert into tbl_compani (comnit,comnombre,comfundado,comreplegal) values (comnit,comnombre,comfundado,comreplegal)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listadeaseguramientos` (`ase_codigo` INT, `ase_fechainicio` DATE, `ase_fechaexpiracion` DATE, `ase_valorasegurado` INT, `ase_estado` VARCHAR(20), `ase_costo` INT, `ase_placa` VARCHAR(20))  insert into tbl_aseguramientos (ase_codigo,ase_fechainicio,ase_fechaexpiracion,ase_valorasegurado,ase_estado,ase_costo,ase_placa) values (ase_codigo,ase_fechainicio,ase_fechaexpiracion,ase_valorasegurado,ase_estado,ase_costo,ase_placa)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listadeautomotores` (`auto_placa` VARCHAR(6), `auto_marca` VARCHAR(30), `auto_tipo` INT, `auto_modelo` INT, `auto_pasajeros` INT, `auto_cilindraje` INT, `auto_numchasis` VARCHAR(20))  insert into tbl_automotores (auto_placa,auto_marca,auto_tipo,auto_modelo,auto_pasajeros,auto_cilindraje,auto_numchasis) values (auto_placa,auto_marca,auto_tipo,auto_modelo,auto_pasajeros,auto_cilindraje,auto_numchasis)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listadeclientes` (`id_cli` VARCHAR(11), `nom_cli` VARCHAR(30), `ape_cli` VARCHAR(30), `dir_cli` VARCHAR(100), `dep_cli` VARCHAR(20), `mes_cum_cli` VARCHAR(10))  insert into tbl_cliente (id_cli,nom_cli,ape_cli,dir_cli,dep_cli,mes_cum_cli) values (id_cli,nom_cli,ape_cli,dir_cli,dep_cli,mes_cum_cli)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listadepedido` ()  select a.nom_cli,a.ape_cli,a.dir_cli,b.fec_ped
from tbl_cliente a join pedido b 
on a.id_cli = b.id_cli_ped where fec_ped = '2012-02-25'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listaestudiantecurso` (`cod_cur_estcur` INT, `doc_est_estcur` INT, `fec_ini_estcur` DATE)  insert into tbl_estudixcurso (cod_cur_estcur,doc_est_estcur,fec_ini_estcur) values (cod_cur_estcur,doc_est_estcur,fec_ini_estcur)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listaincidentes` (`incicodigo` INT, `incifecha` DATE, `inciplaca` VARCHAR(6), `incilugar` VARCHAR(40), `inciantheridos` INT, `incicanfatalidades` INT, `incicanautosinvolucrados` INT)  insert into tbl_incidentes (incicodigo,incifecha,inciplaca,incilugar,inciantheridos,incicanfatalidades,incicanautosinvolucrados) values (incicodigo,incifecha,inciplaca,incilugar,inciantheridos,incicanfatalidades,incicanautosinvolucrados)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listapedido` (`id_ped` INT, `id_cli_ped` VARCHAR(11), `fec_ped` DATE, `val_ped` INT)  insert into pedido (id_ped,id_cli_ped,fec_ped,val_ped) values (id_ped,id_cli_ped,fec_ped,val_ped)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listaprofesor` (`doc_prof` VARCHAR(11), `nom_prof` VARCHAR(30), `ape_prof` VARCHAR(30), `cate` INT(11), `sal_prof` INT(11))  insert into tbl_profesor (doc_prof,nom_prof,ape_prof,cate_prof,sal_prof) values (doc_prof,nom_prof,ape_prof,cate_prof,sal_prof)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarticulo` (`id_art` INT, `tit_art` VARCHAR(100), `aut_art` VARCHAR(100), `edi_art` VARCHAR(100), `prec_art` INT)  insert into tbl_articulo (id_art,tit_art,aut_art,edi_art,prec_art) values (id_art,tit_art,aut_art,edi_art,prec_art)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listatipauto` (`aut_tipo` INT, `aut_nombre` VARCHAR(30))  insert into tbl_tiposautomotores (aut_tipo,aut_nombre) values (aut_tipo,aut_nombre)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listcurso` (`cod_curs` INT, `nom_curs` VARCHAR(100), `horas_cur` INT, `valor_cur` INT)  insert into tbl_curso (cod_curs,nom_curs,horas_cur,valor_cur) values (cod_curs,nom_curs,horas_cur,valor_cur)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listestudiante` (`doc_est` VARCHAR(30), `nom_est` VARCHAR(30), `ape_est` VARCHAR(30), `edad_est` INT)  insert into tbl_estudiante (doc_est,nom_est,ape_est,edad_est) values (doc_est,nom_est,ape_est,edad_est)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artículoxpedido`
--

CREATE TABLE `artículoxpedido` (
  `id_ped_artped` int(30) NOT NULL COMMENT 'identificacion del pedido x articulo del pedido',
  `id_art_artped` int(30) NOT NULL COMMENT 'identificacion del articulo x articulo del pedido',
  `can_art_artped` int(30) NOT NULL COMMENT 'cantidad de articulos x articulos x pedidos ',
  `val_ven_art_artped` int(30) NOT NULL COMMENT 'valor de venta de articulo x pedido',
  `id art x ped` int(11) NOT NULL COMMENT 'identificacion de articulo  x pedido'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `artículoxpedido`
--

INSERT INTO `artículoxpedido` (`id_ped_artped`, `id_art_artped`, `can_art_artped`, `val_ven_art_artped`, `id art x ped`) VALUES
(1, 3, 5, 40000, 1),
(1, 4, 12, 55000, 2),
(2, 1, 5, 65000, 3),
(3, 2, 10, 55000, 4),
(3, 3, 12, 45000, 5),
(4, 1, 20, 65000, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_ped` int(11) NOT NULL COMMENT 'ID del pedido',
  `id_cli_ped` varchar(11) NOT NULL COMMENT 'ID del cliente x pedido',
  `fec_ped` date NOT NULL COMMENT 'fecha de pedido',
  `val_ped` int(11) NOT NULL COMMENT 'valor del pedido'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_ped`, `id_cli_ped`, `fec_ped`, `val_ped`) VALUES
(1, '63502718', '2012-02-25', 120000),
(2, '77191956', '2012-04-30', 55000),
(3, '63502718', '2011-12-10', 260000),
(4, '1098765789', '2012-02-25', 1800000),
(5, '123456789', '2013-10-24', 20000000),
(6, '123456789', '2013-10-24', 20000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_articulo`
--

CREATE TABLE `tbl_articulo` (
  `id_art` int(30) NOT NULL COMMENT 'ID del articulo',
  `tit_art` varchar(100) NOT NULL COMMENT 'titulo del articulo',
  `aut_art` varchar(100) NOT NULL COMMENT 'autor del articulo',
  `edi_art` varchar(100) NOT NULL COMMENT 'editorial del articulo',
  `prec_art` int(11) NOT NULL COMMENT 'precio del articulo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_articulo`
--

INSERT INTO `tbl_articulo` (`id_art`, `tit_art`, `aut_art`, `edi_art`, `prec_art`) VALUES
(1, 'Redes cisco', 'Ernesto\r\nArigasello', 'Alfaomega -\r\nRama', 60000),
(2, 'Facebook y Twitter\r\n\r\npara adultos', 'Veloso Claudio', 'Alfaomega', 52000),
(3, 'Creación de un\r\nportal con php y\r\nmysql', 'Jacob Pavón\r\nPuertas', 'Alfaomega -\r\nRama', 40000),
(4, 'Administración\r\nde sistemas\r\noperativos', 'Julio Gómez\r\nLópez', 'Alfaomega -\r\nRama', 55000),
(5, 'redes', 'andre', 'alfaomega', 10000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_aseguramientos`
--

CREATE TABLE `tbl_aseguramientos` (
  `ase_codigo` int(6) NOT NULL COMMENT 'codigo de aseguramiento',
  `ase_fechainicio` date NOT NULL COMMENT 'fecha de inicio de aseguramiento',
  `ase_fechaexpiracion` date NOT NULL COMMENT 'fecha de expiracion de aseguramiento',
  `ase_valorasegurado` int(11) NOT NULL COMMENT 'valor de aseguramiento',
  `ase_estado` varchar(20) NOT NULL COMMENT 'estado de aseguramiento',
  `ase_costo` int(10) NOT NULL COMMENT 'costo del aseguramiento',
  `ase_placa` varchar(20) NOT NULL COMMENT 'placa asegurada'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_aseguramientos`
--

INSERT INTO `tbl_aseguramientos` (`ase_codigo`, `ase_fechainicio`, `ase_fechaexpiracion`, `ase_valorasegurado`, `ase_estado`, `ase_costo`, `ase_placa`) VALUES
(1, '2012-09-30', '2013-09-27', 30000000, 'Vigente', 500000, 'FLL420'),
(2, '2012-09-29', '2013-09-27', 35000000, 'Vigente', 600000, 'DKZ820'),
(3, '2011-09-28', '2012-09-28', 50000000, 'Vigente', 800000, 'KJQ920'),
(4, '2014-09-10', '2015-01-25', 60000000, 'vigente', 100000, 'WTP951');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_automotores`
--

CREATE TABLE `tbl_automotores` (
  `auto_placa` varchar(6) NOT NULL COMMENT 'placa del auto',
  `auto_marca` varchar(30) NOT NULL COMMENT 'marca del auto',
  `auto_tipo` int(11) NOT NULL COMMENT 'tipo de auto',
  `auto_modelo` int(11) NOT NULL COMMENT 'modelo del auto',
  `auto_pasajeros` int(11) NOT NULL COMMENT 'pasajeros del auto',
  `auto_cilindraje` int(11) NOT NULL COMMENT 'cilindraje del auto',
  `auto_numchasis` varchar(20) NOT NULL COMMENT 'numero de chasis del auto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_automotores`
--

INSERT INTO `tbl_automotores` (`auto_placa`, `auto_marca`, `auto_tipo`, `auto_modelo`, `auto_pasajeros`, `auto_cilindraje`, `auto_numchasis`) VALUES
('DKZ820', 'renault  stepway', 1, 2008, 5, 1600, 'wywwzz157'),
('FLL420', 'chevrolet corsa', 1, 2003, 5, 1400, 'wywzzz167 kk009d25'),
('KJQ920', 'kia  sportage', 2, 2009, 7, 2000, 'wywzzz157'),
('WTP951', 'chevrolet', 3, 2010, 5, 2000, 'wyzxt123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cliente`
--

CREATE TABLE `tbl_cliente` (
  `id_cli` varchar(11) NOT NULL COMMENT 'ID del cliente',
  `nom_cli` varchar(30) NOT NULL COMMENT 'nombre del cliente',
  `ape_cli` varchar(30) NOT NULL COMMENT 'apellido del cliente',
  `dir_cli` varchar(100) NOT NULL COMMENT 'dirrecion del cliente',
  `dep_cli` varchar(20) NOT NULL COMMENT 'departamento del cliente',
  `mes_cum_cli` varchar(10) NOT NULL COMMENT 'mes cumpleaños del cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_cliente`
--

INSERT INTO `tbl_cliente` (`id_cli`, `nom_cli`, `ape_cli`, `dir_cli`, `dep_cli`, `mes_cum_cli`) VALUES
('1098765789', 'Catalina', 'Zapata', 'Av. El\r\nLibertador No.\r\n30-14', 'Cauca', 'Marzo'),
('123456789', 'andre', 'gonsalez', 'cra5 calle 50', 'tolima', 'diciembre'),
('13890234', 'Roger', 'Ariza', 'Cra 30 No.\r\n\r\n13-45', 'Antioquia', 'Junio'),
('63502718', 'Maritza', 'Rojas', 'Calle 34 No.', 'Santander', 'Abril'),
('77191956', 'Juan  Carlos', 'Arenas', 'Diagonal 23\r\nNo. 12-34\r\napto 101', 'Valle', 'Marzo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_compani`
--

CREATE TABLE `tbl_compani` (
  `comnit` varchar(11) NOT NULL COMMENT 'meet de la campañia',
  `comnombre` varchar(30) NOT NULL COMMENT 'nombre de la compañia',
  `comfundado` int(11) NOT NULL COMMENT 'año fundada la compañia',
  `comreplegal` varchar(100) NOT NULL COMMENT 'representante legal de la compañia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_compani`
--

INSERT INTO `tbl_compani` (`comnit`, `comnombre`, `comfundado`, `comreplegal`) VALUES
('0123456789', 'seguros sura', 1999, 'andre'),
('800890890-2', 'Seguros  Atlantida', 1998, 'Carlos López'),
('899999999-1', 'Aseguradora  Rojas', 1991, 'Luis Fernando Rojas'),
('899999999-5', 'Seguros del  Estado', 2001, 'María Margarita \r\n\r\nPérez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_curso`
--

CREATE TABLE `tbl_curso` (
  `cod_curs` int(11) NOT NULL COMMENT 'codigo del curso',
  `nom_curs` varchar(100) DEFAULT NULL COMMENT 'nombre del curso',
  `horas_cur` int(11) DEFAULT NULL COMMENT 'horas del curso',
  `valor_cur` int(11) DEFAULT NULL COMMENT 'valor del curso'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_curso`
--

INSERT INTO `tbl_curso` (`cod_curs`, `nom_curs`, `horas_cur`, `valor_cur`) VALUES
(149842, 'Fundamentos de bases de\r\n\r\ndatos', 40, 500000),
(250067, 'Fundamentos de SQL', 20, 700000),
(289011, 'Manejo de Mysql', 45, 550000),
(345671, 'Fundamentals of Oracle', 60, 3000000),
(1222222222, 'andre', 10, 20000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estudiante`
--

CREATE TABLE `tbl_estudiante` (
  `doc_est` varchar(30) NOT NULL COMMENT 'documento del estudiante',
  `nom_est` varchar(30) DEFAULT NULL COMMENT 'nombre del estudiante',
  `ape_est` varchar(30) DEFAULT NULL COMMENT 'apellido del estudiante',
  `edad_est` int(11) DEFAULT NULL COMMENT 'edad del estudiante'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_estudiante`
--

INSERT INTO `tbl_estudiante` (`doc_est`, `nom_est`, `ape_est`, `edad_est`) VALUES
('1.098.098.097', 'Jonatan', 'Ardila', 22),
('1.098.765.679', 'Carlos', 'Martínez', 45),
('1222', 'andre', 'gonsalez', 11),
('63.502.720', 'María', 'Pérez', 11),
('91.245.678', 'Carlos José', 'López', 35);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estudixcurso`
--

CREATE TABLE `tbl_estudixcurso` (
  `cod_cur_estcur` int(30) NOT NULL COMMENT 'codigo del curso estuiante x curso',
  `doc_est_estcur` varchar(30) NOT NULL COMMENT 'documento estudiante por curso',
  `fec_ini_estcur` date NOT NULL COMMENT 'fecha inicial estudiante x curso'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_estudixcurso`
--

INSERT INTO `tbl_estudixcurso` (`cod_cur_estcur`, `doc_est_estcur`, `fec_ini_estcur`) VALUES
(289011, '1.098.765.679', '2011-02-01'),
(250067, '63.502.720', '2011-03-01'),
(289011, '1.098.098.097', '2011-02-01'),
(345671, '63.502.720', '2011-04-01'),
(1222222222, '1222', '2012-09-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_incidentes`
--

CREATE TABLE `tbl_incidentes` (
  `incicodigo` int(11) NOT NULL COMMENT 'codigo de incidente',
  `incifecha` date NOT NULL COMMENT 'fecha de incidente',
  `inciplaca` varchar(6) NOT NULL COMMENT 'placa de incidente',
  `incilugar` varchar(40) NOT NULL COMMENT 'lugar de incidente',
  `inciantheridos` int(11) NOT NULL COMMENT 'heridos en incidente',
  `incicanfatalidades` int(11) NOT NULL COMMENT 'fatalidades en incidente',
  `incicanautosinvolucrados` int(11) NOT NULL COMMENT 'autos involucrados en incidentes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_incidentes`
--

INSERT INTO `tbl_incidentes` (`incicodigo`, `incifecha`, `inciplaca`, `incilugar`, `inciantheridos`, `incicanfatalidades`, `incicanautosinvolucrados`) VALUES
(1, '2012-09-30', 'DKZ820', 'Bucaramanga', 0, 0, 2),
(2, '2012-09-27', 'FLL420', 'Girón', 1, 0, 1),
(3, '2011-09-28', 'FLL420', 'Bucaramanga', 1, 0, 2),
(4, '2015-04-12', 'WTP951', 'Tolima', 4, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_profesor`
--

CREATE TABLE `tbl_profesor` (
  `doc_prof` varchar(11) NOT NULL COMMENT 'numero de documento del profesor',
  `nom_prof` varchar(30) DEFAULT NULL COMMENT 'nombre del profesor',
  `ape_prof` varchar(30) DEFAULT NULL COMMENT 'apellido del profesor',
  `cate_prof` int(11) DEFAULT NULL COMMENT 'categoria del profesor',
  `sal_prof` int(11) DEFAULT NULL COMMENT 'salario del profesor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_profesor`
--

INSERT INTO `tbl_profesor` (`doc_prof`, `nom_prof`, `ape_prof`, `cate_prof`, `sal_prof`) VALUES
('1.098.765.7', 'Alejandra', 'Torres', 4, 1100000),
('123', 'andre', 'gonzalez', NULL, 10000000),
('12333333333', 'andrea', 'gonzales', NULL, 10000000),
('13.826.789', 'Maritza', 'Angarita', 1, 550000),
('63.502.720', 'Martha', 'Rojas', 2, 690000),
('65776862', 'Andrea ', 'Gonzalez', 1, 1000000),
('91.216.904', 'Carlos', 'Pérez', 3, 950000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tiposautomotores`
--

CREATE TABLE `tbl_tiposautomotores` (
  `aut_tipo` int(11) NOT NULL COMMENT 'tipo de auto',
  `aut_nombre` varchar(30) NOT NULL COMMENT 'nombre del auto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_tiposautomotores`
--

INSERT INTO `tbl_tiposautomotores` (`aut_tipo`, `aut_nombre`) VALUES
(1, 'Automóviles'),
(2, 'Camperos'),
(3, 'Camiones'),
(4, 'automovil');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `artículoxpedido`
--
ALTER TABLE `artículoxpedido`
  ADD PRIMARY KEY (`id art x ped`),
  ADD KEY `id_ped_artped` (`id_ped_artped`),
  ADD KEY `id_art_artped` (`id_art_artped`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_ped`),
  ADD KEY `id_cli_ped` (`id_cli_ped`);

--
-- Indices de la tabla `tbl_articulo`
--
ALTER TABLE `tbl_articulo`
  ADD PRIMARY KEY (`id_art`);

--
-- Indices de la tabla `tbl_aseguramientos`
--
ALTER TABLE `tbl_aseguramientos`
  ADD PRIMARY KEY (`ase_codigo`),
  ADD KEY `ase_placa` (`ase_placa`);

--
-- Indices de la tabla `tbl_automotores`
--
ALTER TABLE `tbl_automotores`
  ADD PRIMARY KEY (`auto_placa`),
  ADD KEY `auto_tipo` (`auto_tipo`);

--
-- Indices de la tabla `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  ADD PRIMARY KEY (`id_cli`);

--
-- Indices de la tabla `tbl_compani`
--
ALTER TABLE `tbl_compani`
  ADD PRIMARY KEY (`comnit`);

--
-- Indices de la tabla `tbl_curso`
--
ALTER TABLE `tbl_curso`
  ADD PRIMARY KEY (`cod_curs`);

--
-- Indices de la tabla `tbl_estudiante`
--
ALTER TABLE `tbl_estudiante`
  ADD PRIMARY KEY (`doc_est`);

--
-- Indices de la tabla `tbl_estudixcurso`
--
ALTER TABLE `tbl_estudixcurso`
  ADD KEY `cod_cur_estcur` (`cod_cur_estcur`),
  ADD KEY `doc_est_estcur` (`doc_est_estcur`);

--
-- Indices de la tabla `tbl_incidentes`
--
ALTER TABLE `tbl_incidentes`
  ADD PRIMARY KEY (`incicodigo`),
  ADD KEY `inciplaca` (`inciplaca`);

--
-- Indices de la tabla `tbl_profesor`
--
ALTER TABLE `tbl_profesor`
  ADD PRIMARY KEY (`doc_prof`);

--
-- Indices de la tabla `tbl_tiposautomotores`
--
ALTER TABLE `tbl_tiposautomotores`
  ADD PRIMARY KEY (`aut_tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_ped` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del pedido', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbl_articulo`
--
ALTER TABLE `tbl_articulo`
  MODIFY `id_art` int(30) NOT NULL AUTO_INCREMENT COMMENT 'ID del articulo', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_aseguramientos`
--
ALTER TABLE `tbl_aseguramientos`
  MODIFY `ase_codigo` int(6) NOT NULL AUTO_INCREMENT COMMENT 'codigo de aseguramiento', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_curso`
--
ALTER TABLE `tbl_curso`
  MODIFY `cod_curs` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo del curso', AUTO_INCREMENT=1222222223;

--
-- AUTO_INCREMENT de la tabla `tbl_incidentes`
--
ALTER TABLE `tbl_incidentes`
  MODIFY `incicodigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo de incidente', AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `artículoxpedido`
--
ALTER TABLE `artículoxpedido`
  ADD CONSTRAINT `artículoxpedido_ibfk_1` FOREIGN KEY (`id_ped_artped`) REFERENCES `pedido` (`id_ped`) ON UPDATE CASCADE,
  ADD CONSTRAINT `artículoxpedido_ibfk_2` FOREIGN KEY (`id_art_artped`) REFERENCES `tbl_articulo` (`id_art`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cli_ped`) REFERENCES `tbl_cliente` (`id_cli`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_aseguramientos`
--
ALTER TABLE `tbl_aseguramientos`
  ADD CONSTRAINT `tbl_aseguramientos_ibfk_1` FOREIGN KEY (`ase_placa`) REFERENCES `tbl_automotores` (`auto_placa`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_automotores`
--
ALTER TABLE `tbl_automotores`
  ADD CONSTRAINT `tbl_automotores_ibfk_1` FOREIGN KEY (`auto_tipo`) REFERENCES `tbl_tiposautomotores` (`aut_tipo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_estudixcurso`
--
ALTER TABLE `tbl_estudixcurso`
  ADD CONSTRAINT `tbl_estudixcurso_ibfk_1` FOREIGN KEY (`cod_cur_estcur`) REFERENCES `tbl_curso` (`cod_curs`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_estudixcurso_ibfk_2` FOREIGN KEY (`doc_est_estcur`) REFERENCES `tbl_estudiante` (`doc_est`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_incidentes`
--
ALTER TABLE `tbl_incidentes`
  ADD CONSTRAINT `tbl_incidentes_ibfk_1` FOREIGN KEY (`inciplaca`) REFERENCES `tbl_automotores` (`auto_placa`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
