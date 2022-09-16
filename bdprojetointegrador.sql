-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29-Ago-2022 às 20:23
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdprojetointegrador`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbdoacao`
--

CREATE TABLE `tbdoacao` (
  `codDoacao` int(11) NOT NULL,
  `codUsuario` int(11) NOT NULL,
  `codProdutos` int(11) NOT NULL,
  `codDonatario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbdonatario`
--

CREATE TABLE `tbdonatario` (
  `codDonatario` int(11) NOT NULL,
  `nomeAssi` varchar(45) NOT NULL,
  `telefoneDonatario` char(15) NOT NULL,
  `telefoneResidencialDonatario` char(14) DEFAULT NULL,
  `endereco` varchar(100) NOT NULL,
  `cpf` char(15) NOT NULL,
  `dataDeNascimento` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `sexoDonatario` char(1) NOT NULL DEFAULT 'F' CHECK (`sexoDonatario` in ('F','M'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbparceiro`
--

CREATE TABLE `tbparceiro` (
  `codParceiro` int(11) NOT NULL,
  `nomeParceiro` varchar(50) NOT NULL,
  `enderecoParceiro` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbperguntas`
--

CREATE TABLE `tbperguntas` (
  `codPerguntas` int(11) NOT NULL,
  `perguntas` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbperguntas`
--

INSERT INTO `tbperguntas` (`codPerguntas`, `perguntas`) VALUES
(1, 'Realizou algum programa de reabilitacao?'),
(2, 'Possui acompanhamento clinico regular?'),
(3, 'Tem déficiencia auditivo ?'),
(4, 'Tem déficiencia intelectual ?'),
(5, 'Possui alguma doença associada ?'),
(6, 'Usa algum medicamento?'),
(7, 'Possui acompanhamento clínico regular?'),
(8, 'Esta em tratamento?'),
(9, 'necessita de ajuda de outra pessoa para realizar deslocamento, transferência, alimentação ou higiene'),
(10, 'Consegue se locomover de forma independente para frequentar as atividades?'),
(11, 'O paciente realizou algum tratamento prévio ou esta em tratamento.(pós operatorio) ?'),
(12, 'Recebe algum auxilio? Se sim qual?'),
(13, 'Qual é a sua renda familiar total?(A soma de todas as pessoas que moram na sua casa) ?'),
(14, 'Situação de moradia?'),
(15, 'Comprovante de residencia'),
(16, 'Prescrição medica de adptaçoes'),
(17, 'Com suas palavras descreva o motivo que vc deve receber essa doação ?');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbprodutos`
--

CREATE TABLE `tbprodutos` (
  `codProdutos` int(11) NOT NULL,
  `produto` varchar(50) NOT NULL,
  `dataDaDoacao` date DEFAULT NULL,
  `dataDaPublicacao` date NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `codParceiro` int(11) NOT NULL,
  `codPerguntas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbusuarios`
--

CREATE TABLE `tbusuarios` (
  `codUsuario` int(11) NOT NULL,
  `nomeUso` varchar(100) NOT NULL,
  `sexoUso` char(1) NOT NULL DEFAULT 'F' CHECK (`sexoUso` in ('F','M')),
  `endereco` varchar(100) NOT NULL,
  `telefoneResidendialUso` char(15) NOT NULL,
  `telefoneUso` char(15) NOT NULL,
  `dataDeNascimento` date DEFAULT NULL,
  `cpf` char(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `codPerguntas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbdoacao`
--
ALTER TABLE `tbdoacao`
  ADD PRIMARY KEY (`codDoacao`),
  ADD KEY `codUsuario` (`codUsuario`),
  ADD KEY `codProdutos` (`codProdutos`),
  ADD KEY `codDonatario` (`codDonatario`);

--
-- Índices para tabela `tbdonatario`
--
ALTER TABLE `tbdonatario`
  ADD PRIMARY KEY (`codDonatario`);

--
-- Índices para tabela `tbparceiro`
--
ALTER TABLE `tbparceiro`
  ADD PRIMARY KEY (`codParceiro`);

--
-- Índices para tabela `tbperguntas`
--
ALTER TABLE `tbperguntas`
  ADD PRIMARY KEY (`codPerguntas`);

--
-- Índices para tabela `tbprodutos`
--
ALTER TABLE `tbprodutos`
  ADD PRIMARY KEY (`codProdutos`),
  ADD KEY `codParceiro` (`codParceiro`),
  ADD KEY `codPerguntas` (`codPerguntas`);

--
-- Índices para tabela `tbusuarios`
--
ALTER TABLE `tbusuarios`
  ADD PRIMARY KEY (`codUsuario`),
  ADD KEY `codPerguntas` (`codPerguntas`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbdoacao`
--
ALTER TABLE `tbdoacao`
  MODIFY `codDoacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbdonatario`
--
ALTER TABLE `tbdonatario`
  MODIFY `codDonatario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbparceiro`
--
ALTER TABLE `tbparceiro`
  MODIFY `codParceiro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbperguntas`
--
ALTER TABLE `tbperguntas`
  MODIFY `codPerguntas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `tbprodutos`
--
ALTER TABLE `tbprodutos`
  MODIFY `codProdutos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbusuarios`
--
ALTER TABLE `tbusuarios`
  MODIFY `codUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tbdoacao`
--
ALTER TABLE `tbdoacao`
  ADD CONSTRAINT `tbdoacao_ibfk_1` FOREIGN KEY (`codUsuario`) REFERENCES `tbusuarios` (`codUsuario`),
  ADD CONSTRAINT `tbdoacao_ibfk_2` FOREIGN KEY (`codProdutos`) REFERENCES `tbprodutos` (`codProdutos`),
  ADD CONSTRAINT `tbdoacao_ibfk_3` FOREIGN KEY (`codDonatario`) REFERENCES `tbdonatario` (`codDonatario`);

--
-- Limitadores para a tabela `tbprodutos`
--
ALTER TABLE `tbprodutos`
  ADD CONSTRAINT `tbprodutos_ibfk_1` FOREIGN KEY (`codParceiro`) REFERENCES `tbparceiro` (`codParceiro`),
  ADD CONSTRAINT `tbprodutos_ibfk_2` FOREIGN KEY (`codPerguntas`) REFERENCES `tbperguntas` (`codPerguntas`);

--
-- Limitadores para a tabela `tbusuarios`
--
ALTER TABLE `tbusuarios`
  ADD CONSTRAINT `tbusuarios_ibfk_1` FOREIGN KEY (`codPerguntas`) REFERENCES `tbperguntas` (`codPerguntas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
