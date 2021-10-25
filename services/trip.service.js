const { Trip, Station, PassengerCarCompany } = require("../models");

// Get List
const getList = async() => {
    const tripList = await Trip.findAll({
        include: [{
            model: Station,
            as: "from"
        }, {
            model: Station,
            as: "to"
        }]
    });
    if (tripList) {
        return tripList;
    }
    return false;
};

// Get Detail
const getDetail = async(id) => {
    const trip = await Trip.findOne({
        where: {
            id
        },
        include: [{
            model: Station,
            as: "from"
        }, {
            model: Station,
            as: "to"
        }]
    });

    if (trip) {
        return trip;
    } else {
        return false;
    }
}

// Create
const create = async(fromStation, toStation, startTime, price) => {
    const isExitTrip = checkExitTrip(fromStation, toStation);
    if (!isExitTrip) {
        const createtrip = await Trip.create({
            fromStation: fromStation,
            toStation: toStation,
            startTime: startTime,
            price: price
        });

        if (createtrip) {
            return createtrip;
        }
    } else {
        return false;
    }

}

// Update
const update = async(id, trip) => {
    console.log(trip);
    const isExitTrip = await checkExitTrip(trip.fromStation, trip.toStation);
    console.log(isExitTrip);
    if (!isExitTrip) {
        const tripUpdate = await getDetail(id);
        if (tripUpdate) {
            tripUpdate.fromStation = trip.fromStation;
            tripUpdate.toStation = trip.toStation;
            tripUpdate.startTime = trip.startTime;
            tripUpdate.price = trip.price;
            const tripUpdated = await tripUpdate.save()
            console.log(tripUpdated)
            return tripUpdated;
        }
    } else {
        return false;
    }
}

// Delete 
const deleteById = async(id) => {
    const tripDelete = await getDetail(id);
    if (tripDelete) {
        await Trip.destroy({
            where: {
                id,
            }
        });
        return tripDelete;
    } else {
        return false;
    }
}

const checkExitTrip = async(fromStation, toStation) => {
    let isExitTrip = false;
    const trip = await Trip.findAll({
        where: {
            fromStation: fromStation,
            toStation: toStation
        }
    });
    console.log(trip);
    if (trip.length > 0) {
        return isExitTrip = true;
    }
    return isExitTrip;
}

const getTripByCondition = async(fromStation, toStation, date) => {
    const listTrip = await Trip.findAll({
        include: [{
                model: Station,
                as: "from"
            },
            {
                model: Station,
                as: "to"
            },
            {
                model: PassengerCarCompany,
                as: 'trip_Pas',
            }
            // {
            //     model: PassengerCarCompany,
            //     as: "trip_Pas"
            // }
        ],
        where: {
            fromStaiton: fromStation,
            toStation: toStation,
            // startTime: date
        },
    });

    return listTrip;
}

module.exports = {
    getList,
    getDetail,
    create,
    update,
    deleteById,
    getTripByCondition
}