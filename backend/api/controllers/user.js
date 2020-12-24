const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const User = require('../models/user');

exports.registerUser = (req,res,next) => {
   User
   .find({email:req.body.email})
   .exec()
   .then(user => {
       if(user.length >=1) {
           return res.status(409).json({
               message:'user already exists'
           })
       }else {
         bcrypt.hash(req.body.password,10,(err,hash) => {
             if(err) {
                 return res.status(500).json({message:err.message});
             }
             if(hash) {
                 const user = new User({
                     name:req.body.name,
                     email:req.body.email,
                     password:hash,
                     registered:Date.now()
                 });
                user
                .save()
                .then( user => {
                   return res.status(201).json({
                       message:'user registered',
                       user:user
                   })
                })
                .catch(error => {
                    return res.status(500).json({
                        message:error.message
                    })
                })
             }
         })
       }
   })
   .catch(error => {
       res.status(500).json({
           message:error.message
       })
   })
}
exports.loginUser = (req,res,next) => {
    User.find({email:req.body.email})
    .exec()
    .then(user => {
        if(user.length<1){
            return res.status(409).json({
                message:'user does not exists'
            })
        }else {
            bcrypt.compare(req.body.password,user[0].password,(err,hashed)=> {
                if(err) {
                    return res.status(500).json({
                        message:err.message
                    })
                }
                if(hashed) {
                 const token = jwt.sign(
                     {
                        email:user[0].email,
                        userId:user[0]._id
                      },
                      process.env.JWT_KEY,
                      {
                          expiresIn:'1h'
                      }
                 ) 
                 return res.status(200).json({
                     message:'auth successful',
                     token:token
                 })
                }
            })
        }
    })
    .catch(error => {
        res.status(500).json({
            message:error.message
        })
    })
}
exports.getUsers = (req,res,next) => {
    User
    .find({})
    .exec()
    .then( users => {
       res.status(200).json({
           message:'users retrieved',
           count:users.length,
           users:users
       })
    })
    .catch(error => {
        res.status(500).json({
            message:error.message
        })
    })
}
exports.getUser = (req,res,next) => {
    const id = req.params.id;
    User
    .findById(id)
    .exec()
    .then(user => {
       res.status(200).json({
          message:'user retrieved',
          user:user
       })
    })
    .catch(error => {
        res.status(500).json({
            message:error.message
        })
    })
}
exports.getUserProfile = (req,res,next) => {
    const id = req.user.userId;
    User
    .findById(id)
    .exec()
    .then(user => {
        res.status(200).json({
            message:'user profile',
            user:user
        })
    })
    .catch(error => {
        res.status(500).json({message:error.message})
    })
}

exports.updateUserProfile = (req,res,next) => {
    const id = req.user.userId;
    User
    .findById(id)
    .exec()
    .then(user => {
        if(user){
            user.name = req.body.name || user.name;
            user.email = req.body.email || user.email;
        }
        user.save()
        .then(user => {
           return res.status(200).json({
               message:'profile updated',
               user:user
           })
        })
        .catch(error => {
            return res.status(500).json({
                message:error.message
            })
        })
    })
    .catch(error => {
        res.status(500).json({message:error.message})
    })
}
exports.deleteUser = (req,res,next) => {
   const id = req.params.id;
   User
   .findByIdAndDelete(id)
   .exec()
   .then(user => {
       res.status(200).json({
           message:'user deleted',
           user:user
       })
   })
   .catch(error => {
       res.status(500).json({
           message:error.message
       })
   })
}