const express = require("express");
const { createStation, allStation, detailStation, updateStation, deleteStation } = require("../controllers/station.controllers");
const { authenticate } = require("../middlewares/auth/authenticate");
const { authorize } = require("../middlewares/auth/authorize");
const { checkDuplicate } = require("../middlewares/Validation/Trip");
const stationRouter = express.Router();

stationRouter.get("/", allStation);
stationRouter.get("/:id", detailStation);
stationRouter.post("/", authenticate, authorize(["ADMIN", "SUPPER_ADMIN"]), checkDuplicate, createStation);
stationRouter.put("/:id", authenticate, authorize(["ADMIN", "SUPPER_ADMIN"]), checkDuplicate, updateStation);
stationRouter.delete("/:id", deleteStation);

module.exports = {
    stationRouter
};