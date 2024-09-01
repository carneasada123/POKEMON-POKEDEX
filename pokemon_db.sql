-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-09-2024 a las 09:47:44
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pokemon_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokemons`
--

CREATE TABLE `pokemons` (
  `id` int(11) NOT NULL,
  `pokemon_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `abilities` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pokemons`
--

INSERT INTO `pokemons` (`id`, `pokemon_id`, `name`, `image_url`, `type`, `abilities`, `created_at`) VALUES
(1, 10, 'caterpie', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/10.png', 'bug', '[{\"name\":\"shield-dust\",\"url\":\"https:\\/\\/pokeapi.co\\/api\\/v2\\/ability\\/19\\/\"},{\"name\":\"run-away\",\"url\":\"https:\\/\\/pokeapi.co\\/api\\/v2\\/ability\\/50\\/\"}]', '2024-08-17 19:09:47'),
(2, 139, 'omastar', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/139.png', 'rock', '[{\"name\":\"swift-swim\",\"url\":\"https:\\/\\/pokeapi.co\\/api\\/v2\\/ability\\/33\\/\"},{\"name\":\"shell-armor\",\"url\":\"https:\\/\\/pokeapi.co\\/api\\/v2\\/ability\\/75\\/\"},{\"name\":\"weak-armor\",\"url\":\"https:\\/\\/pokeapi.co\\/api\\/v2\\/ability\\/133\\/\"}]', '2024-08-17 19:09:53'),
(3, 18, 'pidgeot', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/18.png', 'normal', '[{\"name\":\"keen-eye\",\"url\":\"https:\\/\\/pokeapi.co\\/api\\/v2\\/ability\\/51\\/\"},{\"name\":\"tangled-feet\",\"url\":\"https:\\/\\/pokeapi.co\\/api\\/v2\\/ability\\/77\\/\"},{\"name\":\"big-pecks\",\"url\":\"https:\\/\\/pokeapi.co\\/api\\/v2\\/ability\\/145\\/\"}]', '2024-08-17 19:12:04'),
(4, 115, 'kangaskhan', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/115.png', 'normal', '[{\"name\":\"early-bird\",\"url\":\"https:\\/\\/pokeapi.co\\/api\\/v2\\/ability\\/48\\/\"},{\"name\":\"scrappy\",\"url\":\"https:\\/\\/pokeapi.co\\/api\\/v2\\/ability\\/113\\/\"},{\"name\":\"inner-focus\",\"url\":\"https:\\/\\/pokeapi.co\\/api\\/v2\\/ability\\/39\\/\"}]', '2024-08-17 19:12:09'),
(5, 118, 'goldeen', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/118.png', 'water', '[{\"name\":\"swift-swim\",\"url\":\"https:\\/\\/pokeapi.co\\/api\\/v2\\/ability\\/33\\/\"},{\"name\":\"water-veil\",\"url\":\"https:\\/\\/pokeapi.co\\/api\\/v2\\/ability\\/41\\/\"},{\"name\":\"lightning-rod\",\"url\":\"https:\\/\\/pokeapi.co\\/api\\/v2\\/ability\\/31\\/\"}]', '2024-08-17 19:12:38'),
(6, 6, 'charizard', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png', 'fire', '[{\"name\":\"blaze\"},{\"name\":\"solar-power\"}]', '2024-08-17 19:21:52'),
(7, 150, 'mewtwo', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/150.png', 'psychic', '[{\"name\":\"pressure\"},{\"name\":\"unnerve\"}]', '2024-08-17 19:51:16'),
(8, 90, 'shellder', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/90.png', 'water', '[{\"name\":\"shell-armor\"},{\"name\":\"skill-link\"},{\"name\":\"overcoat\"}]', '2024-08-17 21:55:31'),
(9, 77, 'ponyta', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/77.png', 'fire', '[{\"name\":\"run-away\"},{\"name\":\"flash-fire\"},{\"name\":\"flame-body\"}]', '2024-08-18 06:01:09');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pokemons`
--
ALTER TABLE `pokemons`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pokemons`
--
ALTER TABLE `pokemons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
