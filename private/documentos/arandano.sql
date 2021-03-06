-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 06, 2016 at 08:51 PM
-- Server version: 5.7.16-0ubuntu0.16.04.1
-- PHP Version: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arandano`
--

-- --------------------------------------------------------

--
-- Table structure for table `bloque`
--

CREATE TABLE `bloque` (
  `bloque_id` int(11) NOT NULL,
  `img_url` varchar(256) DEFAULT NULL,
  `content` text NOT NULL,
  `mod_id_f` int(11) NOT NULL,
  `numero_like` int(11) NOT NULL DEFAULT '0',
  `numero_dislike` int(11) NOT NULL DEFAULT '0',
  `vistos` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bloque_visto`
--

CREATE TABLE `bloque_visto` (
  `bloque_id` int(11) NOT NULL,
  `stu_id` int(11) NOT NULL,
  `visto` tinyint(1) NOT NULL,
  `like` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Table structure for table `curso`
--

CREATE TABLE `curso` (
  `curso_id` int(11) NOT NULL,
  `nombre` varchar(256) DEFAULT NULL,
  `imagen` varchar(512) DEFAULT NULL,
  `descripcion` text,
  `exp_id_f` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `curso`
--

INSERT INTO `curso` (`curso_id`, `nombre`, `imagen`, `descripcion`, `exp_id_f`) VALUES
(1, 'fis120', 'url', 'fisica general II', 1);

-- --------------------------------------------------------

--
-- Table structure for table `curso_estudiante`
--

CREATE TABLE `curso_estudiante` (
  `curso_id` int(11) NOT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `nota` int(11) DEFAULT NULL,
  `nivel_curso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `curso_estudiante`
--

INSERT INTO `curso_estudiante` (`curso_id`, `stu_id`, `nota`, `nivel_curso`) VALUES
(1, 42, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `estudiante`
--

CREATE TABLE `estudiante` (
  `stu_id` int(11) NOT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  `nombre` varchar(128) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `tipo` int(1) DEFAULT NULL,
  `nivel_global` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estudiante`
--

INSERT INTO `estudiante` (`stu_id`, `nickname`, `nombre`, `email`, `password`, `tipo`, `nivel_global`) VALUES
(42, 'felipe', 'felipe', 'felipe', '1234', 1, 0),
(43, 'felipe', 'felipe', 'felipe@g.c', '1', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `experto`
--

CREATE TABLE `experto` (
  `exp_id` int(11) NOT NULL,
  `nombre_exp` varchar(256) DEFAULT NULL,
  `exp_pass` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `experto`
--

INSERT INTO `experto` (`exp_id`, `nombre_exp`, `exp_pass`) VALUES
(1, 'felipe avaria', '1234'),
(2, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `modulo`
--

CREATE TABLE `modulo` (
  `mod_id` int(11) NOT NULL,
  `nombre_mod` varchar(256) DEFAULT NULL,
  `img_mod` varchar(256) DEFAULT NULL,
  `curso_id_f` int(11) NOT NULL,
  `numero_blo_asimi` int(11) DEFAULT '0',
  `numero_blo_adap` int(11) NOT NULL DEFAULT '0',
  `numero_blo_conver` int(11) NOT NULL DEFAULT '0',
  `numero_blo_diver` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profesor`
--

CREATE TABLE `profesor` (
  `prof_id` int(11) NOT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  `nombre` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profesor_curso`
--

CREATE TABLE `profesor_curso` (
  `Profesorprof_id` int(11) NOT NULL,
  `Cursocurso_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `progreso`
--

CREATE TABLE `progreso` (
  `Nivel` int(1) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `mod_id_f` int(11) NOT NULL,
  `stu_id_f` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bloque`
--
ALTER TABLE `bloque`
  ADD PRIMARY KEY (`bloque_id`),
  ADD KEY `FKBloque704652` (`mod_id_f`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`curso_id`),
  ADD KEY `Crear` (`exp_id_f`);

--
-- Indexes for table `curso_estudiante`
--
ALTER TABLE `curso_estudiante`
  ADD PRIMARY KEY (`curso_id`),
  ADD UNIQUE KEY `stu_id` (`stu_id`);

--
-- Indexes for table `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`stu_id`);

--
-- Indexes for table `experto`
--
ALTER TABLE `experto`
  ADD PRIMARY KEY (`exp_id`);

--
-- Indexes for table `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`mod_id`),
  ADD KEY `FKModulo188483` (`curso_id_f`);

--
-- Indexes for table `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`prof_id`);

--
-- Indexes for table `profesor_curso`
--
ALTER TABLE `profesor_curso`
  ADD PRIMARY KEY (`Profesorprof_id`,`Cursocurso_id`),
  ADD KEY `FKProfesor_C767515` (`Profesorprof_id`),
  ADD KEY `FKProfesor_C800063` (`Cursocurso_id`);

--
-- Indexes for table `progreso`
--
ALTER TABLE `progreso`
  ADD KEY `FKProgreso853449` (`mod_id_f`),
  ADD KEY `FKProgreso943627` (`stu_id_f`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bloque`
--
ALTER TABLE `bloque`
  MODIFY `bloque_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
  MODIFY `curso_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `stu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `experto`
--
ALTER TABLE `experto`
  MODIFY `exp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `modulo`
--
ALTER TABLE `modulo`
  MODIFY `mod_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `profesor`
--
ALTER TABLE `profesor`
  MODIFY `prof_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bloque`
--
ALTER TABLE `bloque`
  ADD CONSTRAINT `FKBloque704652` FOREIGN KEY (`mod_id_f`) REFERENCES `modulo` (`mod_id`);

--
-- Constraints for table `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `Crear` FOREIGN KEY (`exp_id_f`) REFERENCES `experto` (`exp_id`);

--
-- Constraints for table `curso_estudiante`
--
ALTER TABLE `curso_estudiante`
  ADD CONSTRAINT `curso_estudiante_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`curso_id`),
  ADD CONSTRAINT `curso_estudiante_ibfk_2` FOREIGN KEY (`stu_id`) REFERENCES `estudiante` (`stu_id`);

--
-- Constraints for table `modulo`
--
ALTER TABLE `modulo`
  ADD CONSTRAINT `FKModulo188483` FOREIGN KEY (`curso_id_f`) REFERENCES `curso` (`curso_id`);

--
-- Constraints for table `profesor_curso`
--
ALTER TABLE `profesor_curso`
  ADD CONSTRAINT `FKProfesor_C767515` FOREIGN KEY (`Profesorprof_id`) REFERENCES `profesor` (`prof_id`),
  ADD CONSTRAINT `FKProfesor_C800063` FOREIGN KEY (`Cursocurso_id`) REFERENCES `curso` (`curso_id`);

--
-- Constraints for table `progreso`
--
ALTER TABLE `progreso`
  ADD CONSTRAINT `FKProgreso853449` FOREIGN KEY (`mod_id_f`) REFERENCES `modulo` (`mod_id`),
  ADD CONSTRAINT `FKProgreso943627` FOREIGN KEY (`stu_id_f`) REFERENCES `estudiante` (`stu_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
