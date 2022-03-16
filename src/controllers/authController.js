const { insertUser } = require('../model/authModel');
const { failResponce, successResponce } = require('../utils/dbHelpers');
const { hashPass } = require('../utils/helper');

async function register(req, res) {
  const { email, password, fullname } = req.body;

  const hashedPassword = hashPass(password);
  // res.json({ hashedPassword });
  const insertResult = await insertUser(fullname, email, hashedPassword);

  return insertResult === false
    ? failResponce(res)
    : successResponce(res, 'user created');
}

module.exports = {
  register,
};
