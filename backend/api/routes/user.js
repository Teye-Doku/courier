const express = require('express');
const userAuth = require('../middlewares/authmiddleware');
const userController = require('../controllers/user');

const router = express.Router();
router.post('/register',userController.registerUser);
router.post('/login',userController.loginUser);
router.get('/profile',userAuth.protect,userController.getUserProfile);
router.get('/',userController.getUsers);
router.get('/:id',userController.getUser);
router.delete('/:id',userController.deleteUser);
router.put('/profile',userAuth.protect,userController.updateUserProfile);



module.exports = router;