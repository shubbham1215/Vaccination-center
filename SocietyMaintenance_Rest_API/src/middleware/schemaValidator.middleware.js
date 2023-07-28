const Joi = require("joi");
const schemas = require("../lib/schemas");

exports.validate = (schema) => (req, res, next) => {
  const { error, value } = schemas[schema].validate(req.body);

  if (error) {
    res.status(400).send(error);
  } else {
    res.locals.validatedInput = value;
    next();
  }
};
