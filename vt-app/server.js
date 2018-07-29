const express = require('express');
const app = express();
const port = process.env.PORT || 5656;
var queryAllCars = require("./queryAllCars.js");
// routes go here

app.get('/api/cars', (req,res)=>{
    queryAllCars(req, res);
    //console.log("VALUE: " + val);
    //res.json()
})

app.listen(port, () => {
    console.log(`http://localhost:${port}`)
})