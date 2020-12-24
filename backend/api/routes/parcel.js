const express = require('express');
const parcelController = require('../controllers/parcel');
const userAuth = require('../middlewares/authmiddleware');

const router = express.Router();
router.post('/',userAuth.protect,parcelController.createParcelOrder);
router.get('/',userAuth.protect,parcelController.getParcelOrders);
router.get('/:id',userAuth.protect,parcelController.getParcelOrder);
router.put('/:id',userAuth.protect,parcelController.changeParcelDestination);
router.put('/:id',userAuth.protect,userAuth.admin,parcelController.changeParcelStatus);
router.delete('/:id',userAuth.protect,parcelController.cancelParcelOrder);


module.exports = router;