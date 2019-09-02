-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Set-2019 às 02:12
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
(2, 'pf', '43762393800', 'Maikon Cristino Pereira Rosa', 'maikonmoren@gmail.com', '1'),
(3, 'pf', '75115804085', 'dhasuidh', 'jsaoidja.@jfdo', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `rh`
--

CREATE TABLE `rh` (
  `rg_id` int(11) NOT NULL,
  `rh_inicio` date NOT NULL,
  `rh_termino` date NOT NULL,
  `rh_salario` float NOT NULL,
  `rh_horas_dia` int(11) NOT NULL,
  `pessoa_pessoa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Estrutura da tabela `telefone`
--

CREATE TABLE `telefone` (
  `telefone_id` int(11) NOT NULL,
  `telefone_num` varchar(15) NOT NULL,
  `telefone_tipo` int(11) NOT NULL,
  `pessoa_pessoa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='		';

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL,
  `usuario_login` varchar(45) NOT NULL,
  `usuario_senha` varchar(80) NOT NULL,
  `usuario_tipo` int(11) NOT NULL,
  `usuario_status` int(11) NOT NULL,
  `usuario_notificacao` varchar(120) DEFAULT NULL,
  `pessoa_pessoa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `usuario_login`, `usuario_senha`, `usuario_tipo`, `usuario_status`, `usuario_notificacao`, `pessoa_pessoa_id`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 2, 1, NULL, 1),
(2, 'maikon.rosa', 'a89e24d8f469615adf8e2b124f09e9b6', 2, 1, 'teste	', 2),
(3, 'maik', 'ee319e813a48a4d0afffc8523337cfde', 0, 0, 'dfoçaj					', 3);

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
-- Estrutura para vista `vw_at_dados`
--
DROP TABLE IF EXISTS `vw_at_dados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_at_dados`  AS  select `p`.`pessoa_nome` AS `Nome`,`p`.`pessoa_cpfcnpj` AS `CPF`,`u`.`usuario_login` AS `Login`,`u`.`usuario_tipo` AS `Cargo`,`u`.`usuario_status` AS `Status` from (`pessoa` `p` join `usuario` `u`) where `p`.`pessoa_id` = `u`.`pessoa_pessoa_id` ;

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
-- Estrutura para vista `vw_tab_atualiza_usu`
--
DROP TABLE IF EXISTS `vw_tab_atualiza_usu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_tab_atualiza_usu`  AS  select `p`.`pessoa_nome` AS `Nome`,`u`.`usuario_login` AS `Login`,`p`.`pessoa_cpfcnpj` AS `CPF`,`p`.`pessoa_email` AS `Email` from (`pessoa` `p` join `usuario` `u`) where `p`.`pessoa_id` = `u`.`pessoa_pessoa_id` ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`animal_id`),
  ADD KEY `animal_local_idx` (`animal_local`),
  ADD KEY `animal_criador_idx` (`animal_criador`);

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
-- Índices para tabela `carteira_vacina`
--
ALTER TABLE `carteira_vacina`
  ADD PRIMARY KEY (`carteira_vacina_id`),
  ADD KEY `fk_carteira_vacina_vacina1_idx` (`vacina_vacina_id`),
  ADD KEY `fk_carteira_vacina_animal1_idx` (`animal_animal_id`);

--
-- Índices para tabela `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`compra_id`),
  ADD KEY `compra_produto_idx` (`compra_produto`),
  ADD KEY `compra_fornecedor_idx` (`compra_fornecedor`);

--
-- Índices para tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`consulta_id`),
  ADD KEY `consulta_animal_idx` (`consulta_animal`),
  ADD KEY `consulta_veterinario_idx` (`consulta_veterinario`);

--
-- Índices para tabela `conta_banco`
--
ALTER TABLE `conta_banco`
  ADD PRIMARY KEY (`conta_banco_id`),
  ADD UNIQUE KEY `conta_banco_cpfcnpj_UNIQUE` (`conta_banco_cpfcnpj`),
  ADD KEY `fk_conta_banco_usuario1_idx` (`usuario_usuario_id`),
  ADD KEY `fk_conta_banco_banco1_idx` (`banco_banco_id`);

--
-- Índices para tabela `criador`
--
ALTER TABLE `criador`
  ADD PRIMARY KEY (`criador_id`),
  ADD KEY `criador_endereco_idx` (`criador_endereco`),
  ADD KEY `fk_criador_pessoa1_idx` (`pessoa_pessoa_id`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`endereco_id`),
  ADD KEY `fk_endereco_pessoa1_idx` (`pessoa_pessoa_id`);

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
  ADD KEY `ferrajamento_animal_idx` (`ferrajamento_animal`);

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`fornecedor_id`),
  ADD KEY `fk_fornecedor_pessoa1_idx` (`pessoa_pessoa_id`);

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
  ADD PRIMARY KEY (`pessoa_id`),
  ADD UNIQUE KEY `pessoa_id_UNIQUE` (`pessoa_id`);

--
-- Índices para tabela `rh`
--
ALTER TABLE `rh`
  ADD PRIMARY KEY (`rg_id`),
  ADD KEY `fk_rh_pessoa1_idx` (`pessoa_pessoa_id`);

--
-- Índices para tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`servico_id`),
  ADD KEY `fk_servico_pessoa1_idx` (`pessoa_pessoa_id`);

--
-- Índices para tabela `servico_ferrajamento`
--
ALTER TABLE `servico_ferrajamento`
  ADD PRIMARY KEY (`servico_ferrajamento_id`),
  ADD KEY `fk_servico_ferrajamento_servico1_idx` (`servico_servico_id`),
  ADD KEY `fk_servico_ferrajamento_ferrajamento1_idx` (`ferrajamento_ferrajamento_id`);

--
-- Índices para tabela `servico_itens`
--
ALTER TABLE `servico_itens`
  ADD PRIMARY KEY (`servico_itens_id`),
  ADD KEY `fk_servico_itens_estoque1_idx` (`estoque_estoque_id`),
  ADD KEY `fk_servico_itens_servico1_idx` (`servico_servico_id`);

--
-- Índices para tabela `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`telefone_id`),
  ADD KEY `fk_telefone_pessoa1_idx` (`pessoa_pessoa_id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `usuario_id_UNIQUE` (`usuario_id`),
  ADD KEY `fk_usuario_pessoa1_idx` (`pessoa_pessoa_id`);

--
-- Índices para tabela `vacina`
--
ALTER TABLE `vacina`
  ADD PRIMARY KEY (`vacina_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

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
  MODIFY `pessoa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_criador` FOREIGN KEY (`animal_criador`) REFERENCES `criador` (`criador_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `animal_local` FOREIGN KEY (`animal_local`) REFERENCES `pasto` (`pasto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `carteira_vacina`
--
ALTER TABLE `carteira_vacina`
  ADD CONSTRAINT `fk_carteira_vacina_animal1` FOREIGN KEY (`animal_animal_id`) REFERENCES `animal` (`animal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_carteira_vacina_vacina1` FOREIGN KEY (`vacina_vacina_id`) REFERENCES `vacina` (`vacina_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_fornecedor` FOREIGN KEY (`compra_fornecedor`) REFERENCES `fornecedor` (`fornecedor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `compra_produto` FOREIGN KEY (`compra_produto`) REFERENCES `estoque` (`estoque_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_animal` FOREIGN KEY (`consulta_animal`) REFERENCES `animal` (`animal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `consulta_veterinario` FOREIGN KEY (`consulta_veterinario`) REFERENCES `usuario` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `conta_banco`
--
ALTER TABLE `conta_banco`
  ADD CONSTRAINT `fk_conta_banco_banco1` FOREIGN KEY (`banco_banco_id`) REFERENCES `banco` (`banco_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_conta_banco_usuario1` FOREIGN KEY (`usuario_usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `criador`
--
ALTER TABLE `criador`
  ADD CONSTRAINT `criador_endereco` FOREIGN KEY (`criador_endereco`) REFERENCES `endereco` (`endereco_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_criador_pessoa1` FOREIGN KEY (`pessoa_pessoa_id`) REFERENCES `pessoa` (`pessoa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `fk_endereco_pessoa1` FOREIGN KEY (`pessoa_pessoa_id`) REFERENCES `pessoa` (`pessoa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `ferrajamento`
--
ALTER TABLE `ferrajamento`
  ADD CONSTRAINT `ferrajamento_animal` FOREIGN KEY (`ferrajamento_animal`) REFERENCES `animal` (`animal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD CONSTRAINT `fk_fornecedor_pessoa1` FOREIGN KEY (`pessoa_pessoa_id`) REFERENCES `pessoa` (`pessoa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `rh`
--
ALTER TABLE `rh`
  ADD CONSTRAINT `fk_rh_pessoa1` FOREIGN KEY (`pessoa_pessoa_id`) REFERENCES `pessoa` (`pessoa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `servico`
--
ALTER TABLE `servico`
  ADD CONSTRAINT `fk_servico_pessoa1` FOREIGN KEY (`pessoa_pessoa_id`) REFERENCES `pessoa` (`pessoa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `servico_ferrajamento`
--
ALTER TABLE `servico_ferrajamento`
  ADD CONSTRAINT `fk_servico_ferrajamento_ferrajamento1` FOREIGN KEY (`ferrajamento_ferrajamento_id`) REFERENCES `ferrajamento` (`ferrajamento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servico_ferrajamento_servico1` FOREIGN KEY (`servico_servico_id`) REFERENCES `servico` (`servico_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `servico_itens`
--
ALTER TABLE `servico_itens`
  ADD CONSTRAINT `fk_servico_itens_estoque1` FOREIGN KEY (`estoque_estoque_id`) REFERENCES `estoque` (`estoque_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servico_itens_servico1` FOREIGN KEY (`servico_servico_id`) REFERENCES `servico` (`servico_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `fk_telefone_pessoa1` FOREIGN KEY (`pessoa_pessoa_id`) REFERENCES `pessoa` (`pessoa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_pessoa1` FOREIGN KEY (`pessoa_pessoa_id`) REFERENCES `pessoa` (`pessoa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
