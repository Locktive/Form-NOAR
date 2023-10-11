var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index.ejs', { title: 'Login - Bombeiros de Guaramirim' });
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

module.exports = router;
