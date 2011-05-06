Controller = require '../controller'
controller = new Controller 'other'

controller.index = ->
    this.render()

controller.wtf = ->
    this.render()
    
module.exports = controller