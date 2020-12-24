const mongoose = require('mongoose');

const parcelSchema = mongoose.Schema({
    placedBy:{type:mongoose.Schema.Types.ObjectId, ref:'User'},
    sentOn:{type:Date},
    deliveredOn:{type:Date},
    status:{type:String},
    from:{type:String},
    to:{type:String},
    currentLocation:{type:String}
});

module.exports = mongoose.model('Parcel',parcelSchema);