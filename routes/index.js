const express = require('express');
var router = express.Router();
var app = express();
const cookieParser = require("cookie-parser");
var mysql = require('mysql2')
app.use(cookieParser());
const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: '',
  database: 'noar_bombeiro',
  port: '3306'
});
connection.on("error", (error) => console.log(error));
connection.once("open", () => console.log("Conectado ao banco"));

/* GET login page. */
router.get('/', function(req, res, next) {
  res.render('index.ejs', { title: 'Login - Bombeiros de Guaramirim' });
});

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
          req.session.user = results[0];
          console.log(req.session.user)
        console.log("Connected as " + req.session.user.Nome);
        res.render('formulario_principal.ejs', { title: 'Formulário - Bombeiros de Guaramirim', Nome: 'Olá, ' + req.session.user.Nome + '!'});
        } else {
          res.render('index.ejs', { title: 'Login - Bombeiros de Guaramirim' , errorMessage: 'Senha incorreta' });
          return;
        }
      } else {
        res.render('index.ejs', { title: 'Login - Bombeiros de Guaramirim' , errorMessage: 'Código não encontrado' });
        return;
      }
    } else {
      console.log("Consulta não realizada");
      return;
    }
  })
  console.log("Enviado ao servidor");
});

router.get('/form', function(req, res, next) {
  res.render('formulario_principal.ejs', { title: 'Formulário - Bombeiros de Guaramirim' });
});

router.get('/cadastro', function(req, res, next) {
  res.render('cadastro.ejs', { title: 'Cadastro - Bombeiros de Guaramirim' });
});

router.get('/ocorrencia', function(req, res, next) {
  res.render('pagina_ocorrencia.ejs', { title: 'Ocorrencia - Bombeiros de Guaramirim' });
});

router.get('/vitima', function(req, res, next) {
  res.render('vitima.ejs', { title: 'Vítima - Bombeiros de Guaramirim' });
});

router.get('/formulario', function(req, res, next) {
  res.render('formulario_principal.ejs', { title: 'Formulário - Bombeiros de Guaramirim' });
});

module.exports = router;
