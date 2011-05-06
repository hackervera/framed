mu = null
Controller = (name)->
    this.layout = {}
    this.name = name
    self = this
    this.layout.jquery = "<script src='/js/jquery.js'></script>"
    this.layout.now = "<script src='/nowjs/now.js'></script>"
    this.layout.cookie = "<script src='/js/cookie.js'></script>"
    this.layout.coffee = "<script src='/js/coffee-script.js'></script>"
    this.createServer = (app)->
        self.everyone = app.everyone
        self.mu = app.mu
        console.log "added route /#{self.name}/:function?/:id?"
        app.all "/#{self.name}/:function?/:id?", (req, res)->
            
            self.res = res
            self.req = req
            self.id = req.params.id
            self.function = req.params.function
            if self.before?
                self.before()
            if self.after?
                self.after()
            if req.params.function?
                self[req.params.function](req.params.id)
            else
                self.index()
    
    this.compile = (file, cb)->
        mu = self.mu
        mu.compile file, (err, parsed)->
            body = ""
            if err?
                console.log err
            mu.render(parsed, self.layout)
                .on 'data', (data)->
                    if data?
                        body += data.toString()
                .on 'end', ->
                    cb(body)
    
    this.render = ->
        if self.function?
            route = "#{self.name}/#{self.function}.html.mu"
        else 
            route = "#{self.name}/index.html.mu"
        self.compile route, (body)->
            self.layout.view = body
            self.compile "#{self.name}/#{self.name}.html.mu", (body)->
                self.res.send body    
    return this

module.exports = Controller