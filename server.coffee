express = require 'express'
app = express.createServer()
controllers = {}
app.use(express.static(__dirname + '/public'));
mu = require 'mu'
mu.root = './views'
render = (filename, data, cb)->
    mu.compile "#{filename}.mu", (err, parsed)->
        body = ""
        if err?
            console.log err
        mu.render(parsed, data)
            .on 'data', (data)->
                if data?
                    body += data.toString()
            .on 'end', ->
                cb(body)
fs = require 'fs'
fs.readdir './controllers', (err, files)->
    files.forEach (file)->
        controller = require "./controllers/#{file}"
        controller.createServer app
        controller.renderer render
        controllers[controller.name] = controller
    console.log controllers
    routes = require './config/routes'
    for path, route of routes
        app.get path, (req, res)->
            res.redirect route
        console.log "#{path} #{route}"     
app.listen 8080

