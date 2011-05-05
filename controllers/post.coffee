Controller = require '../controller'
Person = require '../models/person'
# The second argument makes a POST handler
controller = new Controller 'post', 'post'
controller.index = ->
    layout =
        body: this.req.body
    inst = new Person()
    inst.name = this.req.body.name
    inst.age = this.req.body.age
    inst.save()
    console.log layout.body
    this.render layout
module.exports = controller