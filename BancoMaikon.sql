-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Dez-2019 às 19:01
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sharas`
--

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
-- Estrutura da tabela `animal`
--

CREATE TABLE IF NOT EXISTS `animal` (
  `animal_id` int(11) NOT NULL AUTO_INCREMENT,
  `animal_nome` varchar(100) DEFAULT NULL,
  `animal_registro` varchar(25) DEFAULT NULL,
  `animal_proprietario` int(11) DEFAULT NULL,
  `animal_nasc` date DEFAULT NULL,
  `animal_sexo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`animal_id`),
  KEY `animal_proprietario` (`animal_proprietario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `animal`
--

INSERT INTO `animal` (`animal_id`, `animal_nome`, `animal_registro`, `animal_proprietario`, `animal_nasc`, `animal_sexo`) VALUES
(3, 'tour ', 'wadomdmw', 25, '1998-08-12', 'machofemea'),
(6, 'terete', '8578re5s8', 23, '2019-12-02', 'macho'),
(7, 'terete', '8578re5s8', 23, '2019-12-02', 'macho');

-- --------------------------------------------------------

--
-- Estrutura da tabela `baia`
--

CREATE TABLE IF NOT EXISTS `baia` (
  `baia_id` int(11) NOT NULL AUTO_INCREMENT,
  `baia_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`baia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `baia`
--

INSERT INTO `baia` (`baia_id`, `baia_status`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `calendario`
--

CREATE TABLE IF NOT EXISTS `calendario` (
  `calendario_id` int(11) NOT NULL AUTO_INCREMENT,
  `calendario_data` varchar(45) NOT NULL,
  `calendario_desc` text DEFAULT NULL,
  PRIMARY KEY (`calendario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `calendario`
--

INSERT INTO `calendario` (`calendario_id`, `calendario_data`, `calendario_desc`) VALUES
(1, '2019-11-15', '12345');

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

--
-- Extraindo dados da tabela `carrinho`
--

INSERT INTO `carrinho` (`carrinhoid`, `servico_id`) VALUES
(2, 7),
(1, 8);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`clienteid`, `pessoa_id`, `cliente_deb`) VALUES
(3, 25, 0),
(4, 26, 0),
(5, 27, 100),
(7, 23, 500),
(8, 25, 200),
(9, 24, 500),
(11, 29, 500),
(12, 30, 500);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contrato`
--

CREATE TABLE IF NOT EXISTS `contrato` (
  `contrato_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `animal_id` int(11) DEFAULT NULL,
  `contrato_valor` float DEFAULT NULL,
  `contrato_data` datetime DEFAULT current_timestamp(),
  `contrato_descontoTipo` varchar(3) DEFAULT 'Sem',
  `desconto_Valor` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`contrato_id`),
  KEY `animal_id` (`animal_id`),
  KEY `cliente_id` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `contrato`
--

INSERT INTO `contrato` (`contrato_id`, `cliente_id`, `animal_id`, `contrato_valor`, `contrato_data`, `contrato_descontoTipo`, `desconto_Valor`) VALUES
(5, 8, 3, 1500, '2019-12-02 14:28:01', 'R$ ', 15),
(6, 8, 3, 3000, '2019-12-02 14:28:52', '%', 55),
(7, 8, 3, 1500, '2019-12-02 14:30:14', NULL, 0),
(8, 7, 7, 2300, '2019-12-04 09:59:38', '%', 15);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`endereco_id`, `endereco_numero`, `endereco_cep`, `endereco_rua`, `endereco_bairro`, `endereco_cidade`, `endereco_estado`) VALUES
(1, '1100', '18703480', 'braz camilo', 'brabancia', 'avare', 'SP'),
(7, '12', '18754557', 'parecida do nore', 'dolores da vila', 'tumbrlandia', 'SP'),
(8, '787', '174858', 'brazil novo ', 'bacaiambu', 'avare', 'SP'),
(9, '045', '1744894', 'bharahama', 'reverwas', 'avare', 'SP'),
(10, '044', '1744878', 'bharahama', 'reverwas', 'avare', 'SP'),
(11, '1100', '18757830', 'brazcamilo de souza', 'brabancia ', 'pacaibu', 'SP'),
(12, '154', '18754854', 'charmosa da leste ', 'tupijara', 'paicabu', 'SP');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `idenddereco`
-- (Veja abaixo para a view atual)
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

--
-- Extraindo dados da tabela `item_contrato`
--

INSERT INTO `item_contrato` (`servico_id`, `contrato_id`) VALUES
(4, 5),
(6, 5),
(7, 5),
(4, 6),
(4, 6),
(6, 6),
(6, 6),
(7, 6),
(9, 6),
(3, 7),
(5, 7),
(8, 7),
(4, 8),
(5, 8),
(7, 8),
(7, 8),
(8, 8);

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
-- Estrutura stand-in para vista `n_baia`
-- (Veja abaixo para a view atual)
--
CREATE TABLE IF NOT EXISTS `n_baia` (
`dispo` bigint(21)
,`uso` bigint(21)
,`dani` bigint(21)
);

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
  PRIMARY KEY (`pessoa_id`),
  KEY `pessoa_ibfk_1` (`pessoa_endereco`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`pessoa_id`, `pessoa_ind`, `pessoa_cpfcnpj`, `pessoa_nome`, `pessoa_email`, `pesoa_cargo`, `pessoa_endereco`) VALUES
(19, 'PF', '437.623.938-00', 'Maikon', 'maikon.@maikon', 1, NULL),
(20, 'PF', '193.801.280-10', 'Pedro joao', 'maikon.@maikon', 1, NULL),
(22, 'PF', '717.350.740-55', 'Pedro', 'maikonmoren@gmail.com', 2, 7),
(23, 'PF', '787.986.352-00', 'Andressa', 'andressa@gmail.com', 2, 7),
(24, 'PF', '787.932.520-04', 'Bianca Antunes da silva', 'bianquinha_milGrau@gmail.com', 2, 7),
(25, 'PF', '987.568.214-11', 'Thomas nobutico', 'thominha@gmail.com', 2, 8),
(26, 'PF', '645.564.845-10', 'Jõao pessoa', 'Joao.pessoa@uol.com.br', 2, 9),
(27, 'PF', '645.564.847-74', 'Jõao pessoa', 'Joao.pessoa@uol.com.br', 2, 10),
(28, 'PF', '402.041.220-07', 'Maikon dos santos', 'odsadih.siajosi@ksd', 1, NULL),
(29, 'PF', '839.918.130-76', 'Antonio nogueira ', 'maikon.@gmail.com', 2, 11),
(30, 'PF', '004.084.830-24', 'Jonatam Pereira ', 'joazinhodaleste@gmail.com', 2, 12);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `rh`
--

INSERT INTO `rh` (`rh_id`, `rh_inicio`, `rh_termino`, `pessoa_pessoa_id`, `cargo_cargo_id`) VALUES
(1, '2019-11-07', NULL, 20, 1),
(2, '2019-11-27', NULL, 28, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE IF NOT EXISTS `servico` (
  `servico_id` int(11) NOT NULL AUTO_INCREMENT,
  `servico_tipo` varchar(40) DEFAULT NULL,
  `servico_valor` float DEFAULT NULL,
  `servico_nome` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`servico_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`servico_id`, `servico_tipo`, `servico_valor`, `servico_nome`) VALUES
(1, 'Alojamento ', 687687, 'dwada'),
(3, 'Alojamento ', 700, 'baia luxo'),
(4, 'Alojamento ', 500, 'baia media'),
(5, 'Alojamento ', 300, 'baia econimica'),
(6, 'Treinamento', 500, 'hedeas'),
(7, 'Treinamento', 500, 'barril'),
(8, 'Treinamento', 500, 'laços'),
(9, 'Treinamento', 500, 'corrida'),
(10, 'Cuidados', 150, 'vacina a '),
(11, 'Cuidados', 300, 'vacina b'),
(12, 'Cuidados', 500, 'vacina re'),
(13, 'Cuidados', 300, 'ferradura'),
(14, 'Cuidados', 50, 'banho'),
(15, 'Outros', 1500, 'semem');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `tab_cliente`
-- (Veja abaixo para a view atual)
--
CREATE TABLE IF NOT EXISTS `tab_cliente` (
`Codigo` int(11)
,`Nome` varchar(90)
,`CPF` varchar(14)
,`Debito` float
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `tab_usu`
-- (Veja abaixo para a view atual)
--
CREATE TABLE IF NOT EXISTS `tab_usu` (
`Código` int(11)
,`Nome` varchar(90)
,`Login` varchar(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `tab_usucad`
-- (Veja abaixo para a view atual)
--
CREATE TABLE IF NOT EXISTS `tab_usucad` (
`codigo` int(11)
,`nome` varchar(90)
,`Cpf` varchar(14)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `tab_usuncad`
-- (Veja abaixo para a view atual)
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `usuario_senha`, `usuario_status`, `usuario_notificacao`, `pessoa_pessoa_id`, `usuario_login`) VALUES
(4, '698dc19d489c4e4db73e28a713eab07b', 1, NULL, 23, 'sistema'),
(5, 'e959088c6049f1104c84c9bde5560a13', 1, NULL, 20, 'teste1'),
(6, 'e959088c6049f1104c84c9bde5560a13', 1, NULL, 28, 'teste1');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_agenda2`
-- (Veja abaixo para a view atual)
--
CREATE TABLE IF NOT EXISTS `vw_agenda2` (
`Textoid` int(11)
,`Data` varchar(10)
,`Texto` varchar(120)
,`ID` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_animal`
-- (Veja abaixo para a view atual)
--
CREATE TABLE IF NOT EXISTS `vw_animal` (
`cd_p` varchar(14)
,`Código` int(11)
,`Animal` varchar(100)
,`Registro` varchar(25)
,`Proprietario` varchar(90)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_baias`
-- (Veja abaixo para a view atual)
--
CREATE TABLE IF NOT EXISTS `vw_baias` (
`Local` int(11)
,`Status` varchar(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_carrinho`
-- (Veja abaixo para a view atual)
--
CREATE TABLE IF NOT EXISTS `vw_carrinho` (
`Item` int(11)
,`Serviço` varchar(40)
,`UNI` float
,`Quantidade` bigint(21)
,`Valor` double
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_cli`
-- (Veja abaixo para a view atual)
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
-- Estrutura stand-in para vista `vw_contrato`
-- (Veja abaixo para a view atual)
--
CREATE TABLE IF NOT EXISTS `vw_contrato` (
`Codigo` int(11)
,`Pessoa` varchar(90)
,`Animal` varchar(100)
,`Valor` varchar(15)
,`Desconto` varchar(15)
,`Total` varchar(25)
,`Data` varchar(8)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_funcionario`
-- (Veja abaixo para a view atual)
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
-- Estrutura stand-in para vista `vw_login`
-- (Veja abaixo para a view atual)
--
CREATE TABLE IF NOT EXISTS `vw_login` (
`id` int(11)
,`senha` varchar(80)
,`login` varchar(45)
,`cg` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_pessoa_usuario`
-- (Veja abaixo para a view atual)
--
CREATE TABLE IF NOT EXISTS `vw_pessoa_usuario` (
`UsuarioID` int(11)
,`CPF` varchar(14)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_servicos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE IF NOT EXISTS `vw_servicos` (
`Código` int(11)
,`Categoria` varchar(40)
,`Nome` varchar(40)
,`Valor` varchar(57)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_tab_atualiza_usu`
-- (Veja abaixo para a view atual)
--
CREATE TABLE IF NOT EXISTS `vw_tab_atualiza_usu` (
`Nome` varchar(90)
,`Login` varchar(45)
,`CPF` varchar(14)
,`Email` varchar(45)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_tab_servico`
-- (Veja abaixo para a view atual)
--
CREATE TABLE IF NOT EXISTS `vw_tab_servico` (
`Código` int(11)
,`Nome` varchar(40)
,`Valor` float
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_telefone`
-- (Veja abaixo para a view atual)
--
CREATE TABLE IF NOT EXISTS `vw_telefone` (
`Telefone` varchar(15)
,`Pessoaid` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura para vista `idenddereco`
--
DROP TABLE IF EXISTS `idenddereco`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `idenddereco`  AS  select `endereco`.`endereco_id` AS `id`,`endereco`.`endereco_cep` AS `c`,`endereco`.`endereco_numero` AS `n` from `endereco` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `n_baia`
--
DROP TABLE IF EXISTS `n_baia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `n_baia`  AS  select (select count(`baia`.`baia_id`) from `baia` where `baia`.`baia_status` = 1) AS `dispo`,(select count(`baia`.`baia_id`) from `baia` where `baia`.`baia_status` = 2) AS `uso`,(select count(`baia`.`baia_id`) from `baia` where `baia`.`baia_status` = 3) AS `dani` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `tab_cliente`
--
DROP TABLE IF EXISTS `tab_cliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tab_cliente`  AS  select `c`.`clienteid` AS `Codigo`,`p`.`pessoa_nome` AS `Nome`,`p`.`pessoa_cpfcnpj` AS `CPF`,`c`.`cliente_deb` AS `Debito` from (`pessoa` `p` join `cliente` `c`) where `p`.`pesoa_cargo` = 2 and `p`.`pessoa_id` = `c`.`pessoa_id` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `tab_usu`
--
DROP TABLE IF EXISTS `tab_usu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tab_usu`  AS  select `pessoa`.`pessoa_id` AS `Código`,`pessoa`.`pessoa_nome` AS `Nome`,case when `pessoa`.`pessoa_id` in (select `p`.`pessoa_id` from (`pessoa` `p` join `usuario` `u`) where `p`.`pessoa_id` = `u`.`pessoa_pessoa_id`) then 'Cadastrado' when !(`pessoa`.`pessoa_id` in (select `p`.`pessoa_id` from (`pessoa` `p` join `usuario` `u`) where `p`.`pessoa_id` = `u`.`pessoa_pessoa_id`)) then 'Sem Usuario' end AS `Login` from `pessoa` where `pessoa`.`pesoa_cargo` = 1 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `tab_usucad`
--
DROP TABLE IF EXISTS `tab_usucad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tab_usucad`  AS  select `p`.`pessoa_id` AS `codigo`,`p`.`pessoa_nome` AS `nome`,`p`.`pessoa_cpfcnpj` AS `Cpf` from (`pessoa` `p` join `usuario` `u`) where `p`.`pessoa_id` = `u`.`pessoa_pessoa_id` and `p`.`pesoa_cargo` = 1 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `tab_usuncad`
--
DROP TABLE IF EXISTS `tab_usuncad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tab_usuncad`  AS  select `p`.`pessoa_id` AS `codigo`,`p`.`pessoa_nome` AS `nome`,`p`.`pessoa_cpfcnpj` AS `Cpf` from (`pessoa` `p` join `usuario` `u`) where `p`.`pessoa_id` <> `u`.`pessoa_pessoa_id` and `p`.`pesoa_cargo` = 1 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_agenda2`
--
DROP TABLE IF EXISTS `vw_agenda2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_agenda2`  AS  select `agenda`.`agenda_id` AS `Textoid`,date_format(`agenda`.`agenda_data`,'%d/%m/%Y') AS `Data`,`agenda`.`agenda_texto` AS `Texto`,`agenda`.`agenda_usuario` AS `ID` from `agenda` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_animal`
--
DROP TABLE IF EXISTS `vw_animal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_animal`  AS  select `p`.`pessoa_cpfcnpj` AS `cd_p`,`a`.`animal_id` AS `Código`,`a`.`animal_nome` AS `Animal`,`a`.`animal_registro` AS `Registro`,`p`.`pessoa_nome` AS `Proprietario` from (`animal` `a` join `pessoa` `p`) where `a`.`animal_proprietario` = `p`.`pessoa_id` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_baias`
--
DROP TABLE IF EXISTS `vw_baias`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_baias`  AS  select `baia`.`baia_id` AS `Local`,case when `baia`.`baia_status` = 1 then 'Disponivel' when `baia`.`baia_status` = 2 then 'Em uso' when `baia`.`baia_status` = 3 then 'Danificada' end AS `Status` from `baia` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_carrinho`
--
DROP TABLE IF EXISTS `vw_carrinho`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_carrinho`  AS  select `c`.`carrinhoid` AS `Item`,`s`.`servico_nome` AS `Serviço`,`s`.`servico_valor` AS `UNI`,count(`c`.`servico_id`) AS `Quantidade`,`s`.`servico_valor` * count(`c`.`servico_id`) AS `Valor` from (`carrinho` `c` left join `servico` `s` on(`s`.`servico_id` = `c`.`servico_id`)) group by `s`.`servico_nome` order by `c`.`carrinhoid` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_cli`
--
DROP TABLE IF EXISTS `vw_cli`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_cli`  AS  select `c`.`clienteid` AS `id`,`p`.`pessoa_nome` AS `Nome`,`p`.`pessoa_cpfcnpj` AS `Cpf`,`p`.`pessoa_email` AS `Email`,`e`.`endereco_cep` AS `cep`,`e`.`endereco_rua` AS `rua`,`e`.`endereco_numero` AS `numero`,`e`.`endereco_bairro` AS `bairro`,`e`.`endereco_estado` AS `estado`,`e`.`endereco_cidade` AS `cidade` from ((`pessoa` `p` join `endereco` `e`) join `cliente` `c`) where `c`.`pessoa_id` = `p`.`pessoa_id` and `p`.`pessoa_endereco` = `e`.`endereco_id` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_contrato`
--
DROP TABLE IF EXISTS `vw_contrato`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_contrato`  AS  select `c`.`contrato_id` AS `Codigo`,`p`.`pessoa_nome` AS `Pessoa`,`a`.`animal_nome` AS `Animal`,concat('R$ ',`c`.`contrato_valor`) AS `Valor`,concat('R$ ',`c`.`desconto_Valor`) AS `Desconto`,concat('R$',`c`.`contrato_valor` - `c`.`desconto_Valor`) AS `Total`,date_format(`c`.`contrato_data`,'%d/%m/%y') AS `Data` from (((`pessoa` `p` join `cliente` `cl`) join `animal` `a`) join `contrato` `c`) where `c`.`cliente_id` = `cl`.`clienteid` and `c`.`animal_id` = `a`.`animal_id` and `cl`.`pessoa_id` = `p`.`pessoa_id` and `a`.`animal_proprietario` = `p`.`pessoa_id` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_funcionario`
--
DROP TABLE IF EXISTS `vw_funcionario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_funcionario`  AS  select `rh`.`rh_id` AS `Código`,`pessoa`.`pessoa_nome` AS `Nome`,`pessoa`.`pessoa_cpfcnpj` AS `CPF`,`cargo`.`cargo_nome` AS `Cargo`,`rh`.`rh_inicio` AS `Contratação` from ((`pessoa` join `rh`) join `cargo`) where `cargo`.`cargo_id` = `rh`.`cargo_cargo_id` and `pessoa`.`pessoa_id` = `rh`.`pessoa_pessoa_id` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_login`
--
DROP TABLE IF EXISTS `vw_login`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_login`  AS  select `u`.`usuario_id` AS `id`,`u`.`usuario_senha` AS `senha`,`u`.`usuario_login` AS `login`,`f`.`cargo_cargo_id` AS `cg` from ((`usuario` `u` join `rh` `f`) join `pessoa` `p`) where `u`.`pessoa_pessoa_id` = `p`.`pessoa_id` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_pessoa_usuario`
--
DROP TABLE IF EXISTS `vw_pessoa_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_pessoa_usuario`  AS  select `u`.`usuario_id` AS `UsuarioID`,`p`.`pessoa_cpfcnpj` AS `CPF` from (`usuario` `u` join `pessoa` `p`) where `u`.`pessoa_pessoa_id` = `p`.`pessoa_id` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_servicos`
--
DROP TABLE IF EXISTS `vw_servicos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_servicos`  AS  select `servico`.`servico_id` AS `Código`,`servico`.`servico_tipo` AS `Categoria`,`servico`.`servico_nome` AS `Nome`,format(`servico`.`servico_valor`,2,'de_DE') AS `Valor` from `servico` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_tab_atualiza_usu`
--
DROP TABLE IF EXISTS `vw_tab_atualiza_usu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_tab_atualiza_usu`  AS  select `p`.`pessoa_nome` AS `Nome`,`u`.`usuario_login` AS `Login`,`p`.`pessoa_cpfcnpj` AS `CPF`,`p`.`pessoa_email` AS `Email` from (`pessoa` `p` join `usuario` `u`) where `p`.`pessoa_id` = `u`.`pessoa_pessoa_id` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_tab_servico`
--
DROP TABLE IF EXISTS `vw_tab_servico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_tab_servico`  AS  select `servico`.`servico_id` AS `Código`,`servico`.`servico_nome` AS `Nome`,`servico`.`servico_valor` AS `Valor` from `servico` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_telefone`
--
DROP TABLE IF EXISTS `vw_telefone`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_telefone`  AS  select `telefone`.`telefone_num` AS `Telefone`,`telefone`.`pessoa_pessoa_id` AS `Pessoaid` from `telefone` ;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`agenda_usuario`) REFERENCES `usuario` (`usuario_id`);

--
-- Limitadores para a tabela `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`animal_proprietario`) REFERENCES `pessoa` (`pessoa_id`);

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
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`),
  ADD CONSTRAINT `contrato_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`clienteid`);

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
