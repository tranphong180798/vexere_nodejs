'use strict';
const {
    Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class PassengerCarCompany extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate({ Trip, Vehicle }) {
            // define association here
            this.belongsTo(Trip, { foreignKey: "trip_id", as: "trip_Pas" });
            this.hasMany(Vehicle, { foreignKey: "passengerCarCompanies_id", as: "passengerCarCompany" })
        }
    };
    PassengerCarCompany.init({
        name: DataTypes.STRING,
        image: DataTypes.STRING,
        description: DataTypes.STRING
    }, {
        sequelize,
        modelName: 'PassengerCarCompany',
    });
    return PassengerCarCompany;
};