-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Nov-2023 às 04:42
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

--
-- Extraindo dados da tabela `acompanhante`
--

INSERT INTO `acompanhante` (`id_acompanhante`, `nome`, `idade`) VALUES
(1, 'teste', 43),
(2, 'teste', 21),
(3, 'testefinal', 38),
(4, '', 0);

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
  `aconteceu_outras_vezes` varchar(2) NOT NULL,
  `usa_medicacao` varchar(2) NOT NULL,
  `horario_ultima_medicacao` varchar(25) DEFAULT NULL,
  `alergias` varchar(300) DEFAULT NULL,
  `alergico` varchar(2) NOT NULL,
  `ingeriu_mais_de_6hrs` varchar(2) NOT NULL,
  `ingeriu_que_hrs` varchar(25) DEFAULT NULL,
  `possui_problema_saude` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `anamnese_emergencial`
--

INSERT INTO `anamnese_emergencial` (`id_anamnese_emer`, `o_que_ocorreu`, `quanto_tempo_ocorreu`, `quais_problemas`, `quais_medicamentos`, `aconteceu_outras_vezes`, `usa_medicacao`, `horario_ultima_medicacao`, `alergias`, `alergico`, `ingeriu_mais_de_6hrs`, `ingeriu_que_hrs`, `possui_problema_saude`) VALUES
(1, 'b', '', '', '', '0', '0', '', '', '0', '0', '', '0'),
(2, 'b', '', '', '', '0', '0', '', '', '0', '0', '', '0'),
(3, 'b', '', '', '', '0', '0', '', '', '0', '0', '', '0'),
(4, 'd', '', '', '', '01', '0', '', '', '0', '0', '', '0'),
(5, 'd', '', '', '', '01', '0', '', '', '0', '0', '', '0'),
(6, '', '', '', '', '0', '0', '', '', '0', '0', '', '0'),
(7, 'a', 'a', '', '', '10', '0', '', '', '0', '0', '', '0'),
(8, 'a', '', '', '', '0', '0', '', '', '0', '0', '', '0'),
(9, '', '', '', '', '0', '0', '', '', '0', '0', '', '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `anamnese_gestacional`
--

CREATE TABLE `anamnese_gestacional` (
  `id_anamnese_gest` int(11) NOT NULL,
  `periodo` varchar(80) DEFAULT NULL,
  `pre_natal` varchar(2) NOT NULL,
  `medico_pre_natal` varchar(120) DEFAULT NULL,
  `possibilidade_complicacoes` varchar(2) NOT NULL,
  `primeiro_filho` varchar(2) NOT NULL,
  `quantos_filhos` varchar(25) DEFAULT NULL,
  `inicio_contracoes` varchar(30) DEFAULT NULL,
  `duracao_contracoes` varchar(20) DEFAULT NULL,
  `intervalo_contracoes` varchar(20) DEFAULT NULL,
  `pressao_quadril_ou_evacuar` varchar(2) NOT NULL,
  `ruptura_bolsa` varchar(2) NOT NULL,
  `inspecao_visual` varchar(2) NOT NULL,
  `parto_realizado` varchar(2) NOT NULL,
  `hora_nascimento` varchar(20) DEFAULT NULL,
  `sexo_bebe` varchar(2) DEFAULT NULL,
  `nome_do_bebe` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `anamnese_gestacional`
--

INSERT INTO `anamnese_gestacional` (`id_anamnese_gest`, `periodo`, `pre_natal`, `medico_pre_natal`, `possibilidade_complicacoes`, `primeiro_filho`, `quantos_filhos`, `inicio_contracoes`, `duracao_contracoes`, `intervalo_contracoes`, `pressao_quadril_ou_evacuar`, `ruptura_bolsa`, `inspecao_visual`, `parto_realizado`, `hora_nascimento`, `sexo_bebe`, `nome_do_bebe`) VALUES
(1, '4', '01', 'teste', '01', '0', '', '', '', '', '0', '0', '0', '0', '', '0', ''),
(2, '4', '01', 'teste', '01', '0', '', '', '', '', '0', '0', '0', '0', '', '0', ''),
(3, '4', '01', 'teste', '01', '0', '', '', '', '', '0', '0', '0', '0', '', '0', ''),
(4, '', '0', '', '0', '0', '', '', '', '', '0', '0', '0', '0', '', '0', ''),
(5, '', '0', '', '0', '0', '', '', '', '', '0', '0', '0', '0', '', '0', ''),
(6, '', '10', '', '0', '0', '', '', '', '', '0', '0', '0', '0', '', '0', ''),
(7, '', '0', '', '0', '0', '', '', '', '', '0', '0', '0', '0', '', '0', ''),
(8, '', '0', '', '0', '0', '', '', '', '', '0', '0', '0', '0', '', '0', ''),
(9, '', '0', '', '0', '0', '', '', '', '', '0', '0', '0', '0', '', '0', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ataduras`
--

CREATE TABLE `ataduras` (
  `id_atadura` int(11) NOT NULL,
  `tamanho` varchar(3) NOT NULL,
  `qtde` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `ataduras`
--

INSERT INTO `ataduras` (`id_atadura`, `tamanho`, `qtde`) VALUES
(1, '001', '02'),
(2, '001', '02'),
(3, '001', '02'),
(4, '0', '02'),
(5, '0', '02'),
(6, '0', ''),
(7, '0', ''),
(8, '0', ''),
(9, '0', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao_cinematica`
--

CREATE TABLE `avaliacao_cinematica` (
  `id_cinematica` int(11) NOT NULL,
  `escolhas` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `avaliacao_cinematica`
--

INSERT INTO `avaliacao_cinematica` (`id_cinematica`, `escolhas`) VALUES
(1, '0'),
(2, '0'),
(3, '0'),
(4, '0'),
(5, '0'),
(6, '0'),
(7, '0');

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
  `qtde_colar` varchar(4) NOT NULL,
  `tamanho_colar` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `colar`
--

INSERT INTO `colar` (`id_colar`, `qtde_colar`, `tamanho_colar`) VALUES
(1, '', '0'),
(2, '', '0'),
(3, '', '0'),
(4, '2', '0'),
(5, '', '0'),
(6, '', '0'),
(7, '', '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `decisao_transporte`
--

CREATE TABLE `decisao_transporte` (
  `id_decisao_transporte` int(11) NOT NULL,
  `transporte_opcao` varchar(4) DEFAULT NULL,
  `motorista` varchar(150) DEFAULT NULL,
  `socorrista1` varchar(150) DEFAULT NULL,
  `socorrista2` varchar(150) DEFAULT NULL,
  `socorrista3` varchar(150) DEFAULT NULL,
  `demandante` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `decisao_transporte`
--

INSERT INTO `decisao_transporte` (`id_decisao_transporte`, `transporte_opcao`, `motorista`, `socorrista1`, `socorrista2`, `socorrista3`, `demandante`) VALUES
(1, '0001', 'm', 's', 's', 's', 'd'),
(2, '0001', 'm', 's', 's', 's', 'd'),
(3, '0001', 'm', 's', 's', 's', 'd'),
(4, '0001', 'm', 's', 's', 's', 'd'),
(5, '0', '', '', '', '', ''),
(6, '0001', 'test', 'test', 'test', 'test', 'test'),
(7, '0001', 'test', 'test', 'test', 'test', 'test'),
(8, '0001', 'b', 'o', 'n', 'e', 'c');

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

--
-- Extraindo dados da tabela `ferimentos_corpo`
--

INSERT INTO `ferimentos_corpo` (`id_ferimentos`, `fratura_luxacao_entorse`, `ferimentos_diversos`, `hemorragias`, `evisceracao`, `FAB_FAF`, `amputacao`, `queimadura_1_grau`, `queimadura_2_grau`, `queimadura_3_grau`, `queimadura_4_grau`) VALUES
(1, 'partedetrasdacabeça,clavicula-direita', 'peitoral-direito,peitoral-esquerdo', '', '', '', '', '', '', '', ''),
(2, 'partedetrasdacabeça,clavicula-direita,clavicula-esquerda', '', '', '', '', '', '', '', '', ''),
(3, 'partedetrasdacabeça,clavicula-direita,clavicula-esquerda', '', '', '', '', '', '', '', '', ''),
(4, 'partedetrasdacabeça/clavicula-direita/clavicula-esquerda', 'partedetrasdacabeça', '', '', '', '', '', '', '', ''),
(5, 'clavicula-esquerda', 'peitoral-direito', 'lombar', 'costela-direita', 'mão-direita', 'partedetrasdobraço-direita', '', '', '', ''),
(6, 'partedetrasdacabeça', '', 'clavicula-esquerda', '', '', '', '', '', '', ''),
(7, 'face', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `finalizacao_ocorrencia`
--

CREATE TABLE `finalizacao_ocorrencia` (
  `id_finalizacao` int(11) NOT NULL,
  `n_USB` varchar(20) NOT NULL,
  `despachante` varchar(80) NOT NULL,
  `H_CH` varchar(20) NOT NULL,
  `km_final` int(11) NOT NULL,
  `cod_IR_PS` varchar(2) NOT NULL,
  `codigo_SIA_SUS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `finalizacao_ocorrencia`
--

INSERT INTO `finalizacao_ocorrencia` (`id_finalizacao`, `n_USB`, `despachante`, `H_CH`, `km_final`, `cod_IR_PS`, `codigo_SIA_SUS`) VALUES
(1, '1', '3', '4', 5, '01', '6'),
(2, '1', '3', '4', 5, '01', '6'),
(3, '1', '1', '1', 1, '0', '1'),
(4, '2', '2', '2', 2, '01', '2'),
(5, '2', '2', '2', 2, '01', '21231'),
(6, '3', '3', '3', 3, '10', '3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_de_conducao`
--

CREATE TABLE `forma_de_conducao` (
  `id_forma_conducao` int(11) NOT NULL,
  `opcao_escolhida` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `forma_de_conducao`
--

INSERT INTO `forma_de_conducao` (`id_forma_conducao`, `opcao_escolhida`) VALUES
(1, '010'),
(2, '010'),
(3, '100'),
(4, '100'),
(5, '0'),
(6, '001'),
(7, '100'),
(8, '100');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ked`
--

CREATE TABLE `ked` (
  `id_KED` int(11) NOT NULL,
  `qtde_ked` varchar(3) NOT NULL,
  `tamanho_ked` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `ked`
--

INSERT INTO `ked` (`id_KED`, `qtde_ked`, `tamanho_ked`) VALUES
(1, '', '0'),
(2, '', '0'),
(3, '', '0'),
(4, '', '0'),
(5, '', '0'),
(6, '', '0'),
(7, '', '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `kits`
--

CREATE TABLE `kits` (
  `id_kits` int(11) NOT NULL,
  `H_P_G` varchar(3) NOT NULL,
  `qtde` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `kits`
--

INSERT INTO `kits` (`id_kits`, `H_P_G`, `qtde`) VALUES
(1, '100', '045'),
(2, '0', '05'),
(3, '0', '05'),
(4, '0', ''),
(5, '0', ''),
(6, '001', '02'),
(7, '0', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `materiais_descartaveis`
--

CREATE TABLE `materiais_descartaveis` (
  `id_materiais_hospital` int(11) NOT NULL,
  `fk_ataduras` int(11) NOT NULL,
  `fk_kit` int(11) NOT NULL,
  `fk_talas` int(11) NOT NULL,
  `cateter_tp_oculos_qtde` varchar(4) DEFAULT NULL,
  `compressa_comum_qtde` varchar(4) DEFAULT NULL,
  `luvas_descartaveis_qtde` varchar(4) DEFAULT NULL,
  `mascaras_descartaveis_qtde` varchar(4) DEFAULT NULL,
  `manta_luminizada_qtde` varchar(4) DEFAULT NULL,
  `pas_do_dea_qtde` varchar(4) DEFAULT NULL,
  `sonda_de_aspiracao_qtde` varchar(4) DEFAULT NULL,
  `soro_fisiologico_qtde` varchar(4) DEFAULT NULL,
  `outros` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `materiais_descartaveis`
--

INSERT INTO `materiais_descartaveis` (`id_materiais_hospital`, `fk_ataduras`, `fk_kit`, `fk_talas`, `cateter_tp_oculos_qtde`, `compressa_comum_qtde`, `luvas_descartaveis_qtde`, `mascaras_descartaveis_qtde`, `manta_luminizada_qtde`, `pas_do_dea_qtde`, `sonda_de_aspiracao_qtde`, `soro_fisiologico_qtde`, `outros`) VALUES
(1, 5, 3, 4, '03', '03', '06', '', '', '', '', '', ''),
(2, 6, 4, 5, '', '', '', '', '', '', '', '', ''),
(3, 8, 6, 7, '', '', '', '', '', '', '', '', 'a'),
(4, 9, 7, 8, '06', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `materiais_hospital`
--

CREATE TABLE `materiais_hospital` (
  `id_materiais_hospital` int(11) NOT NULL,
  `fk_colar` int(11) NOT NULL,
  `fk_KED` int(11) NOT NULL,
  `fk_ttf` int(11) NOT NULL,
  `canula_qtde` varchar(4) DEFAULT NULL,
  `tirante_cabeca_qtde` varchar(4) DEFAULT NULL,
  `tirante_aranha_qtde` varchar(4) DEFAULT NULL,
  `maca_rigida_qtde` varchar(4) DEFAULT NULL,
  `coxins_estabilizador_qtde` varchar(4) DEFAULT NULL,
  `base_estabilizador_qtde` varchar(4) DEFAULT NULL,
  `outros` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `materiais_hospital`
--

INSERT INTO `materiais_hospital` (`id_materiais_hospital`, `fk_colar`, `fk_KED`, `fk_ttf`, `canula_qtde`, `tirante_cabeca_qtde`, `tirante_aranha_qtde`, `maca_rigida_qtde`, `coxins_estabilizador_qtde`, `base_estabilizador_qtde`, `outros`) VALUES
(1, 3, 3, 3, '', '', '', '03', '', '', ''),
(2, 4, 4, 4, '', '', '2', '2', '2', '2', ''),
(3, 6, 6, 6, NULL, '', '', '', '', '', 'm'),
(4, 7, 7, 7, NULL, '', '', '', '05', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `objeto_recolhido`
--

CREATE TABLE `objeto_recolhido` (
  `id_recolhidos` int(11) NOT NULL,
  `descricao` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `objeto_recolhido`
--

INSERT INTO `objeto_recolhido` (`id_recolhidos`, `descricao`) VALUES
(1, 'nenhum'),
(2, 'nenhum'),
(3, 'nenhum'),
(4, 'nenhum'),
(5, 'aaa'),
(6, 'a'),
(7, ''),
(8, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `observacoes`
--

CREATE TABLE `observacoes` (
  `id_observ` int(11) NOT NULL,
  `observacoes` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `observacoes`
--

INSERT INTO `observacoes` (`id_observ`, `observacoes`) VALUES
(1, 'nenhuma'),
(2, 'nenhuma'),
(3, 'nenhuma'),
(4, 'nenhuma'),
(5, 'aa'),
(6, 'a'),
(7, ''),
(8, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL,
  `Nome_paciente` varchar(80) DEFAULT NULL,
  `Idade_paciente` int(11) DEFAULT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `RG_cpf_paciente` varchar(11) DEFAULT NULL,
  `Local_do_ocorrido` varchar(160) NOT NULL,
  `sexo_paciente` varchar(1) DEFAULT NULL,
  `fk_acompanhante` int(11) DEFAULT NULL,
  `gravidez` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `Nome_paciente`, `Idade_paciente`, `telefone`, `RG_cpf_paciente`, `Local_do_ocorrido`, `sexo_paciente`, `fk_acompanhante`, `gravidez`) VALUES
(1, 'deuboa', 23, '54643734743', '65436375486', 'teste', 'F', 2, 1),
(2, 'teste_final', 25, '34906834005', '43473485686', 'guaramirim', 'M', 3, 0),
(3, 'bon', 4, '4525252525', '34252535342', 'tubarao', 'F', 4, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `problemas_encontrado_suspeitos`
--

CREATE TABLE `problemas_encontrado_suspeitos` (
  `id_problemas_suspeitos` int(11) NOT NULL,
  `respira_psiquiatrico` varchar(14) NOT NULL,
  `outros` varchar(100) DEFAULT NULL,
  `transporte_outros` varchar(100) DEFAULT NULL,
  `diabetes` varchar(2) NOT NULL,
  `obstetrico` varchar(3) NOT NULL,
  `transporte` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `problemas_encontrado_suspeitos`
--

INSERT INTO `problemas_encontrado_suspeitos` (`id_problemas_suspeitos`, `respira_psiquiatrico`, `outros`, `transporte_outros`, `diabetes`, `obstetrico`, `transporte`) VALUES
(1, '0', '', '', '0', '0', '0'),
(2, '010', '', '', '0', '0', '0'),
(3, '0', '', '', '0', '0', '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `procedimentos_efetuados`
--

CREATE TABLE `procedimentos_efetuados` (
  `id_procedimentos` int(11) NOT NULL,
  `codigo_selecoes` varchar(48) DEFAULT NULL,
  `uso_colar_tmn` varchar(2) DEFAULT NULL,
  `oxigenoterapia_lpm` varchar(3) DEFAULT NULL,
  `reanimador_lpm` varchar(3) DEFAULT NULL,
  `outros` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `procedimentos_efetuados`
--

INSERT INTO `procedimentos_efetuados` (`id_procedimentos`, `codigo_selecoes`, `uso_colar_tmn`, `oxigenoterapia_lpm`, `reanimador_lpm`, `outros`) VALUES
(1, '0', '2', '', '', 'a'),
(2, '0', '', '', '', 'm'),
(3, '0', '', '', '', 'm'),
(4, '0', '', '', '', ''),
(5, '0', '8', '', '', 'm'),
(6, '0', '2', '3', '4', ''),
(7, '0', '', '', '', '');

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
  `fk_sinais_vitais` int(11) NOT NULL,
  `data_relatorio` varchar(11) NOT NULL,
  `ultima_alteracao` date NOT NULL,
  `criador_relatorio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `relatorio`
--

INSERT INTO `relatorio` (`id_relatorio`, `cod_relatorio`, `fk_paciente`, `fk_observacoes`, `fk_avaliacaocinematica`, `fk_decisaotransporte`, `fk_formadeconducao`, `fk_objetorecolhido`, `fk_prob_encontrados_suspeitos`, `fk_procedimentos_efetuados`, `fk_sinais_sintomas`, `fk_teste_glasgow`, `fk_tipo_ocorrencia_pre_hospitalar`, `fk_vitima_era`, `fk_ferimentos_corpo`, `fk_finalizacao`, `fk_anamne_emergencial`, `fk_anamne_gestacional`, `fk_materiais_hospital`, `fk_materiais_descarte`, `fk_sinais_vitais`, `data_relatorio`, `ultima_alteracao`, `criador_relatorio`) VALUES
(1, 1, 1, 5, 4, 5, 5, 5, 1, 4, 4, 4, 4, 4, 4, 3, 6, 6, 2, 2, 4, '0', '2023-11-29', 1),
(2, 2, 2, 7, 6, 7, 7, 7, 2, 6, 6, 6, 6, 6, 6, 5, 8, 8, 3, 3, 6, '2004-03-21', '2023-11-29', 1),
(3, 3, 3, 8, 7, 8, 8, 8, 3, 7, 7, 7, 7, 7, 7, 6, 9, 9, 4, 4, 7, '2024-04-21', '2023-11-29', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) NOT NULL,
  `expires` int(10) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('zACz1Ra08TwRr6tiCIWWvfx_qo_StTGG', 1701319238, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2023-11-30T04:07:21.686Z\",\"httpOnly\":true,\"path\":\"/\"},\"user\":{\"id\":1,\"nome\":\"adm_teste\",\"isAdmin\":1,\"data_inicio\":\"2023-10-16T03:00:00.000Z\",\"codigo\":\"0000000001\",\"operante\":1}}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sinais_e_sintomas`
--

CREATE TABLE `sinais_e_sintomas` (
  `id_sinal_sintoma` int(11) NOT NULL,
  `codigo_selecoes` varchar(38) NOT NULL,
  `outros` varchar(100) DEFAULT NULL,
  `codigo_tipopupilas` varchar(6) NOT NULL,
  `codigo_cianose` varchar(2) NOT NULL,
  `cod_edema` varchar(2) NOT NULL,
  `cod_hemorragia` varchar(2) NOT NULL,
  `cod_parada` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `sinais_e_sintomas`
--

INSERT INTO `sinais_e_sintomas` (`id_sinal_sintoma`, `codigo_selecoes`, `outros`, `codigo_tipopupilas`, `codigo_cianose`, `cod_edema`, `cod_hemorragia`, `cod_parada`) VALUES
(1, '0110000000000000000000000000000000000', '', '0', '10', '0', '0', '0'),
(2, '0100000000000000000000000000000000000', '', '0', '10', '0', '0', '0'),
(3, '0100000000000000000000000000000000000', '', '0', '10', '0', '0', '0'),
(4, '0', '', '0', '0', '0', '0', '0'),
(5, '0000000010010000000000000000000000010', '3', '100000', '10', '10', '01', '10'),
(6, '1100000000000000000000000000000000000', 'm', '0', '0', '0', '0', '0'),
(7, '0', '', '0', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sinais_vitais`
--

CREATE TABLE `sinais_vitais` (
  `id_sinais_vitais` int(11) NOT NULL,
  `pressao_arterial` varchar(20) NOT NULL,
  `pulso` varchar(10) NOT NULL,
  `respiracao` varchar(10) NOT NULL,
  `saturacao` varchar(20) NOT NULL,
  `hgt` varchar(20) NOT NULL,
  `temperatura` varchar(10) NOT NULL,
  `perfusao` tinyint(1) NOT NULL,
  `paciente_normal` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `sinais_vitais`
--

INSERT INTO `sinais_vitais` (`id_sinais_vitais`, `pressao_arterial`, `pulso`, `respiracao`, `saturacao`, `hgt`, `temperatura`, `perfusao`, `paciente_normal`) VALUES
(1, '12', '21', '12', '12', '12', '12', 10, 10),
(2, '2', '', '3', '4', '', '5', 1, 10),
(3, '2', '', '3', '4', '', '5', 1, 10),
(4, '', '', '', '', '', '', 0, 0),
(5, '2', '2', '2', '2', '2', '2', 10, 10),
(6, '1', '', '', '', '', '', 0, 0),
(7, '', '', '', '', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `talas_pap`
--

CREATE TABLE `talas_pap` (
  `id_talas_pap` int(11) NOT NULL,
  `tamanho` varchar(2) NOT NULL,
  `qtde` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `talas_pap`
--

INSERT INTO `talas_pap` (`id_talas_pap`, `tamanho`, `qtde`) VALUES
(1, '0', ''),
(2, '0', ''),
(3, '0', ''),
(4, '0', ''),
(5, '0', ''),
(6, '0', ''),
(7, '0', ''),
(8, '0', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `teste_de_glasgow`
--

CREATE TABLE `teste_de_glasgow` (
  `id_teste_glasgow` int(11) NOT NULL,
  `adulto` tinyint(1) DEFAULT 1,
  `soma_total` varchar(3) DEFAULT NULL,
  `nivel_declarado` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `teste_de_glasgow`
--

INSERT INTO `teste_de_glasgow` (`id_teste_glasgow`, `adulto`, `soma_total`, `nivel_declarado`) VALUES
(1, 1, '0', '0'),
(2, 1, '0', '0'),
(3, 1, '0', '0'),
(4, 1, '0', '0'),
(5, 1, '0', 'GRAVE'),
(6, 1, '0', 'GRAVE'),
(7, 0, '0', 'LEVE');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_ocorrencia_pre_hospitalar`
--

CREATE TABLE `tipo_ocorrencia_pre_hospitalar` (
  `id_tipo_ocorrencia` int(11) NOT NULL,
  `codigo_selecoes` varchar(21) NOT NULL,
  `outros` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo_ocorrencia_pre_hospitalar`
--

INSERT INTO `tipo_ocorrencia_pre_hospitalar` (`id_tipo_ocorrencia`, `codigo_selecoes`, `outros`) VALUES
(1, '0', 'z'),
(2, '00000000000000000001', 's'),
(3, '00000000000000000001', 's'),
(4, '00000000000000000001', 'z'),
(5, '00000000000010000000', ''),
(6, '00001000000000000000', 'h'),
(7, '00000000000100000000', 'aa');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ttf`
--

CREATE TABLE `ttf` (
  `id_ttf` int(11) NOT NULL,
  `qtde_ttf` varchar(4) NOT NULL,
  `tamanho_tff` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `ttf`
--

INSERT INTO `ttf` (`id_ttf`, `qtde_ttf`, `tamanho_tff`) VALUES
(1, '', '0'),
(2, '', '0'),
(3, '', '0'),
(4, '', '0'),
(5, '05', '0'),
(6, '01', '0'),
(7, '', '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vitima_era`
--

CREATE TABLE `vitima_era` (
  `id_vit_era` int(11) NOT NULL,
  `escolha` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vitima_era`
--

INSERT INTO `vitima_era` (`id_vit_era`, `escolha`) VALUES
(1, '0'),
(2, '0'),
(3, '0'),
(4, '0'),
(5, '0'),
(6, '0'),
(7, '0');

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
  ADD PRIMARY KEY (`id_procedimentos`);

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
  ADD KEY `fk_criador` (`criador_relatorio`);

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
-- AUTO_INCREMENT de tabela `acompanhante`
--
ALTER TABLE `acompanhante`
  MODIFY `id_acompanhante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `anamnese_emergencial`
--
ALTER TABLE `anamnese_emergencial`
  MODIFY `id_anamnese_emer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `anamnese_gestacional`
--
ALTER TABLE `anamnese_gestacional`
  MODIFY `id_anamnese_gest` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `ataduras`
--
ALTER TABLE `ataduras`
  MODIFY `id_atadura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `avaliacao_cinematica`
--
ALTER TABLE `avaliacao_cinematica`
  MODIFY `id_cinematica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `bombeiro`
--
ALTER TABLE `bombeiro`
  MODIFY `id_bombeiro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `colar`
--
ALTER TABLE `colar`
  MODIFY `id_colar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `decisao_transporte`
--
ALTER TABLE `decisao_transporte`
  MODIFY `id_decisao_transporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `ferimentos_corpo`
--
ALTER TABLE `ferimentos_corpo`
  MODIFY `id_ferimentos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `finalizacao_ocorrencia`
--
ALTER TABLE `finalizacao_ocorrencia`
  MODIFY `id_finalizacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `forma_de_conducao`
--
ALTER TABLE `forma_de_conducao`
  MODIFY `id_forma_conducao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `ked`
--
ALTER TABLE `ked`
  MODIFY `id_KED` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `kits`
--
ALTER TABLE `kits`
  MODIFY `id_kits` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `materiais_descartaveis`
--
ALTER TABLE `materiais_descartaveis`
  MODIFY `id_materiais_hospital` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `materiais_hospital`
--
ALTER TABLE `materiais_hospital`
  MODIFY `id_materiais_hospital` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `objeto_recolhido`
--
ALTER TABLE `objeto_recolhido`
  MODIFY `id_recolhidos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `observacoes`
--
ALTER TABLE `observacoes`
  MODIFY `id_observ` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `problemas_encontrado_suspeitos`
--
ALTER TABLE `problemas_encontrado_suspeitos`
  MODIFY `id_problemas_suspeitos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `procedimentos_efetuados`
--
ALTER TABLE `procedimentos_efetuados`
  MODIFY `id_procedimentos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `relatorio`
--
ALTER TABLE `relatorio`
  MODIFY `id_relatorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `sinais_e_sintomas`
--
ALTER TABLE `sinais_e_sintomas`
  MODIFY `id_sinal_sintoma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `sinais_vitais`
--
ALTER TABLE `sinais_vitais`
  MODIFY `id_sinais_vitais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `talas_pap`
--
ALTER TABLE `talas_pap`
  MODIFY `id_talas_pap` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `teste_de_glasgow`
--
ALTER TABLE `teste_de_glasgow`
  MODIFY `id_teste_glasgow` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tipo_ocorrencia_pre_hospitalar`
--
ALTER TABLE `tipo_ocorrencia_pre_hospitalar`
  MODIFY `id_tipo_ocorrencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `ttf`
--
ALTER TABLE `ttf`
  MODIFY `id_ttf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `vitima_era`
--
ALTER TABLE `vitima_era`
  MODIFY `id_vit_era` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  ADD CONSTRAINT `fk_criador` FOREIGN KEY (`criador_relatorio`) REFERENCES `bombeiro` (`id_bombeiro`),
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
