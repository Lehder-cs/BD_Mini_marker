-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-08-2022 a las 05:19:40
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `factura`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nit` int(15) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `idusuario` int(11) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nit`, `nombre`, `apellido`, `telefono`, `direccion`, `fecha`, `idusuario`, `estatus`) VALUES
(1, 0, 'CF', 'FC', 0, 'FC', '2022-01-22 10:11:33', 1, 1),
(2, 93456098, 'Alexis Biera gonzales ', 'Biera gonzales ', 43567809, 'Poblado paimira ', '2022-01-22 10:13:11', 3, 1),
(3, 8967453, 'Damaris Cortes', ' Cortes', 4567890, 'poblado 1', '2022-01-22 10:14:01', 1, 1),
(86, 89765656, 'Kener Felipe', 'Cortes Angulo', 300693723, 'Barcelona-floridad', '2022-06-04 22:38:39', 1, 1),
(94, 87128490, 'Lliana Maria', 'Castillo Churta', 30098922, 'calle 90 A #56-76', '2022-07-07 20:27:06', 1, 1),
(97, 1193552580, 'Leder ', 'Castillo', 300897292, 'santiago de cali ', '2022-07-31 11:41:32', 1, 1),
(100, 983556221, 'Kevin Stiven', 'Caicedo', 2773931, 'Santiago de cali ', '2022-08-08 20:30:57', 1, 1),
(101, 0, 'Yudi carlina', 'Cabrera', 56629922, 'Bogotá D.C', '2022-08-08 20:53:52', 1, 1),
(102, 108926711, 'Marcos Maria', 'Costella', 2147483647, 'Nariño', '2022-08-08 20:59:06', 1, 1),
(104, 870902020, 'Javier Andres', 'Pantoja', 2727280, 'Valle de lili', '2022-08-13 20:22:38', 1, 1),
(105, 89202922, 'Christian ', 'Castro del milagro ', 2147483647, 'Nariño Ipiales', '2022-08-15 11:35:21', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` bigint(20) NOT NULL,
  `nit` varchar(20) NOT NULL,
  `resolucion_dian` varchar(30) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `razon_social` varchar(100) NOT NULL,
  `telefono` bigint(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` text NOT NULL,
  `iva` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nit`, `resolucion_dian`, `nombre`, `razon_social`, `telefono`, `email`, `direccion`, `iva`) VALUES
(1, '1190899102', '191816549/8109', 'Futones & Colchones ', 'Nuestra fabricacion es nuestro orgullo', 3006983459, 'ledercastillo0276@gmail.com', 'Bogota D.C  (calle 76 13A 79)', '19.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

CREATE TABLE `detallefactura` (
  `correlativo` bigint(11) NOT NULL,
  `nofactura` bigint(11) DEFAULT NULL,
  `codproducto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detallefactura`
--

INSERT INTO `detallefactura` (`correlativo`, `nofactura`, `codproducto`, `cantidad`, `precio_venta`) VALUES
(105, 51, 12, 1, '3517.87'),
(106, 51, 27, 1, '20694.74'),
(108, 52, 12, 5, '3517.87');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

CREATE TABLE `detalle_temp` (
  `correlativo` int(11) NOT NULL,
  `token_user` varchar(50) NOT NULL,
  `codproducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_temp`
--

INSERT INTO `detalle_temp` (`correlativo`, `token_user`, `codproducto`, `cantidad`, `precio_venta`) VALUES
(242, '92cc227532d17e56e07902b254dfad10', 12, 1, '3517.87'),
(243, '92cc227532d17e56e07902b254dfad10', 33, 1, '277481.67'),
(244, '92cc227532d17e56e07902b254dfad10', 5, 1, '4294.12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

CREATE TABLE `entradas` (
  `correlativo` int(11) NOT NULL,
  `codproducto` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `entradas`
--

INSERT INTO `entradas` (`correlativo`, `codproducto`, `fecha`, `cantidad`, `precio`, `usuario_id`) VALUES
(5, 5, '2022-01-23 12:46:43', 10, '350.00', 1),
(12, 12, '2022-03-15 12:21:44', 13, '80.00', 1),
(15, 22, '2022-05-31 21:18:20', 5, '6000.00', 1),
(20, 27, '2022-06-01 21:29:03', 10, '3000.00', 1),
(22, 27, '2022-06-04 17:28:16', 50, '2000.00', 1),
(23, 27, '2022-06-04 17:31:12', 40, '3000.00', 1),
(28, 27, '2022-06-05 10:53:46', 100, '6000.00', 1),
(29, 5, '2022-06-05 10:54:38', 60, '3000.00', 1),
(35, 22, '2022-06-17 19:12:17', 5, '1300.00', 1),
(38, 12, '2022-06-18 13:22:26', 5, '2600.00', 1),
(39, 12, '2022-06-18 13:25:01', 5, '2000.00', 1),
(40, 12, '2022-06-18 13:25:24', 5, '200.00', 1),
(41, 12, '2022-06-18 13:26:37', 6, '3000.00', 1),
(42, 12, '2022-06-18 13:26:57', 6, '4000.00', 1),
(43, 12, '2022-06-18 13:30:10', 5, '9000.00', 1),
(44, 12, '2022-06-18 13:39:09', 10, '300.00', 1),
(46, 22, '2022-06-19 07:33:23', 10, '4700.00', 1),
(48, 22, '2022-06-19 07:36:06', 5, '3900.00', 1),
(49, 22, '2022-06-19 07:42:02', 5, '2300.00', 1),
(51, 22, '2022-06-19 08:03:52', 10, '3300.00', 1),
(52, 29, '2022-06-21 21:12:55', 10, '3200.00', 1),
(53, 29, '2022-06-21 21:13:59', 15, '3700.00', 1),
(59, 33, '2022-06-27 08:36:06', 10, '1499890.00', 1),
(60, 22, '2022-07-04 11:57:16', 50, '1200.00', 1),
(61, 27, '2022-07-04 11:57:40', 200, '35900.00', 1),
(62, 12, '2022-07-05 22:35:58', 10, '4500.00', 1),
(63, 29, '2022-07-07 20:07:45', 25, '4500.00', 1),
(64, 34, '2022-07-07 20:09:35', 30, '6000.00', 1),
(66, 36, '2022-07-07 20:13:38', 40, '1400.00', 1),
(70, 34, '2022-07-14 21:24:13', 30, '9800.00', 1),
(74, 36, '2022-08-08 21:08:26', 20, '5700.00', 1),
(76, 41, '2022-08-08 21:13:51', 10, '5900.00', 1),
(77, 33, '2022-08-10 21:29:25', 50, '33000.00', 1),
(78, 41, '2022-08-11 19:00:11', 10, '5700.00', 1),
(79, 42, '2022-08-12 21:09:32', 20, '-14700.00', 1),
(80, 43, '2022-08-12 21:11:55', 5, '123998.00', 1),
(81, 36, '2022-08-15 11:28:47', 5, '5700.00', 1),
(82, 44, '2022-08-15 11:41:46', 5, '890000.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `nofactura` bigint(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `usuario` int(11) DEFAULT NULL,
  `codcliente` int(11) DEFAULT NULL,
  `totalfactura` decimal(10,2) DEFAULT NULL,
  `estatus` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`nofactura`, `fecha`, `usuario`, `codcliente`, `totalfactura`, `estatus`) VALUES
(12, '2022-06-10 20:00:23', 1, 3, '4300.00', 1),
(13, '2022-06-10 20:01:13', 1, 3, '38000.00', 1),
(46, '2022-08-09 13:54:59', 1, 1, '3517.87', 1),
(47, '2022-08-09 19:57:04', 1, 94, '56907.35', 1),
(48, '2022-08-13 20:00:07', 1, 97, '3517.87', 2),
(51, '2022-08-16 21:38:17', 1, 1, '24212.61', 1),
(52, '2022-08-16 21:39:08', 1, 97, '17589.35', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codproducto` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `proveedor` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `existencia` int(11) DEFAULT NULL,
  `fecha_edicion` datetime NOT NULL DEFAULT current_timestamp(),
  `usuario_id` int(11) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1,
  `foto` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codproducto`, `descripcion`, `proveedor`, `precio`, `existencia`, `fecha_edicion`, `usuario_id`, `estatus`, `foto`) VALUES
(5, 'almuada sprink', 12, '4294.12', 171, '2022-01-23 12:46:43', 1, 1, 'img_c7395ea6ceb1316a648254283a68d161.jpg'),
(12, 'Almuada sprink 60 x 20', 1, '3517.87', 48, '2022-03-15 12:21:44', 1, 1, 'img_a1ef0a57fdd5ece5706275960973d3bf.jpg'),
(22, 'almuada backi', 14, '1994.24', 89, '2022-05-31 21:18:20', 1, 1, 'img_e50126a597445ddf68f187bf9ee41029.jpg'),
(27, 'almuada sprink', 14, '20694.74', 331, '2022-06-01 21:29:03', 1, 1, 'img_8287d7a81f7dd1cf4a814229b28a0cb3.jpg'),
(29, 'Cama doble dormir ', 12, '4000.00', 46, '2022-06-21 21:12:55', 1, 1, 'img_d950b1de6f1c3ad722a0451762db45db.jpg'),
(33, 'Colchon doble sin resorte 160 x 140 ', 14, '277481.67', 60, '2022-06-27 08:36:06', 1, 1, 'img_producto.png'),
(34, 'Cama doble con base cama gratis', 13, '7900.00', 60, '2022-07-07 20:09:35', 1, 1, 'img_1d5e3ed22d3f3eaaa70a3b4006396230jpg'),
(36, 'Cubre colchones de 140 x 120 MM', 1, '3053.84', 65, '2022-07-07 20:13:38', 1, 1, 'img_4902d0d7c34b75207805ab51524c249fjpg'),
(41, 'Base cama doble 120 x 110', 13, '5800.00', 20, '2022-08-08 21:13:51', 1, 0, 'img_producto.png'),
(42, 'Almohada valsten', 25, '-14700.00', 20, '2022-08-12 21:09:32', 1, 0, 'img_producto.png'),
(43, 'Almohada valsten', 25, '123998.00', 5, '2022-08-12 21:11:55', 1, 1, 'img_723eec020d63231fbfdd8437514c87b9jpg'),
(44, 'LG SMART TV', 27, '890000.00', 5, '2022-08-15 11:41:46', 1, 1, 'img_1b6137aac4e643a65f4395e5f2d7c188jpg');

--
-- Disparadores `producto`
--
DELIMITER $$
CREATE TRIGGER `entradas_A_I` AFTER INSERT ON `producto` FOR EACH ROW BEGIN
           INSERT INTO entradas(codproducto,cantidad,precio,usuario_id)
           VALUES (new.codproducto,new.existencia,new.precio,new.usuario_id);
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `codproveedor` int(11) NOT NULL,
  `proveedor` varchar(100) DEFAULT NULL,
  `rut` int(15) NOT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `telefono` bigint(11) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `idusuario` int(11) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`codproveedor`, `proveedor`, `rut`, `contacto`, `telefono`, `direccion`, `fecha`, `idusuario`, `estatus`) VALUES
(1, 'BIC', 99876, 'Claudia Rosales', 789877889, 'Avenida las Americas', '2022-01-22 14:48:14', 0, 1),
(12, 'Bromax', 119355465, 'Paula Gonzales', 3006983459, 'madrid el vallado', '2022-01-22 17:17:04', 1, 1),
(13, 'VLOM', 87687909, 'DAMARIS', 3147654389, 'Poblado 1', '2022-01-22 18:09:43', 1, 1),
(14, 'VILLAN', 99754666, 'FREDY CORTES', 9876654, 'Colonia las mercedes ', '2022-01-22 18:11:23', 1, 1),
(20, 'JC-FATCH', 48999303, 'Monica Moreano', 6789986, 'Cali - Valle del cauca ', '2022-06-18 22:11:44', 1, 1),
(25, 'CD VAINSF', 2147483647, 'Maria Castro Lodoño', 3006983459, 'Cartago de Francisco', '2022-08-08 21:05:05', 1, 1),
(26, 'CONST', 47737323, 'Mariana Churta Ortiz', 3006983459, 'Bogotá D.C', '2022-08-15 11:36:28', 1, 1),
(27, 'VFABRICACIONES S.A', 37855525, 'Miguel Castro MIlo', 34345555, 'Nariño Ipiales', '2022-08-15 11:38:55', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL,
  `rol` varchar(20) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `rol`, `estatus`) VALUES
(1, 'Administrador (a) ', 1),
(2, 'vendedor (a)', 1),
(3, 'Auxiliar de ventas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `correo` varchar(80) DEFAULT NULL,
  `usuario` varchar(15) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  `estatus` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `apellido`, `correo`, `usuario`, `clave`, `rol`, `estatus`) VALUES
(1, 'Leder Castillo', 'castillo', 'ledercs.013@gmail.com', 'admin', '0b08fbd1550283bcbe27f0be5cc0c2c1', 1, 1),
(3, 'Camilo vargas', 'Ortiz', 'camilo@gmail.com', 'vargas', '5ba9ea2bb1ff950c6a7697833e3fe8be', 3, 0),
(91, 'Genesis Lucero Estacio', NULL, 'genesis@gmail.com', 'GenesisEstacio', '5da4a7ebc75a373be4fc264bd0790f74', 2, 1),
(92, 'Kevin Stiven Castillo', NULL, 'Kcastillo@gmail.com', 'KevinCastillo', '9bf3ce727489c0d8a0829f0d99d838be', 3, 1),
(93, 'Monica Moreano Castillo', NULL, 'Moreano@gmail.com', 'MoreanoC', 'efbf48ec4067029ed9ca9e19021305e7', 2, 1),
(94, 'Andres Cortes Ortiz', NULL, 'Ortiz@gmail.com', 'AndresCortes', 'f7d56af2a3b6ea88558e501f4ae72739', 3, 1),
(95, 'Patricia Ordoñes ', NULL, 'Ordones@outlook.com', 'Patricia', '54a7b18f26374fc200ddedde0844f8ec', 3, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`),
  ADD KEY `usuario_id` (`idusuario`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD PRIMARY KEY (`correlativo`),
  ADD KEY `codproducto` (`codproducto`),
  ADD KEY `nofactura` (`nofactura`);

--
-- Indices de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD PRIMARY KEY (`correlativo`),
  ADD KEY `nofactura` (`token_user`),
  ADD KEY `codproducto` (`codproducto`);

--
-- Indices de la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`correlativo`),
  ADD KEY `codproducto` (`codproducto`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`nofactura`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `codcliente` (`codcliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codproducto`),
  ADD KEY `proveedor` (`proveedor`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`codproveedor`),
  ADD KEY `idusuario` (`idusuario`),
  ADD KEY `usuario_id` (`idusuario`),
  ADD KEY `usuario_id_2` (`idusuario`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `rol` (`rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  MODIFY `correlativo` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  MODIFY `correlativo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT de la tabla `entradas`
--
ALTER TABLE `entradas`
  MODIFY `correlativo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `nofactura` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `codproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `codproveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD CONSTRAINT `detallefactura_ibfk_1` FOREIGN KEY (`nofactura`) REFERENCES `factura` (`nofactura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detallefactura_ibfk_2` FOREIGN KEY (`codproducto`) REFERENCES `producto` (`codproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD CONSTRAINT `detalle_temp_ibfk_2` FOREIGN KEY (`codproducto`) REFERENCES `producto` (`codproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD CONSTRAINT `entradas_ibfk_1` FOREIGN KEY (`codproducto`) REFERENCES `producto` (`codproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`codcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`proveedor`) REFERENCES `proveedor` (`codproveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
