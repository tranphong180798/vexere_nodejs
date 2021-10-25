const { Station } = require("../models");
const {
    getList,
    getDetail,
    create,
    update,
    deleteById
} = require("../services/station.services");
// All Station
const allStation = async(req, res) => {
    try {
        const stationList = await getList();
        res.status(200).send(stationList);
    } catch (error) {
        res.status(500).send(error);
    }
}

// Detail Station
const detailStation = async(req, res) => {
    const { id } = req.params;
    try {
        const detailStation = await getDetail(id);
        res.status(200).send(detailStation);
    } catch (error) {
        res.status(500).send(error);
    }
}

// Create Station
const createStation = async(req, res) => {
    const station = req.body;
    try {
        const newStation = await create(station);
        if (newStation) {
            res.status(201).send(newStation);
        }
        res.status(404).send("Không tạo được");
    } catch (error) {
        res.status(500).send(error);
    }
}

// Update Station
const updateStation = async(req, res) => {
    const { id } = req.params;
    const updateStaion = req.body;
    try {
        const updatedStaion = await update(id, updateStaion);
        res.status(201).send(updatedStaion);
    } catch (error) {
        res.status(500).send(error);
    }
}

// Delete Station
const deleteStation = async(req, res) => {
    const { id } = req.params;
    try {
        const newStation = await deleteById(id);
        res.status(201).send(newStation);
    } catch (error) {
        res.status(500).send(error);
    }
}

module.exports = {
    allStation,
    detailStation,
    createStation,
    updateStation,
    deleteStation
};