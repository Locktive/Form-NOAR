-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Set-2023 às 14:43
-- Versão do servidor: 8.0.21
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bombeiro_noar`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acompanhante`
--

CREATE TABLE `acompanhante` (
  `id_acompanhante` int NOT NULL,
  `nome` varchar(80) NOT NULL,
  `idade` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bombeiro`
--

CREATE TABLE `bombeiro` (
  `id_bombeiro` int NOT NULL,
  `Nome` varchar(80) NOT NULL,
  `Data_inicio` date NOT NULL,
  `Operante` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` int NOT NULL,
  `Nome_paciente` varchar(80) DEFAULT NULL,
  `Idade_paciente` int DEFAULT NULL,
  `Acompanhante` varchar(80) DEFAULT NULL,
  `idade_acompanhante` int DEFAULT NULL,
  `telefone` int DEFAULT NULL,
  `RG_cpf_paciente` int DEFAULT NULL,
  `Local_do_ocorrido` varchar(160) NOT NULL,
  `sexo_paciente` varchar(1) DEFAULT NULL,
  `fk_acompanhante` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sinais_e_sintomas`
--

CREATE TABLE `sinais_e_sintomas` (
  `id_sinal_sintoma` int NOT NULL,
  `codigo_selecoes` int NOT NULL,
  `outros` varchar(100) NOT NULL,
  `codigo_tipopupilas` int NOT NULL,
  `codigo_reagentepupila` int NOT NULL,
  `codigo_cianose` int NOT NULL,
  `cod_edema` int NOT NULL,
  `cod_hemorragia` int NOT NULL,
  `cod_parada` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_ocorrencia_pre_hospitalar`
--

CREATE TABLE `tipo_ocorrencia_pre_hospitalar` (
  `id_tipo_ocorrencia` int NOT NULL,
  `codigo_selecoes` int NOT NULL,
  `outros` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `acompanhante`
--
ALTER TABLE `acompanhante`
  ADD PRIMARY KEY (`id_acompanhante`);

--
-- Índices para tabela `bombeiro`
--
ALTER TABLE `bombeiro`
  ADD PRIMARY KEY (`id_bombeiro`);

--
-- Índices para tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`),
  ADD KEY `fk_acompanhante` (`fk_acompanhante`);

--
-- Índices para tabela `tipo_ocorrencia_pre_hospitalar`
--
ALTER TABLE `tipo_ocorrencia_pre_hospitalar`
  ADD PRIMARY KEY (`id_tipo_ocorrencia`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acompanhante`
--
ALTER TABLE `acompanhante`
  MODIFY `id_acompanhante` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bombeiro`
--
ALTER TABLE `bombeiro`
  MODIFY `id_bombeiro` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_ocorrencia_pre_hospitalar`
--
ALTER TABLE `tipo_ocorrencia_pre_hospitalar`
  MODIFY `id_tipo_ocorrencia` int NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `fk_acompanhante` FOREIGN KEY (`fk_acompanhante`) REFERENCES `acompanhante` (`id_acompanhante`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
