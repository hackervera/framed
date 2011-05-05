mu = require 'mu'
mu.root = './views'
class Controller
    constructor: (@name)->
    createServer: (app)->
        self = this
        app.all "/#{@name}/:function?/:id?", (req, res)->
            self.res = res
            self.req = req
            self.id = req.params.id
            self.function = req.params.function
            if req.params.function?
                self[req.params.function](req.params.id)
            else
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
        if this.function?
            route = "#{@name}/#{@function}.html.mu"
        else 
            route = "#{@name}/index.html.mu"
        self.compile route, thing, (body)->
            thing.view = body
            self.compile "#{self.name}/#{self.name}.html.mu", thing, (body)->
                self.res.send body
    action: []

module.exports = Controller