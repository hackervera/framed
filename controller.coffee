class Controller
    constructor: (@name)->
    createServer: (app)->
        self = this
        app.get "/#{@name}/:function", (req, res)->
            #console.log this
            self.res = res
            #console.log res
            self[req.params.function]()
        app.get "/#{@name}", (req, res)->
            self.res = res
            self.index()
    renderer: (rend)->
        @rend = rend
    render: (data)->
        self = this
        @rend "#{@name}/#{@name}.html", data, (body)->
            self.res.send body
    partial: (view, data, cb)->
        self = this
        @rend "#{@name}/#{view}.html", data, (body)->
            cb body
    action: []

module.exports = Controller