'use strict';
const {
    Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Vehicle extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate({ PassengerCarCompany, Seat }) {
            // define association here
            this.belongsTo(PassengerCarCompany, {
                foreignKey: "passengerCarCompanies_id",
                as: "passengerCarCompany"
            });
            this.hasMany(Seat, { foreignKey: "vehicled_id", as: "vehicle" })
        }
    };
    Vehicle.init({
        name: DataTypes.STRING
    }, {
        sequelize,
        modelName: 'Vehicle',
    });
    return Vehicle;
};