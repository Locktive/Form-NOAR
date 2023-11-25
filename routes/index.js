const express = require('express');
var router = express.Router();
var app = express();
const cookieParser = require("cookie-parser");
app.use(cookieParser());

var mysql = require('mysql2');
// conexão com o banco de dados

var connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  database: 'noar_bombeiro',
  port: '3306'
});


/* GET login page. */
router.get('/', function(req, res, next) {
  if(req.session.user) {
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
            nome: results[0].Nome,
            isAdmin: results[0].adm, // Checa se é admin
            data_inicio: results[0].Data_inicio,
            codigo: results[0].codigo,
          };
          console.log(req.session.user)
        console.log("Connected as " + req.session.user.nome);
        res.redirect('/ocorrencia');
        } else {
          res.render('index.ejs', { title: 'Login - Bombeiros de Guaramirim' , pag: 'Login', errorMessage: 'Senha incorreta' });
          return;
        }
      } else {
        res.render('index.ejs', { title: 'Login - Bombeiros de Guaramirim' , pag: 'Login', errorMessage: 'Código não encontrado' });
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

// rota de teste
router.get('/teste', function(req, res, next) {
  res.render('./partials/procedimentos_efetuados.ejs', { pag: 'teste', title: 'teste', user: req.session.user })
});

// rota para pagina de acesso negado

router.get('/acesso_negado', function(req, res, next) {
  res.render('acesso_negado.ejs', { pag: 'Acesso negado', title: 'Acesso negado', user: req.session.user })
});

// Rota pra o formulario principal

router.get('/form',requireAuth, function(req, res, next) {
  res.render('formulario_principal.ejs', { pag: 'Formulário', title: 'Formulário - Bombeiros de Guaramirim', user: req.session.user , idade: req.session.idade, id_paciente : req.session.id_paciente, gravida: req.session.gravida});
  delete req.session.idade;
  delete req.session.gravida;
});



// post do formulario principal
router.post('/form', function(req, res) {










  delete req.session.id_paciente;
  res.redirect('/ocorrencia');
});

// Rota para o cadastro de bombeiros

router.get('/cadastro',requireAuth,admLock, function(req, res, next) {
  res.render('cadastro.ejs', { pag: 'Cadastro', title: 'Cadastro - Bombeiros de Guaramirim', user: req.session.user });
});

router.post('/cadastro', function(req, res) {
  var nome = req.body.nome;
  var codigo = req.body.codbomb;
  var senha = req.body.senha;
  var adm = req.body.adm;
  var admp = adm ? parseInt(adm, 10) : 0;
  var date = new Date();
  var formattedDate = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
  console.log(formattedDate);
  var sql = 'INSERT INTO bombeiro(Nome,Data_inicio, Operante,  codigo, senha, adm) VALUES (?,?, ?, ?, ?, ?)';
  var values = [nome,formattedDate, 1,codigo, senha, admp];
  connection.query(sql, values, function(err, result) {
    if (err) throw err;
    console.log("1 record inserted");
  });
  res.redirect('/contato');
});

router.get('/bombeiros',requireAuth,admLock, function(req, res, next) {
  var sql = 'SELECT * FROM bombeiro';
  connection.query(sql, function(err, results, fields) {
    if (err) throw err;
    res.render('bombeiros.ejs', { pag: 'Bombeiros', title: 'Bombeiros - Bombeiros de Guaramirim', user: req.session.user, data: results });
  });
});

router.get('/usuario',requireAuth, function(req, res, next) {
  res.render('usuario.ejs', { pag: 'Usuário', title: 'Usuário - Bombeiros de Guaramirim', user: req.session.user, data: req.session.user.data_inicio , nome: req.session.user.nome , codigo: req.session.user.codigo });  
});

// Rota para o histório de ocorrências

router.get('/ocorrencia',requireAuth, function(req, res, next) {
  res.render('pagina_ocorrencia.ejs', { pag: 'Ocorrências',title: 'Ocorrência - Bombeiros de Guaramirim', user: req.session.user });
});

// Rota para a Página dos dados da vítima

router.get('/vitima',requireAuth, function(req, res, next) {
  res.render('vitima.ejs', { pag: 'Dados da vítima',title: 'Vítima - Bombeiros de Guaramirim', user: req.session.user });
});


// post dos dados da vítima
router.post('/vitima', function(req, res) {
  delete req.session.id_paciente;
  var nome = req.body.nome;
  var idade = req.body.idade;
  req.session.idade = req.body.idade;
  var sexo = req.body.sexo;
  var numero = req.body.telefone;
  var dados = req.body.rgcpf;
  var acomp = req.body.acomp;
  var idadeacomp = req.body.idadeacomp;
  var sexo = req.body.sexo;
  var gravida_val = req.body.gravida_val;
  req.session.gravida = req.body.gravida_val;
  var local = req.body.local;
  var sql = 'INSERT INTO acompanhante(nome,idade) VALUES (?,?)';
  var valuesAcomp = [acomp, idadeacomp];

    connection.query(sql, valuesAcomp, function(err, results, fields) {
    if (err) throw err;
    
    // Obtenha o ID do acompanhante inserido
     var acompId = results.insertId;

    // Consulta SQL para inserir na tabela vitima
   var sqlVitima = 'INSERT INTO paciente(Nome_paciente, Idade_paciente, telefone, RG_cpf_paciente,Local_do_ocorrido,sexo_paciente, fk_acompanhante, gravidez) VALUES(?, ?, ?, ?, ?, ?, ?, ?)';
   var valuesVitima = [nome, idade, numero, dados,local,sexo, acompId, gravida_val];

    // Execute a consulta
    connection.query(sqlVitima, valuesVitima, function(err, result) {
        if (err) throw err;
        req.session.id_paciente = result.insertId;
        res.redirect('/form');
    });
});


});

// Rota tela de contatos

router.get('/contato', function(req, res, next) {
  res.render('contatos.ejs', { pag: 'Contato',title: 'Contato - Bombeiros de Guaramirim', user: req.session.user });
});

// rota do registro de bombeiros
router.get('/registro',requireAuth,admLock, function(req, res, next) {
  res.render('registro_bomb_ambu.ejs', { pag: 'Bombeiros registrados',title: 'Bombeiros registrados - Bombeiros de Guaramirim', Nome: 'Olá, ' + req.session.user + '!', user: req.session.user });
});

// log out do usuário

router.get('/logout', function(req, res) {
  req.session.destroy(function(err) {
    if (err) {
      console.log('Error while destroying session.');
      console.log(err);
    } else {
      res.redirect('/');
    }
  });
});


module.exports = router;
