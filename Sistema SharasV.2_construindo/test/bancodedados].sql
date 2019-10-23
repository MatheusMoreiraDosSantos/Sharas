/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  maiko
 * Created: 23/10/2019
 */-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 23-Out-2019 às 20:00
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
-- Database: `bd_sharas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agenda`
--

CREATE TABLE `agenda` (
  `agenda_id` int(11) NOT NULL,
  `agenda_texto` varchar(120) DEFAULT NULL,
  `agenda_usuario` int(11) DEFAULT NULL,
  `agenda_data` date NOT NULL,
  `agenda_agend` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `animal`
--

CREATE TABLE `animal` (
  `animal_id` int(11) NOT NULL,
  `animal_nome` varchar(80) NOT NULL,
  `animal_registro` varchar(45) DEFAULT NULL,
  `animal_criador` int(11) DEFAULT NULL,
  `animal_nasc` date DEFAULT NULL,
  `animal_sexo` varchar(45) NOT NULL,
  `animal_pelagem` varchar(45) NOT NULL,
  `animal_proprietario` int(11) DEFAULT NULL,
  `animal_local` int(11) DEFAULT NULL,
  `animal_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Acionadores `animal`
--
DELIMITER $$
CREATE TRIGGER `animal_AFTER_INSERT` AFTER INSERT ON `animal` FOR EACH ROW INSERT INTO log                                   -- tabela de logs
   ( log_sql, log_undo, log_acao, log_entidade, log_usuario, log_time)
 VALUES
   (
   CONCAT(
     "INSERT INTO log (animal_id, animal_nome, animal_registro, animal_criador, animal_nasc, animal_sexo, animal_pelagem, animal_proprietario, animal_local, animal_status) VALUES (",
     CAST( NEW.animal_id AS CHAR ), ",",
     "'", NEW.animal_nome, "'", ",",
     "'", NEW.animal_registro, "'", ",",
     CAST( NEW.animal_criador AS CHAR ), ",",
     CAST( NEW.animal_nasc AS CHAR ), ",",
     "'", NEW.animal_sexo, "'", ",",
     "'", NEW.animal_pelagem, "'", ",",
     CAST( NEW.animal_proprietario AS CHAR ), ",",
     CAST( NEW.animal_local AS CHAR ), ",",
     CAST( NEW.animal_status AS CHAR ), ",",
     ")"
   ),
   CONCAT( 'DELETE FROM animal WHERE animal_id=', CAST( NEW.animal_id AS CHAR ) ),
   'INSERCAO',
   'ANIMAL',
   session_user(),
   current_timestamp()
   )
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `banco`
--

CREATE TABLE `banco` (
  `banco_id` int(11) NOT NULL,
  `banco_cod` int(11) NOT NULL,
  `banco_desc` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `calendario`
--

CREATE TABLE `calendario` (
  `calendario_id` int(11) NOT NULL,
  `calendario_data` varchar(45) NOT NULL,
  `calendario_desc` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE `cargo` (
  `cargo_id` int(11) NOT NULL,
  `cargo_nome` varchar(20) DEFAULT NULL,
  `cargo_desc` varchar(20) DEFAULT NULL,
  `cargo_salario_base` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`cargo_id`, `cargo_nome`, `cargo_desc`, `cargo_salario_base`) VALUES
(17, 'teste', 'teste', 4000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `carrinhoid` int(11) NOT NULL,
  `produto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carteira_vacina`
--

CREATE TABLE `carteira_vacina` (
  `carteira_vacina_id` int(11) NOT NULL,
  `carteira_vacina_nome_vacina` varchar(45) NOT NULL,
  `carteira_vacina_desc` text NOT NULL,
  `carteira_vacina_data` date NOT NULL,
  `carteira_vacina_vacina` int(11) NOT NULL,
  `vacina_vacina_id` int(11) NOT NULL,
  `animal_animal_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `clienteid` int(11) NOT NULL,
  `pessoa_id` int(11) DEFAULT NULL,
  `cliente_deb` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`clienteid`, `pessoa_id`, `cliente_deb`) VALUES
(3, 15, 0),
(4, 16, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE `compra` (
  `compra_id` int(11) NOT NULL,
  `compra_produto` int(11) NOT NULL,
  `compra_fornecedor` int(11) NOT NULL,
  `compra_data` date NOT NULL,
  `compra_valor` float NOT NULL,
  `compra_entrega` date NOT NULL,
  `compra_parc` int(11) NOT NULL,
  `compra_qtd` int(11) NOT NULL,
  `compra_udm` varchar(45) NOT NULL,
  `compra_venc` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `consulta`
--

CREATE TABLE `consulta` (
  `consulta_id` int(11) NOT NULL,
  `consulta_veterinario` int(11) NOT NULL,
  `consulta_valor` float NOT NULL,
  `consulta_inicio` date NOT NULL,
  `consulta_termino` date NOT NULL,
  `consulta_diagnostico` text NOT NULL,
  `consulta_tratamento` varchar(120) NOT NULL,
  `consulta_animal` int(11) NOT NULL,
  `consulta_vacina` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `conta_banco`
--

CREATE TABLE `conta_banco` (
  `conta_banco_id` int(11) NOT NULL,
  `usuario_usuario_id` int(11) NOT NULL,
  `conta_banco_cpfcnpj` int(11) NOT NULL,
  `conta_banco_agencia` int(11) NOT NULL,
  `conta_banco_conta` int(11) NOT NULL,
  `banco_banco_id` int(11) NOT NULL,
  `conta_banco_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contrato`
--

CREATE TABLE `contrato` (
  `contrato_id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `contrato_valor` float DEFAULT NULL,
  `contrato_data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contratos`
--

CREATE TABLE `contratos` (
  `contrato_id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `contrato_valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `criador`
--

CREATE TABLE `criador` (
  `criador_id` int(11) NOT NULL,
  `criador_endereco` int(11) NOT NULL,
  `pessoa_pessoa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `endereco_id` int(11) NOT NULL,
  `endereco_numero` varchar(45) NOT NULL,
  `endereco_cep` varchar(11) NOT NULL,
  `endereco_rua` varchar(80) NOT NULL,
  `endereco_bairro` varchar(80) NOT NULL,
  `endereco_cidade` varchar(80) NOT NULL,
  `endereco_estado` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`endereco_id`, `endereco_numero`, `endereco_cep`, `endereco_rua`, `endereco_bairro`, `endereco_cidade`, `endereco_estado`) VALUES
(1, '000', '0', '000', '000', '000', '00'),
(14, '11000', '18703480', 'brazcamilo de souza', 'brabancia ', 'avare', 'SP'),
(16, '1100', '18703480', 'brazcamilo de souza', 'brabancia ', 'avare', 'SP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE `estoque` (
  `estoque_id` int(11) NOT NULL,
  `estoque_udm` varchar(45) NOT NULL,
  `estoque_produto` varchar(45) NOT NULL,
  `estoque_qtd` float NOT NULL,
  `estoque_produto_desc` varchar(120) NOT NULL,
  `estoque_esgotado` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ferrajamento`
--

CREATE TABLE `ferrajamento` (
  `ferrajamento_id` int(11) NOT NULL,
  `ferrajamento_ferrador` int(11) NOT NULL,
  `ferrajamento_animal` int(11) NOT NULL,
  `ferrajamento_valor` float NOT NULL,
  `terceiros_terceiros_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `fornecedor_id` int(11) NOT NULL,
  `pessoa_pessoa_id` int(11) NOT NULL,
  `fornecedor_produto` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `idenddereco`
-- (See below for the actual view)
--
CREATE TABLE `idenddereco` (
`id` int(11)
,`c` varchar(11)
,`n` varchar(45)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_contrato`
--

CREATE TABLE `item_contrato` (
  `produto_id` int(11) DEFAULT NULL,
  `contrato_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

CREATE TABLE `log` (
  `log_id` int(11) NOT NULL,
  `log_acao` varchar(45) NOT NULL,
  `log_entidade` varchar(45) NOT NULL,
  `log_usuario` varchar(45) NOT NULL,
  `log_time` time NOT NULL,
  `log_row` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pasto`
--

CREATE TABLE `pasto` (
  `pasto_id` int(11) NOT NULL,
  `pasto_num` int(11) NOT NULL,
  `pasto_status` int(11) NOT NULL,
  `pasto_desc` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `pessoa_id` int(11) NOT NULL,
  `pessoa_ind` varchar(2) NOT NULL,
  `pessoa_cpfcnpj` varchar(14) NOT NULL,
  `pessoa_nome` varchar(90) NOT NULL,
  `pessoa_email` varchar(45) DEFAULT NULL,
  `pesoa_cargo` int(1) DEFAULT NULL,
  `pessoa_endereco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`pessoa_id`, `pessoa_ind`, `pessoa_cpfcnpj`, `pessoa_nome`, `pessoa_email`, `pesoa_cargo`, `pessoa_endereco`) VALUES
(9, 'S', '000.000.000-00', 'Sistema', 'systemwalla@gmail.com', 1, 1),
(12, 'PF', '43762393800', 'Maikon Cristino ', 'maikonmoren@gmail.com', 1, 1),
(15, 'PF', '69301332051', 'MAikon', 'ndmkasndas.@jojo', 2, 14),
(16, 'PF', '99467554089', 'teste2 ', 'teset.teste@teste', 2, 16);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `produto_id` int(11) NOT NULL,
  `produto_tipo` int(11) DEFAULT NULL,
  `produto_valor` float DEFAULT NULL,
  `produto_nome` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rh`
--

CREATE TABLE `rh` (
  `rg_id` int(11) NOT NULL,
  `rh_inicio` date NOT NULL,
  `rh_termino` date DEFAULT NULL,
  `pessoa_pessoa_id` int(11) NOT NULL,
  `cargo_cargo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `rh`
--

INSERT INTO `rh` (`rg_id`, `rh_inicio`, `rh_termino`, `pessoa_pessoa_id`, `cargo_cargo_id`) VALUES
(2, '2019-10-02', NULL, 12, 17);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `servico_id` int(11) NOT NULL,
  `servico_desc` varchar(45) NOT NULL,
  `servico_valor` int(11) NOT NULL,
  `servico_inicio` date NOT NULL,
  `servico_termino` date NOT NULL,
  `servico_venc` date NOT NULL,
  `servico_desconto` float NOT NULL,
  `pessoa_pessoa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico_ferrajamento`
--

CREATE TABLE `servico_ferrajamento` (
  `servico_ferrajamento_id` int(11) NOT NULL,
  `servico_servico_id` int(11) NOT NULL,
  `ferrajamento_ferrajamento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico_itens`
--

CREATE TABLE `servico_itens` (
  `servico_itens_id` int(11) NOT NULL,
  `estoque_estoque_id` int(11) NOT NULL,
  `servico_servico_id` int(11) NOT NULL,
  `servico_itens_qtde` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `tab_cliente`
-- (See below for the actual view)
--
CREATE TABLE `tab_cliente` (
`Codigo` int(11)
,`Nome` varchar(90)
,`status` varchar(9)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

CREATE TABLE `telefone` (
  `telefone_id` int(11) NOT NULL,
  `telefone_num` varchar(15) NOT NULL,
  `telefone_tipo` int(11) NOT NULL,
  `pessoa_pessoa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `total_carriho`
-- (See below for the actual view)
--
CREATE TABLE `total_carriho` (
`sum(produto_valor)` double
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL,
  `usuario_senha` varchar(80) NOT NULL,
  `usuario_tipo` int(11) NOT NULL,
  `usuario_status` int(11) NOT NULL,
  `usuario_notificacao` varchar(120) DEFAULT NULL,
  `pessoa_pessoa_id` int(11) NOT NULL,
  `usuario_login` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `usuario_senha`, `usuario_tipo`, `usuario_status`, `usuario_notificacao`, `pessoa_pessoa_id`, `usuario_login`) VALUES
(8, '698dc19d489c4e4db73e28a713eab07b', 1, 1, NULL, 9, 'sistema');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vacina`
--

CREATE TABLE `vacina` (
  `vacina_id` int(11) NOT NULL,
  `vacina_composicao` varchar(45) NOT NULL,
  `vacina_uso` varchar(45) NOT NULL,
  `vacina_desc` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_agenda2`
-- (See below for the actual view)
--
CREATE TABLE `vw_agenda2` (
`Textoid` int(11)
,`Data` varchar(10)
,`Texto` varchar(120)
,`ID` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_at_dados`
-- (See below for the actual view)
--
CREATE TABLE `vw_at_dados` (
`Nome` varchar(90)
,`CPF` varchar(14)
,`Login` varchar(45)
,`Cargo` int(11)
,`Status` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_funcionarios`
-- (See below for the actual view)
--
CREATE TABLE `vw_funcionarios` (
`Código` int(11)
,`Nome` varchar(90)
,`CPF` varchar(14)
,`EMail` varchar(45)
,`Cargo` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_login`
-- (See below for the actual view)
--
CREATE TABLE `vw_login` (
`usuario_status` int(11)
,`usuario_id` int(11)
,`usuario_login` varchar(45)
,`usuario_tipo` int(11)
,`pessoa_pessoa_id` int(11)
,`usuario_senha` varchar(80)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_pessoa_usuario`
-- (See below for the actual view)
--
CREATE TABLE `vw_pessoa_usuario` (
`UsuarioID` int(11)
,`CPF` varchar(14)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_tab_atualiza_usu`
-- (See below for the actual view)
--
CREATE TABLE `vw_tab_atualiza_usu` (
`Nome` varchar(90)
,`Login` varchar(45)
,`CPF` varchar(14)
,`Email` varchar(45)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_tab_produto`
-- (See below for the actual view)
--
CREATE TABLE `vw_tab_produto` (
`Código` int(11)
,`Nome` varchar(40)
,`Valor` float
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_telefone`
-- (See below for the actual view)
--
CREATE TABLE `vw_telefone` (
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tab_cliente`  AS  select `c`.`clienteid` AS `Codigo`,`p`.`pessoa_nome` AS `Nome`,(case `c`.`cliente_deb` when (`c`.`cliente_deb` > 0) then 'Ativo' when (`c`.`cliente_deb` < 0) then 'Bloqueado' end) AS `status` from (`pessoa` `p` join `cliente` `c`) where ((`p`.`pesoa_cargo` = 2) and (`p`.`pessoa_id` = `c`.`pessoa_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `total_carriho`
--
DROP TABLE IF EXISTS `total_carriho`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_carriho`  AS  select sum(`produto`.`produto_valor`) AS `sum(produto_valor)` from (`produto` join `carrinho`) where (`produto`.`produto_id` = `carrinho`.`produto_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_agenda2`
--
DROP TABLE IF EXISTS `vw_agenda2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_agenda2`  AS  select `agenda`.`agenda_id` AS `Textoid`,date_format(`agenda`.`agenda_data`,'%d/%m/%Y') AS `Data`,`agenda`.`agenda_texto` AS `Texto`,`agenda`.`agenda_usuario` AS `ID` from `agenda` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_at_dados`
--
DROP TABLE IF EXISTS `vw_at_dados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_at_dados`  AS  select `p`.`pessoa_nome` AS `Nome`,`p`.`pessoa_cpfcnpj` AS `CPF`,`u`.`usuario_login` AS `Login`,`u`.`usuario_tipo` AS `Cargo`,`u`.`usuario_status` AS `Status` from (`pessoa` `p` join `usuario` `u`) where (`p`.`pessoa_id` = `u`.`pessoa_pessoa_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_funcionarios`
--
DROP TABLE IF EXISTS `vw_funcionarios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_funcionarios`  AS  select `rh`.`rg_id` AS `Código`,`pessoa`.`pessoa_nome` AS `Nome`,`pessoa`.`pessoa_cpfcnpj` AS `CPF`,`pessoa`.`pessoa_email` AS `EMail`,`cargo`.`cargo_nome` AS `Cargo` from ((`rh` join `pessoa`) join `cargo`) where ((`pessoa`.`pesoa_cargo` = 1) and (`rh`.`cargo_cargo_id` = `cargo`.`cargo_id`) and (`pessoa`.`pessoa_id` = `rh`.`pessoa_pessoa_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_login`
--
DROP TABLE IF EXISTS `vw_login`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_login`  AS  select `usuario`.`usuario_status` AS `usuario_status`,`usuario`.`usuario_id` AS `usuario_id`,`usuario`.`usuario_login` AS `usuario_login`,`usuario`.`usuario_tipo` AS `usuario_tipo`,`usuario`.`pessoa_pessoa_id` AS `pessoa_pessoa_id`,`usuario`.`usuario_senha` AS `usuario_senha` from `usuario` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_pessoa_usuario`
--
DROP TABLE IF EXISTS `vw_pessoa_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_pessoa_usuario`  AS  select `u`.`usuario_id` AS `UsuarioID`,`p`.`pessoa_cpfcnpj` AS `CPF` from (`usuario` `u` join `pessoa` `p`) where (`u`.`pessoa_pessoa_id` = `p`.`pessoa_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_tab_atualiza_usu`
--
DROP TABLE IF EXISTS `vw_tab_atualiza_usu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_tab_atualiza_usu`  AS  select `p`.`pessoa_nome` AS `Nome`,`u`.`usuario_login` AS `Login`,`p`.`pessoa_cpfcnpj` AS `CPF`,`p`.`pessoa_email` AS `Email` from (`pessoa` `p` join `usuario` `u`) where (`p`.`pessoa_id` = `u`.`pessoa_pessoa_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_tab_produto`
--
DROP TABLE IF EXISTS `vw_tab_produto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_tab_produto`  AS  select `produto`.`produto_id` AS `Código`,`produto`.`produto_nome` AS `Nome`,`produto`.`produto_valor` AS `Valor` from `produto` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_telefone`
--
DROP TABLE IF EXISTS `vw_telefone`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_telefone`  AS  select `telefone`.`telefone_num` AS `Telefone`,`telefone`.`pessoa_pessoa_id` AS `Pessoaid` from `telefone` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`agenda_id`),
  ADD KEY `agenda_usuario` (`agenda_usuario`);

--
-- Indexes for table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`animal_id`),
  ADD KEY `animal_criador` (`animal_criador`),
  ADD KEY `animal_local` (`animal_local`);

--
-- Indexes for table `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`banco_id`);

--
-- Indexes for table `calendario`
--
ALTER TABLE `calendario`
  ADD PRIMARY KEY (`calendario_id`);

--
-- Indexes for table `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`cargo_id`);

--
-- Indexes for table `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`carrinhoid`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Indexes for table `carteira_vacina`
--
ALTER TABLE `carteira_vacina`
  ADD PRIMARY KEY (`carteira_vacina_id`),
  ADD KEY `vacina_vacina_id` (`vacina_vacina_id`),
  ADD KEY `animal_animal_id` (`animal_animal_id`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`clienteid`),
  ADD KEY `pessoa_id` (`pessoa_id`);

--
-- Indexes for table `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`compra_id`),
  ADD KEY `compra_fornecedor` (`compra_fornecedor`),
  ADD KEY `compra_produto` (`compra_produto`);

--
-- Indexes for table `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`consulta_id`),
  ADD KEY `consulta_animal` (`consulta_animal`),
  ADD KEY `consulta_veterinario` (`consulta_veterinario`);

--
-- Indexes for table `conta_banco`
--
ALTER TABLE `conta_banco`
  ADD PRIMARY KEY (`conta_banco_id`),
  ADD UNIQUE KEY `conta_banco_cpfcnpj` (`conta_banco_cpfcnpj`),
  ADD KEY `usuario_usuario_id` (`usuario_usuario_id`),
  ADD KEY `banco_banco_id` (`banco_banco_id`);

--
-- Indexes for table `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`contrato_id`);

--
-- Indexes for table `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`contrato_id`);

--
-- Indexes for table `criador`
--
ALTER TABLE `criador`
  ADD PRIMARY KEY (`criador_id`),
  ADD KEY `criador_endereco` (`criador_endereco`),
  ADD KEY `pessoa_pessoa_id` (`pessoa_pessoa_id`),
  ADD KEY `criador_endereco_2` (`criador_endereco`);

--
-- Indexes for table `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`endereco_id`);

--
-- Indexes for table `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`estoque_id`);

--
-- Indexes for table `ferrajamento`
--
ALTER TABLE `ferrajamento`
  ADD PRIMARY KEY (`ferrajamento_id`),
  ADD KEY `ferrajamento_animal` (`ferrajamento_animal`);

--
-- Indexes for table `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`fornecedor_id`),
  ADD KEY `pessoa_pessoa_id` (`pessoa_pessoa_id`);

--
-- Indexes for table `item_contrato`
--
ALTER TABLE `item_contrato`
  ADD KEY `produto_id` (`produto_id`),
  ADD KEY `contrato_id` (`contrato_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `pasto`
--
ALTER TABLE `pasto`
  ADD PRIMARY KEY (`pasto_id`);

--
-- Indexes for table `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`pessoa_id`),
  ADD UNIQUE KEY `pessoa_cpfcnpj` (`pessoa_cpfcnpj`),
  ADD UNIQUE KEY `pessoa_email` (`pessoa_email`),
  ADD KEY `pessoa_endereco` (`pessoa_endereco`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`produto_id`);

--
-- Indexes for table `rh`
--
ALTER TABLE `rh`
  ADD PRIMARY KEY (`rg_id`),
  ADD KEY `pessoa_pessoa_id` (`pessoa_pessoa_id`),
  ADD KEY `fk_rh_cargo1_idx` (`cargo_cargo_id`);

--
-- Indexes for table `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`servico_id`),
  ADD KEY `pessoa_pessoa_id` (`pessoa_pessoa_id`);

--
-- Indexes for table `servico_ferrajamento`
--
ALTER TABLE `servico_ferrajamento`
  ADD PRIMARY KEY (`servico_ferrajamento_id`),
  ADD KEY `servico_servico_id` (`servico_servico_id`);

--
-- Indexes for table `servico_itens`
--
ALTER TABLE `servico_itens`
  ADD PRIMARY KEY (`servico_itens_id`),
  ADD KEY `estoque_estoque_id` (`estoque_estoque_id`),
  ADD KEY `servico_servico_id` (`servico_servico_id`);

--
-- Indexes for table `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`telefone_id`),
  ADD KEY `pessoa_pessoa_id` (`pessoa_pessoa_id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `usuario_login` (`usuario_login`),
  ADD KEY `pessoa_pessoa_id` (`pessoa_pessoa_id`);

--
-- Indexes for table `vacina`
--
ALTER TABLE `vacina`
  ADD PRIMARY KEY (`vacina_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `agenda_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `animal`
--
ALTER TABLE `animal`
  MODIFY `animal_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banco`
--
ALTER TABLE `banco`
  MODIFY `banco_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `calendario`
--
ALTER TABLE `calendario`
  MODIFY `calendario_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cargo`
--
ALTER TABLE `cargo`
  MODIFY `cargo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `carrinhoid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `clienteid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `conta_banco`
--
ALTER TABLE `conta_banco`
  MODIFY `conta_banco_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contrato`
--
ALTER TABLE `contrato`
  MODIFY `contrato_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contratos`
--
ALTER TABLE `contratos`
  MODIFY `contrato_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `criador`
--
ALTER TABLE `criador`
  MODIFY `criador_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `endereco`
--
ALTER TABLE `endereco`
  MODIFY `endereco_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ferrajamento`
--
ALTER TABLE `ferrajamento`
  MODIFY `ferrajamento_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `pessoa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
  MODIFY `produto_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rh`
--
ALTER TABLE `rh`
  MODIFY `rg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `servico`
--
ALTER TABLE `servico`
  MODIFY `servico_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `servico_ferrajamento`
--
ALTER TABLE `servico_ferrajamento`
  MODIFY `servico_ferrajamento_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `telefone`
--
ALTER TABLE `telefone`
  MODIFY `telefone_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
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
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`animal_criador`) REFERENCES `criador` (`criador_id`),
  ADD CONSTRAINT `animal_ibfk_2` FOREIGN KEY (`animal_local`) REFERENCES `pasto` (`pasto_id`);

--
-- Limitadores para a tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD CONSTRAINT `carrinho_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`);

--
-- Limitadores para a tabela `carteira_vacina`
--
ALTER TABLE `carteira_vacina`
  ADD CONSTRAINT `carteira_vacina_ibfk_1` FOREIGN KEY (`vacina_vacina_id`) REFERENCES `vacina` (`vacina_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `carteira_vacina_ibfk_2` FOREIGN KEY (`animal_animal_id`) REFERENCES `animal` (`animal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`pessoa_id`);

--
-- Limitadores para a tabela `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`compra_fornecedor`) REFERENCES `fornecedor` (`fornecedor_id`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`compra_produto`) REFERENCES `estoque` (`estoque_id`);

--
-- Limitadores para a tabela `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`consulta_animal`) REFERENCES `animal` (`animal_id`),
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`consulta_veterinario`) REFERENCES `usuario` (`usuario_id`);

--
-- Limitadores para a tabela `conta_banco`
--
ALTER TABLE `conta_banco`
  ADD CONSTRAINT `conta_banco_ibfk_1` FOREIGN KEY (`usuario_usuario_id`) REFERENCES `usuario` (`usuario_id`),
  ADD CONSTRAINT `conta_banco_ibfk_2` FOREIGN KEY (`banco_banco_id`) REFERENCES `banco` (`banco_id`);

--
-- Limitadores para a tabela `criador`
--
ALTER TABLE `criador`
  ADD CONSTRAINT `criador_ibfk_1` FOREIGN KEY (`criador_endereco`) REFERENCES `endereco` (`endereco_id`),
  ADD CONSTRAINT `criador_ibfk_2` FOREIGN KEY (`pessoa_pessoa_id`) REFERENCES `pessoa` (`pessoa_id`);

--
-- Limitadores para a tabela `ferrajamento`
--
ALTER TABLE `ferrajamento`
  ADD CONSTRAINT `ferrajamento_ibfk_1` FOREIGN KEY (`ferrajamento_animal`) REFERENCES `animal` (`animal_id`);

--
-- Limitadores para a tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD CONSTRAINT `fornecedor_ibfk_1` FOREIGN KEY (`pessoa_pessoa_id`) REFERENCES `pessoa` (`pessoa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `item_contrato`
--
ALTER TABLE `item_contrato`
  ADD CONSTRAINT `item_contrato_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`),
  ADD CONSTRAINT `item_contrato_ibfk_2` FOREIGN KEY (`contrato_id`) REFERENCES `contrato` (`contrato_id`);

--
-- Limitadores para a tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`pessoa_endereco`) REFERENCES `endereco` (`endereco_id`);

--
-- Limitadores para a tabela `rh`
--
ALTER TABLE `rh`
  ADD CONSTRAINT `rh_ibfk_1` FOREIGN KEY (`pessoa_pessoa_id`) REFERENCES `pessoa` (`pessoa_id`);

--
-- Limitadores para a tabela `servico`
--
ALTER TABLE `servico`
  ADD CONSTRAINT `servico_ibfk_1` FOREIGN KEY (`pessoa_pessoa_id`) REFERENCES `pessoa` (`pessoa_id`);

--
-- Limitadores para a tabela `servico_ferrajamento`
--
ALTER TABLE `servico_ferrajamento`
  ADD CONSTRAINT `servico_ferrajamento_ibfk_1` FOREIGN KEY (`servico_servico_id`) REFERENCES `servico` (`servico_id`);

--
-- Limitadores para a tabela `servico_itens`
--
ALTER TABLE `servico_itens`
  ADD CONSTRAINT `servico_itens_ibfk_1` FOREIGN KEY (`estoque_estoque_id`) REFERENCES `estoque` (`estoque_id`),
  ADD CONSTRAINT `servico_itens_ibfk_2` FOREIGN KEY (`servico_servico_id`) REFERENCES `servico` (`servico_id`);

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


