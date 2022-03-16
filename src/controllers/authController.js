const { insertUser, findUserByEmail } = require('../model/authModel');
const { failResponce, successResponce } = require('../utils/dbHelpers');
const { hashPass, verifyHash, generateJwtToken } = require('../utils/helper');

async function register(req, res) {
  const { email, password, fullname } = req.body;

  const hashedPassword = hashPass(password);
  // res.json({ hashedPassword });
  const insertResult = await insertUser(fullname, email, hashedPassword);

  return insertResult === false
    ? failResponce(res)
    : successResponce(res, 'user created');
}

async function login(req, res) {
  const { email, password, fullname } = req.body;

  const findResults = await findUserByEmail(email);

  if (findResults === false) return failResponce(res);
  if (!findResults.length) return failResponce(res, 'email or pass not mach 1');

  const foundUserObj = findResults[0];

  if (!verifyHash(password, foundUserObj)) {
    return failResponce(res, 'email or pass not match 2');
  }
  const token = generateJwtToken(foundUserObj);
  successResponce(res, token);
}
module.exports = {
  register,
  login,
};
