const Joi = require('joi');
const { failResponce } = require('./dbHelpers');

async function validateUser(req, res, next) {
  const schema = Joi.object({
    fullname: Joi.string().min(5).max(50).alphanum()
      .required(),
    email: Joi.string().email().required(),
    password: Joi.string().min(5).max(50).required(),
  });
  try {
    await schema.validateAsync(req.body, { abortEarly: false });
    next();
  } catch (error) {
    console.log('validateUser error ===', error);
    const formatedError = error.details.map((detail) => ({
      message: detail.message,
      field: detail.context.key,
    }));
    failResponce(res, formatedError);
  }
}

module.exports = {
  validateUser,
};
