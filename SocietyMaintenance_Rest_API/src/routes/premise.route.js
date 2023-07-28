const express = require("express");
const premiseControllers = require("../controllers/premise.controller");
const validator = require("../middleware/schemaValidator.middleware");
const ownerExistsMiddleware = require("../middleware/ownerExists.middleware");

const router = express.Router();

router
  .route("/")
  .get(premiseControllers.getPremises)
  .post(validator.validate("premiseSchema"), premiseControllers.savePremises);

router
  .route("/memberId/:memberId/premiseId/:premiseId")
  .patch(premiseControllers.updatePremisesForOwner);

router
  .route("/renterId/:renterId/premiseId/:premiseId")
  .patch(
    ownerExistsMiddleware.checkOwner(),
    premiseControllers.updatePremisesForRenter
  );

module.exports = router;
