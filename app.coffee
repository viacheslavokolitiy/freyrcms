express = require('express')
path = require('path')
favicon = require('serve-favicon')
logger = require('morgan')
cookieParser = require('cookie-parser')
bodyParser = require('body-parser')
routes = require('./js/index')
users = require('./js/users')
app = express()
# view engine setup
app.set 'views', path.join(__dirname, 'views')
app.set 'view engine', 'ejs'
# uncomment after placing your favicon in /public
#app.use(favicon(__dirname + '/public/favicon.ico'));
app.use logger('dev')
app.use bodyParser.json()
app.use bodyParser.urlencoded(extended: false)
app.use cookieParser()
app.use require('node-compass')(mode: 'expanded')
app.use '/css', express.static(path.join(__dirname, 'public/stylesheets'))
app.use '/js', express.static(path.join(__dirname, 'public/javascripts'))
app.use '/', routes
app.use '/users', users
app.get '/signup', (req, res) ->
  res.render 'signup', title: 'Sign up'
  return
app.get '/signin', (req, res) ->
  res.render 'signin', title: 'Sign in'
  return
# catch 404 and forward to error handler
app.use (req, res, next) ->
  err = new Error('Not Found')
  err.status = 404
  next err
  return
# error handlers
# development error handler
# will print stacktrace
if app.get('env') == 'development'
  app.use (err, req, res, next) ->
    res.status err.status or 500
    res.render 'error',
      message: err.message
      error: err
    return
# production error handler
# no stacktraces leaked to user
app.use (err, req, res, next) ->
  res.status err.status or 500
  res.render 'error',
    message: err.message
    error: {}
  return
module.exports = app