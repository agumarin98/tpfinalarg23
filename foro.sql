-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-09-2023 a las 04:34:37
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `foro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forop`
--

CREATE TABLE `forop` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  `imagen` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `forop`
--

INSERT INTO `forop` (`id`, `titulo`, `descripcion`, `fecha`, `imagen`) VALUES
(1, 'test', 'pruebaprueba', '2023-09-13', 'https://ih1.redbubble.net/image.726720537.7470/st,small,507x507-pad,600x600,f8f8f8.jpg'),
(5, 'prueba5', 'Lorem Ipsum \"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...\" \"No hay nadie que ame el dolor mismo, que lo busque, lo encuentre y lo quiera, simplemente porque es el dolor.\"', '2023-09-29', 'https://i.pinimg.com/originals/7f/ed/9c/7fed9c11202f1887164d489af9d32d86.png'),
(6, 'prueb6', 'Lorem Ipsum \"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...\" \"No hay nadie que ame el dolor mismo, que lo busque, lo encuentre y lo quiera, simplemente porque es el dolor.\"', '2023-09-29', 'https://static.wikia.nocookie.net/mrfz/images/c/cc/Rhine_Lab.png/revision/latest?cb=20210421020108');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `forop`
--
ALTER TABLE `forop`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `forop`
--
ALTER TABLE `forop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
