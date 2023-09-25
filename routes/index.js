var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index.ejs', { title: 'Login - Bombeiros de Guaramirim' });
});

router.get('/form', function(req, res, next) {
  res.render('formulario_principal.ejs', { title: 'Formulário - Bombeiros de Guaramirim' });
});

module.exports = router;
