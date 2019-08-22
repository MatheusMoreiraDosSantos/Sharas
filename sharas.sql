-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 07-Jun-2019 às 03:25
-- Versão do servidor: 10.1.37-MariaDB
-- versão do PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sharas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `animal`
--

CREATE TABLE `animal` (
  `animal_id` int(11) NOT NULL,
  `animal_nome` varchar(80) DEFAULT NULL,
  `animal_registro` varchar(20) DEFAULT NULL,
  `animal_proprietario` varchar(80) DEFAULT NULL,
  `animal_criador` varchar(80) DEFAULT NULL,
  `animal_nascimento` date DEFAULT NULL,
  `animal_sexo` varchar(30) DEFAULT NULL,
  `animal_pelagem` varchar(80) DEFAULT NULL,
  `animal_modalidade` varchar(80) DEFAULT NULL,
  `animal_treinador` varchar(80) DEFAULT NULL,
  `animal_veterinario` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `animal`
--

INSERT INTO `animal` (`animal_id`, `animal_nome`, `animal_registro`, `animal_proprietario`, `animal_criador`, `animal_nascimento`, `animal_sexo`, `animal_pelagem`, `animal_modalidade`, `animal_treinador`, `animal_veterinario`) VALUES
(1, 'CAPTAIN COUNTRY', 'P175575', 'MARCELO MOREIRA DOS SANTOS', 'MARCELO MOREIRA DOS SANTOS', '2012-12-29', 'GARANHAO', 'BAIO ', 'REDEAS', 'CT MARCELO MOREIRA', 'NETO CAMARGO'),
(2, 'BUDDY CHIC SON  ', 'P249710', 'MARCELO MOREIRA DOS SANTOS', 'MARCELO MOREIRA DOS SANTOS', '2016-10-13', 'MACHO', 'BAIO AMARILHO', 'REDEAS', 'CT MARCELO MOREIRA', 'NETO CAMARGO'),
(3, 'BELL WHIZ  ', 'P127714', 'ANTÔNIO CARLOS DA SILVA MALTEZ  CRIADOR', 'CARLOS ROBERTO CORÁ', '2008-12-02', 'MATRIZ', 'ALAZAO', 'REPRODUCAO', '-', 'NETO CAMARGO'),
(17, 'pe de pano', 'P141520', '', '', '2019-06-05', 'Castrado', 'Alazao', 'redeas', 'sr.Madruga', 'Equine Center');

-- --------------------------------------------------------

--
-- Estrutura da tabela `calendario`
--

CREATE TABLE `calendario` (
  `calendario_id` int(11) NOT NULL,
  `calendario_data` date DEFAULT NULL,
  `calendario_anotacao` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `calendario`
--

INSERT INTO `calendario` (`calendario_id`, `calendario_data`, `calendario_anotacao`) VALUES
(12, '2019-06-06', 'avaliação SHARAS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cliente_id` int(11) NOT NULL,
  `cliente_none` varchar(45) NOT NULL,
  `cliente_cpf` varchar(11) NOT NULL,
  `cliente_endereco` varchar(100) DEFAULT NULL,
  `cliente_cidade` varchar(45) NOT NULL,
  `cliente_datanasc` date DEFAULT NULL,
  `usu_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `feno`
--

CREATE TABLE `feno` (
  `feno_id` int(11) NOT NULL,
  `feno_quantidade` int(11) DEFAULT NULL,
  `feno_qualidade` int(11) DEFAULT NULL,
  `feno_fornecedor` varchar(80) DEFAULT NULL,
  `feno_valor` float DEFAULT NULL,
  `feno_compra` date DEFAULT NULL,
  `feno_duracao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `feno`
--

INSERT INTO `feno` (`feno_id`, `feno_quantidade`, `feno_qualidade`, `feno_fornecedor`, `feno_valor`, `feno_compra`, `feno_duracao`) VALUES
(1, 200, 2, 'k', 2500, '2019-05-29', '2019-06-29');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ferrajamento`
--

CREATE TABLE `ferrajamento` (
  `ferrajamento_id` int(11) NOT NULL,
  `ferrajamento_inicio` date DEFAULT NULL,
  `ferrajamento_termino` date DEFAULT NULL,
  `ferrajamento_ferrador` varchar(80) DEFAULT NULL,
  `ferrajamento_animal` varchar(80) DEFAULT NULL,
  `ferrajamento_valor` float DEFAULT NULL,
  `ferrajamento_descricao` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ferrajamento`
--

INSERT INTO `ferrajamento` (`ferrajamento_id`, `ferrajamento_inicio`, `ferrajamento_termino`, `ferrajamento_ferrador`, `ferrajamento_animal`, `ferrajamento_valor`, `ferrajamento_descricao`) VALUES
(1, '2019-05-27', '2019-05-28', 'Ivan Correia', 'MR CHIC DUNT IT', 120, 'Ferrajamento Normal '),
(5, '2019-06-01', '2019-06-01', 'Ivan Correia', 'CAPTAIN COUNTRY', 120, 'dificuldade de ferrar as maos cascos muito\nquebrado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

CREATE TABLE `log` (
  `log_id` int(11) NOT NULL,
  `log_acao` varchar(20) DEFAULT NULL,
  `log_entidade` varchar(80) DEFAULT NULL,
  `log_usuario` varchar(45) DEFAULT NULL,
  `log_time` varchar(45) DEFAULT NULL,
  `log_how` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `log`
--

INSERT INTO `log` (`log_id`, `log_acao`, `log_entidade`, `log_usuario`, `log_time`, `log_how`) VALUES
(10, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 11:10:48', NULL),
(11, 'CRIOU', 'ANIMAL', 'matheus', '2019-06-06 11:11:08', 'a'),
(12, 'ALTEROU', 'ANIMAL', 'matheus', '2019-06-06 11:11:22', 'd'),
(13, 'EXCLUIU', 'ANIMAL', 'matheus', '2019-06-06 11:11:34', 'd'),
(14, 'CADASTROU', 'TREINAMENTO', 'matheus', '2019-06-06 11:11:51', 'a'),
(15, 'ALTEROU', 'TREINAMENTO', 'matheus', '2019-06-06 11:12:08', 'ae'),
(16, 'EXCLUIU', 'TREINAMENTO', 'matheus', '2019-06-06 11:12:21', 'a'),
(17, 'CADASTROU', 'FENO', 'matheus', '2019-06-06 11:12:47', '7'),
(18, 'ALTEROU', 'FENO', 'matheus', '2019-06-06 11:13:15', '7'),
(19, 'EXCLUIU', 'FENO', 'matheus', '2019-06-06 11:13:27', '7'),
(20, 'CADASTROU', 'RACAO', 'matheus', '2019-06-06 11:15:37', '4'),
(21, 'ALTEROU', 'RACAO', 'matheus', '2019-06-06 11:15:56', '4'),
(22, 'EXCLUIU', 'RACAO', 'matheus', '2019-06-06 11:16:08', '4'),
(23, 'ENTROU', 'SISTEMA', 'maikon', '2019-06-06 11:18:12', NULL),
(24, 'ENTROU', 'SISTEMA', 'nicole', '2019-06-06 11:18:31', NULL),
(25, 'CADASTROU', 'SERRAGEM', 'nicole', '2019-06-06 11:18:51', '6'),
(26, 'ALTERAR', 'SERRAGEM', 'nicole', '2019-06-06 11:19:06', '6'),
(27, 'EXCLUIU', 'SERRAGEM', 'nicole', '2019-06-06 11:19:18', '6'),
(28, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 11:30:27', NULL),
(29, 'CRIOU', 'VETERINARIO', 'matheus', '2019-06-06 11:30:52', 'a'),
(30, 'ALTEROU', 'VETERINARIO', 'matheus', '2019-06-06 11:31:07', 'a'),
(31, 'EXCLUIU', 'VETERINARIO', 'matheus', '2019-06-06 11:31:33', 'a'),
(32, 'CADASTROU', 'PASTO', 'matheus', '2019-06-06 11:31:56', '15'),
(33, 'ALTEROU', 'PASTO', 'matheus', '2019-06-06 11:32:10', '15'),
(34, 'EXCLUIU', 'PASTO', 'matheus', '2019-06-06 11:32:20', '15'),
(35, 'CADASTROU', 'FERRAJAMENTO', 'matheus', '2019-06-06 11:34:34', '4'),
(36, 'ALTEROU', 'FERRAJAMENTO', 'matheus', '2019-06-06 11:34:46', '4'),
(37, 'EXCLUIU', 'FERRAJAMENTO', 'matheus', '2019-06-06 11:34:55', '4'),
(38, 'CRIOU', 'CALENDARIO', 'matheus', '2019-06-06 11:35:11', '11'),
(39, 'ALTEROU', 'CALENDARIO', 'matheus', '2019-06-06 11:35:23', '11'),
(40, 'ALTEROU', 'CALENDARIO', 'matheus', '2019-06-06 11:36:04', '11'),
(41, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 15:38:15', NULL),
(42, 'CRIOU', 'ANIMAL', 'matheus', '2019-06-06 15:38:39', 'a'),
(43, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 15:59:28', NULL),
(44, 'EXCLUIU', 'TREINAMENTO', 'matheus', '2019-06-06 16:00:06', 'ttt'),
(45, 'ALTEROU', 'TREINAMENTO', 'matheus', '2019-06-06 16:00:20', 'dddd'),
(46, 'ALTEROU', 'TREINAMENTO', 'matheus', '2019-06-06 16:00:29', 'CT Marcelo Moreira'),
(47, 'ALTEROU', 'TREINAMENTO', 'matheus', '2019-06-06 16:01:02', 'c'),
(48, 'ALTEROU', 'TREINAMENTO', 'matheus', '2019-06-06 16:01:16', 'dddd'),
(49, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 16:23:47', NULL),
(50, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 16:44:10', NULL),
(51, 'ALTEROU', 'USUARIO', 'matheus', '2019-06-06 16:44:34', 'maikon'),
(52, 'EXCLUIU', 'USUARIO', 'matheus', '2019-06-06 16:44:40', 'c'),
(53, 'ALTEROU', 'USUARIO', 'matheus', '2019-06-06 16:44:57', 'matheus'),
(54, 'EXCLUIU', 'CALENDARIO', 'matheus', '2019-06-06 16:45:30', '10'),
(55, 'EXCLUIU', 'CALENDARIO', 'matheus', '2019-06-06 16:45:35', '11'),
(56, 'CRIOU', 'CALENDARIO', 'matheus', '2019-06-06 16:47:11', '12'),
(57, 'EXCLUIU', 'ANIMAL', 'matheus', '2019-06-06 16:47:49', 'a'),
(58, 'EXCLUIU', 'TREINAMENTO', 'matheus', '2019-06-06 16:48:02', 'c'),
(59, 'EXCLUIU', 'TREINAMENTO', 'matheus', '2019-06-06 16:48:05', 'x'),
(60, 'EXCLUIU', 'TREINAMENTO', 'matheus', '2019-06-06 16:48:09', 'dddd'),
(61, 'ALTEROU', 'TREINAMENTO', 'matheus', '2019-06-06 16:48:16', 'Buddy Chic Son'),
(62, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 16:53:38', NULL),
(63, 'CADASTROU', 'TREINAMENTO', 'matheus', '2019-06-06 16:53:56', 'hhhhahaha'),
(64, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 16:55:04', NULL),
(65, 'CADASTROU', 'TREINAMENTO', 'matheus', '2019-06-06 16:55:28', 'kkkkk'),
(66, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 17:04:10', NULL),
(67, 'CADASTROU', 'TREINAMENTO', 'matheus', '2019-06-06 17:05:29', 'BELL WHIZ  '),
(68, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 17:06:29', NULL),
(69, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 17:09:24', NULL),
(70, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 17:10:38', NULL),
(71, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 17:24:47', NULL),
(72, 'EXCLUIU', 'TREINAMENTO', 'matheus', '2019-06-06 17:26:13', 'a'),
(73, 'EXCLUIU', 'TREINAMENTO', 'matheus', '2019-06-06 17:26:18', 'k'),
(74, 'EXCLUIU', 'TREINAMENTO', 'matheus', '2019-06-06 17:26:23', 's'),
(75, 'CADASTROU', 'TREINAMENTO', 'matheus', '2019-06-06 17:27:39', 'CAPTAIN COUNTRY'),
(76, 'EXCLUIU', 'VETERINARIO', 'matheus', '2019-06-06 17:27:53', 'c'),
(77, 'EXCLUIU', 'VETERINARIO', 'matheus', '2019-06-06 17:27:58', 'm'),
(78, 'CRIOU', 'VETERINARIO', 'matheus', '2019-06-06 17:32:08', 'CAPTAIN COUNTRY'),
(79, 'ALTEROU', 'VETERINARIO', 'matheus', '2019-06-06 17:32:18', 'CAPTAIN COUNTRY'),
(80, 'EXCLUIU', 'FERRAJAMENTO', 'matheus', '2019-06-06 17:34:18', '3'),
(81, 'EXCLUIU', 'FERRAJAMENTO', 'matheus', '2019-06-06 17:34:21', '2'),
(82, 'CADASTROU', 'FERRAJAMENTO', 'matheus', '2019-06-06 17:36:07', '5'),
(83, 'EXCLUIU', 'SERRAGEM', 'matheus', '2019-06-06 17:47:17', '5'),
(84, 'EXCLUIU', 'SERRAGEM', 'matheus', '2019-06-06 17:47:20', '4'),
(85, 'EXCLUIU', 'SERRAGEM', 'matheus', '2019-06-06 17:47:25', '3'),
(86, 'EXCLUIU', 'RACAO', 'matheus', '2019-06-06 17:47:31', '3'),
(87, 'EXCLUIU', 'RACAO', 'matheus', '2019-06-06 17:47:35', '2'),
(88, 'EXCLUIU', 'FENO', 'matheus', '2019-06-06 17:47:41', '6'),
(89, 'EXCLUIU', 'FENO', 'matheus', '2019-06-06 17:47:45', '5'),
(90, 'EXCLUIU', 'FENO', 'matheus', '2019-06-06 17:47:50', '4'),
(91, 'EXCLUIU', 'FENO', 'matheus', '2019-06-06 17:47:53', '3'),
(92, 'EXCLUIU', 'FENO', 'matheus', '2019-06-06 17:47:57', '2'),
(93, 'EXCLUIU', 'PASTO', 'matheus', '2019-06-06 17:48:45', '14'),
(94, 'EXCLUIU', 'PASTO', 'matheus', '2019-06-06 17:48:49', '13'),
(95, 'CADASTROU', 'PASTO', 'matheus', '2019-06-06 17:49:24', '16'),
(96, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 17:54:26', NULL),
(97, 'EXCLUIU', 'FUNCIONARIO', 'matheus', '2019-06-06 17:54:43', 'e'),
(98, 'EXCLUIU', 'FUNCIONARIO', 'matheus', '2019-06-06 17:54:47', 'c'),
(99, 'EXCLUIU', 'FUNCIONARIO', 'matheus', '2019-06-06 17:54:53', 'z'),
(100, 'ALTEROU', 'FUNCIONARIO', 'matheus', '2019-06-06 17:55:09', 'Matheus'),
(101, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 18:20:02', NULL),
(102, 'ENTROU', 'SISTEMA', 'nicole', '2019-06-06 18:20:16', NULL),
(103, 'ENTROU', 'SISTEMA', 'maikon', '2019-06-06 18:20:29', NULL),
(104, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 18:20:42', NULL),
(105, 'CADASTROU', 'USUARIO', 'matheus', '2019-06-06 18:21:16', 'Adm'),
(106, 'ALTEROU', 'USUARIO', 'matheus', '2019-06-06 18:21:24', 'Adm'),
(107, 'ENTROU', 'SISTEMA', 'adm', '2019-06-06 18:21:37', NULL),
(108, 'CADASTROU', 'USUARIO', 'Diego', '2019-06-06 18:22:11', 'Diego'),
(109, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 18:22:37', NULL),
(110, 'CADASTROU', 'USUARIO', 'teste', '2019-06-06 18:24:53', 'teste'),
(111, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 18:26:25', NULL),
(112, 'CADASTROU', 'USUARIO', 'marcos', '2019-06-06 18:28:56', 'marcos'),
(113, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 18:30:04', NULL),
(114, 'EXCLUIU', 'USUARIO', 'matheus', '2019-06-06 18:30:15', 'marcos'),
(115, 'EXCLUIU', 'USUARIO', 'matheus', '2019-06-06 18:30:21', 'teste'),
(116, 'EXCLUIU', 'USUARIO', 'matheus', '2019-06-06 18:30:28', 'Diego'),
(117, 'CADASTROU', 'USUARIO', 'thiago', '2019-06-06 18:30:54', 'thiago'),
(118, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 18:31:04', NULL),
(119, 'ALTEROU', 'USUARIO', 'matheus', '2019-06-06 18:31:42', 'thiago'),
(120, 'ENTROU', 'SISTEMA', 'thiago', '2019-06-06 18:31:56', NULL),
(121, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 18:58:57', NULL),
(122, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 19:06:52', NULL),
(123, 'ALTEROU', 'USUARIO', 'matheus', '2019-06-06 19:07:22', 'matheus'),
(124, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 19:26:03', NULL),
(125, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 20:27:44', NULL),
(126, 'CRIOU', 'ANIMAL', 'matheus', '2019-06-06 20:29:19', 'pe de pano'),
(127, 'ALTEROU', 'ANIMAL', 'matheus', '2019-06-06 20:29:54', 'pe de pano'),
(128, 'ALTEROU', 'ANIMAL', 'matheus', '2019-06-06 20:30:19', 'pe de pano'),
(129, 'ENTROU', 'SISTEMA', 'matheus', '2019-06-06 20:33:05', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `manutencao`
--

CREATE TABLE `manutencao` (
  `manutencao_id` int(11) NOT NULL,
  `manutencao_nome` varchar(80) DEFAULT NULL,
  `manutencao_salario` float DEFAULT NULL,
  `manutencao_funcao` varchar(500) DEFAULT NULL,
  `manutencao_setor` int(11) DEFAULT NULL,
  `manutencao_anotacao` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `manutencao`
--

INSERT INTO `manutencao` (`manutencao_id`, `manutencao_nome`, `manutencao_salario`, `manutencao_funcao`, `manutencao_setor`, `manutencao_anotacao`) VALUES
(5, 'Caio Henrique Cerri Romano', 1500, 'Limpeza das baias,\nAlimentação dos cavalos', 1, 'Rodara a potra de leilao 1h em trote elevado'),
(6, 'Matheus', 800, 'Sempre que possivel selar cavalos', 1, 'Rodar o Buddy chic son');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pastagem`
--

CREATE TABLE `pastagem` (
  `pastagem_id` int(11) NOT NULL,
  `pastagem_numero` int(11) DEFAULT NULL,
  `pastagem_quantidade` int(11) DEFAULT NULL,
  `pastagem_qualidade` int(11) DEFAULT NULL,
  `pastagem_anotacao` varchar(500) DEFAULT NULL,
  `pastagem_data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pastagem`
--

INSERT INTO `pastagem` (`pastagem_id`, `pastagem_numero`, `pastagem_quantidade`, `pastagem_qualidade`, `pastagem_anotacao`, `pastagem_data`) VALUES
(12, 1, 8, 2, 'foi passado abubo dia 22/05/2019', '2019-05-26'),
(16, 2, 5, 3, 'Tropa de Ranch Sorting ', '2019-06-06');

-- --------------------------------------------------------

--
-- Estrutura da tabela `racao`
--

CREATE TABLE `racao` (
  `racao_id` int(11) NOT NULL,
  `racao_compra` date DEFAULT NULL,
  `racao_duracao` date DEFAULT NULL,
  `racao_fornecedor` varchar(80) DEFAULT NULL,
  `racao_quantidade` int(11) DEFAULT NULL,
  `racao_valor` float DEFAULT NULL,
  `racao_descricao` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `racao`
--

INSERT INTO `racao` (`racao_id`, `racao_compra`, `racao_duracao`, `racao_fornecedor`, `racao_quantidade`, `racao_valor`, `racao_descricao`) VALUES
(1, '2019-05-30', '2019-05-31', 'Agrogiro', 50, 2100, 'teste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `serragem`
--

CREATE TABLE `serragem` (
  `serragem_id` int(11) NOT NULL,
  `serragem_compra` date DEFAULT NULL,
  `serragem_tipo` varchar(80) DEFAULT NULL,
  `serragem_fornecedor` varchar(80) DEFAULT NULL,
  `serragem_metros` float DEFAULT NULL,
  `serragem_baias` int(11) DEFAULT NULL,
  `serragem_duracao` date DEFAULT NULL,
  `serragem_valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `serragem`
--

INSERT INTO `serragem` (`serragem_id`, `serragem_compra`, `serragem_tipo`, `serragem_fornecedor`, `serragem_metros`, `serragem_baias`, `serragem_duracao`, `serragem_valor`) VALUES
(2, '2019-05-28', 'granulada', 'José Oliveira', 45, 16, '2019-06-28', 800);

-- --------------------------------------------------------

--
-- Estrutura da tabela `treinamento`
--

CREATE TABLE `treinamento` (
  `treinamento_id` int(11) NOT NULL,
  `treinamento_treinador` varchar(80) DEFAULT NULL,
  `treinamento_animal` varchar(80) DEFAULT NULL,
  `treinamento_inicio` date DEFAULT NULL,
  `treinamento_termino` date DEFAULT NULL,
  `treinamento_modalidade` varchar(80) DEFAULT NULL,
  `treinamento_valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `treinamento`
--

INSERT INTO `treinamento` (`treinamento_id`, `treinamento_treinador`, `treinamento_animal`, `treinamento_inicio`, `treinamento_termino`, `treinamento_modalidade`, `treinamento_valor`) VALUES
(9, 'CT Marcelo Moreira', 'Buddy Chic Son', '2018-10-27', '2022-05-27', 'REDEAS', 1200),
(19, 'CT Marcelo Moreira', 'CAPTAIN COUNTRY', '2016-06-01', '2023-06-01', 'Redeas', 1200);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `usu_id` int(11) NOT NULL,
  `usu_login` varchar(50) DEFAULT NULL,
  `usu_senha` varchar(50) DEFAULT NULL,
  `usu_tipo` int(11) DEFAULT NULL,
  `usuario_status` int(11) DEFAULT NULL,
  `usuario_notificacao` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`usu_id`, `usu_login`, `usu_senha`, `usu_tipo`, `usuario_status`, `usuario_notificacao`) VALUES
(4, 'matheus', '698dc19d489c4e4db73e28a713eab07b', 1, 1, 'Diego esqueceu a senha'),
(5, 'maikon', '698dc19d489c4e4db73e28a713eab07b', 3, 1, ''),
(6, 'nicole', '698dc19d489c4e4db73e28a713eab07b', 0, 1, ''),
(8, 'Adm', '698dc19d489c4e4db73e28a713eab07b', 2, 1, ''),
(12, 'thiago', '698dc19d489c4e4db73e28a713eab07b', 0, 1, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `veterinario`
--

CREATE TABLE `veterinario` (
  `veterinario_id` int(11) NOT NULL,
  `veterinario_animal` varchar(80) DEFAULT NULL,
  `veterinario_nome` varchar(80) DEFAULT NULL,
  `veterinario_inicio` date DEFAULT NULL,
  `veterinario_termino` date DEFAULT NULL,
  `veterinario_diagnostico` varchar(500) DEFAULT NULL,
  `veterinario_tratamento` varchar(500) DEFAULT NULL,
  `veterinario_valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `veterinario`
--

INSERT INTO `veterinario` (`veterinario_id`, `veterinario_animal`, `veterinario_nome`, `veterinario_inicio`, `veterinario_termino`, `veterinario_diagnostico`, `veterinario_tratamento`, `veterinario_valor`) VALUES
(2, 'survivor', 'Equino Center', '2019-05-27', '2019-05-31', 'leisão na navicular', 'gelo nas mãos 1 vez ao dia durante 30min\ndurante 10 dais.', 500),
(6, 'CAPTAIN COUNTRY', 'Equine Center', '2019-01-01', '2019-06-01', 'Nervo Patelar direito', 'Repouso por 6 meses e aplicação de Condrontom\n10ml 1 vez ao dia por 3 dias.', 2000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_cliente_usuario`
-- (See below for the actual view)
--
CREATE TABLE `vw_cliente_usuario` (
`NomeCliente` varchar(45)
,`NomeUsuario` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_cliente_usuario`
--
DROP TABLE IF EXISTS `vw_cliente_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_cliente_usuario`  AS  select `cliente`.`cliente_none` AS `NomeCliente`,`usuario`.`usu_login` AS `NomeUsuario` from (`cliente` join `usuario` on((`cliente`.`usu_id` = `usuario`.`usu_id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`animal_id`);

--
-- Indexes for table `calendario`
--
ALTER TABLE `calendario`
  ADD PRIMARY KEY (`calendario_id`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_cpf`),
  ADD UNIQUE KEY `cliente_cpf_UNIQUE` (`cliente_cpf`),
  ADD KEY `usu_id` (`usu_id`);

--
-- Indexes for table `feno`
--
ALTER TABLE `feno`
  ADD PRIMARY KEY (`feno_id`);

--
-- Indexes for table `ferrajamento`
--
ALTER TABLE `ferrajamento`
  ADD PRIMARY KEY (`ferrajamento_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `manutencao`
--
ALTER TABLE `manutencao`
  ADD PRIMARY KEY (`manutencao_id`);

--
-- Indexes for table `pastagem`
--
ALTER TABLE `pastagem`
  ADD PRIMARY KEY (`pastagem_id`);

--
-- Indexes for table `racao`
--
ALTER TABLE `racao`
  ADD PRIMARY KEY (`racao_id`);

--
-- Indexes for table `serragem`
--
ALTER TABLE `serragem`
  ADD PRIMARY KEY (`serragem_id`);

--
-- Indexes for table `treinamento`
--
ALTER TABLE `treinamento`
  ADD PRIMARY KEY (`treinamento_id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usu_id`);

--
-- Indexes for table `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`veterinario_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `animal`
--
ALTER TABLE `animal`
  MODIFY `animal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `calendario`
--
ALTER TABLE `calendario`
  MODIFY `calendario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `feno`
--
ALTER TABLE `feno`
  MODIFY `feno_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ferrajamento`
--
ALTER TABLE `ferrajamento`
  MODIFY `ferrajamento_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `manutencao`
--
ALTER TABLE `manutencao`
  MODIFY `manutencao_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pastagem`
--
ALTER TABLE `pastagem`
  MODIFY `pastagem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `racao`
--
ALTER TABLE `racao`
  MODIFY `racao_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `serragem`
--
ALTER TABLE `serragem`
  MODIFY `serragem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `treinamento`
--
ALTER TABLE `treinamento`
  MODIFY `treinamento_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `veterinario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`usu_id`) REFERENCES `usuario` (`usu_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
