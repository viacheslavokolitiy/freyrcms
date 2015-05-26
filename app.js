// Generated by CoffeeScript 1.9.2
(function() {
  var app, bodyParser, cookieParser, express, favicon, logger, path, routes, users;

  express = require('express');

  path = require('path');

  favicon = require('serve-favicon');

  logger = require('morgan');

  cookieParser = require('cookie-parser');

  bodyParser = require('body-parser');

  routes = require('./js/index');

  users = require('./js/users');

  app = express();

  app.set('views', path.join(__dirname, 'views'));

  app.set('view engine', 'ejs');

  app.use(logger('dev'));

  app.use(bodyParser.json());

  app.use(bodyParser.urlencoded({
    extended: false
  }));

  app.use(cookieParser());

  app.use(require('node-compass')({
    mode: 'expanded'
  }));

  app.use('/css', express["static"](path.join(__dirname, 'public/stylesheets')));

  app.use('/js', express["static"](path.join(__dirname, 'public/javascripts')));

  app.use('/', routes);

  app.use('/users', users);

  app.get('/signup', function(req, res) {
    res.render('signup', {
      title: 'Sign up'
    });
  });

  app.get('/signin', function(req, res) {
    res.render('signin', {
      title: 'Sign in'
    });
  });

  app.use(function(req, res, next) {
    var err;
    err = new Error('Not Found');
    err.status = 404;
    next(err);
  });

  if (app.get('env') === 'development') {
    app.use(function(err, req, res, next) {
      res.status(err.status || 500);
      res.render('error', {
        message: err.message,
        error: err
      });
    });
  }

  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: {}
    });
  });

  module.exports = app;

}).call(this);

//# sourceMappingURL=app.js.map
