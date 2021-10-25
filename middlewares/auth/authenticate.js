const jwt = require('jsonwebtoken');
const authenticate = (req, res, next) => {
    const token = req.header("token");
    try {
        const decode = jwt.verify(token, "Dai-Phong-1807");
        console.log("decode : ", decode);
        if (decode) {
            req.user = decode;
            next();
        } else {
            res.status(401).send("Bạn chưa đăng nhập");
        }
    } catch (error) {
        res.status(401).send("Bạn chưa đăng nhập");
    }

}
module.exports = {
    authenticate
}