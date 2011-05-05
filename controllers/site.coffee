Controller = require '../controller'
controller = new Controller 'site'
layout = {}
controller.index = ->
    this.partial 'index', layout, (body)->
        layout.view = body
        controller.render layout
controller.foo = ->
    layout.name = 'tyler'
    layout.age = 27
    layout.badnumber = 30
    this.partial 'foo', layout, (body)->
        layout.view = body
        controller.render layout
controller.github = ->
    request = require 'request'
    request {uri: 'http://www.google.com'}, (err, res, resbody)->
        if err?
            resbody = err
        controller.partial 'github', layout, (body)->
            layout.view = body
            layout.resbody = resbody
            controller.render layout
module.exports = controller