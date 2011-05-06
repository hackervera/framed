express = require 'express'
app = express.createServer()
app.use(express.cookieParser());
app.use(express.bodyParser());
app.use(express.static(__dirname + '/public'));
nowjs = require 'now'
mu = require 'mu'
mu.root = './views'
app.everyone = nowjs.initialize app
app.mu = mu
fs = require 'fs'
fs.readdir './controllers', (err, files)->
    files.forEach (file)->
        controller = require "./controllers/#{file}"
        console.log controller.name
        controller.createServer app
    routes = require './config/routes'
    for path, route of routes
        app.get path, (req, res)->
            res.redirect route

app.listen 8080

