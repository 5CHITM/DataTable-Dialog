const asyncHandler = require('express-async-handler');
const model = require('../model/books');

const getBooks = asyncHandler(async (req, res) => {
  const books = await model.getBooks();
  return res.status(200).send(books);
});

const delBook = asyncHandler(async (req, res) => {
  const book = await model.delBook(req.params.id);
  return res.status(200).send(book);
});

module.exports = { getBooks, delBook };
