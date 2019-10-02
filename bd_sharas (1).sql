-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Out-2019 às 23:12
-- Versão do servidor: 10.3.16-MariaDB
-- versão do PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_sharas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agenda`
--

CREATE TABLE `agenda` (
  `agenda_id` int(11) NOT NULL,
  `agenda_texto` varchar(120) DEFAULT NULL,
  `agenda_usuario` int(11) DEFAULT NULL,
  `agenda_data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `agenda`
--

INSERT INTO `agenda` (`agenda_id`, `agenda_texto`, `agenda_usuario`, `agenda_data`) VALUES
(7, 'por no git ', 7, '2019-09-18'),
(8, 'fgdgdsgdfgdgdf', 7, '2019-09-04');

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
  `calendario_desc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `calendario`
--

INSERT INTO `calendario` (`calendario_id`, `calendario_data`, `calendario_desc`) VALUES
(1, '2019-09-02', 'teste\n'),
(2, '2019-09-24', 'teste');

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
(1, 'T.I', 'fazer suporte ', 1550.65),
(2, 'Treinador', 'treinar cavalo ', 5000.78),
(12, 'veteririnario', 'cuidar dos bichinho', 2560.65);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `carrinho`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `carrinho` (
`Compra` int(11)
,`Codigo` int(11)
,`Nome` varchar(40)
,`Valor` float
);

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
  `cliente_id` int(11) NOT NULL,
  `pessoa_id` int(11) DEFAULT NULL,
  `cliente_debito` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cliente_id`, `pessoa_id`, `cliente_debito`) VALUES
(1, 9, 0),
(2, 3, 700),
(3, 2, 787),
(4, 11, 4848);

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
  `endereco_cep` int(11) NOT NULL,
  `endereco_rua` varchar(80) NOT NULL,
  `endereco_bairro` varchar(80) NOT NULL,
  `endereco_cidade` varchar(80) NOT NULL,
  `endereco_estado` varchar(80) NOT NULL,
  `pessoa_pessoa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `pessoa_email` varchar(45) NOT NULL,
  `pesoa_cargo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`pessoa_id`, `pessoa_ind`, `pessoa_cpfcnpj`, `pessoa_nome`, `pessoa_email`, `pesoa_cargo`) VALUES
(1, 'PF', '11111111111', 'Administrador', 'systemawalla@gmail.com', 'Systema'),
(2, 'pf', '43762393800', 'Maikon Cristino  Rosa', 'maikonmoren@gmail.com', '2'),
(3, 'pf', '75115804085', 'dhasuidh', 'jsaoidja.@jfdo', '2'),
(8, 'pf', '43762393800', 'Maikon Cristino  Rosa', 'maikonmoren@gmail.com', '2'),
(9, 'pf', '36904473134', 'joao', 'joaodasilva123@fmail.com', '2'),
(10, 'pf', '21427878196', 'joao', 'joa123.ro@', '2'),
(11, 'pf', '99558825069', 'joao silva', 'joao.silva@gmail.com', '2'),
(12, 'pf', '702.867.390-11', 'maikon 2 teste', 'teste@teste.com', '2');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `produtoid` int(11) NOT NULL,
  `produto_nome` varchar(40) DEFAULT NULL,
  `produto_desc` varchar(200) DEFAULT NULL,
  `produto_precos` float DEFAULT NULL,
  `produto_cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`produtoid`, `produto_nome`, `produto_desc`, `produto_precos`, `produto_cat`) VALUES
(1, 'Tambor', 'treinamento para essa modalidade ', 500, 1),
(2, 'alojamento ', 'alojar um cavalo ', 300, 2),
(3, 'ferradura ', 'trocar ferradura do cavalo ', 150, 3),
(4, 'laços', 'treinamento para prova de laços', 800, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_servico`
--

CREATE TABLE `produto_servico` (
  `servicoid` int(11) NOT NULL,
  `produtoid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto_servico`
--

INSERT INTO `produto_servico` (`servicoid`, `produtoid`) VALUES
(1, 4),
(1, 2),
(1, 2),
(1, 4),
(1, 3),
(1, 3),
(1, 4),
(1, 4),
(1, 2),
(1, 3),
(1, 4),
(1, 3),
(1, 4),
(1, 3),
(1, 2),
(1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `rh`
--

CREATE TABLE `rh` (
  `rg_id` int(11) NOT NULL,
  `rh_inicio` date NOT NULL,
  `rh_termino` date NOT NULL,
  `rh_horas_dia` int(11) NOT NULL,
  `pessoa_pessoa_id` int(11) NOT NULL,
  `cargo_cargo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `servico_id` int(11) NOT NULL,
  `servico_desc` varchar(45) NOT NULL,
  `servico_valor` int(11) NOT NULL,
  `servico_desconto` int(11) NOT NULL,
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
(7, '698dc19d489c4e4db73e28a713eab07b', 2, 1, 'teste de notificação	', 8, 'maikon.rosa'),
(8, '698dc19d489c4e4db73e28a713eab07b', 3, 0, 'eai seja em vindo', 11, 'j787'),
(9, '698dc19d489c4e4db73e28a713eab07b', 1, 1, NULL, 12, 'teste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vacina`
--

CREATE TABLE `vacina` (
  `vacina_id` int(11) NOT NULL,
  `vacina_composicao` varchar(45) NOT NULL,
  `vacina_uso` varchar(45) NOT NULL,
  `vacina_desc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_agenda2`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_agenda2` (
`Textoid` int(11)
,`Data` varchar(10)
,`Texto` varchar(120)
,`ID` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_at_dados`
-- (Veja abaixo para a view atual)
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
-- Estrutura stand-in para vista `vw_cliente`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_cliente` (
`Codigo` int(11)
,`Nome` varchar(90)
,`CPF` varchar(14)
,`Debito` float
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_login`
-- (Veja abaixo para a view atual)
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
-- Estrutura stand-in para vista `vw_pessoa_usuario`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_pessoa_usuario` (
`UsuarioID` int(11)
,`CPF` varchar(14)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_produto`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_produto` (
`Código` int(11)
,`Categoria` int(11)
,`Nome` varchar(40)
,`Valor` float
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_servico_produto`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_servico_produto` (
`servicoid` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_tab_atualiza_usu`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_tab_atualiza_usu` (
`Nome` varchar(90)
,`Login` varchar(45)
,`CPF` varchar(14)
,`Email` varchar(45)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_telefone`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_telefone` (
`Telefone` varchar(15)
,`Pessoaid` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura para vista `carrinho`
--
DROP TABLE IF EXISTS `carrinho`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `carrinho`  AS  select `produto_servico`.`servicoid` AS `Compra`,`produto`.`produtoid` AS `Codigo`,`produto`.`produto_nome` AS `Nome`,`produto`.`produto_precos` AS `Valor` from (`produto_servico` join `produto`) where `produto`.`produtoid` = `produto_servico`.`produtoid` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_agenda2`
--
DROP TABLE IF EXISTS `vw_agenda2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_agenda2`  AS  select `agenda`.`agenda_id` AS `Textoid`,date_format(`agenda`.`agenda_data`,'%d/%m/%Y') AS `Data`,`agenda`.`agenda_texto` AS `Texto`,`agenda`.`agenda_usuario` AS `ID` from `agenda` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_at_dados`
--
DROP TABLE IF EXISTS `vw_at_dados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_at_dados`  AS  select `p`.`pessoa_nome` AS `Nome`,`p`.`pessoa_cpfcnpj` AS `CPF`,`u`.`usuario_login` AS `Login`,`u`.`usuario_tipo` AS `Cargo`,`u`.`usuario_status` AS `Status` from (`pessoa` `p` join `usuario` `u`) where `p`.`pessoa_id` = `u`.`pessoa_pessoa_id` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_cliente`
--
DROP TABLE IF EXISTS `vw_cliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_cliente`  AS  select `cliente`.`cliente_id` AS `Codigo`,`pessoa`.`pessoa_nome` AS `Nome`,`pessoa`.`pessoa_cpfcnpj` AS `CPF`,`cliente`.`cliente_debito` AS `Debito` from (`cliente` join `pessoa`) where `pessoa`.`pessoa_id` = `cliente`.`pessoa_id` and `pessoa`.`pesoa_cargo` = 2 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_login`
--
DROP TABLE IF EXISTS `vw_login`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_login`  AS  select `usuario`.`usuario_status` AS `usuario_status`,`usuario`.`usuario_id` AS `usuario_id`,`usuario`.`usuario_login` AS `usuario_login`,`usuario`.`usuario_tipo` AS `usuario_tipo`,`usuario`.`pessoa_pessoa_id` AS `pessoa_pessoa_id`,`usuario`.`usuario_senha` AS `usuario_senha` from `usuario` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_pessoa_usuario`
--
DROP TABLE IF EXISTS `vw_pessoa_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_pessoa_usuario`  AS  select `u`.`usuario_id` AS `UsuarioID`,`p`.`pessoa_cpfcnpj` AS `CPF` from (`usuario` `u` join `pessoa` `p`) where `u`.`pessoa_pessoa_id` = `p`.`pessoa_id` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_produto`
--
DROP TABLE IF EXISTS `vw_produto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_produto`  AS  select `produto`.`produtoid` AS `Código`,`produto`.`produto_cat` AS `Categoria`,`produto`.`produto_nome` AS `Nome`,`produto`.`produto_precos` AS `Valor` from `produto` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_servico_produto`
--
DROP TABLE IF EXISTS `vw_servico_produto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_servico_produto`  AS  select `produto_servico`.`servicoid` AS `servicoid` from `produto_servico` where `produto_servico`.`servicoid` <= `produto_servico`.`servicoid` order by `produto_servico`.`servicoid` desc limit 1 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_tab_atualiza_usu`
--
DROP TABLE IF EXISTS `vw_tab_atualiza_usu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_tab_atualiza_usu`  AS  select `p`.`pessoa_nome` AS `Nome`,`u`.`usuario_login` AS `Login`,`p`.`pessoa_cpfcnpj` AS `CPF`,`p`.`pessoa_email` AS `Email` from (`pessoa` `p` join `usuario` `u`) where `p`.`pessoa_id` = `u`.`pessoa_pessoa_id` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_telefone`
--
DROP TABLE IF EXISTS `vw_telefone`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_telefone`  AS  select `telefone`.`telefone_num` AS `Telefone`,`telefone`.`pessoa_pessoa_id` AS `Pessoaid` from `telefone` ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`agenda_id`),
  ADD KEY `agenda_usuario` (`agenda_usuario`);

--
-- Índices para tabela `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`animal_id`),
  ADD KEY `animal_criador` (`animal_criador`),
  ADD KEY `animal_local` (`animal_local`);

--
-- Índices para tabela `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`banco_id`);

--
-- Índices para tabela `calendario`
--
ALTER TABLE `calendario`
  ADD PRIMARY KEY (`calendario_id`);

--
-- Índices para tabela `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`cargo_id`);

--
-- Índices para tabela `carteira_vacina`
--
ALTER TABLE `carteira_vacina`
  ADD PRIMARY KEY (`carteira_vacina_id`),
  ADD KEY `vacina_vacina_id` (`vacina_vacina_id`),
  ADD KEY `animal_animal_id` (`animal_animal_id`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_id`),
  ADD KEY `pessoa_id` (`pessoa_id`);

--
-- Índices para tabela `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`compra_id`),
  ADD KEY `compra_fornecedor` (`compra_fornecedor`),
  ADD KEY `compra_produto` (`compra_produto`);

--
-- Índices para tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`consulta_id`),
  ADD KEY `consulta_animal` (`consulta_animal`),
  ADD KEY `consulta_veterinario` (`consulta_veterinario`);

--
-- Índices para tabela `conta_banco`
--
ALTER TABLE `conta_banco`
  ADD PRIMARY KEY (`conta_banco_id`),
  ADD UNIQUE KEY `conta_banco_cpfcnpj` (`conta_banco_cpfcnpj`),
  ADD KEY `usuario_usuario_id` (`usuario_usuario_id`),
  ADD KEY `banco_banco_id` (`banco_banco_id`);

--
-- Índices para tabela `criador`
--
ALTER TABLE `criador`
  ADD PRIMARY KEY (`criador_id`),
  ADD KEY `criador_endereco` (`criador_endereco`),
  ADD KEY `pessoa_pessoa_id` (`pessoa_pessoa_id`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`endereco_id`),
  ADD KEY `pessoa_pessoa_id` (`pessoa_pessoa_id`);

--
-- Índices para tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`estoque_id`);

--
-- Índices para tabela `ferrajamento`
--
ALTER TABLE `ferrajamento`
  ADD PRIMARY KEY (`ferrajamento_id`),
  ADD KEY `ferrajamento_animal` (`ferrajamento_animal`);

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`fornecedor_id`),
  ADD KEY `pessoa_pessoa_id` (`pessoa_pessoa_id`);

--
-- Índices para tabela `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`);

--
-- Índices para tabela `pasto`
--
ALTER TABLE `pasto`
  ADD PRIMARY KEY (`pasto_id`);

--
-- Índices para tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`pessoa_id`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`produtoid`);

--
-- Índices para tabela `produto_servico`
--
ALTER TABLE `produto_servico`
  ADD KEY `produtoid` (`produtoid`);

--
-- Índices para tabela `rh`
--
ALTER TABLE `rh`
  ADD PRIMARY KEY (`rg_id`),
  ADD KEY `pessoa_pessoa_id` (`pessoa_pessoa_id`),
  ADD KEY `fk_rh_cargo1_idx` (`cargo_cargo_id`);

--
-- Índices para tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`servico_id`),
  ADD KEY `pessoa_pessoa_id` (`pessoa_pessoa_id`);

--
-- Índices para tabela `servico_ferrajamento`
--
ALTER TABLE `servico_ferrajamento`
  ADD PRIMARY KEY (`servico_ferrajamento_id`),
  ADD KEY `servico_servico_id` (`servico_servico_id`);

--
-- Índices para tabela `servico_itens`
--
ALTER TABLE `servico_itens`
  ADD PRIMARY KEY (`servico_itens_id`),
  ADD KEY `estoque_estoque_id` (`estoque_estoque_id`),
  ADD KEY `servico_servico_id` (`servico_servico_id`);

--
-- Índices para tabela `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`telefone_id`),
  ADD KEY `pessoa_pessoa_id` (`pessoa_pessoa_id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `usuario_login` (`usuario_login`),
  ADD KEY `pessoa_pessoa_id` (`pessoa_pessoa_id`);

--
-- Índices para tabela `vacina`
--
ALTER TABLE `vacina`
  ADD PRIMARY KEY (`vacina_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agenda`
--
ALTER TABLE `agenda`
  MODIFY `agenda_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `animal`
--
ALTER TABLE `animal`
  MODIFY `animal_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `banco`
--
ALTER TABLE `banco`
  MODIFY `banco_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `calendario`
--
ALTER TABLE `calendario`
  MODIFY `calendario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `cargo`
--
ALTER TABLE `cargo`
  MODIFY `cargo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `conta_banco`
--
ALTER TABLE `conta_banco`
  MODIFY `conta_banco_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `criador`
--
ALTER TABLE `criador`
  MODIFY `criador_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `pessoa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `produtoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `servico_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `servico_ferrajamento`
--
ALTER TABLE `servico_ferrajamento`
  MODIFY `servico_ferrajamento_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `telefone`
--
ALTER TABLE `telefone`
  MODIFY `telefone_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`animal_criador`) REFERENCES `criador` (`criador_id`),
  ADD CONSTRAINT `animal_ibfk_2` FOREIGN KEY (`animal_local`) REFERENCES `pasto` (`pasto_id`);

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
-- Limitadores para a tabela `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`pessoa_pessoa_id`) REFERENCES `pessoa` (`pessoa_id`);

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
-- Limitadores para a tabela `produto_servico`
--
ALTER TABLE `produto_servico`
  ADD CONSTRAINT `produto_servico_ibfk_1` FOREIGN KEY (`produtoid`) REFERENCES `produto` (`produtoid`);

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
