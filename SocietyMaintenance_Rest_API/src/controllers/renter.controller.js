const renterModels = require("../models/renter.model");

const saveRenter = (req, res) => {
  renterModels
    .create(res.locals.validatedInput)
    .then(() => {
      res.status(200).send("Renter details saved");
    })
    .catch((err) => {
      res.status(500).json({
        mesage: "Unable to save Renter details to db",
        err,
      });
    });
};

const getRenters = (req, res) => {
  renterModels
    .findRenters()
    .then((results) => {
      res.status(200).json(results);
    })
    .catch((err) => {
      res.status(500).json({
        mesage: "Unable to get Renter details from db",
        err,
      });
    });
};

module.exports = { saveRenter, getRenters };
