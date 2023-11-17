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
    res.render('index.ejs', { title: 'Login - Bombeiros de Guaramirim', pag: 'Login' });
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
            isAdmin: results[0].adm // Checa se é admin
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

// rota para pagina de acesso negado

router.get('/acesso_negado', function(req, res, next) {
  res.render('acesso_negado.ejs', { pag: 'Acesso negado', title: 'Acesso negado' })
});

// Rota pra o formulario principal

router.get('/form',requireAuth, function(req, res, next) {
  res.render('formulario_principal.ejs', { pag: 'Formulário', title: 'Formulário - Bombeiros de Guaramirim' });
});

router.post('/form', function(req, res) {
  res.redirect('/ocorrencia');
});

// Rota para o cadastro de bombeiros

router.get('/cadastro',requireAuth,admLock, function(req, res, next) {
  res.render('cadastro.ejs', { pag: 'Cadastro', title: 'Cadastro - Bombeiros de Guaramirim' });
});

// Rota para o histório de ocorrências

router.get('/ocorrencia',requireAuth, function(req, res, next) {
  res.render('pagina_ocorrencia.ejs', { pag: 'Ocorrências',title: 'Ocorrência - Bombeiros de Guaramirim' });
});

// Rota para a Página dos dados da vítima

router.get('/vitima',requireAuth, function(req, res, next) {
  res.render('vitima.ejs', { pag: 'Dados da vítima',title: 'Vítima - Bombeiros de Guaramirim' });
});

// Rota tela de contatos

router.get('/contato', function(req, res, next) {
  res.render('contatos.ejs', { pag: 'Contato',title: 'Contato - Bombeiros de Guaramirim' });
});

// rota do registro de bombeiros
router.get('/registro',requireAuth,admLock, function(req, res, next) {
  res.render('registro_bomb_ambu.ejs', { pag: 'Bombeiros registrados',title: 'Bombeiros registrados - Bombeiros de Guaramirim', Nome: 'Olá, ' + req.session.user + '!' });
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
