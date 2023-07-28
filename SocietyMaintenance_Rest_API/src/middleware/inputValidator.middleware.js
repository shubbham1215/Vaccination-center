const { body, validationResult } = require("express-validator");

exports.validate = (method) => {
  switch (method) {
    case "savePremise": {
      return [
        body("premiseDetails", "premise details object is missing").exists({
          checkFalsy: true,
        }),
        body(
          "premiseDetails.premiseTypeId",
          "premiseTypeId must be int and in 1 to 5"
        )
          .isInt()
          .isIn([1, 2, 3, 4, 5]),
        body("premiseDetails.premiseNo", "PremiseNo must be valid").contains(
          "-"
        ),
      ];
    }
    case "saveMember": {
      return [
        body("firstname", "firstname must exist").exists({
          checkFalsy: true,
        }),
        body("lastname", "lastname must exist").exists({
          checkFalsy: true,
        }),
        body("email", "Invalid email").trim().isEmail(),
        body("phone", "phone must be valid")
          .exists({
            checkFalsy: true,
          })
          .isMobilePhone()
          .isLength({ min: 10, max: 10 }),
        body("aadharNo", "aadharNo must be valid")
          .isInt()
          .isLength({ min: 12, max: 12 }),
        body("dob", "dob must be valid")
          .exists({
            checkFalsy: true,
          })
          .isISO8601(),
      ];
    }
    case "duesTransaction": {
      return [
        body("memberId", "memberId must exist")
          .exists({
            checkFalsy: true,
          })
          .isInt(),
        body("amountPeriod", "amountPeriod must be in 1M or 1Y").isIn([
          "1M",
          "1Y",
        ]),
      ];
    }
    default: {
      console.log("Didnt match any case in input validator");
    }
  }
};

exports.result = () => (req, res, next) => {
  res.locals.errors = validationResult(req);

  if (!res.locals.errors.isEmpty()) {
    res.status(400).json({ errors: res.locals.errors });
  } else {
    next();
  }
};
