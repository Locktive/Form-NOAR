var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const https = require('https');
const session = require('express-session');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

var app = express();

var MySQLStore = require('express-mysql-session')(session);
app.use(cookieParser());
// conexão com o banco de dados
var options = {
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  database: 'noar_bombeiro',
  port: '3306',
  clearExpired: true,
  checkExpirationInterval: 600000,
  expiration: 3600000,
};

var sessionStore = new MySQLStore(options);

app.use(session({
  secret: 'bombeiro03249u2p54f8',
  resave: false,
  saveUninitialized: false,
  store: sessionStore,
  cookie: { maxAge: 3600000 }
}));

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  const statusCode = res.statusCode;
  res.status(err.status || 500);
  res.render('error.ejs', {
    message: err.message,
    error: statusCode
  });
});

module.exports = session;
module.exports = app;
