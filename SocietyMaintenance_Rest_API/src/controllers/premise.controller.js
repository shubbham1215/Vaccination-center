const premiseModels = require("../models/premise.model");

const getPremises = (req, res) => {
  premiseModels
    .find()
    .then(function (premises) {
      res.status(200).json(premises);
    })
    .catch((err) => {
      res.status(500).json({
        mesage: "Unable to retrieve premises from db",
        err,
      });
    });
};

const savePremises = (req, res) => {
  premiseModels
    .create(res.locals.validatedInput)
    .then(() => {
      res.status(200).send("Premise saved");
    })
    .catch((err) => {
      res.status(500).json({
        mesage: "Unable to save premise to db",
        err,
      });
    });
};

const updatePremisesForOwner = (req, res) => {
  premiseModels
    .updateOwnerByPremiseId(req.params)
    .then((count) => {
      if (count > 0) {
        res.status(200).json({
          mesage:
            "Owner linked to premise and entry made in ledger successsfully",
        });
      } else {
        res.status(401).send("This premise already has a owner");
      }
    })
    .catch((err) => {
      res.status(500).json({
        mesage: "Unable to update premises in db",
        err,
      });
    });
};

const updatePremisesForRenter = (req, res) => {
  premiseModels
    .updateRenterByPremiseId(req.params)
    .then((count) => {
      if (count > 0) {
        res.status(200).json({
          mesage:
            "Renter linked to premise and rent incremented by 500 in ledger",
        });
      } else {
        res.status(200).send("This premise already has a Renter");
      }
    })
    .catch((err) => {
      res.status(500).json({
        mesage: "Unable to update premises in db",
        err,
      });
    });
};

module.exports = {
  getPremises,
  savePremises,
  updatePremisesForOwner,
  updatePremisesForRenter,
};
