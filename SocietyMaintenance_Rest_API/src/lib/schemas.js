const Joi = require("joi");

const premiseSchema = Joi.object({
  premiseNo: Joi.string()
    .pattern(new RegExp("^[A-Za-z]{1,2}-[0-9]{2}$"))
    .uppercase()
    .required(),
  premiseTypeId: Joi.number().min(1).max(5).required(),
});

const memberSchema = Joi.object({
  firstName: Joi.string().pattern(new RegExp("^[A-Za-z]+$")).required(),
  lastName: Joi.string().pattern(new RegExp("^[A-Za-z]+$")).required(),
  email: Joi.string().email(),
  phone: Joi.string().min(10).max(14),
  aadharNo: Joi.string().min(12).max(14).required(),
  dob: Joi.date(),
});

const payDuesSchema = Joi.object({
  memberId: Joi.number().min(1).required(),
  amountPeriod: Joi.string().valid("1M", "1Y").uppercase().required(),
});

module.exports = {
  premiseSchema,
  memberSchema,
  payDuesSchema,
};

// var term = "SH-05";
// var re = new RegExp("^[A-Za-z]{1,2}-[0-9]{2}$");
// if (re.test(term)) {
//   console.log("Valid");
// } else {
//   console.log("Invalid");
// }
