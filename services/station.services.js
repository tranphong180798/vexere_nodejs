const { Station } = require("../models");

// Get List
const getList = async() => {
    const stationList = await Station.findAll();
    if (stationList) {
        return stationList;
    }
    return false;
};

// Get Detail
const getDetail = async(id) => {
    const station = await Station.findOne({
        where: {
            id
        }
    });

    if (station) {
        return station;
    } else {
        return false;
    }
}

// Create
const create = async(newStation) => {
    console.log(newStation);
    const createStation = await Station.create(newStation);
    if (createStation) {
        return createStation;
    }
    return false;
}

// Update
const update = async(id, station) => {
    const stationUpdate = await getDetail(id);
    if (stationUpdate) {
        stationUpdate.name = station.name;
        stationUpdate.address = station.address;
        stationUpdate.province = station.province;
        const stationUpdated = await stationUpdate.save()
        return stationUpdated;
    } else {
        return false;
    }
}

// Delete 
const deleteById = async(id) => {
    const stationDelete = await getDetail(id);
    if (stationDelete) {
        await Station.destroy({
            where: {
                id,
            }
        });
        return stationDelete;
    } else {
        return false;
    }
}

module.exports = {
    getList,
    getDetail,
    create,
    update,
    deleteById
}