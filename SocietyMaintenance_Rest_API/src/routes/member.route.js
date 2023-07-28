const express = require("express");
const memberControllers = require("../controllers/member.controller");
const validator = require("../middleware/schemaValidator.middleware");

const router = express.Router();

router
  .route("/")
  .get(memberControllers.getAllMembersWithPremises)
  .post(validator.validate("memberSchema"), memberControllers.saveMember);

module.exports = router;
