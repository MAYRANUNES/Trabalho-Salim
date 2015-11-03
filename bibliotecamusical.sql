-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 03-Nov-2015 às 14:21
-- Versão do servidor: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bibliotecamusical`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `album`
--

CREATE TABLE IF NOT EXISTS `album` (
`id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `ano` int(11) DEFAULT NULL,
  `artista_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `album`
--

INSERT INTO `album` (`id`, `nome`, `ano`, `artista_id`) VALUES
(1, 'album 1', 2015, 1),
(2, 'TRANSPARENCIA', 2012, 2),
(3, 'albumqualquer', 2015, 3),
(4, 'Depois da guerra', 2010, 1),
(5, 'Depois da guerra', 2010, 1),
(6, 'Depois da guerra', 2010, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `artista`
--

CREATE TABLE IF NOT EXISTS `artista` (
`id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `genero_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `artista`
--

INSERT INTO `artista` (`id`, `nome`, `genero_id`) VALUES
(1, 'Oficina G3', 1),
(2, 'Gerson Rufino', 2),
(3, 'outroartista', 3),
(4, 'Oficina G3', 1),
(5, 'Oficina G3', 1),
(6, 'Aline Barros', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `genero`
--

CREATE TABLE IF NOT EXISTS `genero` (
`id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `genero`
--

INSERT INTO `genero` (`id`, `nome`) VALUES
(1, 'rock'),
(2, 'Regaee'),
(3, 'outro'),
(5, 'Rock'),
(6, 'Gospel');

-- --------------------------------------------------------

--
-- Estrutura da tabela `musica`
--

CREATE TABLE IF NOT EXISTS `musica` (
`id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `nota` int(11) DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  `album_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `musica`
--

INSERT INTO `musica` (`id`, `nome`, `nota`, `duracao`, `album_id`) VALUES
(1, 'musica qualquer', 5, 280, 1),
(2, 'Depois da Guerra', 10, 300, 1),
(3, 'Depois da Guerra', 10, 300, 1),
(4, 'Revolução', 10, 300, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_album_artista1_idx` (`artista_id`);

--
-- Indexes for table `artista`
--
ALTER TABLE `artista`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_artista_genero_idx` (`genero_id`);

--
-- Indexes for table `genero`
--
ALTER TABLE `genero`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `musica`
--
ALTER TABLE `musica`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_musica_album1_idx` (`album_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `artista`
--
ALTER TABLE `artista`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `genero`
--
ALTER TABLE `genero`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `musica`
--
ALTER TABLE `musica`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `album`
--
ALTER TABLE `album`
ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`artista_id`) REFERENCES `artista` (`id`),
ADD CONSTRAINT `fk_album_artista1` FOREIGN KEY (`artista_id`) REFERENCES `artista` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `artista`
--
ALTER TABLE `artista`
ADD CONSTRAINT `artista_ibfk_1` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`),
ADD CONSTRAINT `fk_artista_genero` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `musica`
--
ALTER TABLE `musica`
ADD CONSTRAINT `fk_musica_album1` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `musica_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
