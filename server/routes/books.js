const express = require('express');
const asyncHandler = require('express-async-handler');
const { getBooks, delBook } = require('../controllers/books');

const router = express.Router();
const db = require('../db');

router.get(
  '/test',
  asyncHandler(async (req, res) => {
    const { rows } = await db.query('SELECT * FROM companies');
    res.json(rows);
  }),
);

router.get('/books', getBooks);
router.delete('/book/:id', delBook);

module.exports = router;
