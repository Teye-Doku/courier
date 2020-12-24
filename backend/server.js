const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const connectDatabase = require('./api/config');
const parcelRoutes = require('./api/routes/parcel');
const userRoutes = require('./api/routes/user');

const PORT = process.env.PORT || 8000;
const app = express();
app.use(cors());
app.use(express.json())
app.use(morgan('dev'));

//connecting to the database
connectDatabase();


app.use('/users',userRoutes);
app.use('/parcels',parcelRoutes);

app.use((req,res,next) => {
    const error = new Error('not found');
    error.status = 404;
    next(error);
  });
  
  app.use((error,req,res,next) => {
   res.status(error.status || 500).json({
        error:{
            message:error.message
        }
   });
  })

app.listen(PORT,() => {
    console.log(`server is running on port ${PORT}`);
})
