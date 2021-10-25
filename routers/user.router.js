const express = require("express");
const { authenticate } = require("../middlewares/auth/authenticate");

const { register, login, uploadAvatar } = require("../controllers/user.controllers");
const { uploadImage } = require("../middlewares/upload/upload-image");
const userRouter = express.Router();

userRouter.post("/register", register);
userRouter.post("/login", login);

userRouter.post("/upload-avatar", authenticate, uploadImage(), uploadAvatar);

module.exports = {
    userRouter
};