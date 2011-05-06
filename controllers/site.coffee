Controller = require '../controller'
Person = require '../models/person'
Food = require '../models/food'
controller = new Controller 'site'

controller.before = ->
    if controller.req.cookies.digest
        Person.findOne {digest: controller.req.cookies.digest}, (err, doc)->
            if doc?
                return
            else
                controller.res.redirect '/site/signin' unless controller.function == 'signin'
    else
        this.res.redirect '/site/signin' unless this.function == 'signin'

controller.index = ->
    this.render()
    
controller.foo = ->
    this.render()

controller.people = ->
    if this.req.method == "GET"
        Person.find {age: {$gt:10} }, (err, docs)->
            controller.layout.docs = docs
            controller.render()
    if this.req.method == "POST"
        this.layout.body = this.req.body
        inst = new Person()
        inst.name = this.req.body.name
        inst.age = this.req.body.age
        inst.save (err)->
            if err?
                controller.res.send err
                return
        this.render()

controller.food = ->
    Food.find {}, (err, docs)->
        controller.layout.docs = docs
        controller.render()

controller.signin = ->
    # do if POST
    if this.req.method == "POST"
        name = this.req.body.name
        password = this.req.body.password
        Person.findOne {name: name, password: password}, (err, doc)->
            console.log doc
            if doc?
                md5sum = require('crypto').createHash 'md5'
                md5sum.update "#{name}#{password}"
                digest = md5sum.digest 'hex'
                controller.res.send digest
            else
                controller.res.send 'false'
            return
    # do if GET
    
    if controller.req.cookies.digest
        Person.findOne {digest: controller.req.cookies.digest}, (err, doc)->
            if doc?
                controller.layout.signedin = true
            else
                controller.layout.signedin = false
            controller.render()
    else
        this.layout.signedin = false
        controller.render()

controller.getid = (id)->
    Person.find {name: id}, (err, docs)->
        if err?
            controller.res.send err
            return
        controller.layout.id = id
        controller.layout.docs = docs
        controller.layout.amount = docs.length
        controller.render()

controller.realtime = ->
    this.everyone.now.uptime = ->
        os = require 'os'
        client = this
        setInterval (->
            client.now.rUptime os.uptime()), 1000
    this.render()
    
module.exports = controller