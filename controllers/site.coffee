Controller = require '../controller'
Person = require '../models/person'
Food = require '../models/food'
controller = new Controller 'site'

controller.index = ->
    this.render {}

controller.foo = ->
    dude = 
        name: 'tyler'
        age: 27
        badnumber: 30
    this.render dude

controller.people = ->
    Person.find {age: {$gt:10} }, (err, docs)->
        layout = 
            docs: docs
        controller.render layout

controller.food = ->
    Food.find {}, (err, docs)->
        data =
            docs: docs
        controller.render data

controller.signin = ->
    
    data =
        params: controller.req.params
    if controller.req.cookies.name?
        data.name = controller.req.cookies.name

    console.log data.params
    controller.render data

module.exports = controller