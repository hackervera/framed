mongoose = require 'mongoose'
mongoose.connect 'mongodb://localhost/main'
scheme = mongoose.Schema
person = new scheme
    name: String
    age: Number
model = mongoose.model('person', person)