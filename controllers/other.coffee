Controller = require '../controller'
controller = new Controller 'other'
controller.index = ->
    layout = {}
    this.partial 'index', layout, (body)->
        layout.view = body
        controller.render layout
module.exports = controller