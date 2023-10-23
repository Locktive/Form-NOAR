-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Out-2023 às 14:39
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
-- Banco de dados: `noar_bombeiro`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acompanhante`
--

CREATE TABLE `acompanhante` (
  `id_acompanhante` int NOT NULL,
  `nome` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idade` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `anamnese_emergencial`
--

CREATE TABLE `anamnese_emergencial` (
  `id_anamnese_emer` int NOT NULL,
  `o_que_ocorreu` varchar(200) NOT NULL,
  `quanto_tempo_ocorreu` varchar(300) DEFAULT NULL,
  `quais_problemas` varchar(300) DEFAULT NULL,
  `quais_medicamentos` varchar(300) DEFAULT NULL,
  `aconteceu_outras_vezes` tinyint(1) NOT NULL,
  `usa_medicacao` tinyint(1) NOT NULL,
  `horario_ultima_medicacao` time DEFAULT NULL,
  `alergias` varchar(300) DEFAULT NULL,
  `alergico` tinyint(1) NOT NULL,
  `ingeriu_mais_de_6hrs` tinyint(1) NOT NULL,
  `ingeriu_que_hrs` time DEFAULT NULL,
  `possui_problema_saude` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `anamnese_gestacional`
--

CREATE TABLE `anamnese_gestacional` (
  `id_anamnese_gest` int NOT NULL,
  `periodo` varchar(80) DEFAULT NULL,
  `pre_natal` tinyint(1) NOT NULL,
  `medico_pre_natal` varchar(120) DEFAULT NULL,
  `possibilidade_complicacoes` tinyint(1) NOT NULL,
  `primeiro_filho` tinyint(1) NOT NULL,
  `quantos_filhos` int DEFAULT NULL,
  `inicio_contracoes` time DEFAULT NULL,
  `duracao_contracoes` varchar(20) DEFAULT NULL,
  `intervalo_contracoes` varchar(20) DEFAULT NULL,
  `pressao_quadril_ou_evacuar` tinyint(1) NOT NULL,
  `ruptura_bolsa` tinyint(1) NOT NULL,
  `inspecao_visual` tinyint(1) NOT NULL,
  `parto_realizado` tinyint(1) NOT NULL,
  `hora_nascimento` time DEFAULT NULL,
  `sexo_bebe` varchar(1) DEFAULT NULL,
  `nome_do_bebe` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ataduras`
--

CREATE TABLE `ataduras` (
  `id_atadura` int NOT NULL,
  `tamanho` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `qtde` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao_cinematica`
--

CREATE TABLE `avaliacao_cinematica` (
  `id_cinematica` int NOT NULL,
  `escolhas` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bombeiro`
--

CREATE TABLE `bombeiro` (
  `id_bombeiro` int NOT NULL,
  `Nome` varchar(80) NOT NULL,
  `Data_inicio` date NOT NULL,
  `Operante` tinyint(1) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `adm` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `bombeiro`
--

INSERT INTO `bombeiro` (`id_bombeiro`, `Nome`, `Data_inicio`, `Operante`, `codigo`, `senha`, `adm`) VALUES
(1, 'adm_teste', '2023-10-16', 1, '0000000001', 'senha', 1),
(2, 'boneco', '2023-10-16', 1, '0000000002', 'boneco', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `colar`
--

CREATE TABLE `colar` (
  `id_colar` int NOT NULL,
  `tamanho` varchar(5) NOT NULL,
  `tamanho_outro` varchar(2) DEFAULT NULL,
  `qtde` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `decisao_transporte`
--

CREATE TABLE `decisao_transporte` (
  `id_decisao_transporte` int NOT NULL,
  `transporte_opcao` int DEFAULT NULL,
  `mandante` varchar(150) DEFAULT NULL,
  `socorrista1` varchar(150) DEFAULT NULL,
  `socorrista2` varchar(150) DEFAULT NULL,
  `socorrista3` varchar(150) DEFAULT NULL,
  `demandante` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_de_conducao`
--

CREATE TABLE `forma_de_conducao` (
  `id_forma_conducao` int NOT NULL,
  `opcao_escolhida` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `kits`
--

CREATE TABLE `kits` (
  `id_KITs` int NOT NULL,
  `tamanho` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `qtde` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `materiais_deixados_hospital`
--

CREATE TABLE `materiais_deixados_hospital` (
  `id_materiais_hospital` int NOT NULL,
  `base_establizador` int NOT NULL,
  `fk_colar` int NOT NULL,
  `coxins_estabilizador` int NOT NULL,
  `KED_adulto` tinyint(1) NOT NULL,
  `KED_qtde` int NOT NULL,
  `maca_rigida` int NOT NULL,
  `TTF_adulto` tinyint(1) NOT NULL,
  `TTF_qtde` int NOT NULL,
  `tirante_aranha` int NOT NULL,
  `tirante_cabeca` int NOT NULL,
  `canula` int NOT NULL,
  `outros` varchar(50) NOT NULL,
  `outros_qtde` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `materiais_descartaveis`
--

CREATE TABLE `materiais_descartaveis` (
  `id_materiais_descartaveis` int NOT NULL,
  `fk_ataduras` int NOT NULL,
  `cateter__tp_oculos` int NOT NULL,
  `compressa_comum` int NOT NULL,
  `fk_KITs` int NOT NULL,
  `luvas_descartaveis` int NOT NULL,
  `mascara_descartavel` int NOT NULL,
  `manta_luminizada` int NOT NULL,
  `pas_do_dea` int NOT NULL,
  `sonda_de_aspiracao` int NOT NULL,
  `soro_fisiologico` int NOT NULL,
  `fk_tala_pap` int NOT NULL,
  `outros` varchar(50) DEFAULT NULL,
  `outros_qtde` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `meios_auxiliares`
--

CREATE TABLE `meios_auxiliares` (
  `id_meio_auxiliar` int NOT NULL,
  `celesc` tinyint(1) DEFAULT NULL,
  `defesa_civil` tinyint(1) DEFAULT NULL,
  `igp/pc` tinyint(1) DEFAULT NULL,
  `cod_policia` varchar(4) DEFAULT NULL,
  `CIT` tinyint(1) DEFAULT NULL,
  `outro` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `objeto_recolhido`
--

CREATE TABLE `objeto_recolhido` (
  `id_recolhidos` int NOT NULL,
  `descricao` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `observacoes`
--

CREATE TABLE `observacoes` (
  `id_observ` int NOT NULL,
  `observacoes` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `fk_acompanhante` int DEFAULT NULL,
  `gravidez` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `problemas_encontrado_suspeitos`
--

CREATE TABLE `problemas_encontrado_suspeitos` (
  `id_problemas_suspeitos` int NOT NULL,
  `codigo_selecoes` int NOT NULL,
  `outros` varchar(100) DEFAULT NULL,
  `transporte_outros` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `procedimentos_efetuados`
--

CREATE TABLE `procedimentos_efetuados` (
  `id_procedimentos` int NOT NULL,
  `codigo_selecoes` varchar(37) DEFAULT NULL,
  `meio_auxiliar_fk` int NOT NULL,
  `uso_colar_tmn` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `oxigenoterapia_lpm` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reanimador_lpm` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `queimadura`
--

CREATE TABLE `queimadura` (
  `id_queimadura` int NOT NULL,
  `cabeca` int DEFAULT NULL,
  `pescoco` int DEFAULT NULL,
  `tronco_ant` int DEFAULT NULL,
  `tronco_pos` int DEFAULT NULL,
  `genitalia` int DEFAULT NULL,
  `m_inf_direito` int DEFAULT NULL,
  `m_inf_esquerdo` int DEFAULT NULL,
  `m_sup_direito` int DEFAULT NULL,
  `m_sup_esquerdo` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sinais_e_sintomas`
--

CREATE TABLE `sinais_e_sintomas` (
  `id_sinal_sintoma` int NOT NULL,
  `codigo_selecoes` varchar(38) NOT NULL,
  `outros` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `codigo_tipopupilas` int NOT NULL,
  `codigo_reagentepupila` int NOT NULL,
  `codigo_cianose` int NOT NULL,
  `cod_edema` int NOT NULL,
  `cod_hemorragia` int NOT NULL,
  `cod_parada` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `talas_papel`
--

CREATE TABLE `talas_papel` (
  `id_talas` int NOT NULL,
  `tamanho` varchar(3) NOT NULL,
  `qtde` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `teste_de_glasgow`
--

CREATE TABLE `teste_de_glasgow` (
  `id_teste_glasgow` int NOT NULL,
  `adulto` tinyint(1) DEFAULT '1',
  `soma_total` int DEFAULT NULL,
  `nivel_declarado` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_ocorrencia_pre_hospitalar`
--

CREATE TABLE `tipo_ocorrencia_pre_hospitalar` (
  `id_tipo_ocorrencia` int NOT NULL,
  `codigo_selecoes` int NOT NULL,
  `outros` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vitima_era`
--

CREATE TABLE `vitima_era` (
  `id_vit_era` int NOT NULL,
  `escolha` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `acompanhante`
--
ALTER TABLE `acompanhante`
  ADD PRIMARY KEY (`id_acompanhante`);

--
-- Índices para tabela `anamnese_emergencial`
--
ALTER TABLE `anamnese_emergencial`
  ADD PRIMARY KEY (`id_anamnese_emer`);

--
-- Índices para tabela `anamnese_gestacional`
--
ALTER TABLE `anamnese_gestacional`
  ADD PRIMARY KEY (`id_anamnese_gest`);

--
-- Índices para tabela `ataduras`
--
ALTER TABLE `ataduras`
  ADD PRIMARY KEY (`id_atadura`);

--
-- Índices para tabela `avaliacao_cinematica`
--
ALTER TABLE `avaliacao_cinematica`
  ADD PRIMARY KEY (`id_cinematica`);

--
-- Índices para tabela `bombeiro`
--
ALTER TABLE `bombeiro`
  ADD PRIMARY KEY (`id_bombeiro`);

--
-- Índices para tabela `colar`
--
ALTER TABLE `colar`
  ADD PRIMARY KEY (`id_colar`);

--
-- Índices para tabela `decisao_transporte`
--
ALTER TABLE `decisao_transporte`
  ADD PRIMARY KEY (`id_decisao_transporte`);

--
-- Índices para tabela `forma_de_conducao`
--
ALTER TABLE `forma_de_conducao`
  ADD PRIMARY KEY (`id_forma_conducao`);

--
-- Índices para tabela `kits`
--
ALTER TABLE `kits`
  ADD PRIMARY KEY (`id_KITs`);

--
-- Índices para tabela `materiais_deixados_hospital`
--
ALTER TABLE `materiais_deixados_hospital`
  ADD PRIMARY KEY (`id_materiais_hospital`),
  ADD KEY `fk_colar` (`fk_colar`);

--
-- Índices para tabela `materiais_descartaveis`
--
ALTER TABLE `materiais_descartaveis`
  ADD PRIMARY KEY (`id_materiais_descartaveis`),
  ADD KEY `fk_atadura` (`fk_ataduras`),
  ADD KEY `fk_kit` (`fk_KITs`),
  ADD KEY `fk_talas` (`fk_tala_pap`);

--
-- Índices para tabela `meios_auxiliares`
--
ALTER TABLE `meios_auxiliares`
  ADD PRIMARY KEY (`id_meio_auxiliar`);

--
-- Índices para tabela `objeto_recolhido`
--
ALTER TABLE `objeto_recolhido`
  ADD PRIMARY KEY (`id_recolhidos`);

--
-- Índices para tabela `observacoes`
--
ALTER TABLE `observacoes`
  ADD PRIMARY KEY (`id_observ`);

--
-- Índices para tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`),
  ADD KEY `fk_acompanhante` (`fk_acompanhante`);

--
-- Índices para tabela `problemas_encontrado_suspeitos`
--
ALTER TABLE `problemas_encontrado_suspeitos`
  ADD PRIMARY KEY (`id_problemas_suspeitos`);

--
-- Índices para tabela `procedimentos_efetuados`
--
ALTER TABLE `procedimentos_efetuados`
  ADD PRIMARY KEY (`id_procedimentos`),
  ADD KEY `fk_meios_auxiliares` (`meio_auxiliar_fk`);

--
-- Índices para tabela `queimadura`
--
ALTER TABLE `queimadura`
  ADD PRIMARY KEY (`id_queimadura`);

--
-- Índices para tabela `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Índices para tabela `sinais_e_sintomas`
--
ALTER TABLE `sinais_e_sintomas`
  ADD PRIMARY KEY (`id_sinal_sintoma`);

--
-- Índices para tabela `talas_papel`
--
ALTER TABLE `talas_papel`
  ADD PRIMARY KEY (`id_talas`);

--
-- Índices para tabela `teste_de_glasgow`
--
ALTER TABLE `teste_de_glasgow`
  ADD PRIMARY KEY (`id_teste_glasgow`);

--
-- Índices para tabela `tipo_ocorrencia_pre_hospitalar`
--
ALTER TABLE `tipo_ocorrencia_pre_hospitalar`
  ADD PRIMARY KEY (`id_tipo_ocorrencia`);

--
-- Índices para tabela `vitima_era`
--
ALTER TABLE `vitima_era`
  ADD PRIMARY KEY (`id_vit_era`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acompanhante`
--
ALTER TABLE `acompanhante`
  MODIFY `id_acompanhante` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `anamnese_emergencial`
--
ALTER TABLE `anamnese_emergencial`
  MODIFY `id_anamnese_emer` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `anamnese_gestacional`
--
ALTER TABLE `anamnese_gestacional`
  MODIFY `id_anamnese_gest` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ataduras`
--
ALTER TABLE `ataduras`
  MODIFY `id_atadura` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `avaliacao_cinematica`
--
ALTER TABLE `avaliacao_cinematica`
  MODIFY `id_cinematica` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bombeiro`
--
ALTER TABLE `bombeiro`
  MODIFY `id_bombeiro` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `colar`
--
ALTER TABLE `colar`
  MODIFY `id_colar` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `decisao_transporte`
--
ALTER TABLE `decisao_transporte`
  MODIFY `id_decisao_transporte` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `forma_de_conducao`
--
ALTER TABLE `forma_de_conducao`
  MODIFY `id_forma_conducao` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `kits`
--
ALTER TABLE `kits`
  MODIFY `id_KITs` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `materiais_deixados_hospital`
--
ALTER TABLE `materiais_deixados_hospital`
  MODIFY `id_materiais_hospital` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `materiais_descartaveis`
--
ALTER TABLE `materiais_descartaveis`
  MODIFY `id_materiais_descartaveis` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `meios_auxiliares`
--
ALTER TABLE `meios_auxiliares`
  MODIFY `id_meio_auxiliar` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `objeto_recolhido`
--
ALTER TABLE `objeto_recolhido`
  MODIFY `id_recolhidos` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `observacoes`
--
ALTER TABLE `observacoes`
  MODIFY `id_observ` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `problemas_encontrado_suspeitos`
--
ALTER TABLE `problemas_encontrado_suspeitos`
  MODIFY `id_problemas_suspeitos` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `procedimentos_efetuados`
--
ALTER TABLE `procedimentos_efetuados`
  MODIFY `id_procedimentos` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `queimadura`
--
ALTER TABLE `queimadura`
  MODIFY `id_queimadura` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sinais_e_sintomas`
--
ALTER TABLE `sinais_e_sintomas`
  MODIFY `id_sinal_sintoma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `talas_papel`
--
ALTER TABLE `talas_papel`
  MODIFY `id_talas` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `teste_de_glasgow`
--
ALTER TABLE `teste_de_glasgow`
  MODIFY `id_teste_glasgow` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_ocorrencia_pre_hospitalar`
--
ALTER TABLE `tipo_ocorrencia_pre_hospitalar`
  MODIFY `id_tipo_ocorrencia` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vitima_era`
--
ALTER TABLE `vitima_era`
  MODIFY `id_vit_era` int NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `materiais_deixados_hospital`
--
ALTER TABLE `materiais_deixados_hospital`
  ADD CONSTRAINT `fk_colar` FOREIGN KEY (`fk_colar`) REFERENCES `colar` (`id_colar`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `materiais_descartaveis`
--
ALTER TABLE `materiais_descartaveis`
  ADD CONSTRAINT `fk_atadura` FOREIGN KEY (`fk_ataduras`) REFERENCES `ataduras` (`id_atadura`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_kit` FOREIGN KEY (`fk_KITs`) REFERENCES `kits` (`id_KITs`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_talas` FOREIGN KEY (`fk_tala_pap`) REFERENCES `talas_papel` (`id_talas`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `fk_acompanhante` FOREIGN KEY (`fk_acompanhante`) REFERENCES `acompanhante` (`id_acompanhante`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `procedimentos_efetuados`
--
ALTER TABLE `procedimentos_efetuados`
  ADD CONSTRAINT `fk_meios_auxiliares` FOREIGN KEY (`meio_auxiliar_fk`) REFERENCES `meios_auxiliares` (`id_meio_auxiliar`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
