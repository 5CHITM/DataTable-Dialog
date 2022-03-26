const db = require('../db');

const getBooks = async () => {
  const { rows } = await db.query('select * from books');
  return rows;
};

const delBook = async (id) => {
  const { rows } = await db.query('delete from books where bid = $1 returning *;', [id]);
  return rows;
};

module.exports = { getBooks, delBook };
