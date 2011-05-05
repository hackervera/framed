mongoose = require 'mongoose'
mongoose.connect 'mongodb://localhost/main'
Schema = mongoose.Schema
scheme = new Schema
    name: String
    color: String
    price: Number
model = mongoose.model('food', scheme)
module.exports = model