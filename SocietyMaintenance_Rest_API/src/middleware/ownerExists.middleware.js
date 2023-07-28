const premiseModels = require("../models/premise.model");

exports.checkOwner = () => (req, res, next) => {
  premiseModels
    .ownerExists(req.params.premiseId)
    .then((results) => {
      if (results.length === 0) {
        res
          .status(400)
          .json({ msg: "Owner doesnt exist for this premise yet" });
      } else {
        next();
      }
    })
    .catch((err) => {
      res.status(500).json({
        msg: "Something went wrong while checking if owner exists",
        err,
      });
    });
};
