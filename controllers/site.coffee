Controller = require '../controller'
Person = require '../models/person'
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

controller.people = ->
    Person.find {age: {$gt:10} }, (err, docs)->
        console.log docs
        controller.partial 'people', layout, (body)->
            layout.view = body
            layout.docs = docs
            controller.render layout



module.exports = controller