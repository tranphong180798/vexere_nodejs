const { User } = require("../models");
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { host } = require("./constants");

const {
    getList,
    getDetail,
    create,
    update,
    deleteById
} = require("../services/user.services");
const register = async(req, res) => {

    const user = req.body;
    try {
        let newUser = await create(user);
        res.status(201).send(newUser);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

const login = async(req, res) => {
    const { email, password } = req.body;
    // b1: tìm ra user đang đăng nhập dưa trên email
    const user = await User.findOne({
        where: {
            email
        }
    });

    if (user) {
        //b2: kiểm tra mật khẩu có đúng hay không
        const isAuth = bcrypt.compareSync(password, user.password);
        console.log("isAuth : ", isAuth);
        if (isAuth) {
            const token = jwt.sign({ email: user.email, type: user.type }, "Dai-Phong-1807", { expiresIn: 60 * 60 });
            res.status(200).send({ message: "Đăng nhập thành công", token });
        } else {
            res.status(500).send({ message: "tài khoản hoặc mật khẩu không đúng" });
        }
    } else {
        res.status(404).send({ message: "Không tìm thấy email phù hợp" });
    }
}

const uploadAvatar = async(req, res) => {
    let { file } = req;
    file.path = file.path.slice(6);
    console.log(file.path);
    const urlImage = `${host}/${file.path}`;
    const { user } = req;
    console.log(user);
    const userFound = await User.findOne({
        where: {
            email: user.email
        }
    });
    userFound.avatar = urlImage;
    await userFound.save();
    res.send(userFound);
}

module.exports = {
    register,
    login,
    uploadAvatar
}