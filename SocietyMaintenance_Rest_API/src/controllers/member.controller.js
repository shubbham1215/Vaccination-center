const memberModels = require("../models/member.model");

const saveMember = (req, res) => {
  memberModels
    .create(res.locals.validatedInput)
    .then(() => {
      res.status(200).send("Member details saved");
    })
    .catch((err) => {
      res.status(500).json({
        mesage: "Unable to save member details to db",
        err,
      });
    });
};

const getAllMembersWithPremises = (req, res) => {
  memberModels
    .findMembersAndPremises()
    .then((results) => {
      res.status(200).json(results);
    })
    .catch((err) => {
      res.status(500).json({
        mesage: "Unable to get members with their premisess",
        err,
      });
    });
};

module.exports = { saveMember, getAllMembersWithPremises };
