const mysql = require('mysql2/promise');
const dbConfig = require('../dbConfig');

const tableName = 'users';

async function insertUser(email, pass, fullname) {
  try {
    const conn = await mysql.createConnection(dbConfig);
    const sql = `
        INSERT INTO ${tableName} (full_name, email, password)
        VALUES (?, ?, ?)
        `;
    const [insertResult] = await conn.execute(sql, [email, pass, fullname]);
    await conn.close();
    return insertResult;
  } catch (error) {
    console.log('insertUser ===', error);
    return false;
  }
}

module.exports = {
  insertUser,
};
