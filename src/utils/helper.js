const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

function hashPass(plainPassword) {
  return bcrypt.hashSync(plainPassword, 10);
}

module.exports = {
  hashPass,
};
