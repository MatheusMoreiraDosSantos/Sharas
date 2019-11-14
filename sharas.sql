-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 14-Nov-2019 às 18:09
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.3.4

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
CREATE DATABASE IF NOT EXISTS `sharas` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sharas`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agenda`
--

CREATE TABLE IF NOT EXISTS `agenda` (
  `agenda_id` int(11) NOT NULL AUTO_INCREMENT,
  `agenda_texto` varchar(120) DEFAULT NULL,
  `agenda_usuario` int(11) DEFAULT NULL,
  `agenda_data` date NOT NULL,
  `agenda_agend` int(11) NOT NULL,
  PRIMARY KEY (`agenda_id`),
  KEY `agenda_usuario` (`agenda_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `baia`
--

CREATE TABLE IF NOT EXISTS `baia` (
  `baia_id` int(11) NOT NULL AUTO_INCREMENT,
  `baia_tamanho` int(11) DEFAULT NULL,
  PRIMARY KEY (`baia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `calendario`
--

CREATE TABLE IF NOT EXISTS `calendario` (
  `calendario_id` int(11) NOT NULL AUTO_INCREMENT,
  `calendario_data` varchar(45) NOT NULL,
  `calendario_desc` text,
  PRIMARY KEY (`calendario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
  `cargo_id` int(11) NOT NULL,
  `cargo_nome` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`cargo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`cargo_id`, `cargo_nome`) VALUES
(1, 'Caixa'),
(2, 'Veterinario'),
(3, 'Ferreiro'),
(4, 'Criador'),
(5, 'RH'),
(6, 'Administrador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho`
--

CREATE TABLE IF NOT EXISTS `carrinho` (
  `carrinhoid` int(11) NOT NULL,
  `servico_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`carrinhoid`),
  KEY `servico_id` (`servico_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `clienteid` int(11) NOT NULL AUTO_INCREMENT,
  `pessoa_id` int(11) DEFAULT NULL,
  `cliente_deb` float DEFAULT NULL,
  PRIMARY KEY (`clienteid`),
  KEY `pessoa_id` (`pessoa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`clienteid`, `pessoa_id`, `cliente_deb`) VALUES
(1, 18, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contrato`
--

CREATE TABLE IF NOT EXISTS `contrato` (
  `contrato_id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `contrato_valor` float DEFAULT NULL,
  `contrato_data` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`contrato_id`),
  KEY `cliente_id` (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE IF NOT EXISTS `endereco` (
  `endereco_id` int(11) NOT NULL AUTO_INCREMENT,
  `endereco_numero` varchar(45) NOT NULL,
  `endereco_cep` varchar(11) NOT NULL,
  `endereco_rua` varchar(80) NOT NULL,
  `endereco_bairro` varchar(80) NOT NULL,
  `endereco_cidade` varchar(80) NOT NULL,
  `endereco_estado` varchar(80) NOT NULL,
  PRIMARY KEY (`endereco_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`endereco_id`, `endereco_numero`, `endereco_cep`, `endereco_rua`, `endereco_bairro`, `endereco_cidade`, `endereco_estado`) VALUES
(1, '1100', '18703480', 'braz camilo', 'brabancia', 'avare', 'SP');

-- --------------------------------------------------------

--
-- Stand-in structure for view `idenddereco`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `idenddereco` (
`id` int(11)
,`c` varchar(11)
,`n` varchar(45)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_contrato`
--

CREATE TABLE IF NOT EXISTS `item_contrato` (
  `servico_id` int(11) DEFAULT NULL,
  `contrato_id` int(11) DEFAULT NULL,
  KEY `contrato_id` (`contrato_id`),
  KEY `servico_id` (`servico_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `log_id` int(11) NOT NULL,
  `log_acao` varchar(45) NOT NULL,
  `log_entidade` varchar(45) NOT NULL,
  `log_usuario` varchar(45) NOT NULL,
  `log_time` time NOT NULL,
  `log_row` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE IF NOT EXISTS `pessoa` (
  `pessoa_id` int(11) NOT NULL AUTO_INCREMENT,
  `pessoa_ind` varchar(2) NOT NULL,
  `pessoa_cpfcnpj` varchar(14) NOT NULL,
  `pessoa_nome` varchar(90) NOT NULL,
  `pessoa_email` varchar(45) DEFAULT NULL,
  `pesoa_cargo` int(1) DEFAULT NULL,
  `pessoa_endereco` int(11) DEFAULT NULL,
  PRIMARY KEY (`pessoa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`pessoa_id`, `pessoa_ind`, `pessoa_cpfcnpj`, `pessoa_nome`, `pessoa_email`, `pesoa_cargo`, `pessoa_endereco`) VALUES
(18, 'PF', '43762393800', 'Maikon cristino ', 'maikonmoren@gmail.com', 2, 1),
(19, 'PF', '43762393800', 'Maikon', 'maikon.@maikon', 1, NULL),
(20, 'PF', '19380128010', 'Maikon Cristino', 'maikon.@maikon', 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `rh`
--

CREATE TABLE IF NOT EXISTS `rh` (
  `rh_id` int(11) NOT NULL AUTO_INCREMENT,
  `rh_inicio` date NOT NULL,
  `rh_termino` date DEFAULT NULL,
  `pessoa_pessoa_id` int(11) NOT NULL,
  `cargo_cargo_id` int(11) NOT NULL,
  PRIMARY KEY (`rh_id`),
  KEY `pessoa_pessoa_id` (`pessoa_pessoa_id`),
  KEY `cargo_cargo_id` (`cargo_cargo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `rh`
--

INSERT INTO `rh` (`rh_id`, `rh_inicio`, `rh_termino`, `pessoa_pessoa_id`, `cargo_cargo_id`) VALUES
(1, '2019-11-07', NULL, 20, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE IF NOT EXISTS `servico` (
  `servico_id` int(11) NOT NULL,
  `servico_tipo` int(11) DEFAULT NULL,
  `servico_valor` float DEFAULT NULL,
  `servico_nome` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`servico_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `tab_cliente`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `tab_cliente` (
`Codigo` int(11)
,`Nome` varchar(90)
,`CPF` varchar(14)
,`Debito` float
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tab_usu`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `tab_usu` (
`Código` int(11)
,`Nome` varchar(90)
,`Login` varchar(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tab_usucad`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `tab_usucad` (
`codigo` int(11)
,`nome` varchar(90)
,`Cpf` varchar(14)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tab_usuncad`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `tab_usuncad` (
`codigo` int(11)
,`nome` varchar(90)
,`Cpf` varchar(14)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

CREATE TABLE IF NOT EXISTS `telefone` (
  `telefone_id` int(11) NOT NULL,
  `telefone_num` varchar(15) NOT NULL,
  `telefone_tipo` int(11) NOT NULL,
  `pessoa_pessoa_id` int(11) NOT NULL,
  KEY `pessoa_pessoa_id` (`pessoa_pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_senha` varchar(80) NOT NULL,
  `usuario_status` int(11) NOT NULL,
  `usuario_notificacao` varchar(120) DEFAULT NULL,
  `pessoa_pessoa_id` int(11) NOT NULL,
  `usuario_login` varchar(45) NOT NULL,
  PRIMARY KEY (`usuario_id`),
  KEY `pessoa_pessoa_id` (`pessoa_pessoa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `usuario_senha`, `usuario_status`, `usuario_notificacao`, `pessoa_pessoa_id`, `usuario_login`) VALUES
(3, 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, 19, 'maikon.rosa');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_agenda2`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `vw_agenda2` (
`Textoid` int(11)
,`Data` varchar(10)
,`Texto` varchar(120)
,`ID` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_cli`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `vw_cli` (
`id` int(11)
,`Nome` varchar(90)
,`Cpf` varchar(14)
,`Email` varchar(45)
,`cep` varchar(11)
,`rua` varchar(80)
,`numero` varchar(45)
,`bairro` varchar(80)
,`estado` varchar(80)
,`cidade` varchar(80)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_funcionario`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `vw_funcionario` (
`Código` int(11)
,`Nome` varchar(90)
,`CPF` varchar(14)
,`Cargo` varchar(40)
,`Contratação` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_login`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `vw_login` (
`id` int(11)
,`senha` varchar(80)
,`login` varchar(45)
,`cg` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_pessoa_usuario`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `vw_pessoa_usuario` (
`UsuarioID` int(11)
,`CPF` varchar(14)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_servicos`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `vw_servicos` (
`Código` int(11)
,`Categoria` int(11)
,`Nome` varchar(40)
,`Valor` varchar(49)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_tab_atualiza_usu`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `vw_tab_atualiza_usu` (
`Nome` varchar(90)
,`Login` varchar(45)
,`CPF` varchar(14)
,`Email` varchar(45)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_tab_servico`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `vw_tab_servico` (
`Código` int(11)
,`Nome` varchar(40)
,`Valor` float
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_telefone`
-- (See below for the actual view)
--
CREATE TABLE IF NOT EXISTS `vw_telefone` (
`Telefone` varchar(15)
,`Pessoaid` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `idenddereco`
--
DROP TABLE IF EXISTS `idenddereco`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `idenddereco`  AS  select `endereco`.`endereco_id` AS `id`,`endereco`.`endereco_cep` AS `c`,`endereco`.`endereco_numero` AS `n` from `endereco` ;

-- --------------------------------------------------------

--
-- Structure for view `tab_cliente`
--
DROP TABLE IF EXISTS `tab_cliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tab_cliente`  AS  select `c`.`clienteid` AS `Codigo`,`p`.`pessoa_nome` AS `Nome`,`p`.`pessoa_cpfcnpj` AS `CPF`,`c`.`cliente_deb` AS `Debito` from (`pessoa` `p` join `cliente` `c`) where ((`p`.`pesoa_cargo` = 2) and (`p`.`pessoa_id` = `c`.`pessoa_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `tab_usu`
--
DROP TABLE IF EXISTS `tab_usu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tab_usu`  AS  select `pessoa`.`pessoa_id` AS `Código`,`pessoa`.`pessoa_nome` AS `Nome`,(case when `pessoa`.`pessoa_id` in (select `p`.`pessoa_id` from (`pessoa` `p` join `usuario` `u`) where (`p`.`pessoa_id` = `u`.`pessoa_pessoa_id`)) then 'Cadastrado' when (not(`pessoa`.`pessoa_id` in (select `p`.`pessoa_id` from (`pessoa` `p` join `usuario` `u`) where (`p`.`pessoa_id` = `u`.`pessoa_pessoa_id`)))) then 'Sem Usuario' end) AS `Login` from `pessoa` where (`pessoa`.`pesoa_cargo` = 1) ;

-- --------------------------------------------------------

--
-- Structure for view `tab_usucad`
--
DROP TABLE IF EXISTS `tab_usucad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tab_usucad`  AS  select `p`.`pessoa_id` AS `codigo`,`p`.`pessoa_nome` AS `nome`,`p`.`pessoa_cpfcnpj` AS `Cpf` from (`pessoa` `p` join `usuario` `u`) where ((`p`.`pessoa_id` = `u`.`pessoa_pessoa_id`) and (`p`.`pesoa_cargo` = 1)) ;

-- --------------------------------------------------------

--
-- Structure for view `tab_usuncad`
--
DROP TABLE IF EXISTS `tab_usuncad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tab_usuncad`  AS  select `p`.`pessoa_id` AS `codigo`,`p`.`pessoa_nome` AS `nome`,`p`.`pessoa_cpfcnpj` AS `Cpf` from (`pessoa` `p` join `usuario` `u`) where ((`p`.`pessoa_id` <> `u`.`pessoa_pessoa_id`) and (`p`.`pesoa_cargo` = 1)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_agenda2`
--
DROP TABLE IF EXISTS `vw_agenda2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_agenda2`  AS  select `agenda`.`agenda_id` AS `Textoid`,date_format(`agenda`.`agenda_data`,'%d/%m/%Y') AS `Data`,`agenda`.`agenda_texto` AS `Texto`,`agenda`.`agenda_usuario` AS `ID` from `agenda` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_cli`
--
DROP TABLE IF EXISTS `vw_cli`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_cli`  AS  select `c`.`clienteid` AS `id`,`p`.`pessoa_nome` AS `Nome`,`p`.`pessoa_cpfcnpj` AS `Cpf`,`p`.`pessoa_email` AS `Email`,`e`.`endereco_cep` AS `cep`,`e`.`endereco_rua` AS `rua`,`e`.`endereco_numero` AS `numero`,`e`.`endereco_bairro` AS `bairro`,`e`.`endereco_estado` AS `estado`,`e`.`endereco_cidade` AS `cidade` from ((`pessoa` `p` join `endereco` `e`) join `cliente` `c`) where ((`c`.`pessoa_id` = `p`.`pessoa_id`) and (`p`.`pessoa_endereco` = `e`.`endereco_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_funcionario`
--
DROP TABLE IF EXISTS `vw_funcionario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_funcionario`  AS  select `rh`.`rh_id` AS `Código`,`pessoa`.`pessoa_nome` AS `Nome`,`pessoa`.`pessoa_cpfcnpj` AS `CPF`,`cargo`.`cargo_nome` AS `Cargo`,`rh`.`rh_inicio` AS `Contratação` from ((`pessoa` join `rh`) join `cargo`) where ((`cargo`.`cargo_id` = `rh`.`cargo_cargo_id`) and (`pessoa`.`pessoa_id` = `rh`.`pessoa_pessoa_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_login`
--
DROP TABLE IF EXISTS `vw_login`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_login`  AS  select `u`.`usuario_id` AS `id`,`u`.`usuario_senha` AS `senha`,`u`.`usuario_login` AS `login`,`f`.`cargo_cargo_id` AS `cg` from ((`usuario` `u` join `rh` `f`) join `pessoa` `p`) where (`u`.`pessoa_pessoa_id` = `p`.`pessoa_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_pessoa_usuario`
--
DROP TABLE IF EXISTS `vw_pessoa_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_pessoa_usuario`  AS  select `u`.`usuario_id` AS `UsuarioID`,`p`.`pessoa_cpfcnpj` AS `CPF` from (`usuario` `u` join `pessoa` `p`) where (`u`.`pessoa_pessoa_id` = `p`.`pessoa_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_servicos`
--
DROP TABLE IF EXISTS `vw_servicos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_servicos`  AS  select `servico`.`servico_id` AS `Código`,`servico`.`servico_tipo` AS `Categoria`,`servico`.`servico_nome` AS `Nome`,format(`servico`.`servico_valor`,2,'de_DE') AS `Valor` from `servico` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_tab_atualiza_usu`
--
DROP TABLE IF EXISTS `vw_tab_atualiza_usu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_tab_atualiza_usu`  AS  select `p`.`pessoa_nome` AS `Nome`,`u`.`usuario_login` AS `Login`,`p`.`pessoa_cpfcnpj` AS `CPF`,`p`.`pessoa_email` AS `Email` from (`pessoa` `p` join `usuario` `u`) where (`p`.`pessoa_id` = `u`.`pessoa_pessoa_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_tab_servico`
--
DROP TABLE IF EXISTS `vw_tab_servico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_tab_servico`  AS  select `servico`.`servico_id` AS `Código`,`servico`.`servico_nome` AS `Nome`,`servico`.`servico_valor` AS `Valor` from `servico` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_telefone`
--
DROP TABLE IF EXISTS `vw_telefone`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_telefone`  AS  select `telefone`.`telefone_num` AS `Telefone`,`telefone`.`pessoa_pessoa_id` AS `Pessoaid` from `telefone` ;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`agenda_usuario`) REFERENCES `usuario` (`usuario_id`);

--
-- Limitadores para a tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD CONSTRAINT `carrinho_ibfk_1` FOREIGN KEY (`servico_id`) REFERENCES `servico` (`servico_id`);

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`pessoa_id`);

--
-- Limitadores para a tabela `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`clienteid`);

--
-- Limitadores para a tabela `item_contrato`
--
ALTER TABLE `item_contrato`
  ADD CONSTRAINT `item_contrato_ibfk_1` FOREIGN KEY (`contrato_id`) REFERENCES `contrato` (`contrato_id`),
  ADD CONSTRAINT `item_contrato_ibfk_2` FOREIGN KEY (`servico_id`) REFERENCES `servico` (`servico_id`);

--
-- Limitadores para a tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`pessoa_endereco`) REFERENCES `endereco` (`endereco_id`);

--
-- Limitadores para a tabela `rh`
--
ALTER TABLE `rh`
  ADD CONSTRAINT `rh_ibfk_1` FOREIGN KEY (`pessoa_pessoa_id`) REFERENCES `pessoa` (`pessoa_id`),
  ADD CONSTRAINT `rh_ibfk_2` FOREIGN KEY (`cargo_cargo_id`) REFERENCES `cargo` (`cargo_id`);

--
-- Limitadores para a tabela `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`pessoa_pessoa_id`) REFERENCES `pessoa` (`pessoa_id`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`pessoa_pessoa_id`) REFERENCES `pessoa` (`pessoa_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
