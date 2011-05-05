mu = require 'mu'
mu.root = './views'
class Controller
    constructor: (@name)->
    createServer: (app)->

        self = this
        app.all "/#{@name}/:function", (req, res)->
            self.res = res
            self.req = req
            self.function = req.params.function
            self[req.params.function]()
        app.all "/#{@name}", (req, res)->
            self.function = 'index'
            self.res = res
            self.req = req
            self.index()
    compile: (file, thing, cb)->
        self = this
        mu.compile file, (err, parsed)->
            body = ""
            if err?
                console.log err
            mu.render(parsed, thing)
                .on 'data', (data)->
                    if data?
                        body += data.toString()
                .on 'end', ->
                    cb(body)
    render: (thing)->
        self = this
        self.compile "#{@name}/#{@function}.html.mu", thing, (body)->
            thing.view = body
            self.compile "#{self.name}/#{self.name}.html.mu", thing, (body)->
                self.res.send body
    action: []

module.exports = Controller