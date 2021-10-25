const express = require('express');
const { createTrip, getAllTtrip, getDetailTrip, updateTrip, deleteTrip, getTripByConditions } = require('../controllers/trip.controllers')
const tripRouters = express.Router();

tripRouters.post('/', createTrip);
tripRouters.get('/', getAllTtrip);
tripRouters.get('/:id', getDetailTrip);
tripRouters.put('/:id', updateTrip);
tripRouters.delete('/:id', deleteTrip);
tripRouters.post('/getTripCondition', getTripByConditions);

module.exports = {
    tripRouters
}