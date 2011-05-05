Controller = require '../controller'
controller = new Controller 'other'
controller.index = ->
    this.render {}
module.exports = controller