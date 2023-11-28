const express = require('express');
var router = express.Router();
var app = express();
const cookieParser = require("cookie-parser");
const bodyParser = require('body-parser');
app.use(cookieParser());
app.use(express.json());
var mysql = require('mysql2');
// conexão com o banco de dados

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

var connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  database: 'noar_bombeiro',
  port: '3306'
});


/* GET login page. */
router.get('/', function (req, res, next) {
  if (req.session.user) {
    res.redirect('/ocorrencia');
  } else {
    res.render('index.ejs', { title: 'Login - Bombeiros de Guaramirim', pag: 'Login', user: req.session.user });
  }
});

// POST no login e criação de sessão
router.post('/login', function (req, res) {
  var codigo = req.body.input;
  var senha = req.body.Senha;
  var sql = 'SELECT * FROM bombeiro WHERE codigo = ?';
  connection.query(sql, [codigo], function (err, results, fields) {
    if (!err) {
      if (results && results.length > 0) {
        var passCheck = results[0].senha;
        if (senha === passCheck) {
          console.log("Resultado:", results);
          req.session.user = {
            id: results[0].id_bombeiro,
            nome: results[0].Nome,
            isAdmin: results[0].adm, // Checa se é admin
            data_inicio: results[0].Data_inicio,
            codigo: results[0].codigo,
          };
          console.log(req.session.user)
          console.log("Connected as " + req.session.user.nome);
          res.redirect('/ocorrencia');
        } else {
          res.render('index.ejs', { title: 'Login - Bombeiros de Guaramirim', pag: 'Login', errorMessage: 'Senha incorreta' });
          return;
        }
      } else {
        res.render('index.ejs', { title: 'Login - Bombeiros de Guaramirim', pag: 'Login', errorMessage: 'Código não encontrado' });
        return;
      }
    } else {
      console.log("Consulta não realizada");
      return;
    }
  })
  console.log("Enviado ao servidor");
});

// mecanismo de autenticação

function requireAuth(req, res, next) {
  if (req.session && req.session.user) {
    return next();
  } else {
    res.redirect('/');
  }
}

// mecanismo de permissao de administrador

function admLock(req, res, next) {
  if (req.session && req.session.user && req.session.user.isAdmin === 1) {
    return next();
  } else {
    res.redirect('/acesso_negado');
  }
}

// rota para pagina de acesso negado

router.get('/acesso_negado', function (req, res, next) {
  res.render('acesso_negado.ejs', { pag: 'Acesso negado', title: 'Acesso negado', user: req.session.user })
});

// Rota para a Página dos dados da vítima

router.get('/vitima', requireAuth, function (req, res, next) {
  res.render('vitima.ejs', { pag: 'Dados da vítima', title: 'Vítima - Bombeiros de Guaramirim', user: req.session.user });
});


// post dos dados da vítima
router.post('/vitima', function (req, res) {
  var nome = req.body.nome;
  var idade = req.body.idade;
  var sexo = req.body.sexo;
  var numero = req.body.telefone;
  var dados = req.body.rgcpf;
  var acomp = req.body.acomp;
  var idadeacomp = req.body.idadeacomp;
  var sexo = req.body.sexo;
  var gravida_val = req.body.gravida_val;
  console.log(gravida_val);
  if (idadeacomp == '') {
    idadeacomp = 0;
  }
  var local = req.body.local;
  var sql = 'INSERT INTO acompanhante(nome,idade) VALUES (?,?)';
  var valuesAcomp = [acomp, idadeacomp];

  connection.query(sql, valuesAcomp, function (err, results, fields) {
    if (err) throw err;

    // Obtenha o ID do acompanhante inserido
    var acompId = results.insertId;

    // Consulta SQL para inserir na tabela vitima
    var sqlVitima = 'INSERT INTO paciente(Nome_paciente, Idade_paciente, telefone, RG_cpf_paciente,Local_do_ocorrido,sexo_paciente, fk_acompanhante, gravidez) VALUES(?, ?, ?, ?, ?, ?, ?, ?)';
    var valuesVitima = [nome, idade, numero, dados, local, sexo, acompId, gravida_val];

    // Execute a consulta
    connection.query(sqlVitima, valuesVitima, function (err, result) {
      if (err) throw err;
      var id_paciente = result.insertId;
      console.log("1 record inserted");

      res.redirect('/form?paciente=' + id_paciente + '&idade=' + idade + '&gravida=' + gravida_val);
    });
  });


});

// Rota pra o formulario principal

router.get('/form', requireAuth, function (req, res, next) {
  var id = req.query.paciente;
  var idade = req.query.idade;
  var gravida = req.query.gravida;


  res.render('formulario_principal.ejs', { pag: 'Formulário', title: 'Formulário - Bombeiros de Guaramirim', user: req.session.user, idade: idade, id_paciente: id, gravida: gravida });
});



// post do formulario principal
router.post('/form', requireAuth, function (req, res) {
  console.log(req.body.textareafinal1)
  console.log(req.body.inputtextfinal1);
  console.log(req.body.ferimentos)
  var tpo = req.body.radios1 || 0;
  var vte = req.body.radiovte1 || 0;
  var pe = req.body.checkboxpe1 || 0;
  var normal = req.body.sinais_annsv1 || 0;
  var perf = req.body.sinais_perfsv1 || 0;
  var ac = req.body.checkboxac1 || 0;
  var pes = req.body.radio1pes || 0;
  var pes2 = req.body.radio1pes2 || 0;
  var pes3 = req.body.radio1pes3 || 0;
  var pes4 = req.body.radio1pes4 || 0;
  var dct = req.body.dct1 || 0;
  var fc = req.body.forma_conducao || 0;
  var ked = req.body.kedradioStfftate1 || 0;
  var colar = req.body.colarradioStfftate1 || 0;
  var ttf = req.body.radiotff1 || 0;
  var aov = req.body.radioaov || 0;
  var pbs = req.body.radiopbs || 0;
  var med = req.body.radiomed || 0;
  var alergia = req.body.radioalergia || 0;
  var ingeriu = req.body.radioingerir || 0;
  var cod = req.body.cod1 || 0;
  var CSESS = req.body.checkboxses || 0;
  var SESS = req.body.radiopupila || 0;
  var SESS2 = req.body.radiocianose || 0;
  var SESS3 = req.body.radioedema || 0;
  var SESS4 = req.body.radiohemorragia || 0;
  var SESS5 = req.body.checkboxparada || 0;
  var corpo = req.body.ferimentos || {
    "Fratura/luxação/entorse": [],
    "Ferimentos diversos": [],
    "Hemorragias": [],
    "Evisceração": [],
    "F.A.B./F.A.F.": [],
    "Amputação": [],
    "Queimadura 1 grau": [],
    "Queimadura 2 grau": [],
    "Queimadura 3 grau": [],
    "Queimadura 4 grau": []
  };
  console.log(corpo)
  if (corpo === undefined || corpo === null || corpo === '[object Object]') {
    corpo = {
      "Fratura/luxação/entorse": [],
      "Ferimentos diversos": [],
      "Hemorragias": [],
      "Evisceração": [],
      "F.A.B./F.A.F.": [],
      "Amputação": [],
      "Queimadura 1 grau": [],
      "Queimadura 2 grau": [],
      "Queimadura 3 grau": [],
      "Queimadura 4 grau": []
    };
  }
  var ferimentos = JSON.parse(corpo);
  console.log(ferimentos);
  console.log(req.body.adulto);
  var savedRadioAGState = req.body.radio_pre_natalState1 || 0;
  var savedRadioAG2State = req.body.radio_p_filho1State1 || 0;
  var savedRadioAG3State = req.body.radio_pre_natal1State1 || 0;
  var savedRadioAG4State = req.body.radio_pre_natal2State1 || 0;
  var savedRadioAG5State = req.body.radio_pre_natal3State1 || 0;
  var parto_realizado = req.body.radio_parto1 || 0;
  var sexobebe = req.body.radio_bebe1 || 0;
  var savedRadioAG8State = req.body.radio_pre_natal4State1 || 0;
  var ataduras = req.body.radioState_ataduras || 0;
  var talas = req.body.radioState_talas || 0;
  var kits = req.body.radioState_KITS || 0;
  var somaglasgow = req.body.totalglasgow || 0;
  var nivelglasgow = req.body.nivel || 0;
  var adultoglasgow = req.body.adulto || 0;
  var date = req.body.dataoco || 0;
  var gravida = req.body.gravida || 0;
  var id_paciente = req.body.id_paciente || 0; ''
  var textareafinal = req.body.textareafinal1;
  var parts = JSON.parse(textareafinal);
  if (gravida == 1) {
    var [
      outrosTPO, pressaoarteria, respira, satura, temperatura,
      pulso, htg, outrotransporte, outroproblemasuspeito, outrosinal_sintoma, motorista,
      socorrista1, socorrista2, socorrista3, demandante, outropcef,
      outromaterialdesc, outromaterialhosp, oqacon, quantotemp, problemasaude,
      medicamentos, horamedica, tipoalergia, hora_ingest, periodogesta, medico_pre_natal, quantosfilho,
      horacontracoes, duracaocontracao, intervalocontracoes, hora_nascimento, nome_bebe, objetos, obsgerais, nusb,
      nocorrencia, despachante, h_ch, km_final, codsiasus
    ] = parts;
    console.log(parts)
  } else {
    var [
      outrosTPO, pressaoarteria, respira, satura, temperatura,
      pulso, htg, outrotransporte, outroproblemasuspeito, outrosinal_sintoma, motorista,
      socorrista1, socorrista2, socorrista3, demandante, outropcef,
      outromaterialdesc, outromaterialhosp, oqacon, quantotemp, problemasaude,
      medicamentos, horamedica, tipoalergia, hora_ingest, objetos, obsgerais, nusb,
      nocorrencia, despachante, h_ch, km_final, codsiasus, periodogesta, medico_pre_natal, quantosfilho,
      horacontracoes, duracaocontracao, intervalocontracoes, hora_nascimento, nome_bebe
    ] = parts;
    // var periodogesta = 0;
    // var medico_pre_natal = 0;
    // var quantosfilho = 0;
    // var horacontracoes = 0;
    // var duracaocontracao = 0;
    // var intervalocontracoes = 0;
    // var hora_nascimento = 0;
    // var nome_bebe = 0;
    console.log(parts)
  }
  if (km_final == '') {
    km_final = 0;
  }
  var inputtextfinal = req.body.inputtextfinal1;
  var partsinput = JSON.parse(inputtextfinal);
  var [tmusocolar, lpmoxi, lpmreanima, atadurasqtd, caratertpoc, compressa, kitsqtd, luvasdesc, mascdesc, mantailuminizada, pasdodea, sonda, sorofisi, talasqtd, base, colarqtd, coxins, kedqtd, macarigida, ttfqtd, tirante, canula] = partsinput;
  console.log(partsinput)
  var anme_emeq = 'INSERT INTO anamnese_emergencial (o_que_ocorreu, quanto_tempo_ocorreu, quais_problemas, quais_medicamentos, aconteceu_outras_vezes, usa_medicacao, horario_ultima_medicacao, alergias, alergico, ingeriu_mais_de_6hrs, ingeriu_que_hrs, possui_problema_saude) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);'
  var anme_eme_values = [oqacon, quantotemp, problemasaude, medicamentos, aov, med, horamedica, tipoalergia, alergia, ingeriu, hora_ingest, pbs];
  var anme_gestq = 'INSERT INTO anamnese_gestacional (periodo, pre_natal, medico_pre_natal, possibilidade_complicacoes, primeiro_filho, quantos_filhos, inicio_contracoes, duracao_contracoes, intervalo_contracoes, pressao_quadril_ou_evacuar, ruptura_bolsa, inspecao_visual, parto_realizado, hora_nascimento, sexo_bebe, nome_do_bebe) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);'
  var anme_gest_values = [periodogesta, savedRadioAGState, medico_pre_natal, savedRadioAG8State, savedRadioAG2State, quantosfilho, horacontracoes, duracaocontracao, intervalocontracoes, savedRadioAG3State, savedRadioAG4State, savedRadioAG5State, parto_realizado, hora_nascimento, sexobebe, nome_bebe];
  var atadurasq = 'INSERT INTO ataduras (tamanho, qtde) VALUES (?, ?);'
  var ataduras_values = [ataduras, atadurasqtd];

  var dctransporte = 'INSERT INTO decisao_transporte (transporte_opcao, motorista, socorrista1, socorrista2, socorrista3, demandante) VALUES (?, ?, ?, ?, ?,?);'
  var dctransporte_values = [dct, motorista, socorrista1, socorrista2, socorrista3, demandante];

  var fcq = 'INSERT INTO forma_de_conducao (opcao_escolhida) VALUES (?);'
  var fc_values = [fc];

  var observe = 'INSERT INTO observacoes (observacoes) VALUES (?);'
  var observe_values = [obsgerais];

  var objetosq = 'INSERT INTO objeto_recolhido (descricao) VALUES (?);'
  var objetos_values = [objetos];

  var talasq = 'INSERT INTO talas_pap (tamanho, qtde) VALUES (?, ?);'
  var talas_values = [talas, talasqtd];

  var proceefet = 'INSERT INTO procedimentos_efetuados (codigo_selecoes, uso_colar_tmn, oxigenoterapia_lpm, reanimador_lpm, outros) VALUES ( ?, ?, ?, ?, ?);'
  var proceefet_values = [pe, tmusocolar, lpmoxi, lpmreanima, outropcef];

  var colarq = 'INSERT INTO colar (qtde_colar, tamanho_colar) VALUES (?, ?);'
  var colar_values = [colarqtd, colar];

  var fle = ferimentos["Fratura/luxação/entorse"].join('/');
  var feridiv = ferimentos["Ferimentos diversos"].join('/');
  var hemorragia = ferimentos["Hemorragias"].join('/');
  var evisc = ferimentos["Evisceração"].join('/');
  var fabfaf = ferimentos["F.A.B./F.A.F."].join('/');
  var amput = ferimentos["Amputação"].join('/');
  var queim1 = ferimentos["Queimadura 1 grau"].join('/');
  var queim2 = ferimentos["Queimadura 2 grau"].join('/');
  var queim3 = ferimentos["Queimadura 3 grau"].join('/');
  var queim4 = ferimentos["Queimadura 4 grau"].join('/');

  var corpoq = 'INSERT INTO ferimentos_corpo (fratura_luxacao_entorse, ferimentos_diversos, hemorragias, evisceracao, FAB_FAF, amputacao, queimadura_1_grau, queimadura_2_grau, queimadura_3_grau, queimadura_4_grau) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);'
  var corpo_values = [fle, feridiv, hemorragia, evisc, fabfaf, amput, queim1, queim2, queim3, queim4];

  var kedq = 'INSERT INTO ked (qtde_ked, tamanho_ked) VALUES (?, ?);'
  var ked_values = [kedqtd, ked];

  var kitsq = 'INSERT INTO kits (H_P_G, qtde) VALUES (?, ?);'
  var kits_values = [kits, kitsqtd];

  var ttfq = 'INSERT INTO ttf (qtde_ttf, tamanho_tff) VALUES (?, ?);'
  var ttf_values = [ttfqtd, ttf];

  var avacineq = 'INSERT INTO avaliacao_cinematica (escolhas) VALUES (?);'
  var avacine_values = [ac];

  var sinal_sintomaq = 'INSERT INTO sinais_e_sintomas (codigo_selecoes, outros, codigo_tipopupilas, codigo_cianose, cod_edema, cod_hemorragia, cod_parada) VALUES (?, ?, ?, ?, ?, ?, ?);'
  var sinal_sintoma_values = [CSESS, outrosinal_sintoma, SESS, SESS2, SESS3, SESS4, SESS5];

  var sinalvital = 'INSERT INTO sinais_vitais (pressao_arterial, pulso, respiracao, saturacao, hgt, temperatura, perfusao, paciente_normal) VALUES (?, ?, ?, ?, ?, ?, ?, ?);'
  var sinalvital_values = [pressaoarteria, pulso, respira, satura, htg, temperatura, perf, normal];

  var glasgowq = 'INSERT INTO teste_de_glasgow (adulto, soma_total, nivel_declarado) VALUES ( ?, ?, ?);'
  var glasgow_values = [adultoglasgow, somaglasgow, nivelglasgow];

  var tipoocorrenciaq = 'INSERT INTO tipo_ocorrencia_pre_hospitalar (codigo_selecoes, outros) VALUES (?, ?);'
  var tipoocorrencia_values = [tpo, outrosTPO];

  var vitimaera = 'INSERT INTO vitima_era (escolha) VALUES (?);'
  var vitimaera_values = [vte];

  var finaloco = 'INSERT INTO finalizacao_ocorrencia (n_USB, despachante, H_CH, km_final, cod_IR_PS, codigo_SIA_SUS) VALUES (?, ?, ?, ?, ?, ?);'
  var finaloco_values = [nusb, despachante, h_ch, km_final, cod, codsiasus];

  var problemassuspeitos = 'INSERT INTO problemas_encontrado_suspeitos (respira_psiquiatrico, outros, transporte_outros, diabetes, obstetrico, transporte) VALUES (?, ?, ?, ?, ?, ?);'
  var problemassuspeitos_values = [pes, outroproblemasuspeito, outrotransporte, pes2, pes3, pes4];

  var anme_eme_id, anme_gest_id, ataduras_id, dctransporte_id, fc_id, observe_id, objetos_id, talas_id, proceefet_id, colar_id, corpo_id, ked_id, kits_id, ttf_id, avacine_id, sinal_sintoma_id, sinalvital_id, glasgow_id, tipoocorrencia_id, vitimaera_id, finaloco_id, materiaishosp_id, materiaisdesc_id, problemassuspeitos_id;




  connection.query(anme_emeq, anme_eme_values, function (error, results) {
    if (error) throw error;
    console.log('anamnese_emergencial inserted');
    anme_eme_id = results.insertId;

    connection.query(anme_gestq, anme_gest_values, function (error, results) {
      if (error) throw error;
      console.log('anamnese_gestacional inserted');
      anme_gest_id = results.insertId;

      connection.query(atadurasq, ataduras_values, function (error, results) {
        if (error) throw error;
        console.log('ataduras inserted');
        ataduras_id = results.insertId;

        connection.query(dctransporte, dctransporte_values, function (error, results) {
          if (error) throw error;
          console.log('decisao_transporte inserted');
          dctransporte_id = results.insertId;

          connection.query(fcq, fc_values, function (error, results) {
            if (error) throw error;
            console.log('forma_de_conducao inserted');
            fc_id = results.insertId;

            connection.query(observe, observe_values, function (error, results) {
              if (error) throw error;
              console.log('observacoes inserted');
              observe_id = results.insertId;

              connection.query(objetosq, objetos_values, function (error, results) {
                if (error) throw error;
                console.log('objeto_recolhido inserted');
                objetos_id = results.insertId;

                connection.query(talasq, talas_values, function (error, results) {
                  if (error) throw error;
                  console.log('talas_pap inserted');
                  talas_id = results.insertId;

                  connection.query(proceefet, proceefet_values, function (error, results) {
                    if (error) throw error;
                    console.log('procedimentos_efetuados inserted');
                    proceefet_id = results.insertId;

                    connection.query(colarq, colar_values, function (error, results) {
                      if (error) throw error;
                      console.log('colar inserted');
                      colar_id = results.insertId;
                      console.log(colar_id);
                      connection.query(corpoq, corpo_values, function (error, results) {
                        if (error) throw error;
                        console.log('ferimentos_corpo inserted');
                        corpo_id = results.insertId;
                        console.log(colar_id);
                        connection.query(kedq, ked_values, function (error, results) {
                          if (error) throw error;
                          console.log('ked inserted');
                          ked_id = results.insertId;
                          console.log(ked_id);
                          connection.query(kitsq, kits_values, function (error, results) {
                            if (error) throw error;
                            console.log('kits inserted');
                            kits_id = results.insertId;
                            console.log(kits_id);
                            connection.query(ttfq, ttf_values, function (error, results) {
                              if (error) throw error;
                              console.log('ttf inserted');
                              ttf_id = results.insertId;

                              connection.query(avacineq, avacine_values, function (error, results) {
                                if (error) throw error;
                                console.log('avaliacao_cinematica inserted');
                                avacine_id = results.insertId;

                                connection.query(sinal_sintomaq, sinal_sintoma_values, function (error, results) {
                                  if (error) throw error;
                                  console.log('sinais_e_sintomas inserted');
                                  sinal_sintoma_id = results.insertId;

                                  connection.query(sinalvital, sinalvital_values, function (error, results) {
                                    if (error) throw error;
                                    console.log('sinais_vitais inserted');
                                    sinalvital_id = results.insertId;

                                    connection.query(glasgowq, glasgow_values, function (error, results) {
                                      if (error) throw error;
                                      console.log('teste_de_glasgow inserted');
                                      glasgow_id = results.insertId;

                                      connection.query(tipoocorrenciaq, tipoocorrencia_values, function (error, results) {
                                        if (error) throw error;
                                        console.log('tipo_de_ocorrencia inserted');
                                        tipoocorrencia_id = results.insertId;

                                        connection.query(vitimaera, vitimaera_values, function (error, results) {
                                          if (error) throw error;
                                          console.log('vitima_era inserted');
                                          vitimaera_id = results.insertId;

                                          connection.query(finaloco, finaloco_values, function (error, results) {
                                            if (error) throw error;
                                            console.log('finalizacao_ocorrencia inserted');
                                            finaloco_id = results.insertId;
                                            var materiaishosp = 'INSERT INTO materiais_hospital (fk_colar, fk_KED, fk_ttf, canula_qtde, tirante_cabeca_qtde, tirante_aranha_qtde, maca_rigida_qtde, coxins_estabilizador_qtde, base_estabilizador_qtde , outros) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);'
                                            var materiaishosp_values = [colar_id, ked_id, ttf_id, canula, tirante, tirante, macarigida, coxins, base, outromaterialhosp];

                                            connection.query(materiaishosp, materiaishosp_values, function (error, results) {
                                              if (error) throw error;
                                              console.log('materiais_hospital inserted');
                                              materiaishosp_id = results.insertId;
                                              var materiaisdesc = 'INSERT INTO materiais_descartaveis (fk_ataduras, fk_kit, fk_talas, cateter_tp_oculos_qtde, compressa_comum_qtde, luvas_descartaveis_qtde, mascaras_descartaveis_qtde, manta_luminizada_qtde, pas_do_dea_qtde, sonda_de_aspiracao_qtde, soro_fisiologico_qtde, outros) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);'
                                              var materiaisdesc_values = [ataduras_id, kits_id, talas_id, caratertpoc, compressa, luvasdesc, mascdesc, mantailuminizada, pasdodea, sonda, sorofisi, outromaterialdesc];


                                              connection.query(materiaisdesc, materiaisdesc_values, function (error, results) {
                                                if (error) throw error;
                                                console.log('materiais_descartaveis inserted');
                                                materiaisdesc_id = results.insertId;

                                                connection.query(problemassuspeitos, problemassuspeitos_values, function (error, results) {
                                                  if (error) throw error;
                                                  console.log('problemas_encontrado_suspeitos inserted');
                                                  problemassuspeitos_id = results.insertId;
                                                  var data = new Date();
                                                  var formattedDate = data.getFullYear() + '-' + (data.getMonth() + 1) + '-' + data.getDate();
                                                  var relatorio = 'INSERT INTO relatorio (cod_relatorio, fk_paciente, fk_observacoes, fk_avaliacaocinematica, fk_decisaotransporte, fk_formadeconducao, fk_objetorecolhido, fk_prob_encontrados_suspeitos, fk_procedimentos_efetuados, fk_sinais_sintomas, fk_teste_glasgow, fk_tipo_ocorrencia_pre_hospitalar, fk_vitima_era, fk_ferimentos_corpo, fk_finalizacao, fk_anamne_emergencial, fk_anamne_gestacional, fk_materiais_hospital, fk_materiais_descarte, fk_sinais_vitais, data_relatorio, ultima_alteracao, criador_relatorio) VALUES (?,?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);'
                                                  var relatorioValues = [nocorrencia, id_paciente, observe_id, avacine_id, dctransporte_id, fc_id, objetos_id, problemassuspeitos_id, proceefet_id, sinal_sintoma_id, glasgow_id, tipoocorrencia_id, vitimaera_id, corpo_id, finaloco_id, anme_eme_id, anme_gest_id, materiaishosp_id, materiaisdesc_id, sinalvital_id, date, formattedDate, req.session.user.id];
                                                  connection.query(relatorio, relatorioValues, function (error, results) {
                                                    if (error) throw error;
                                                    console.log('relatorio inserted');
                                                  });
                                                });
                                              });
                                            });
                                          });
                                        });
                                      });
                                    });
                                  });
                                });
                              });
                            });
                          });
                        });
                      });
                    });
                  });
                });
              });
            });
          });
        });
      });
    });
  });
  res.redirect('/ocorrencia');
});

// Rota para o cadastro de bombeiros

router.get('/cadastro', requireAuth, admLock, function (req, res, next) {
  res.render('cadastro.ejs', { pag: 'Cadastro', title: 'Cadastro - Bombeiros de Guaramirim', user: req.session.user });
});

router.post('/cadastro', function (req, res) {
  var nome = req.body.nome;
  var codigo = req.body.codbomb;
  var senha = req.body.senha;
  var adm = req.body.adm;
  var admp = adm ? parseInt(adm, 10) : 0;
  var date = new Date();
  var formattedDate = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
  console.log(formattedDate);
  var sql = 'INSERT INTO bombeiro(Nome,Data_inicio, Operante,  codigo, senha, adm) VALUES (?,?, ?, ?, ?, ?)';
  var values = [nome, formattedDate, 1, codigo, senha, admp];
  connection.query(sql, values, function (err, result) {
    if (err) throw err;
    console.log("1 record inserted");
  });
  res.redirect('/contato');
});

router.get('/bombeiros', requireAuth, admLock, function (req, res, next) {
  var sql = 'SELECT * FROM bombeiro';
  connection.query(sql, function (err, results, fields) {
    if (err) throw err;
    res.render('bombeiros.ejs', { pag: 'Bombeiros', title: 'Bombeiros - Bombeiros de Guaramirim', user: req.session.user, data: results });
  });
});

router.get('/usuario', requireAuth, function (req, res, next) {
  res.render('usuario.ejs', { pag: 'Usuário', title: 'Usuário - Bombeiros de Guaramirim', user: req.session.user, data: req.session.user.data_inicio, nome: req.session.user.nome, codigo: req.session.user.codigo });
});

// Rota para o histório de ocorrências

router.get('/ocorrencia', requireAuth, function (req, res, next) {
  var query = 'SELECT * FROM relatorio WHERE criador_relatorio = ? ORDER BY ultima_alteracao DESC LIMIT 3';
  var bombeirocheck_values = [req.session.user.id];
  connection.query(query,bombeirocheck_values, function (err, results, fields) {
    if (err) throw err;
    res.render('pagina_ocorrencia.ejs', { pag: 'Ocorrências', title: 'Ocorrência - Bombeiros de Guaramirim', user: req.session.user, data: results,relatorio: results.id_relatorio, codigo: results.cod_relatorio, data_alterado: results.ultima_alteracao, fk_paciente: results.fk_paciente, fk_observacoes: results.fk_observacoes, fk_avaliacaocinematica: results.fk_avaliacaocinematica, fk_decisaotransporte: results.fk_decisaotransporte, fk_formadeconducao: results.fk_formadeconducao, fk_objetorecolhido: results.fk_objetorecolhido, fk_prob_encontrados_suspeitos: results.fk_prob_encontrados_suspeitos, fk_procedimentos_efetuados: results.fk_procedimentos_efetuados, fk_sinais_sintomas: results.fk_sinais_sintomas, fk_teste_glasgow: results.fk_teste_glasgow, fk_tipo_ocorrencia_pre_hospitalar: results.fk_tipo_ocorrencia_pre_hospitalar, fk_vitima_era: results.fk_vitima_era, fk_ferimentos_corpo: results.fk_ferimentos_corpo, fk_finalizacao: results.fk_finalizacao, fk_anamne_emergencial: results.fk_anamne_emergencial, fk_anamne_gestacional: results.fk_anamne_gestacional, fk_materiais_hospital: results.fk_materiais_hospital, fk_materiais_descarte: results.fk_materiais_descarte, fk_sinais_vitais: results.fk_sinais_vitais, data_relatorio: results.data_relatorio, criador_relatorio: results.criador_relatorio  });
  });
});

router.get('/ocview', requireAuth, function (req, res, next) {
  var paciente = req.query.paciente;
  var observ = req.query.observ;
  var avacine = req.query.avacine;
  var dct = req.query.dct;
  var fc = req.query.fc;
  var obj = req.query.obj;
  var pbs = req.query.pbs;
  var pe = req.query.pe;
  var ss = req.query.ss;
  var glasgow = req.query.glasgow;
  var tpo = req.query.tpo;
  var vte = req.query.vte;
  var ferimentos = req.query.ferimentos;
  var final = req.query.final;
  var anamneemer = req.query.anamneemer;
  var anamnegesta = req.query.anamnegesta;
  var mtehosp = req.query.mtehosp;
  var mtedesc = req.query.mtedesc;
  var sv = req.query.sv;
  var id = parseInt(paciente, 10);
  connection.query('SELECT * FROM paciente WHERE id_paciente = ?', [id], function (err, results, fields) {
    if (err) throw err;
    var nome = results[0].Nome_paciente;
    var idade = results[0].Idade_paciente;
    var telefone = results[0].telefone;
    var rgcpf = results[0].RG_cpf_paciente;
    var local = results[0].Local_do_ocorrido;
    var sexo = results[0].sexo_paciente;
    var gravida = results[0].gravidez;
    var acomp = results[0].fk_acompanhante;
    connection.query('SELECT * FROM acompanhante WHERE id_acompanhante = ?', [acomp], function (err, results, fields) {
      var acompnome = results[0].nome;
      var acompidade = results[0].idade;

      res.render('vitima_alter.ejs', { pag: 'Ocorrências', title: 'Ocorrência - Bombeiros de Guaramirim', user: req.session.user, paciente: id, observ: observ, avacine: avacine, dct: dct, fc: fc, obj: obj, pbs: pbs, pe: pe, ss: ss, glasgow: glasgow, tpo: tpo, vte: vte, ferimentos: ferimentos, final: final, anamneemer: anamneemer, anamnegesta: anamnegesta, mtehosp: mtehosp, mtedesc: mtedesc, sv: sv, nome: nome, idade: idade, telefone: telefone, rgcpf: rgcpf, local: local, sexo: sexo, gravida: gravida, acompnome: acompnome, acompidade: acompidade, acomp: acomp });
    });
  });
});

router.post('/vitimaalter', function (req, res) {
  var paciente = req.body.paciente;
  var observ = req.body.observ;
  var avacine = req.body.avacine;
  var dct = req.body.dct;
  var fc = req.body.fc;
  var obj = req.body.obj;
  var pbs = req.body.pbs;
  var pe = req.body.pe;
  var ss = req.body.ss;
  var glasgow = req.body.glasgow;
  var tpo = req.body.tpo;
  var vte = req.body.vte;
  var ferimentos = req.body.ferimentos;
  var final = req.body.final;
  var anamneemer = req.body.anamneemer;
  var anamnegesta = req.body.anamnegesta;
  var mtehosp = req.body.mtehosp;
  var mtedesc = req.body.mtedesc;
  var sv = req.body.sv;
  var nome = req.body.nome;
  var idade = req.body.idade;
  var numero = req.body.telefone;
  var dados = req.body.rgcpf;
  var local = req.body.local;
  var sexo = req.body.sexo;
  var gravida_val = req.body.gravida_val;
  var acomp = req.body.acomp;
  var acompnome = req.body.acompnome;
  var acompidade = req.body.idadeacomp;
  var id_paciente = parseInt(paciente, 10);
  var relatorio = req.body.relatorio;
  var sqlacompanhante = 'UPDATE acompanhante SET nome = ?, idade = ? WHERE id_acompanhante = ?';
  connection.query(sqlacompanhante, [acompnome, acompidade, acomp], function (err, result) {
    if (err) throw err;
    console.log("1 record inserted");
  });
  var sql = 'UPDATE paciente SET Nome_paciente = ?, Idade_paciente = ?, telefone = ?, RG_cpf_paciente = ?, Local_do_ocorrido = ?, sexo_paciente = ?, fk_acompanhante = ?, gravidez = ? WHERE id_paciente = ?';
  var values = [nome, idade, numero, dados, local, sexo, acomp, gravida_val, id_paciente];
  connection.query(sql, values, function (err, result) {
    if (err) throw err;
    console.log("1 record inserted");
  });
  res.redirect('/alterform?relatorio=' + relatorio + 'paciente=' + id_paciente + '&observ=' + observ + '&avacine=' + avacine + '&dct=' + dct + '&fc=' + fc + '&obj=' + obj + '&pbs=' + pbs + '&pe=' + pe + '&ss=' + ss + '&glasgow=' + glasgow + '&tpo=' + tpo + '&vte=' + vte + '&ferimentos=' + ferimentos + '&final=' + final + '&anamneemer=' + anamneemer + '&anamnegesta=' + anamnegesta + '&mtehosp=' + mtehosp + '&mtedesc=' + mtedesc + '&sv=' + sv);
});

router.get('/alterform', requireAuth, function (req, res, next) {
  var observ = req.query.observ;
  var avacine = req.query.avacine;
  var dct = req.query.dct;
  var fc = req.query.fc;
  var obj = req.query.obj;
  var pbs = req.query.pbs;
  var pe = req.query.pe;
  var ss = req.query.ss;
  var glasgow = req.query.glasgow;
  var tpo = req.query.tpo;
  var vte = req.query.vte;
  var ferimentos = req.query.ferimentos;
  var final = req.query.final;
  var anamneemer = req.query.anamneemer;
  var anamnegesta = req.query.anamnegesta;
  var mtehosp = req.query.mtehosp;
  var mtedesc = req.query.mtedesc;
  var sv = req.query.sv;

  var anme_emeq = 'SELECT * FROM anamnese_emergencial WHERE id_anamnese_emer = ?';
  connection.query(anme_emeq, [anamneemer], function (err, results, fields) {
    if (err) throw err;
    // Handle the results
    var oqacon = results[0].o_que_ocorreu;
    var quantotemp = results[0].quanto_tempo_ocorreu;
    var problemasaude = results[0].quais_problemas;
    var medicamentos = results[0].quais_medicamentos;
    var aov = results[0].aconteceu_outras_vezes;
    var med = results[0].usa_medicacao;
    var horamedica = results[0].horario_ultima_medicacao;
    var tipoalergia = results[0].alergias;
    var alergia = results[0].alergico;
    var ingeriu = results[0].ingeriu_mais_de_6hrs;
    var hora_ingest = results[0].ingeriu_que_hrs;


    var anme_gestq = 'SELECT * FROM anamnese_gestacional WHERE id_anamnese_gest = ?';
    connection.query(anme_gestq, [anamnegesta], function (err, results, fields) {
      if (err) throw err;
      // Handle the results
      var periodogesta = results[0].periodo;
      var medico_pre_natal = results[0].pre_natal;
      var quantosfilho = results[0].quantos_filhos;
      var horacontracoes = results[0].inicio_contracoes;
      var duracaocontracao = results[0].duracao_contracoes;
      var intervalocontracoes = results[0].intervalo_contracoes;
      var hora_nascimento = results[0].hora_nascimento;
      var nome_bebe = results[0].nome_do_bebe;


      var dctransporteq = 'SELECT * FROM decisao_transporte WHERE id_decisao_transporte = ?';
      connection.query(dctransporteq, [dct], function (err, results, fields) {
        if (err) throw err;
        // Handle the results
        var dct = results[0].transporte_opcao;
        var motorista = results[0].motorista;
        var socorrista1 = results[0].socorrista1;
        var socorrista2 = results[0].socorrista2;
        var socorrista3 = results[0].socorrista3;
        var demandante = results[0].demandante;

        var fcq = 'SELECT * FROM forma_de_conducao WHERE id_forma_de_conducao = ?';
        connection.query(fcq, [fc], function (err, results, fields) {
          if (err) throw err;
          // Handle the results

          var fcop = results[0].opcao_escolhida;

          var observeq = 'SELECT * FROM observacoes WHERE id_observacoes = ?';
          connection.query(observeq, [observ], function (err, results, fields) {
            if (err) throw err;
            // Handle the results
            var obsgerais = results[0].observacoes;

            var objetosq = 'SELECT * FROM objeto_recolhido WHERE id_objeto_recolhido = ?';
            connection.query(objetosq, [obj], function (err, results, fields) {
              if (err) throw err;
              // Handle the results

              var objetos = results[0].descricao;

              var proceefetq = 'SELECT * FROM procedimentos_efetuados WHERE id_procedimentos_efetuados = ?';
              connection.query(proceefetq, [pe], function (err, results, fields) {
                if (err) throw err;
                // Handle the results

                var pe = results[0].codigo_selecoes;
                var tmusocolar = results[0].uso_colar_tmn;
                var lpmoxi = results[0].oxigenoterapia_lpm;
                var lpmreanima = results[0].reanimador_lpm;
                var outropcef = results[0].outros;


                var corpoq = 'SELECT * FROM ferimentos_corpo WHERE id_ferimentos_corpo = ?';
                connection.query(corpoq, [ferimentos], function (err, results, fields) {
                  if (err) throw err;
                  // Handle the results

                  var fle = results[0].fratura_luxacao_entorse;
                  var feridiv = results[0].ferimentos_diversos;
                  var hemorragia = results[0].hemorragias;
                  var evisc = results[0].evisceracao;
                  var fabfaf = results[0].FAB_FAF;
                  var amput = results[0].amputacao;
                  var queim1 = results[0].queimadura_1_grau;
                  var queim2 = results[0].queimadura_2_grau;
                  var queim3 = results[0].queimadura_3_grau;
                  var queim4 = results[0].queimadura_4_grau;


                  var avacineq = 'SELECT * FROM avaliacao_cinematica WHERE id_avaliacao_cinematica = ?';
                  connection.query(avacineq, [avacine], function (err, results, fields) {
                    if (err) throw err;
                    // Handle the results
                    var ac = results[0].escolhas;

                    var sinal_sintomaq = 'SELECT * FROM sinais_e_sintomas WHERE id_sinais_e_sintomas = ?';
                    connection.query(sinal_sintomaq, [ss], function (err, results, fields) {
                      if (err) throw err;
                      // Handle the results
                      var CSESS = results[0].codigo_selecoes;
                      var outrosinal_sintoma = results[0].outros;
                      var SESS = results[0].codigo_tipopupilas;
                      var SESS2 = results[0].codigo_cianose;
                      var SESS3 = results[0].cod_edema;
                      var SESS4 = results[0].cod_hemorragia;
                      var SESS5 = results[0].cod_parada;


                      var sinalvitalq = 'SELECT * FROM sinais_vitais WHERE id_sinais_vitais = ?';
                      connection.query(sinalvitalq, [sv], function (err, results, fields) {
                        if (err) throw err;
                        // Handle the results
                        
                        var pressaoarteria = results[0].pressao_arterial;
                        var pulso = results[0].pulso;
                        var respira = results[0].respiracao;
                        var satura = results[0].saturacao;
                        var htg = results[0].hgt;
                        var temperatura = results[0].temperatura;
                        var perf = results[0].perfusao;
                        var normal = results[0].paciente_normal;


                        var glasgowq = 'SELECT * FROM teste_de_glasgow WHERE id_teste_de_glasgow = ?';
                        connection.query(glasgowq, [glasgow], function (err, results, fields) {
                          if (err) throw err;
                          // Handle the results

                          var adultoglasgow = results[0].adulto;
                          var somaglasgow = results[0].soma_total;
                          var nivelglasgow = results[0].nivel_declarado;


                          var tipoocorrenciaq = 'SELECT * FROM tipo_ocorrencia_pre_hospitalar WHERE id_tipo_ocorrencia_pre_hospitalar = ?';
                          connection.query(tipoocorrenciaq, [tpo], function (err, results, fields) {
                            if (err) throw err;
                            // Handle the results

                            var tpo = results[0].codigo_selecoes;
                            var outrosTPO = results[0].outros;


                            var vitimaeraq = 'SELECT * FROM vitima_era WHERE id_vitima_era = ?';
                            connection.query(vitimaeraq, [vte], function (err, results, fields) {
                              if (err) throw err;
                              // Handle the results

                              var vte = results[0].escolha;

                              var finalocoq = 'SELECT * FROM finalizacao_ocorrencia WHERE id_finalizacao_ocorrencia = ?';
                              connection.query(finalocoq, [final], function (err, results, fields) {
                                if (err) throw err;
                                // Handle the results

                                var nusb = results[0].n_USB;
                                var despachante = results[0].despachante;
                                var h_ch = results[0].H_CH;
                                var km_final = results[0].km_final;
                                var cod = results[0].cod_IR_PS;
                                var codsiasus = results[0].codigo_SIA_SUS;

                                var problemassuspeitosq = 'SELECT * FROM problemas_encontrado_suspeitos WHERE id_problemas_encontrado_suspeitos = ?';
                                connection.query(problemassuspeitosq, [pbs], function (err, results, fields) {
                                  if (err) throw err;
                                  // Handle the results
                                  
                                  var pes = results[0].respira_psiquiatrico;
                                  var outroproblemasuspeito = results[0].outros;
                                  var outrotransporte = results[0].transporte_outros;
                                  var pes2 = results[0].diabetes;
                                  var pes3 = results[0].obstetrico;
                                  var pes4 = results[0].transporte;

                                  var mtehospq = 'SELECT * FROM materiais_hospital WHERE id_materiais_hospital = ?';
                                  connection.query(mtehospq, [mtehosp], function (err, results, fields) {
                                    if (err) throw err;
                                    var colar = results[0].fk_colar;
                                    var ked = results[0].fk_KED;
                                    var ttf = results[0].fk_ttf;
                                    var canula = results[0].canula_qtde;
                                    var tirante = results[0].tirante_cabeca_qtde;
                                    var tirante = results[0].tirante_aranha_qtde;
                                    var macarigida = results[0].maca_rigida_qtde;
                                    var coxins = results[0].coxins_estabilizador_qtde;
                                    var base = results[0].base_estabilizador_qtde;
                                    var outromaterialhosp = results[0].outros;

                                    var mtedescq = 'SELECT * FROM materiais_descartaveis WHERE id_materiais_descartaveis = ?';
                                    connection.query(mtedescq, [mtedesc], function (err, results, fields) {
                                      if (err) throw err;
                                      var ataduras = results[0].fk_ataduras;
                                      var kits = results[0].fk_kit;
                                      var talas = results[0].fk_talas;
                                      var caratertpoc = results[0].cateter_tp_oculos_qtde;
                                      var compressa = results[0].compressa_comum_qtde;
                                      var luvasdesc = results[0].luvas_descartaveis_qtde;
                                      var mascdesc = results[0].mascaras_descartaveis_qtde;
                                      var mantailuminizada = results[0].manta_luminizada_qtde;
                                      var pasdodea = results[0].pas_do_dea_qtde;
                                      var sonda = results[0].sonda_de_aspiracao_qtde;
                                      var sorofisi = results[0].soro_fisiologico_qtde;
                                      var outromaterialdesc = results[0].outros;

                                      var colarq = 'SELECT * FROM colar WHERE id_colar = ?';
                                      connection.query(colarq, [colar], function (err, results, fields) {
                                        if (err) throw err;
                                        // Handle the results
                                        var colarqtd = results[0].qtde_colar;
                                        var colartmn = results[0].tamanho_colar;

                                        var ttfq = 'SELECT * FROM ttf WHERE id_ttf = ?';
                                        connection.query(ttfq, [ttf], function (err, results, fields) {
                                          if (err) throw err;
                                          // Handle the results
                                          var ttfqtd = results[0].qtde_ttf;
                                          var ttftmn = results[0].tamanho_tff;

                                          var kedq = 'SELECT * FROM ked WHERE id_ked = ?';
                                          connection.query(kedq, [ked], function (err, results, fields) {
                                            if (err) throw err;
                                            // Handle the results

                                            var kedqtd = results[0].qtde_ked;
                                            var kedtmn = results[0].tamanho_ked;

                                            var kitsq = 'SELECT * FROM kits WHERE id_kits = ?';
                                            connection.query(kitsq, [kits], function (err, results, fields) {
                                              if (err) throw err;

                                              var kitstmn = results[0].H_P_G;
                                              var kitsqtd = results[0].qtde;

                                              var atadurasq = 'SELECT * FROM ataduras WHERE id_ataduras = ?';
                                              connection.query(atadurasq, [ataduras], function (err, results, fields) {
                                                if (err) throw err;

                                                var atadurasqtd = results[0].qtde;
                                                var atadurastmn = results[0].tamanho;
                                                var talasq = 'SELECT * FROM talas_pap WHERE id_talas_pap = ?';
                                                connection.query(talasq, [talas], function (err, results, fields) {
                                                  if (err) throw err;

                                                  var talasqtd = results[0].qtde;
                                                  var talastmn = results[0].tamanho;
                                                  var relatorio = req.query.relatorio;

                                                  res.render('form_alter.ejs', { pag: 'Ocorrências', title: 'Ocorrência - Bombeiros de Guaramirim', user: req.session.user, relatorio: relatorio,  paciente: paciente, observ: observ, avacine: avacine, dct: dct, fc: fc, obj: obj, pbs: pbs, pe: pe, ss: ss, glasgow: glasgow, tpo: tpo, vte: vte, ferimentos: ferimentos, final: final, anamneemer: anamneemer, anamnegesta: anamnegesta, mtehosp: mtehosp, mtedesc: mtedesc, sv: sv, oqacon: oqacon, quantotemp: quantotemp, problemasaude: problemasaude, medicamentos: medicamentos, aov: aov, med: med, horamedica: horamedica, tipoalergia: tipoalergia, alergia: alergia, ingeriu: ingeriu, hora_ingest: hora_ingest, periodogesta: periodogesta, medico_pre_natal: medico_pre_natal, quantosfilho: quantosfilho, horacontracoes: horacontracoes, duracaocontracao: duracaocontracao, intervalocontracoes: intervalocontracoes, hora_nascimento: hora_nascimento, nome_bebe: nome_bebe, dct: dct, motorista: motorista, socorrista1: socorrista1, socorrista2: socorrista2, socorrista3: socorrista3, demandante: demandante, fcop: fcop, obsgerais: obsgerais, objetos: objetos, pe: pe, fle: fle, feridiv: feridiv, hemorragia: hemorragia, evisc: evisc, fabfaf: fabfaf, amput: amput, queim1: queim1, queim2: queim2, queim3: queim3, queim4: queim4, ac: ac, CSESS: CSESS, pressaoarteria: pressaoarteria, pulso: pulso, respira: respira, satura: satura, htg: htg, temperatura: temperatura, perf: perf , normal: normal, adultoglasgow: adultoglasgow, somaglasgow: somaglasgow, nivelglasgow: nivelglasgow, tpo: tpo, outrosTPO: outrosTPO, vte: vte, nusb: nusb, despachante: despachante, h_ch: h_ch, km_final: km_final, cod: cod, codsiasus: codsiasus, pes: pes, outroproblemasuspeito: outroproblemasuspeito, outrotransporte: outrotransporte, pes2: pes2, pes3: pes3, pes4: pes4, colarqtd: colarqtd, colartmn: colartmn, ttfqtd: ttfqtd, ttftmn: ttftmn, kedqtd: kedqtd, kedtmn: kedtmn, kitsqtd: kitsqtd, kitstmn: kitstmn, atadurasqtd: atadurasqtd, atadurastmn: atadurastmn, talasqtd: talasqtd, talastmn: talastmn,talas:  talas, canula: canula, tirante: tirante, macarigida: macarigida, coxins: coxins, base: base, outromaterialhosp: outromaterialhosp, caratertpoc: caratertpoc, compressa: compressa, luvasdesc: luvasdesc, mascdesc: mascdesc, mantailuminizada: mantailuminizada, pasdodea: pasdodea, sonda: sonda, sorofisi: sorofisi, outromaterialdesc: outromaterialdesc , ataduras: ataduras, kits : kits, ked: ked, ttf: ttf, colar: colar});
                                                });
                                              });
                                            });
                                          });
                                        });
                                      });
                                    });
                                  });
                                });
                              });
                            });
                          });
                        });
                      });
                    });
                  });
                });
              });
            });
          });
        });
      });
    });
  });
});

router.post('/form_alter', requireAuth, function (req, res, next) {
  var observ2 = req.query.observ2;
  var avacine2 = req.query.avacine2;
  var dct2 = req.query.dct2;
  var fc2 = req.query.fc2;
  var obj2 = req.query.obj2;
  var pbs2 = req.query.pbs2;
  var pe2 = req.query.pe2;
  var ss2 = req.query.ss2;
  var glasgow2 = req.query.glasgow2;
  var tpo2 = req.query.tpo2;
  var vte2 = req.query.vte2;
  var ferimentos2 = req.query.ferimentos2;
  var final2 = req.query.final2;
  var anamneemer2 = req.query.anamneemer2;
  var anamnegesta2 = req.query.anamnegesta2;
  var mtehosp2 = req.query.mtehosp2;
  var mtedesc2 = req.query.mtedesc2;
  var sv2 = req.query.sv2;
  var relatorio = req.query.relatorio;
  var talas2 = req.query.talas2;
  var ttf2 = req.query.tff2;
  var ataduras2 = req.query.ataduras2;
  var colar2 = req.query.colar2;
  var ked2 = req.query.ked2;
  var kits2 = req.query.kits2;


  var tpo = req.body.radios1 || 0;
  var vte = req.body.radiovte1 || 0;
  var pe = req.body.checkboxpe1 || 0;
  var normal = req.body.sinais_annsv1 || 0;
  var perf = req.body.sinais_perfsv1 || 0;
  var ac = req.body.checkboxac1 || 0;
  var pes = req.body.radio1pes || 0;
  var pes2 = req.body.radio1pes2 || 0;
  var pes3 = req.body.radio1pes3 || 0;
  var pes4 = req.body.radio1pes4 || 0;
  var dct = req.body.dct1 || 0;
  var fc = req.body.forma_conducao || 0;
  var ked = req.body.kedradioStfftate1 || 0;
  var colar = req.body.colarradioStfftate1 || 0;
  var ttf = req.body.radiotff1 || 0;
  var aov = req.body.radioaov || 0;
  var pbs = req.body.radiopbs || 0;
  var med = req.body.radiomed || 0;
  var alergia = req.body.radioalergia || 0;
  var ingeriu = req.body.radioingerir || 0;
  var cod = req.body.cod1 || 0;
  var CSESS = req.body.checkboxses || 0;
  var SESS = req.body.radiopupila || 0;
  var SESS2 = req.body.radiocianose || 0;
  var SESS3 = req.body.radioedema || 0;
  var SESS4 = req.body.radiohemorragia || 0;
  var SESS5 = req.body.checkboxparada || 0;
  var corpo = req.body.ferimentos || {
    "Fratura/luxação/entorse": [],
    "Ferimentos diversos": [],
    "Hemorragias": [],
    "Evisceração": [],
    "F.A.B./F.A.F.": [],
    "Amputação": [],
    "Queimadura 1 grau": [],
    "Queimadura 2 grau": [],
    "Queimadura 3 grau": [],
    "Queimadura 4 grau": []
  };
  console.log(corpo)
  if (corpo === undefined || corpo === null || corpo === '[object Object]') {
    corpo = {
      "Fratura/luxação/entorse": [],
      "Ferimentos diversos": [],
      "Hemorragias": [],
      "Evisceração": [],
      "F.A.B./F.A.F.": [],
      "Amputação": [],
      "Queimadura 1 grau": [],
      "Queimadura 2 grau": [],
      "Queimadura 3 grau": [],
      "Queimadura 4 grau": []
    };
  }
  var ferimentos = JSON.parse(corpo);
  console.log(ferimentos);
  console.log(req.body.adulto);
  var savedRadioAGState = req.body.radio_pre_natalState1 || 0;
  var savedRadioAG2State = req.body.radio_p_filho1State1 || 0;
  var savedRadioAG3State = req.body.radio_pre_natal1State1 || 0;
  var savedRadioAG4State = req.body.radio_pre_natal2State1 || 0;
  var savedRadioAG5State = req.body.radio_pre_natal3State1 || 0;
  var parto_realizado = req.body.radio_parto1 || 0;
  var sexobebe = req.body.radio_bebe1 || 0;
  var savedRadioAG8State = req.body.radio_pre_natal4State1 || 0;
  var ataduras = req.body.radioState_ataduras || 0;
  var talas = req.body.radioState_talas || 0;
  var kits = req.body.radioState_KITS || 0;
  var somaglasgow = req.body.totalglasgow || 0;
  var nivelglasgow = req.body.nivel || 0;

  var gravida = req.body.gravida || 0;
  var textareafinal = req.body.textareafinal1;
  var parts = JSON.parse(textareafinal);
  if (gravida == 1) {
    var [
      outrosTPO, pressaoarteria, respira, satura, temperatura,
      pulso, htg, outrotransporte, outroproblemasuspeito, outrosinal_sintoma, motorista,
      socorrista1, socorrista2, socorrista3, demandante, outropcef,
      outromaterialdesc, outromaterialhosp, oqacon, quantotemp, problemasaude,
      medicamentos, horamedica, tipoalergia, hora_ingest, periodogesta, medico_pre_natal, quantosfilho,
      horacontracoes, duracaocontracao, intervalocontracoes, hora_nascimento, nome_bebe, objetos, obsgerais, nusb,
      nocorrencia, despachante, h_ch, km_final, codsiasus
    ] = parts;
    console.log(parts)
  } else {
    var [
      outrosTPO, pressaoarteria, respira, satura, temperatura,
      pulso, htg, outrotransporte, outroproblemasuspeito, outrosinal_sintoma, motorista,
      socorrista1, socorrista2, socorrista3, demandante, outropcef,
      outromaterialdesc, outromaterialhosp, oqacon, quantotemp, problemasaude,
      medicamentos, horamedica, tipoalergia, hora_ingest, objetos, obsgerais, nusb,
      nocorrencia, despachante, h_ch, km_final, codsiasus, periodogesta, medico_pre_natal, quantosfilho,
      horacontracoes, duracaocontracao, intervalocontracoes, hora_nascimento, nome_bebe
    ] = parts;
    // var periodogesta = 0;
    // var medico_pre_natal = 0;
    // var quantosfilho = 0;
    // var horacontracoes = 0;
    // var duracaocontracao = 0;
    // var intervalocontracoes = 0;
    // var hora_nascimento = 0;
    // var nome_bebe = 0;
    console.log(parts)
  }
  if (km_final == '') {
    km_final = 0;
  }
  var inputtextfinal = req.body.inputtextfinal1;
  var partsinput = JSON.parse(inputtextfinal);
  var [tmusocolar, lpmoxi, lpmreanima, atadurasqtd, caratertpoc, compressa, kitsqtd, luvasdesc, mascdesc, mantailuminizada, pasdodea, sonda, sorofisi, talasqtd, base, colarqtd, coxins, kedqtd, macarigida, ttfqtd, tirante, canula] = partsinput;
  console.log(partsinput)
  var anme_emeq = 'UPDATE anamnese_emergencial SET o_que_ocorreu = ?, quanto_tempo_ocorreu = ?, quais_problemas = ?, quais_medicamentos = ?, aconteceu_outras_vezes = ?, usa_medicacao = ?, horario_ultima_medicacao = ?, alergias = ?, alergico = ?, ingeriu_mais_de_6hrs = ?, ingeriu_que_hrs = ?, possui_problema_saude = ? WHERE id_anamnese_emer = ?';
  var anme_eme_values = [oqacon, quantotemp, problemasaude, medicamentos, aov, med, horamedica, tipoalergia, alergia, ingeriu, hora_ingest, pbs, anamneemer2];
  var anme_gestq = 'UPDATE anamnese_gestacional SET periodo = ?, pre_natal = ?, medico_pre_natal = ?, possibilidade_complicacoes = ?, primeiro_filho = ?, quantos_filhos = ?, inicio_contracoes = ?, duracao_contracoes = ?, intervalo_contracoes = ?, pressao_quadril_ou_evacuar = ?, ruptura_bolsa = ?, inspecao_visual = ?, parto_realizado = ?, hora_nascimento = ?, sexo_bebe = ?, nome_do_bebe = ? WHERE id_anamnese_gest = ?';
  var anme_gest_values = [periodogesta, savedRadioAGState, medico_pre_natal, savedRadioAG8State, savedRadioAG2State, quantosfilho, horacontracoes, duracaocontracao, intervalocontracoes, savedRadioAG3State, savedRadioAG4State, savedRadioAG5State, parto_realizado, hora_nascimento, sexobebe, nome_bebe, anamnegesta2];
  var atadurasq = 'UPDATE ataduras SET tamanho = ?, qtde = ? WHERE id_atadura = ?';
  var ataduras_values = [ataduras, atadurasqtd, ataduras2];

  var dctransporte = 'UPDATE decisao_transporte SET transporte_opcao = ?, motorista = ?, socorrista1 = ?, socorrista2 = ?, socorrista3 = ?, demandante = ? WHERE id_decisao_trasporte = ?';
  var dctransporte_values = [dct, motorista, socorrista1, socorrista2, socorrista3, demandante, dct2];

  var fcq = 'UPDATE forma_de_conducao SET opcao_escolhida = ? WHERE id_forma_conducao = ?';
  var fc_values = [fc, fc2];

  var observe = 'UPDATE observacoes SET observacoes = ? WHERE id_observ = ?';
  var observe_values = [obsgerais, observ2];

  var objetosq = 'UPDATE objeto_recolhido SET descricao = ? WHERE id_recolhidos = ?';
  var objetos_values = [objetos, obj2];

  var talasq = 'UPDATE talas_pap SET tamanho = ?, qtde = ? WHERE id_talas_pap = ?';
  var talas_values = [talas, talasqtd, talas2];

  var proceefet = 'UPDATE procedimentos_efetuados SET codigo_selecoes = ?, uso_colar_tmn = ?, oxigenoterapia_lpm = ?, reanimador_lpm = ?, outros = ? WHERE id_procedimentos = ?';
  var proceefet_values = [pe, tmusocolar, lpmoxi, lpmreanima, outropcef, pe2];

  var colarq = 'UPDATE colar SET qtde_colar = ?, tamanho_colar = ? WHERE id_colar = ?';
  var colar_values = [colarqtd, colar, colar2];

  var fle = ferimentos["Fratura/luxação/entorse"].join('/');
  var feridiv = ferimentos["Ferimentos diversos"].join('/');
  var hemorragia = ferimentos["Hemorragias"].join('/');
  var evisc = ferimentos["Evisceração"].join('/');
  var fabfaf = ferimentos["F.A.B./F.A.F."].join('/');
  var amput = ferimentos["Amputação"].join('/');
  var queim1 = ferimentos["Queimadura 1 grau"].join('/');
  var queim2 = ferimentos["Queimadura 2 grau"].join('/');
  var queim3 = ferimentos["Queimadura 3 grau"].join('/');
  var queim4 = ferimentos["Queimadura 4 grau"].join('/');

  var corpoq = 'UPDATE ferimentos_corpo SET fratura_luxacao_entorse = ?, ferimentos_diversos = ?, hemorragias = ?, evisceracao = ?, FAB_FAF = ?, amputacao = ?, queimadura_1_grau = ?, queimadura_2_grau = ?, queimadura_3_grau = ?, queimadura_4_grau = ? WHERE id_ferimentos = ?';
  var corpo_values = [fle, feridiv, hemorragia, evisc, fabfaf, amput, queim1, queim2, queim3, queim4, ferimentos2];

  var kedq = 'UPDATE ked SET qtde_ked = ?, tamanho_ked = ? WHERE id_KED = ?';
  var ked_values = [kedqtd, ked, ked2];

  var kitsq = 'UPDATE kits SET H_P_G = ?, qtde = ? WHERE id_kits = ?';
  var kits_values = [kits, kitsqtd, kits2];

  var ttfq = 'UPDATE ttf SET qtde_ttf = ?, tamanho_tff = ? WHERE id_ttf = ?';
  var ttf_values = [ttfqtd, ttf, ttf2];

  var avacineq = 'UPDATE avaliacao_cinematica SET escolhas = ? WHERE id_cinematica = ?';
  var avacine_values = [ac, avacine2];

  var sinal_sintomaq = 'UPDATE sinais_e_sintomas SET codigo_selecoes = ?, outros = ?, codigo_tipopupilas = ?, codigo_cianose = ?, cod_edema = ?, cod_hemorragia = ?, cod_parada = ? WHERE id_sinal_sintoma = ?';
  var sinal_sintoma_values = [CSESS, outrosinal_sintoma, SESS, SESS2, SESS3, SESS4, SESS5, ss2];

  var sinalvital = 'UPDATE sinais_vitais SET pressao_arterial = ?, pulso = ?, respiracao = ?, saturacao = ?, hgt = ?, temperatura = ?, perfusao = ?, paciente_normal = ? WHERE id_sinais_vitais = ?';
  var sinalvital_values = [pressaoarteria, pulso, respira, satura, htg, temperatura, perf, normal, sv2];

  var glasgowq = 'UPDATE teste_de_glasgow SET soma_total = ?, nivel_declarado = ? WHERE id_teste_glasgow = ?';
  var glasgow_values = [ somaglasgow, nivelglasgow, glasgow2];

  var tipoocorrenciaq = 'UPDATE tipo_ocorrencia_pre_hospitalar SET codigo_selecoes = ?, outros = ? WHERE id_tipo_ocorrencia = ?';
  var tipoocorrencia_values = [tpo, outrosTPO, tpo2];

  var vitimaeraq = 'UPDATE vitima_era SET escolha = ? WHERE id_vit_era = ?';
  var vitimaera_values = [vte, vte2];

  var finalocoq = 'UPDATE finalizacao_ocorrencia SET n_USB = ?, despachante = ?, H_CH = ?, km_final = ?, cod_IR_PS = ?, codigo_SIA_SUS = ? WHERE id_finalizacao = ?';
  var finaloco_values = [nusb, despachante, h_ch, km_final, cod, codsiasus, final2];

  var problemassuspeitosq = 'UPDATE problemas_encontrado_suspeitos SET respira_psiquiatrico = ?, outros = ?, transporte_outros = ?, diabetes = ?, obstetrico = ?, transporte = ? WHERE id_problemas_suspeitos = ?';
  var problemassuspeitos_values = [pes, outroproblemasuspeito, outrotransporte, pes2, pes3, pes4, pbs2];

  connection.query(anme_emeq, anme_eme_values, function (error, results) {
    if (error) throw error;
    console.log('anamnese_emergencial updated');

    connection.query(anme_gestq, anme_gest_values, function (error, results) {
      if (error) throw error;
      console.log('anamnese_gestacional updated');

      connection.query(atadurasq, ataduras_values, function (error, results) {
        if (error) throw error;
        console.log('ataduras updated');

        // Continue with the rest of the queries...
      });
    });
  });

        connection.query(dctransporte, dctransporte_values, function (error, results) {
          if (error) throw error;
          console.log('decisao_transporte inserted');
       

          connection.query(fcq, fc_values, function (error, results) {
            if (error) throw error;
            console.log('forma_de_conducao inserted');
       

            connection.query(observe, observe_values, function (error, results) {
              if (error) throw error;
              console.log('observacoes inserted');
    

              connection.query(objetosq, objetos_values, function (error, results) {
                if (error) throw error;
                console.log('objeto_recolhido inserted');
      

                connection.query(talasq, talas_values, function (error, results) {
                  if (error) throw error;
                  console.log('talas_pap inserted');
                  talas_id = results.insertId;

                  connection.query(proceefet, proceefet_values, function (error, results) {
                    if (error) throw error;
                    console.log('procedimentos_efetuados inserted');
                    proceefet_id = results.insertId;

                    connection.query(colarq, colar_values, function (error, results) {
                      if (error) throw error;
                      console.log('colar inserted');
                      colar_id = results.insertId;
                      console.log(colar_id);
                      connection.query(corpoq, corpo_values, function (error, results) {
                        if (error) throw error;
                        console.log('ferimentos_corpo inserted');
                        corpo_id = results.insertId;
                        console.log(colar_id);
                        connection.query(kedq, ked_values, function (error, results) {
                          if (error) throw error;
                          console.log('ked inserted');
                          ked_id = results.insertId;
                          console.log(ked_id);
                          connection.query(kitsq, kits_values, function (error, results) {
                            if (error) throw error;
                            console.log('kits inserted');
                            kits_id = results.insertId;
                            console.log(kits_id);
                            connection.query(ttfq, ttf_values, function (error, results) {
                              if (error) throw error;
                              console.log('ttf inserted');
                          

                              connection.query(avacineq, avacine_values, function (error, results) {
                                if (error) throw error;
                                console.log('avaliacao_cinematica inserted');
                          

                                connection.query(sinal_sintomaq, sinal_sintoma_values, function (error, results) {
                                  if (error) throw error;
                                  console.log('sinais_e_sintomas inserted');
                           

                                  connection.query(sinalvital, sinalvital_values, function (error, results) {
                                    if (error) throw error;
                                    console.log('sinais_vitais inserted');
                               
                                    connection.query(glasgowq, glasgow_values, function (error, results) {
                                      if (error) throw error;
                                      console.log('teste_de_glasgow inserted');
                               

                                      connection.query(tipoocorrenciaq, tipoocorrencia_values, function (error, results) {
                                        if (error) throw error;
                                        console.log('tipo_de_ocorrencia inserted');
                    

                                        connection.query(vitimaeraq, vitimaera_values, function (error, results) {
                                          if (error) throw error;
                                          console.log('vitima_era inserted');
                   

                                          connection.query(finalocoq, finaloco_values, function (error, results) {
                                            if (error) throw error;
                                            console.log('finalizacao_ocorrencia inserted');
                                
                                            var materiaishosp = 'UPDATE materiais_hospital SET canula_qtde = ?, tirante_cabeca_qtde = ?, tirante_aranha_qtde = ?, maca_rigida_qtde = ?, coxins_estabilizador_qtde = ?, base_estabilizador_qtde = ?, outros = ? WHERE id_materiais_hospital = ?;';
                                            var materiaishosp_values = [canula, tirante, tirante, macarigida, coxins, base, outromaterialhosp, mtehosp2];

                                            connection.query(materiaishosp, materiaishosp_values, function (error, results) {
                                              if (error) throw error;
                                              console.log('materiais_hospital inserted');
                                           

                                                var materiaisdesc = 'UPDATE materiais_descartaveis SET cateter_tp_oculos_qtde = ?, compressa_comum_qtde = ?, luvas_descartaveis_qtde = ?, mascaras_descartaveis_qtde = ?, manta_luminizada_qtde = ?, pas_do_dea_qtde = ?, sonda_de_aspiracao_qtde = ?, soro_fisiologico_qtde = ?, outros = ? WHERE id_materiais_hospital = ?;'
                                                var materiaisdesc_values = [caratertpoc, compressa, luvasdesc, mascdesc, mantailuminizada, pasdodea, sonda, sorofisi, outromaterialdesc, mtedesc2];

                                                connection.query(materiaisdesc, materiaisdesc_values, function (error, results) {
                                                  if (error) throw error;
                                                  console.log('materiais_descartaveis inserted');
                     

                                                  connection.query(problemassuspeitosq, problemassuspeitos_values, function (error, results) {
                                                    if (error) throw error;
                                                    console.log('problemas_encontrado_suspeitos inserted');
                                       
                                                    var data = new Date();
                                                    var formattedDate = data.getFullYear() + '-' + (data.getMonth() + 1) + '-' + data.getDate();
                                                    var updateRelatorio = 'UPDATE relatorio SET ultima_alteracao = ? WHERE id_relatorio = ?;';
                                                    var updateRelatorioValues = [  formattedDate, relatorio ];

                                                    connection.query(updateRelatorio, updateRelatorioValues, function (error, results) {
                                                      if (error) throw error;
                                                      console.log('relatorio updated');
                                                      res.redirect('/ocorrencia');
                                                    });
                                                  });
                                                });
                                            });
                                          });
                                        });
                                      });
                                    });
                                  });
                                });
                              });
                            });
                          });
                        });
                      });
                    });
                  });
                });
              });
            });
    });
  });
  res.redirect('/ocorrencia');
});

// Rota para o histório de ocorrências

router.get('/historico', requireAuth, function (req, res, next) {
  var sql = 'SELECT * FROM relatorio ORDER BY ultima_alteracao DESC';
  connection.query(sql, function (err, results, fields) {
    if (err) throw err;
    res.render('historico.ejs', { pag: 'Histórico', title: 'Histórico - Bombeiros de Guaramirim', user: req.session.user, data: results, codigo: results.cod_relatorio, data_alterado: results.ultima_alteracao, fk_paciente: results.fk_paciente, fk_observacoes: results.fk_observacoes, fk_avaliacaocinematica: results.fk_avaliacaocinematica, fk_decisaotransporte: results.fk_decisaotransporte, fk_formadeconducao: results.fk_formadeconducao, fk_objetorecolhido: results.fk_objetorecolhido, fk_prob_encontrados_suspeitos: results.fk_prob_encontrados_suspeitos, fk_procedimentos_efetuados: results.fk_procedimentos_efetuados, fk_sinais_sintomas: results.fk_sinais_sintomas, fk_teste_glasgow: results.fk_teste_glasgow, fk_tipo_ocorrencia_pre_hospitalar: results.fk_tipo_ocorrencia_pre_hospitalar, fk_vitima_era: results.fk_vitima_era, fk_ferimentos_corpo: results.fk_ferimentos_corpo, fk_finalizacao: results.fk_finalizacao, fk_anamne_emergencial: results.fk_anamne_emergencial, fk_anamne_gestacional: results.fk_anamne_gestacional, fk_materiais_hospital: results.fk_materiais_hospital, fk_materiais_descarte: results.fk_materiais_descarte, fk_sinais_vitais: results.fk_sinais_vitais, data_relatorio: results.data_relatorio, criador_relatorio: results.criador_relatorio });
  });
});

// Rota tela de contatos

router.get('/contato', function (req, res, next) {
  res.render('contatos.ejs', { pag: 'Contato', title: 'Contato - Bombeiros de Guaramirim', user: req.session.user });
});

// rota do registro de bombeiros
router.get('/registro', requireAuth, admLock, function (req, res, next) {
  res.render('registro_bomb_ambu.ejs', { pag: 'Bombeiros registrados', title: 'Bombeiros registrados - Bombeiros de Guaramirim', Nome: 'Olá, ' + req.session.user + '!', user: req.session.user });
});

// log out do usuário

router.get('/logout', function (req, res) {
  req.session.destroy(function (err) {
    if (err) {
      console.log('Error while destroying session.');
      console.log(err);
    } else {
      res.redirect('/');
    }
  });
});


module.exports = router;
