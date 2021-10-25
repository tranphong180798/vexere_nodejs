'use strict';
const {
    Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class User extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate({ Ticket }) {
            // define association here
            this.hasMany(Ticket, { foreignKey: "user_id", as: "user" });

        }
    };
    User.init({
        name: DataTypes.STRING,
        email: DataTypes.STRING,
        password: DataTypes.STRING,
        numberPhone: DataTypes.STRING,
        type: {
            type: DataTypes.STRING,
            defaultValue: "client"
        },
        avatar: {
            type: DataTypes.STRING,
            allowNull: true,
        }
    }, {
        sequelize,
        modelName: 'User',
    });
    return User;
};