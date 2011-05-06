mongoose = require 'mongoose'
mongoose.connect 'mongodb://localhost/main'
scheme = mongoose.Schema
person = new scheme
    name: String
    age: Number
    password: String
person.path('name').validate ((v)->
    v.length > 2), "name not long enough"
model = mongoose.model('person', person)
module.exports = model