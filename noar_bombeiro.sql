-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25-Out-2023 às 01:44
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
-- Banco de dados: `noar_bombeiro`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acompanhante`
--

CREATE TABLE `acompanhante` (
  `id_acompanhante` int(11) NOT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `anamnese_emergencial`
--

CREATE TABLE `anamnese_emergencial` (
  `id_anamnese_emer` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `anamnese_gestacional`
--

CREATE TABLE `anamnese_gestacional` (
  `id_anamnese_gest` int(11) NOT NULL,
  `periodo` varchar(80) DEFAULT NULL,
  `pre_natal` tinyint(1) NOT NULL,
  `medico_pre_natal` varchar(120) DEFAULT NULL,
  `possibilidade_complicacoes` tinyint(1) NOT NULL,
  `primeiro_filho` tinyint(1) NOT NULL,
  `quantos_filhos` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ataduras`
--

CREATE TABLE `ataduras` (
  `id_atadura` int(11) NOT NULL,
  `tamanho` varchar(3) NOT NULL,
  `qtde` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao_cinematica`
--

CREATE TABLE `avaliacao_cinematica` (
  `id_cinematica` int(11) NOT NULL,
  `escolhas` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bombeiro`
--

CREATE TABLE `bombeiro` (
  `id_bombeiro` int(11) NOT NULL,
  `Nome` varchar(80) NOT NULL,
  `Data_inicio` date NOT NULL,
  `Operante` tinyint(1) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `adm` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `id_colar` int(11) NOT NULL,
  `qtde_colar` int(11) NOT NULL,
  `tamanho_colar` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `decisao_transporte`
--

CREATE TABLE `decisao_transporte` (
  `id_decisao_transporte` int(11) NOT NULL,
  `transporte_opcao` int(11) DEFAULT NULL,
  `mandante` varchar(150) DEFAULT NULL,
  `socorrista1` varchar(150) DEFAULT NULL,
  `socorrista2` varchar(150) DEFAULT NULL,
  `socorrista3` varchar(150) DEFAULT NULL,
  `demandante` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ferimentos_corpo`
--

CREATE TABLE `ferimentos_corpo` (
  `id_ferimentos` int(11) NOT NULL,
  `fratura_luxacao_entorse` varchar(500) NOT NULL,
  `ferimentos_diversos` varchar(500) NOT NULL,
  `hemorragias` varchar(500) NOT NULL,
  `evisceracao` varchar(500) NOT NULL,
  `FAB_FAF` varchar(500) NOT NULL,
  `amputacao` varchar(500) NOT NULL,
  `queimadura_1_grau` varchar(500) NOT NULL,
  `queimadura_2_grau` varchar(500) NOT NULL,
  `queimadura_3_grau` varchar(500) NOT NULL,
  `queimadura_4_grau` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `finalizacao_ocorrencia`
--

CREATE TABLE `finalizacao_ocorrencia` (
  `id_finalizacao` int(11) NOT NULL,
  `n_USB` int(11) NOT NULL,
  `despachante` varchar(80) NOT NULL,
  `H_CH` int(11) NOT NULL,
  `km_final` int(11) NOT NULL,
  `cod_IR_PS` varchar(2) NOT NULL,
  `codigo_SIA/SUS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_de_conducao`
--

CREATE TABLE `forma_de_conducao` (
  `id_forma_conducao` int(11) NOT NULL,
  `opcao_escolhida` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ked`
--

CREATE TABLE `ked` (
  `id_KED` int(11) NOT NULL,
  `qtde_ked` int(11) NOT NULL,
  `tamanho_ked` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `kits`
--

CREATE TABLE `kits` (
  `id_kits` int(11) NOT NULL,
  `H_P_G` varchar(3) NOT NULL,
  `qtde` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `materiais_descartaveis`
--

CREATE TABLE `materiais_descartaveis` (
  `id_materiais_hospital` int(11) NOT NULL,
  `fk_ataduras` int(11) NOT NULL,
  `fk_kit` int(11) NOT NULL,
  `fk_talas` int(11) NOT NULL,
  `cateter_tp_oculos_qtde` int(11) NOT NULL,
  `compressa_comum_qtde` int(11) NOT NULL,
  `luvas_descartaveis_qtde` int(11) NOT NULL,
  `mascaras_descartaveis_qtde` int(11) NOT NULL,
  `manta_luminizada_qtde` int(11) NOT NULL,
  `pas_do_dea_qtde` int(11) NOT NULL,
  `sonda_de_aspiracao_qtde` int(11) NOT NULL,
  `soro_fisiologico_qtde` int(11) NOT NULL,
  `outros` varchar(100) DEFAULT NULL,
  `outros_qtde` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `materiais_hospital`
--

CREATE TABLE `materiais_hospital` (
  `id_materiais_hospital` int(11) NOT NULL,
  `fk_colar` int(11) NOT NULL,
  `fk_KED` int(11) NOT NULL,
  `fk_ttf` int(11) NOT NULL,
  `canula_qtde` int(11) NOT NULL,
  `tirante_cabeca_qtde` int(11) NOT NULL,
  `tirante_aranha_qtde` int(11) NOT NULL,
  `maca_rigida_qtde` int(11) NOT NULL,
  `coxins_estabilizador_qtde` int(11) NOT NULL,
  `base_estabilizador_qtde` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `meios_auxiliares`
--

CREATE TABLE `meios_auxiliares` (
  `id_meio_auxiliar` int(11) NOT NULL,
  `celesc` tinyint(1) DEFAULT NULL,
  `defesa_civil` tinyint(1) DEFAULT NULL,
  `igp/pc` tinyint(1) DEFAULT NULL,
  `cod_policia` varchar(4) DEFAULT NULL,
  `CIT` tinyint(1) DEFAULT NULL,
  `outro` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `objeto_recolhido`
--

CREATE TABLE `objeto_recolhido` (
  `id_recolhidos` int(11) NOT NULL,
  `descricao` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `observacoes`
--

CREATE TABLE `observacoes` (
  `id_observ` int(11) NOT NULL,
  `observacoes` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL,
  `Nome_paciente` varchar(80) DEFAULT NULL,
  `Idade_paciente` int(11) DEFAULT NULL,
  `Acompanhante` varchar(80) DEFAULT NULL,
  `idade_acompanhante` int(11) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `RG_cpf_paciente` int(11) DEFAULT NULL,
  `Local_do_ocorrido` varchar(160) NOT NULL,
  `sexo_paciente` varchar(1) DEFAULT NULL,
  `fk_acompanhante` int(11) DEFAULT NULL,
  `gravidez` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `problemas_encontrado_suspeitos`
--

CREATE TABLE `problemas_encontrado_suspeitos` (
  `id_problemas_suspeitos` int(11) NOT NULL,
  `codigo_selecoes` int(11) NOT NULL,
  `outros` varchar(100) DEFAULT NULL,
  `transporte_outros` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `procedimentos_efetuados`
--

CREATE TABLE `procedimentos_efetuados` (
  `id_procedimentos` int(11) NOT NULL,
  `codigo_selecoes` varchar(37) DEFAULT NULL,
  `meio_auxiliar_fk` int(11) NOT NULL,
  `uso_colar_tmn` varchar(2) DEFAULT NULL,
  `oxigenoterapia_lpm` varchar(3) DEFAULT NULL,
  `reanimador_lpm` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `relatorio`
--

CREATE TABLE `relatorio` (
  `id_relatorio` int(11) NOT NULL,
  `cod_relatorio` int(11) NOT NULL,
  `fk_paciente` int(11) NOT NULL,
  `fk_observacoes` int(11) NOT NULL,
  `fk_avaliacaocinematica` int(11) NOT NULL,
  `fk_decisaotransporte` int(11) NOT NULL,
  `fk_formadeconducao` int(11) NOT NULL,
  `fk_meiosauxiliares` int(11) NOT NULL,
  `fk_objetorecolhido` int(11) NOT NULL,
  `fk_prob_encontrados_suspeitos` int(11) NOT NULL,
  `fk_procedimentos_efetuados` int(11) NOT NULL,
  `fk_sinais_sintomas` int(11) NOT NULL,
  `fk_teste_glasgow` int(11) NOT NULL,
  `fk_tipo_ocorrencia_pre_hospitalar` int(11) NOT NULL,
  `fk_vitima_era` int(11) NOT NULL,
  `fk_ferimentos_corpo` int(11) NOT NULL,
  `fk_finalizacao` int(11) NOT NULL,
  `fk_anamne_emergencial` int(11) NOT NULL,
  `fk_anamne_gestacional` int(11) NOT NULL,
  `fk_materiais_hospital` int(11) NOT NULL,
  `fk_materiais_descarte` int(11) NOT NULL,
  `fk_sinais_vitais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(10) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sinais_e_sintomas`
--

CREATE TABLE `sinais_e_sintomas` (
  `id_sinal_sintoma` int(11) NOT NULL,
  `codigo_selecoes` varchar(38) NOT NULL,
  `outros` varchar(100) DEFAULT NULL,
  `codigo_tipopupilas` int(11) NOT NULL,
  `codigo_reagentepupila` int(11) NOT NULL,
  `codigo_cianose` int(11) NOT NULL,
  `cod_edema` int(11) NOT NULL,
  `cod_hemorragia` int(11) NOT NULL,
  `cod_parada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sinais_vitais`
--

CREATE TABLE `sinais_vitais` (
  `id_sinais_vitais` int(11) NOT NULL,
  `pressao_arterial` varchar(20) NOT NULL,
  `pulso` varchar(10) NOT NULL,
  `respiracao` varchar(10) NOT NULL,
  `saturacao` int(11) NOT NULL,
  `hgt` varchar(20) NOT NULL,
  `temperatura` int(11) NOT NULL,
  `perfusao` tinyint(1) NOT NULL,
  `paciente_normal` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `talas_pap`
--

CREATE TABLE `talas_pap` (
  `id_talas_pap` int(11) NOT NULL,
  `tamanho` varchar(2) NOT NULL,
  `qtde` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `teste_de_glasgow`
--

CREATE TABLE `teste_de_glasgow` (
  `id_teste_glasgow` int(11) NOT NULL,
  `adulto` tinyint(1) DEFAULT 1,
  `soma_total` int(11) DEFAULT NULL,
  `nivel_declarado` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_ocorrencia_pre_hospitalar`
--

CREATE TABLE `tipo_ocorrencia_pre_hospitalar` (
  `id_tipo_ocorrencia` int(11) NOT NULL,
  `codigo_selecoes` int(11) NOT NULL,
  `outros` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ttf`
--

CREATE TABLE `ttf` (
  `id_ttf` int(11) NOT NULL,
  `qtde_ttf` int(11) NOT NULL,
  `tamanho_tff` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vitima_era`
--

CREATE TABLE `vitima_era` (
  `id_vit_era` int(11) NOT NULL,
  `escolha` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Índices para tabela `ferimentos_corpo`
--
ALTER TABLE `ferimentos_corpo`
  ADD PRIMARY KEY (`id_ferimentos`);

--
-- Índices para tabela `finalizacao_ocorrencia`
--
ALTER TABLE `finalizacao_ocorrencia`
  ADD PRIMARY KEY (`id_finalizacao`);

--
-- Índices para tabela `forma_de_conducao`
--
ALTER TABLE `forma_de_conducao`
  ADD PRIMARY KEY (`id_forma_conducao`);

--
-- Índices para tabela `ked`
--
ALTER TABLE `ked`
  ADD PRIMARY KEY (`id_KED`);

--
-- Índices para tabela `kits`
--
ALTER TABLE `kits`
  ADD PRIMARY KEY (`id_kits`);

--
-- Índices para tabela `materiais_descartaveis`
--
ALTER TABLE `materiais_descartaveis`
  ADD PRIMARY KEY (`id_materiais_hospital`),
  ADD KEY `fk_tala` (`fk_talas`),
  ADD KEY `fk_kit` (`fk_kit`),
  ADD KEY `fk_atadura` (`fk_ataduras`);

--
-- Índices para tabela `materiais_hospital`
--
ALTER TABLE `materiais_hospital`
  ADD PRIMARY KEY (`id_materiais_hospital`),
  ADD KEY `fk_colar` (`fk_colar`),
  ADD KEY `fk_ked` (`fk_KED`),
  ADD KEY `fk_ttf` (`fk_ttf`);

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
-- Índices para tabela `relatorio`
--
ALTER TABLE `relatorio`
  ADD PRIMARY KEY (`id_relatorio`),
  ADD KEY `fk_paciente` (`fk_paciente`),
  ADD KEY `fk_observacoes` (`fk_observacoes`),
  ADD KEY `fk_avaliacaocinematica` (`fk_avaliacaocinematica`),
  ADD KEY `fk_decisaotransporte` (`fk_decisaotransporte`),
  ADD KEY `fk_formadeconducao` (`fk_formadeconducao`),
  ADD KEY `fk_meiosauxiliares` (`fk_meiosauxiliares`),
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
  ADD KEY `fk_anamne_gestacional` (`fk_anamne_gestacional`);

--
-- Índices para tabela `sinais_e_sintomas`
--
ALTER TABLE `sinais_e_sintomas`
  ADD PRIMARY KEY (`id_sinal_sintoma`);

--
-- Índices para tabela `sinais_vitais`
--
ALTER TABLE `sinais_vitais`
  ADD PRIMARY KEY (`id_sinais_vitais`);

--
-- Índices para tabela `talas_pap`
--
ALTER TABLE `talas_pap`
  ADD PRIMARY KEY (`id_talas_pap`);

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
-- Índices para tabela `ttf`
--
ALTER TABLE `ttf`
  ADD PRIMARY KEY (`id_ttf`);

--
-- Índices para tabela `vitima_era`
--
ALTER TABLE `vitima_era`
  ADD PRIMARY KEY (`id_vit_era`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `ferimentos_corpo`
--
ALTER TABLE `ferimentos_corpo`
  MODIFY `id_ferimentos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `finalizacao_ocorrencia`
--
ALTER TABLE `finalizacao_ocorrencia`
  MODIFY `id_finalizacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ked`
--
ALTER TABLE `ked`
  MODIFY `id_KED` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `kits`
--
ALTER TABLE `kits`
  MODIFY `id_kits` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `materiais_descartaveis`
--
ALTER TABLE `materiais_descartaveis`
  MODIFY `id_materiais_hospital` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `materiais_hospital`
--
ALTER TABLE `materiais_hospital`
  MODIFY `id_materiais_hospital` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `relatorio`
--
ALTER TABLE `relatorio`
  MODIFY `id_relatorio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sinais_vitais`
--
ALTER TABLE `sinais_vitais`
  MODIFY `id_sinais_vitais` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `talas_pap`
--
ALTER TABLE `talas_pap`
  MODIFY `id_talas_pap` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ttf`
--
ALTER TABLE `ttf`
  MODIFY `id_ttf` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `fk_decisaotransporte` FOREIGN KEY (`fk_decisaotransporte`) REFERENCES `decisao_transporte` (`id_decisao_transporte`),
  ADD CONSTRAINT `fk_ferimentos_corpo` FOREIGN KEY (`fk_ferimentos_corpo`) REFERENCES `ferimentos_corpo` (`id_ferimentos`),
  ADD CONSTRAINT `fk_finalizacao` FOREIGN KEY (`fk_finalizacao`) REFERENCES `finalizacao_ocorrencia` (`id_finalizacao`),
  ADD CONSTRAINT `fk_formadeconducao` FOREIGN KEY (`fk_formadeconducao`) REFERENCES `forma_de_conducao` (`id_forma_conducao`),
  ADD CONSTRAINT `fk_materiais_descarte` FOREIGN KEY (`fk_materiais_descarte`) REFERENCES `materiais_descartaveis` (`id_materiais_hospital`),
  ADD CONSTRAINT `fk_materiais_hospital` FOREIGN KEY (`fk_materiais_hospital`) REFERENCES `materiais_hospital` (`id_materiais_hospital`),
  ADD CONSTRAINT `fk_meiosauxiliares` FOREIGN KEY (`fk_meiosauxiliares`) REFERENCES `meios_auxiliares` (`id_meio_auxiliar`),
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
