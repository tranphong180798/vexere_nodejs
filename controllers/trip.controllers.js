const { Trip, Station } = require("../models");
const { create, getList, update, deleteById, getDetail, getTripByCondition } = require("../services/trip.service")
const createTrip = async(req, res) => {
    let { fromStation, toStation, startTime, price } = req.body;

    try {

        const newTrips = await create(fromStation, toStation, startTime, price);
        if (newTrips) {
            res.status(201).send(newTrips);
        } else {
            res.status(400).send("Đã có chuyến đi này rồi");
        }
    } catch (error) {
        res.status(500).send(error);
    }
}

const getAllTtrip = async(req, res) => {
    try {
        const tripList = await getList();
        res.status(200).send(tripList);
    } catch (error) {
        res.status(500).send(error);
    }
}

const getDetailTrip = async(req, res) => {
    const { id } = req.params;
    try {
        const trip = await getDetail(id)
        res.status(200).send(trip);
    } catch (error) {
        res.status(500).send(error);
    }
}

const updateTrip = async(req, res) => {
    const { id } = req.params;
    const trip = req.body;

    try {
        const tripUpdate = await update(id, trip);

        if (tripUpdate) {
            res.status(200).send(tripUpdate);
        } else {
            res.status(400).send("Đã có chuyến đi này rồi");
        }

    } catch (error) {
        res.status(500).send(error);
    }
}

const deleteTrip = async(req, res) => {
    const { id } = req.params;
    try {
        const trip = await deleteById(id)
        res.status(200).send(trip);
    } catch (error) {
        res.status(200).send(error);
    }
}

const getTripByConditions = async(req, res) => {

    const { fromStation, toStation, date } = req.body;


    const listTrip = await getTripByCondition(fromStation, toStation, date);
    res.status(200).send(listTrip);
}

module.exports = {
    createTrip,
    getAllTtrip,
    getDetailTrip,
    updateTrip,
    deleteTrip,
    getTripByConditions
}