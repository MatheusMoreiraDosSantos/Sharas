-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 23-Ago-2019 às 16:37
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
-- Database: `sharasv1`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `animal`
--

CREATE TABLE `animal` (
  `animal_id` int(11) NOT NULL,
  `animal_nome` varchar(80) DEFAULT NULL,
  `animal_registro` varchar(20) DEFAULT NULL,
  `animal_proprietario` int(11) DEFAULT NULL,
  `animal_criador` int(11) DEFAULT NULL,
  `animal_nascimento` date DEFAULT NULL,
  `animal_sexo` varchar(30) DEFAULT NULL,
  `animal_pelagem` varchar(80) DEFAULT NULL,
  `animal_modalidade` varchar(80) DEFAULT NULL,
  `animal_treinador` int(11) DEFAULT NULL,
  `animal_veterinario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `calendario`
--

CREATE TABLE `calendario` (
  `calendario_id` int(11) NOT NULL,
  `calendario_data` date DEFAULT NULL,
  `calendario_anotacao` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `consulta`
--

CREATE TABLE `consulta` (
  `consulta_id` int(11) NOT NULL,
  `consulta_animal` int(11) DEFAULT NULL,
  `consulta_veterinario` int(11) DEFAULT NULL,
  `consulta_inicio` date DEFAULT NULL,
  `consulta_termino` date DEFAULT NULL,
  `consulta_diagnostico` varchar(500) DEFAULT NULL,
  `consulta_tratamento` varchar(500) DEFAULT NULL,
  `consulta_valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ferrajamento`
--

CREATE TABLE `ferrajamento` (
  `ferrajamento_id` int(11) NOT NULL,
  `ferrajamento_inicio` date DEFAULT NULL,
  `ferrajamento_termino` date DEFAULT NULL,
  `ferrajamento_ferrador` int(11) DEFAULT NULL,
  `ferrajamento_animal` int(11) DEFAULT NULL,
  `ferrajamento_valor` float DEFAULT NULL,
  `ferrajamento_descricao` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `fornecedor_id` int(11) NOT NULL,
  `fornecedor_nome` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_comsumo`
--

CREATE TABLE `item_comsumo` (
  `item_id` int(11) NOT NULL,
  `item_nome` varchar(80) DEFAULT NULL,
  `fornecedor_id` int(11) DEFAULT NULL,
  `item_valor` float DEFAULT NULL,
  `item_compra` date DEFAULT NULL,
  `item_duracao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

CREATE TABLE `log` (
  `log_id` int(11) NOT NULL,
  `log_acao` varchar(20) DEFAULT NULL,
  `log_entidade` varchar(80) DEFAULT NULL,
  `log_usuarioario` int(11) DEFAULT NULL,
  `log_time` varchar(45) DEFAULT NULL,
  `log_how` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `manutencao`
--

CREATE TABLE `manutencao` (
  `manutencao_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `manutencao_salario` float DEFAULT NULL,
  `manutencao_funcao` varchar(500) DEFAULT NULL,
  `manutencao_setor` int(11) DEFAULT NULL,
  `manutencao_anotacao` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `proprietario`
--

CREATE TABLE `proprietario` (
  `proprietario_id` int(11) NOT NULL,
  `proprietario_none` varchar(45) DEFAULT NULL,
  `proprietario_cpf` varchar(11) DEFAULT NULL,
  `proprietario_endereco` varchar(100) DEFAULT NULL,
  `proprietario_cidade` varchar(45) DEFAULT NULL,
  `proprietario_datanasc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `terceiros`
--

CREATE TABLE `terceiros` (
  `terceiros_id` int(11) NOT NULL,
  `terceiros_nome` varchar(80) DEFAULT NULL,
  `terceiros_funcoes` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `treinamento`
--

CREATE TABLE `treinamento` (
  `treinamento_id` int(11) NOT NULL,
  `treinamento_treinador` int(11) DEFAULT NULL,
  `treinamento_animal` int(11) DEFAULT NULL,
  `treinamento_inicio` date DEFAULT NULL,
  `treinamento_termino` date DEFAULT NULL,
  `treinamento_modalidade` varchar(80) DEFAULT NULL,
  `treinamento_valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL,
  `usuario_login` varchar(50) DEFAULT NULL,
  `usuario_senha` varchar(15) DEFAULT NULL,
  `usuario_tipo` int(11) DEFAULT NULL,
  `usuarioario_status` int(11) DEFAULT NULL,
  `usuarioario_notificacao` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`animal_id`),
  ADD KEY `animal_proprietario` (`animal_proprietario`),
  ADD KEY `animal_criador` (`animal_criador`),
  ADD KEY `animal_treinador` (`animal_treinador`),
  ADD KEY `animal_veterinario` (`animal_veterinario`);

--
-- Indexes for table `calendario`
--
ALTER TABLE `calendario`
  ADD PRIMARY KEY (`calendario_id`);

--
-- Indexes for table `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`consulta_id`),
  ADD KEY `consulta_animal` (`consulta_animal`),
  ADD KEY `consulta_veterinario` (`consulta_veterinario`);

--
-- Indexes for table `ferrajamento`
--
ALTER TABLE `ferrajamento`
  ADD PRIMARY KEY (`ferrajamento_id`),
  ADD KEY `ferrajamento_ferrador` (`ferrajamento_ferrador`),
  ADD KEY `ferrajamento_animal` (`ferrajamento_animal`);

--
-- Indexes for table `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`fornecedor_id`);

--
-- Indexes for table `item_comsumo`
--
ALTER TABLE `item_comsumo`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `fornecedor_id` (`fornecedor_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_usuarioario` (`log_usuarioario`);

--
-- Indexes for table `manutencao`
--
ALTER TABLE `manutencao`
  ADD PRIMARY KEY (`manutencao_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `pastagem`
--
ALTER TABLE `pastagem`
  ADD PRIMARY KEY (`pastagem_id`);

--
-- Indexes for table `proprietario`
--
ALTER TABLE `proprietario`
  ADD PRIMARY KEY (`proprietario_id`);

--
-- Indexes for table `terceiros`
--
ALTER TABLE `terceiros`
  ADD PRIMARY KEY (`terceiros_id`);

--
-- Indexes for table `treinamento`
--
ALTER TABLE `treinamento`
  ADD PRIMARY KEY (`treinamento_id`),
  ADD KEY `treinamento_treinador` (`treinamento_treinador`),
  ADD KEY `treinamento_animal` (`treinamento_animal`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `usuario_login` (`usuario_login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `animal`
--
ALTER TABLE `animal`
  MODIFY `animal_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `calendario`
--
ALTER TABLE `calendario`
  MODIFY `calendario_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consulta`
--
ALTER TABLE `consulta`
  MODIFY `consulta_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ferrajamento`
--
ALTER TABLE `ferrajamento`
  MODIFY `ferrajamento_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `fornecedor_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_comsumo`
--
ALTER TABLE `item_comsumo`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manutencao`
--
ALTER TABLE `manutencao`
  MODIFY `manutencao_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pastagem`
--
ALTER TABLE `pastagem`
  MODIFY `pastagem_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proprietario`
--
ALTER TABLE `proprietario`
  MODIFY `proprietario_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terceiros`
--
ALTER TABLE `terceiros`
  MODIFY `terceiros_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `treinamento`
--
ALTER TABLE `treinamento`
  MODIFY `treinamento_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`animal_proprietario`) REFERENCES `proprietario` (`proprietario_id`),
  ADD CONSTRAINT `animal_ibfk_2` FOREIGN KEY (`animal_criador`) REFERENCES `terceiros` (`terceiros_id`),
  ADD CONSTRAINT `animal_ibfk_3` FOREIGN KEY (`animal_treinador`) REFERENCES `usuario` (`usuario_id`),
  ADD CONSTRAINT `animal_ibfk_4` FOREIGN KEY (`animal_veterinario`) REFERENCES `usuario` (`usuario_id`);

--
-- Limitadores para a tabela `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`consulta_animal`) REFERENCES `animal` (`animal_id`),
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`consulta_veterinario`) REFERENCES `usuario` (`usuario_id`);

--
-- Limitadores para a tabela `ferrajamento`
--
ALTER TABLE `ferrajamento`
  ADD CONSTRAINT `ferrajamento_ibfk_1` FOREIGN KEY (`ferrajamento_ferrador`) REFERENCES `terceiros` (`terceiros_id`),
  ADD CONSTRAINT `ferrajamento_ibfk_2` FOREIGN KEY (`ferrajamento_animal`) REFERENCES `animal` (`animal_id`);

--
-- Limitadores para a tabela `item_comsumo`
--
ALTER TABLE `item_comsumo`
  ADD CONSTRAINT `item_comsumo_ibfk_1` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor` (`fornecedor_id`);

--
-- Limitadores para a tabela `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_ibfk_1` FOREIGN KEY (`log_usuarioario`) REFERENCES `usuario` (`usuario_id`);

--
-- Limitadores para a tabela `manutencao`
--
ALTER TABLE `manutencao`
  ADD CONSTRAINT `manutencao_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`);

--
-- Limitadores para a tabela `treinamento`
--
ALTER TABLE `treinamento`
  ADD CONSTRAINT `treinamento_ibfk_1` FOREIGN KEY (`treinamento_treinador`) REFERENCES `usuario` (`usuario_id`),
  ADD CONSTRAINT `treinamento_ibfk_2` FOREIGN KEY (`treinamento_animal`) REFERENCES `animal` (`animal_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
