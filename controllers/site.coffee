Controller = require '../controller'
Person = require '../models/person'
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



module.exports = controller