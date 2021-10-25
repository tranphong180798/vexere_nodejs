const { User } = require("../models");
const bcrypt = require('bcrypt');
// Get List
const getList = async() => {
    const userList = await User.findAll();
    if (userList) {
        return userList;
    }
    return false;
};

// Get Detail
const getDetail = async(id) => {
    const user = await User.findOne({
        where: {
            id
        }
    });

    if (user) {
        return user;
    } else {
        return false;
    }
}

// Create
const create = async(newUser) => {
    console.log(newUser);
    const salt = bcrypt.genSaltSync(10);
    // mã hóa salt +password
    const hashPassword = bcrypt.hashSync(newUser.password, salt);
    newUser.password = hashPassword;
    const createdUser = await User.create(newUser);
    if (createdUser) {
        return createdUser;
    }
    return false;
}

// Update
const update = async(id, user) => {
    const userUpdate = await getDetail(id);
    if (userUpdate) {
        userUpdate.name = user.name;
        userUpdate.address = user.address;
        userUpdate.province = user.province;
        const userUpdated = await userUpdate.save()
        return userUpdated;
    } else {
        return false;
    }
}

// Delete 
const deleteById = async(id) => {
    const userDelete = await getDetail(id);
    if (userDelete) {
        await User.destroy({
            where: {
                id,
            }
        });
        return userDelete;
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