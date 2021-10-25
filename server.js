const express = require('express');
const { sequelize } = require('./models')
const { rootRouter } = require("./routers")
const path = require('path');
const app = express();

// cai ung dung su dung kieu json

app.use(express.json());

//caì đặt static file
const publicPathDirectory = path.join(__dirname, './public')
app.use(express.static(publicPathDirectory));

// dùng router
app.use('/api/v1', rootRouter);

//lắng nghe sự kiện kết nối
app.listen(3000, async() => {
    console.log('listening on http://localhost:3000');
    try {
        await sequelize.authenticate();
        console.log('connection has been established successfully');
    } catch (error) {
        console.log('unable to connect to the database:', error);
    }
});

//sequelize.sync({ force: true });