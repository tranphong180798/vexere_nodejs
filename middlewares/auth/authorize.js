const authorize = (arrType) => (req, res, next) => {
    const { user } = req;
    console.log("authorize : ", user.type)
    if (arrType.findIndex((ele) => ele === user.type) > -1) {
        next();
    } else {
        res.status(403).send("Bạn đã đăng nhập nhưng không có quyền");
    }
}

module.exports = {
    authorize
}