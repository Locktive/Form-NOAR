-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Nov-2023 às 12:14
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
  `nome` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idade` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `anamnese_emergencial`
--

CREATE TABLE `anamnese_emergencial` (
  `id_anamnese_emer` int NOT NULL,
  `o_que_ocorreu` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `quanto_tempo_ocorreu` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quais_problemas` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quais_medicamentos` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `aconteceu_outras_vezes` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `usa_medicacao` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `horario_ultima_medicacao` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alergias` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alergico` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `ingeriu_mais_de_6hrs` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `ingeriu_que_hrs` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `possui_problema_saude` varchar(2) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `anamnese_gestacional`
--

CREATE TABLE `anamnese_gestacional` (
  `id_anamnese_gest` int NOT NULL,
  `periodo` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pre_natal` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `medico_pre_natal` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `possibilidade_complicacoes` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `primeiro_filho` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `quantos_filhos` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `inicio_contracoes` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `duracao_contracoes` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `intervalo_contracoes` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pressao_quadril_ou_evacuar` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `ruptura_bolsa` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `inspecao_visual` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `parto_realizado` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `hora_nascimento` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sexo_bebe` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nome_do_bebe` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ataduras`
--

CREATE TABLE `ataduras` (
  `id_atadura` int NOT NULL,
  `tamanho` varchar(3) COLLATE utf8mb4_general_ci NOT NULL,
  `qtde` varchar(5) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao_cinematica`
--

CREATE TABLE `avaliacao_cinematica` (
  `id_cinematica` int NOT NULL,
  `escolhas` varchar(7) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bombeiro`
--

CREATE TABLE `bombeiro` (
  `id_bombeiro` int NOT NULL,
  `Nome` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `Data_inicio` date NOT NULL,
  `Operante` tinyint(1) NOT NULL,
  `codigo` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `senha` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
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
  `qtde_colar` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `tamanho_colar` varchar(2) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `decisao_transporte`
--

CREATE TABLE `decisao_transporte` (
  `id_decisao_transporte` int NOT NULL,
  `transporte_opcao` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `motorista` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `socorrista1` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `socorrista2` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `socorrista3` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `demandante` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ferimentos_corpo`
--

CREATE TABLE `ferimentos_corpo` (
  `id_ferimentos` int NOT NULL,
  `fratura_luxacao_entorse` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `ferimentos_diversos` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `hemorragias` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `evisceracao` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `FAB_FAF` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `amputacao` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `queimadura_1_grau` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `queimadura_2_grau` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `queimadura_3_grau` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `queimadura_4_grau` varchar(500) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `finalizacao_ocorrencia`
--

CREATE TABLE `finalizacao_ocorrencia` (
  `id_finalizacao` int NOT NULL,
  `n_USB` int NOT NULL,
  `despachante` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `H_CH` int NOT NULL,
  `km_final` int NOT NULL,
  `cod_IR_PS` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `codigo_SIA/SUS` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_de_conducao`
--

CREATE TABLE `forma_de_conducao` (
  `id_forma_conducao` int NOT NULL,
  `opcao_escolhida` varchar(3) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ked`
--

CREATE TABLE `ked` (
  `id_KED` int NOT NULL,
  `qtde_ked` varchar(3) COLLATE utf8mb4_general_ci NOT NULL,
  `tamanho_ked` varchar(2) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `kits`
--

CREATE TABLE `kits` (
  `id_kits` int NOT NULL,
  `H_P_G` varchar(3) COLLATE utf8mb4_general_ci NOT NULL,
  `qtde` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `materiais_descartaveis`
--

CREATE TABLE `materiais_descartaveis` (
  `id_materiais_hospital` int NOT NULL,
  `fk_ataduras` int NOT NULL,
  `fk_kit` int NOT NULL,
  `fk_talas` int NOT NULL,
  `cateter_tp_oculos_qtde` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `compressa_comum_qtde` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `luvas_descartaveis_qtde` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `mascaras_descartaveis_qtde` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `manta_luminizada_qtde` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `pas_do_dea_qtde` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `sonda_de_aspiracao_qtde` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `soro_fisiologico_qtde` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `outros` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `materiais_hospital`
--

CREATE TABLE `materiais_hospital` (
  `id_materiais_hospital` int NOT NULL,
  `fk_colar` int NOT NULL,
  `fk_KED` int NOT NULL,
  `fk_ttf` int NOT NULL,
  `canula_qtde` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `tirante_cabeca_qtde` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `tirante_aranha_qtde` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `maca_rigida_qtde` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `coxins_estabilizador_qtde` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `base_estabilizador_qtde` varchar(4) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `objeto_recolhido`
--

CREATE TABLE `objeto_recolhido` (
  `id_recolhidos` int NOT NULL,
  `descricao` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `observacoes`
--

CREATE TABLE `observacoes` (
  `id_observ` int NOT NULL,
  `observacoes` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` int NOT NULL,
  `Nome_paciente` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Idade_paciente` int DEFAULT NULL,
  `telefone` int DEFAULT NULL,
  `RG_cpf_paciente` int DEFAULT NULL,
  `Local_do_ocorrido` varchar(160) COLLATE utf8mb4_general_ci NOT NULL,
  `sexo_paciente` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fk_acompanhante` int DEFAULT NULL,
  `gravidez` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `problemas_encontrado_suspeitos`
--

CREATE TABLE `problemas_encontrado_suspeitos` (
  `id_problemas_suspeitos` int NOT NULL,
  `codigo_selecoes` varchar(14) COLLATE utf8mb4_general_ci NOT NULL,
  `outros` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transporte_outros` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `procedimentos_efetuados`
--

CREATE TABLE `procedimentos_efetuados` (
  `id_procedimentos` int NOT NULL,
  `codigo_selecoes` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `uso_colar_tmn` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `oxigenoterapia_lpm` varchar(3) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reanimador_lpm` varchar(3) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `relatorio`
--

CREATE TABLE `relatorio` (
  `id_relatorio` int NOT NULL,
  `cod_relatorio` int NOT NULL,
  `fk_paciente` int NOT NULL,
  `fk_observacoes` int NOT NULL,
  `fk_avaliacaocinematica` int NOT NULL,
  `fk_decisaotransporte` int NOT NULL,
  `fk_formadeconducao` int NOT NULL,
  `fk_objetorecolhido` int NOT NULL,
  `fk_prob_encontrados_suspeitos` int NOT NULL,
  `fk_procedimentos_efetuados` int NOT NULL,
  `fk_sinais_sintomas` int NOT NULL,
  `fk_teste_glasgow` int NOT NULL,
  `fk_tipo_ocorrencia_pre_hospitalar` int NOT NULL,
  `fk_vitima_era` int NOT NULL,
  `fk_ferimentos_corpo` int NOT NULL,
  `fk_finalizacao` int NOT NULL,
  `fk_anamne_emergencial` int NOT NULL,
  `fk_anamne_gestacional` int NOT NULL,
  `fk_materiais_hospital` int NOT NULL,
  `fk_materiais_descarte` int NOT NULL,
  `fk_sinais_vitais` int NOT NULL,
  `data_relatorio` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `ultima_alteracao` date NOT NULL,
  `criador_relatorio` int NOT NULL
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

--
-- Extraindo dados da tabela `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('AeqA8Ie0fBgslVOEbqFVeXtPcTmBeO_u', 1701087228, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2023-11-27T11:40:35.099Z\",\"httpOnly\":true,\"path\":\"/\"},\"user\":{\"id\":1,\"nome\":\"adm_teste\",\"isAdmin\":1,\"data_inicio\":\"2023-10-16T03:00:00.000Z\",\"codigo\":\"0000000001\"}}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sinais_e_sintomas`
--

CREATE TABLE `sinais_e_sintomas` (
  `id_sinal_sintoma` int NOT NULL,
  `codigo_selecoes` varchar(38) COLLATE utf8mb4_general_ci NOT NULL,
  `outros` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `codigo_tipopupilas` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `codigo_cianose` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `cod_edema` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `cod_hemorragia` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `cod_parada` varchar(2) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sinais_vitais`
--

CREATE TABLE `sinais_vitais` (
  `id_sinais_vitais` int NOT NULL,
  `pressao_arterial` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `pulso` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `respiracao` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `saturacao` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `hgt` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `temperatura` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `perfusao` tinyint(1) NOT NULL,
  `paciente_normal` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `talas_pap`
--

CREATE TABLE `talas_pap` (
  `id_talas_pap` int NOT NULL,
  `tamanho` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `qtde` varchar(4) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `teste_de_glasgow`
--

CREATE TABLE `teste_de_glasgow` (
  `id_teste_glasgow` int NOT NULL,
  `adulto` tinyint(1) DEFAULT '1',
  `soma_total` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nivel_declarado` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_ocorrencia_pre_hospitalar`
--

CREATE TABLE `tipo_ocorrencia_pre_hospitalar` (
  `id_tipo_ocorrencia` int NOT NULL,
  `codigo_selecoes` varchar(21) COLLATE utf8mb4_general_ci NOT NULL,
  `outros` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ttf`
--

CREATE TABLE `ttf` (
  `id_ttf` int NOT NULL,
  `qtde_ttf` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `tamanho_tff` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vitima_era`
--

CREATE TABLE `vitima_era` (
  `id_vit_era` int NOT NULL,
  `escolha` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `acompanhante`
--
ALTER TABLE `acompanhante`
  ADD PRIMARY KEY (`id_acompanhante`),
  MODIFY `id_acompanhante` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `anamnese_emergencial`
  ADD PRIMARY KEY (`id_anamnese_emer`),
  MODIFY `id_anamnese_emer` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `anamnese_gestacional`
  ADD PRIMARY KEY (`id_anamnese_gest`),
  MODIFY `id_anamnese_gest` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `ataduras`
  ADD PRIMARY KEY (`id_atadura`),
  MODIFY `id_atadura` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `avaliacao_cinematica`
  ADD PRIMARY KEY (`id_cinematica`),
  MODIFY `id_cinematica` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `bombeiro`
  ADD PRIMARY KEY (`id_bombeiro`),
  MODIFY `id_bombeiro` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `colar`
  ADD PRIMARY KEY (`id_colar`),
  MODIFY `id_colar` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `decisao_transporte`
  ADD PRIMARY KEY (`id_decisao_transporte`),
  MODIFY `id_decisao_transporte` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `ferimentos_corpo`
  ADD PRIMARY KEY (`id_ferimentos`),
  MODIFY `id_ferimentos` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `finalizacao_ocorrencia`
  ADD PRIMARY KEY (`id_finalizacao`),
  MODIFY `id_finalizacao` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `forma_de_conducao`
  ADD PRIMARY KEY (`id_forma_conducao`),
  MODIFY `id_forma_conducao` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `ked`
  ADD PRIMARY KEY (`id_KED`),
  MODIFY `id_KED` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `kits`
  ADD PRIMARY KEY (`id_kits`),
  MODIFY `id_kits` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `materiais_descartaveis`
  ADD PRIMARY KEY (`id_materiais_hospital`),
  ADD KEY `fk_tala` (`fk_talas`),
  ADD KEY `fk_kit` (`fk_kit`),
  ADD KEY `fk_atadura` (`fk_ataduras`),
  MODIFY `id_materiais_hospital` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `materiais_hospital`
  ADD PRIMARY KEY (`id_materiais_hospital`),
  ADD KEY `fk_colar` (`fk_colar`),
  ADD KEY `fk_ked` (`fk_KED`),
  ADD KEY `fk_ttf` (`fk_ttf`),
  MODIFY `id_materiais_hospital` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `objeto_recolhido`
  ADD PRIMARY KEY (`id_recolhidos`),
  MODIFY `id_recolhidos` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `observacoes`
  ADD PRIMARY KEY (`id_observ`),
  MODIFY `id_observ` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`),
  ADD KEY `fk_acompanhante` (`fk_acompanhante`),
  MODIFY `id_paciente` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `problemas_encontrado_suspeitos`
  ADD PRIMARY KEY (`id_problemas_suspeitos`),
  MODIFY `id_problemas_suspeitos` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `procedimentos_efetuados`
  ADD PRIMARY KEY (`id_procedimentos`),
  MODIFY `id_procedimentos` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `relatorio`
  ADD PRIMARY KEY (`id_relatorio`),
  ADD KEY `fk_paciente` (`fk_paciente`),
  ADD KEY `fk_observacoes` (`fk_observacoes`),
  ADD KEY `fk_avaliacaocinematica` (`fk_avaliacaocinematica`),
  ADD KEY `fk_decisaotransporte` (`fk_decisaotransporte`),
  ADD KEY `fk_formadeconducao` (`fk_formadeconducao`),
  ADD KEY `fk_objetorecolhido` (`fk_objetorecolhido`),
  ADD KEY `fk_prob_encontrados_suspeitos` (`fk_prob_encontrados_suspeitos`),
  ADD KEY `fk_procedimentos_efetuados` (`fk_procedimentos_efetuados`),
  ADD KEY `fk_ferimentos_corpo` (`fk_ferimentos_corpo`),
  ADD KEY `fk_finalizacao` (`fk_finalizacao`),
  ADD KEY `fk_anamne_emergencial` (`fk_anamne_emergencial`),
  ADD KEY `fk_materiais_hospital` (`fk_materiais_hospital`),
  ADD KEY `fk_materiais_descarte` (`fk_materiais_descarte`),
  ADD KEY `fk_sinais_vitais` (`fk_sinais_vitais`),
  ADD KEY `fk_vitima_era` (`fk_vitima_era`),
  ADD KEY `fk_tipo_ocorrencia_pre_hospitalar` (`fk_tipo_ocorrencia_pre_hospitalar`),
  ADD KEY `fk_teste_glasgow` (`fk_teste_glasgow`),
  ADD KEY `fk_sinais_sintomas` (`fk_sinais_sintomas`),
  ADD KEY `fk_anamne_gestacional` (`fk_anamne_gestacional`),
  ADD KEY `fk_criador` (`criador_relatorio`),
  MODIFY `id_relatorio` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`),
  MODIFY `session_id` varchar(128) NOT NULL;

ALTER TABLE `sinais_e_sintomas`
  ADD PRIMARY KEY (`id_sinal_sintoma`),
  MODIFY `id_sinal_sintoma` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `sinais_vitais`
  ADD PRIMARY KEY (`id_sinais_vitais`),
  MODIFY `id_sinais_vitais` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `talas_pap`
  ADD PRIMARY KEY (`id_talas_pap`),
  MODIFY `id_talas_pap` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `teste_de_glasgow`
  ADD PRIMARY KEY (`id_teste_glasgow`),
  MODIFY `id_teste_glasgow` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `tipo_ocorrencia_pre_hospitalar`
  ADD PRIMARY KEY (`id_tipo_ocorrencia`),
  MODIFY `id_tipo_ocorrencia` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `ttf`
  ADD PRIMARY KEY (`id_ttf`),
  MODIFY `id_ttf` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `vitima_era`
  ADD PRIMARY KEY (`id_vit_era`),
  MODIFY `id_vit_era` int NOT NULL AUTO_INCREMENT;
--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `materiais_descartaveis`
--
ALTER TABLE `materiais_descartaveis`
  ADD CONSTRAINT `fk_atadura` FOREIGN KEY (`fk_ataduras`) REFERENCES `ataduras` (`id_atadura`),
  ADD CONSTRAINT `fk_kit` FOREIGN KEY (`fk_kit`) REFERENCES `kits` (`id_kits`),
  ADD CONSTRAINT `fk_tala` FOREIGN KEY (`fk_talas`) REFERENCES `talas_pap` (`id_talas_pap`);

--
-- Limitadores para a tabela `materiais_hospital`
--
ALTER TABLE `materiais_hospital`
  ADD CONSTRAINT `fk_colar` FOREIGN KEY (`fk_colar`) REFERENCES `colar` (`id_colar`),
  ADD CONSTRAINT `fk_ked` FOREIGN KEY (`fk_KED`) REFERENCES `ked` (`id_KED`),
  ADD CONSTRAINT `fk_ttf` FOREIGN KEY (`fk_ttf`) REFERENCES `ttf` (`id_ttf`);

--
-- Limitadores para a tabela `relatorio`
--
ALTER TABLE `relatorio`
  ADD CONSTRAINT `fk_anamne_emergencial` FOREIGN KEY (`fk_anamne_emergencial`) REFERENCES `anamnese_emergencial` (`id_anamnese_emer`),
  ADD CONSTRAINT `fk_anamne_gestacional` FOREIGN KEY (`fk_anamne_gestacional`) REFERENCES `anamnese_gestacional` (`id_anamnese_gest`),
  ADD CONSTRAINT `fk_avaliacaocinematica` FOREIGN KEY (`fk_avaliacaocinematica`) REFERENCES `avaliacao_cinematica` (`id_cinematica`),
  ADD CONSTRAINT `fk_criador` FOREIGN KEY (`criador_relatorio`) REFERENCES `bombeiro` (`id_bombeiro`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_decisaotransporte` FOREIGN KEY (`fk_decisaotransporte`) REFERENCES `decisao_transporte` (`id_decisao_transporte`),
  ADD CONSTRAINT `fk_ferimentos_corpo` FOREIGN KEY (`fk_ferimentos_corpo`) REFERENCES `ferimentos_corpo` (`id_ferimentos`),
  ADD CONSTRAINT `fk_finalizacao` FOREIGN KEY (`fk_finalizacao`) REFERENCES `finalizacao_ocorrencia` (`id_finalizacao`),
  ADD CONSTRAINT `fk_formadeconducao` FOREIGN KEY (`fk_formadeconducao`) REFERENCES `forma_de_conducao` (`id_forma_conducao`),
  ADD CONSTRAINT `fk_materiais_descarte` FOREIGN KEY (`fk_materiais_descarte`) REFERENCES `materiais_descartaveis` (`id_materiais_hospital`),
  ADD CONSTRAINT `fk_materiais_hospital` FOREIGN KEY (`fk_materiais_hospital`) REFERENCES `materiais_hospital` (`id_materiais_hospital`),
  ADD CONSTRAINT `fk_objetorecolhido` FOREIGN KEY (`fk_objetorecolhido`) REFERENCES `objeto_recolhido` (`id_recolhidos`),
  ADD CONSTRAINT `fk_observacoes` FOREIGN KEY (`fk_observacoes`) REFERENCES `observacoes` (`id_observ`),
  ADD CONSTRAINT `fk_paciente` FOREIGN KEY (`fk_paciente`) REFERENCES `paciente` (`id_paciente`),
  ADD CONSTRAINT `fk_prob_encontrados_suspeitos` FOREIGN KEY (`fk_prob_encontrados_suspeitos`) REFERENCES `problemas_encontrado_suspeitos` (`id_problemas_suspeitos`),
  ADD CONSTRAINT `fk_procedimentos_efetuados` FOREIGN KEY (`fk_procedimentos_efetuados`) REFERENCES `procedimentos_efetuados` (`id_procedimentos`),
  ADD CONSTRAINT `fk_sinais_sintomas` FOREIGN KEY (`fk_sinais_sintomas`) REFERENCES `sinais_e_sintomas` (`id_sinal_sintoma`),
  ADD CONSTRAINT `fk_sinais_vitais` FOREIGN KEY (`fk_sinais_vitais`) REFERENCES `sinais_vitais` (`id_sinais_vitais`),
  ADD CONSTRAINT `fk_teste_glasgow` FOREIGN KEY (`fk_teste_glasgow`) REFERENCES `teste_de_glasgow` (`id_teste_glasgow`),
  ADD CONSTRAINT `fk_tipo_ocorrencia_pre_hospitalar` FOREIGN KEY (`fk_tipo_ocorrencia_pre_hospitalar`) REFERENCES `tipo_ocorrencia_pre_hospitalar` (`id_tipo_ocorrencia`),
  ADD CONSTRAINT `fk_vitima_era` FOREIGN KEY (`fk_vitima_era`) REFERENCES `vitima_era` (`id_vit_era`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
