"use trict";
const { Model } = require("sequelize");

module.exports = (sequelize, DataTypes) => {
    class Station extends Model {
        static associate({ Trip }) {
            this.hasMany(Trip, { foreignKey: "fromStation", as: "from" });
            this.hasMany(Trip, { foreignKey: "toStation", as: "to" });
        }
    }
    Station.init({
        name: {
            type: DataTypes.STRING,
            allowNull: false,
            validate: {
                notEmpty: true,
                len: [3, 50],
            }
        },
        address: {
            type: DataTypes.STRING,
            validate: {
                checkLen(value) {
                    // if (value.length >= 5 && value.length >= 20) {
                    //     return true;
                    // }
                    // throw new Error('Độ dài phải từ 5-20');
                }
            }
        },
        province: DataTypes.STRING,
    }, {
        sequelize,
        modelName: "Station",
    });
    return Station;
}