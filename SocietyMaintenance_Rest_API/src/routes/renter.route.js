const express = require("express");
const renterControllers = require("../controllers/renter.controller");
const validator = require("../middleware/schemaValidator.middleware");

const router = express.Router();

router
  .route("/")
  .get(renterControllers.getRenters)
  .post(validator.validate("memberSchema"), renterControllers.saveRenter);

module.exports = router;
