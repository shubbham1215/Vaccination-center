const express = require("express");
const ledgerControllers = require("../controllers/ledger.controller");
const validator = require("../middleware/schemaValidator.middleware");

const router = express.Router();

router
  .route("/memberid/:memberId")
  .get(ledgerControllers.getLedgerDetailsByMember);

router.route("/members").get(ledgerControllers.getPendingDuesAllMembers);

router
  .route("/")
  .post(validator.validate("payDuesSchema"), ledgerControllers.payDues);

module.exports = router;
