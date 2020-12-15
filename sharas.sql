-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Nov-2019 às 18:58
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

CREATE TABLE `agenda` (
  `agenda_id` int(11) NOT NULL,
  `agenda_texto` varchar(120) DEFAULT NULL,
  `agenda_usuario` int(11) DEFAULT NULL,
  `agenda_data` date NOT NULL,
  `agenda_agend` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `baia`
--

CREATE TABLE `baia` (
  `baia_id` int(11) NOT NULL,
  `baia_tamanho` int(11) DEFAULT NULL
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
(1, '2019-11-15', '12345');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE `cargo` (
  `cargo_id` int(11) NOT NULL,
  `cargo_nome` varchar(40) DEFAULT NULL
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

CREATE TABLE `carrinho` (
  `carrinhoid` int(11) NOT NULL,
  `servico_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `carrinho`
--

INSERT INTO `carrinho` (`carrinhoid`, `servico_id`) VALUES
(1, 6),
(2, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `clienteid` int(11) NOT NULL,
  `pessoa_id` int(11) DEFAULT NULL,
  `cliente_deb` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`clienteid`, `pessoa_id`, `cliente_deb`) VALUES
(3, 25, 0),
(4, 26, 0),
(5, 27, 0),
(7, 23, NULL),
(8, 25, 788),
(9, 24, 0),
(10, 19, 7755);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contrato`
--

CREATE TABLE `contrato` (
  `contrato_id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `contrato_valor` float DEFAULT NULL,
  `contrato_data` datetime DEFAULT current_timestamp(),
  `contrato_descontoTipo` varchar(10) NOT NULL,
  `desconto_Valor` float NOT NULL DEFAULT 0,
  `descontomotivo` varchar(100) NOT NULL
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
(1, '1100', '18703480', 'braz camilo', 'brabancia', 'avare', 'SP'),
(7, '12', '18754557', 'parecida do nore', 'dolores da vila', 'tumbrlandia', 'SP'),
(8, '787', '174858', 'brazil novo ', 'bacaiambu', 'avare', 'SP'),
(9, '045', '1744894', 'bharahama', 'reverwas', 'avare', 'SP'),
(10, '044', '1744878', 'bharahama', 'reverwas', 'avare', 'SP');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `idenddereco`
-- (Veja abaixo para a view atual)
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
  `servico_id` int(11) DEFAULT NULL,
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
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `pessoa_id` int(11) NOT NULL,
  `pessoa_ind` varchar(2) NOT NULL,
  `pessoa_cpfcnpj` varchar(14) NOT NULL,
  `pessoa_nome` varchar(90) NOT NULL,
  `pessoa_email` varchar(45) DEFAULT NULL,
  `pesoa_cargo` int(1) DEFAULT NULL,
  `pessoa_endereco` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`pessoa_id`, `pessoa_ind`, `pessoa_cpfcnpj`, `pessoa_nome`, `pessoa_email`, `pesoa_cargo`, `pessoa_endereco`) VALUES
(19, 'PF', '43762393800', 'Maikon', 'maikon.@maikon', 1, NULL),
(20, 'PF', '19380128010', 'Pedro joao', 'maikon.@maikon', 1, NULL),
(22, 'PF', '71735074055', 'Pedro', 'maikonmoren@gmail.com', 2, 7),
(23, 'PF', '78798635200', 'Andressa', 'andressa@gmail.com', 2, 7),
(24, 'PF', '78793252004', 'Bianca Antunes da silva', 'bianquinha_milGrau@gmail.com', 2, 7),
(25, 'PF', '98756821411', 'Thomas nobutico', 'thominha@gmail.com', 2, 8),
(26, 'PF', '64556484', 'Jõao pessoa', 'Joao.pessoa@uol.com.br', 2, 9),
(27, 'PF', '64556484774', 'Jõao pessoa', 'Joao.pessoa@uol.com.br', 2, 10),
(28, 'PF', '402.041.220-07', 'Maikon dos santos', 'odsadih.siajosi@ksd', 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `rh`
--

CREATE TABLE `rh` (
  `rh_id` int(11) NOT NULL,
  `rh_inicio` date NOT NULL,
  `rh_termino` date DEFAULT NULL,
  `pessoa_pessoa_id` int(11) NOT NULL,
  `cargo_cargo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `servico` (
  `servico_id` int(11) NOT NULL,
  `servico_tipo` varchar(40) DEFAULT NULL,
  `servico_valor` float DEFAULT NULL,
  `servico_nome` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
CREATE TABLE `tab_cliente` (
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
CREATE TABLE `tab_usu` (
`Código` int(11)
,`Nome` varchar(90)
,`Login` varchar(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `tab_usucad`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `tab_usucad` (
`codigo` int(11)
,`nome` varchar(90)
,`Cpf` varchar(14)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `tab_usuncad`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `tab_usuncad` (
`codigo` int(11)
,`nome` varchar(90)
,`Cpf` varchar(14)
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
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL,
  `usuario_senha` varchar(80) NOT NULL,
  `usuario_status` int(11) NOT NULL,
  `usuario_notificacao` varchar(120) DEFAULT NULL,
  `pessoa_pessoa_id` int(11) NOT NULL,
  `usuario_login` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `usuario_senha`, `usuario_status`, `usuario_notificacao`, `pessoa_pessoa_id`, `usuario_login`) VALUES
(3, 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, 19, 'maikon.rosa'),
(4, '698dc19d489c4e4db73e28a713eab07b', 1, NULL, 19, 'sistema');

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
-- Estrutura stand-in para vista `vw_carrinho`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_carrinho` (
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
CREATE TABLE `vw_cli` (
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
-- Estrutura stand-in para vista `vw_funcionario`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_funcionario` (
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
CREATE TABLE `vw_login` (
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
CREATE TABLE `vw_pessoa_usuario` (
`UsuarioID` int(11)
,`CPF` varchar(14)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_servicos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_servicos` (
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
CREATE TABLE `vw_tab_atualiza_usu` (
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
CREATE TABLE `vw_tab_servico` (
`Código` int(11)
,`Nome` varchar(40)
,`Valor` float
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
-- Estrutura para vista `idenddereco`
--
DROP TABLE IF EXISTS `idenddereco`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `idenddereco`  AS  select `endereco`.`endereco_id` AS `id`,`endereco`.`endereco_cep` AS `c`,`endereco`.`endereco_numero` AS `n` from `endereco` ;

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
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`agenda_id`),
  ADD KEY `agenda_usuario` (`agenda_usuario`);

--
-- Índices para tabela `baia`
--
ALTER TABLE `baia`
  ADD PRIMARY KEY (`baia_id`);

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
-- Índices para tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`carrinhoid`),
  ADD KEY `servico_id` (`servico_id`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`clienteid`),
  ADD KEY `pessoa_id` (`pessoa_id`);

--
-- Índices para tabela `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`contrato_id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`endereco_id`);

--
-- Índices para tabela `item_contrato`
--
ALTER TABLE `item_contrato`
  ADD KEY `contrato_id` (`contrato_id`),
  ADD KEY `servico_id` (`servico_id`);

--
-- Índices para tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`pessoa_id`),
  ADD KEY `pessoa_ibfk_1` (`pessoa_endereco`);

--
-- Índices para tabela `rh`
--
ALTER TABLE `rh`
  ADD PRIMARY KEY (`rh_id`),
  ADD KEY `pessoa_pessoa_id` (`pessoa_pessoa_id`),
  ADD KEY `cargo_cargo_id` (`cargo_cargo_id`);

--
-- Índices para tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`servico_id`);

--
-- Índices para tabela `telefone`
--
ALTER TABLE `telefone`
  ADD KEY `pessoa_pessoa_id` (`pessoa_pessoa_id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`),
  ADD KEY `pessoa_pessoa_id` (`pessoa_pessoa_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agenda`
--
ALTER TABLE `agenda`
  MODIFY `agenda_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `baia`
--
ALTER TABLE `baia`
  MODIFY `baia_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `calendario`
--
ALTER TABLE `calendario`
  MODIFY `calendario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `clienteid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `endereco_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `pessoa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `rh`
--
ALTER TABLE `rh`
  MODIFY `rh_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `servico_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
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
