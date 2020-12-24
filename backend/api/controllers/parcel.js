const Parcel = require('../models/parcel');

exports.createParcelOrder = (req,res,next) =>{
  const parcel = new Parcel({
   placeBy:req.user.userId,
   sentOn:Date.now().toISOString(),
   status:'placed',
   from:req.body.from,
   to:req.body.to,
   currentLocation:req.body.from
  });
  parcel
  .save()
  .then(parcel => {
     res.status(201).json({
         message:'parcel placed',
         parcel:parcel
     })
  })
  .catch(error => {
      res.status(500).json({
          message:error.message
      })
  })
}
exports.getParcelOrders = (req,res,next) => {
    Parcel
    .find({})
    .sort(-1)
    .exec()
    .then(parcels => {
        res.status(200).json({
            message:'parcels retrieved',
            parcels:parcels
        })
    })
    .catch(error => {
        res.status(500).json({
            message:error.message
        })
    })
}
exports.getParcelOrder = (req,res,next) => {
    const id = req.params.id;
    Parcel
    .findById(id)
    .exec()
    .then(parcel => {
       res.status(200).json({
           message:'parcel retrieved',
           parcel:parcel
       })
    })
    .catch(error => {
        res.status(500).json({
            message:error.message
        })
    })
}
exports.cancelParcelOrder = (req,res,next) => {
    const id = req.params.id;
    Parcel
    .findByIdAndDelete(id)
    .exec()
    .then(parcel => {
        res.status(200).json({
            message:'parcel cancelled'
        })
    })
    .catch(error => {
        res.status(500).json({
            message:error.message
        })
    })
}
exports.changeParcelDestination = (req,res,next) => {
    const id = req.params.id;
    Parcel
    .findById(id)
    .exec()
    .then(parcel => {
        if(parcel.status === 'delivered') {
            return res.status(403).json({message:'delivered parcel destination can not be changed'})
        }
        if(parcel) {
            parcel.to = req.body.to || parcel.to
        }
        parcel.save()
        .then(parcel => {
            return res.status(500).json({
                message:'parcel destination changed',
                destination:parcel.to
            })
        })
        .catch(error => {
            return res.status(500).json({
                message:error.message
            })
        })
    })
    .catch(error => {
        res.status(500).json({
            message:error.message
        })
    })
}
exports.changeParcelStatus = (req,res,next) => {
    const id = req.params.id;
    Parcel
    .findById(id)
    .exec()
    .then(parcel => {
        if(parcel) {
           parcel.status = req.body.status ||parcel.status;
           parcel.deliveredOn = (parcel.status === 'delivered') ? Date.now().toISOString():null 
        }
        parcel
        .save()
        .then(parcel => {
           return res.status(200).json({
               message:'parcel delivered',
               parcel:parcel
           })
        })
        .catch(error => {
            return res.status(500).json({
                message:error.message
            })
        })
    })
    .catch(error => {
        res.status(500).json({
            message:error.message
        })
    })
}