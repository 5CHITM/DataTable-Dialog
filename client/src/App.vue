<template>
  <v-app>
    <v-app-bar color="teal darken-3" dense dark app>
      <v-img max-height="50" max-width="50" src="./assets/books.png"> </v-img>
      <v-toolbar-title>Books 'n More</v-toolbar-title>
      <v-img max-height="50" max-width="50" src="./assets/books.png"> </v-img>

      <v-spacer></v-spacer>

      <v-btn class="ma-2 teal lighten-1" active-class="red lighten-1" to="/"> Home </v-btn>
      <v-btn class="ma-2" active-class="red lighten-1" to="/about"> About </v-btn>
    </v-app-bar>
    <v-main>
      <v-container> <router-view :books="books" @delte="deleteBook" @edit="editBook" /></v-container>
    </v-main>
  </v-app>
</template>

<script>
// import booksJson from './assets/books.json';
import axios from 'axios';
export default {
  created() {
    // this.books = booksJson.map((el) => ({ ...el, isDeleted: false }));
    // this.books = this.books.filter((el) => el.isDeleted == false);
    this.getBooks();
  },
  name: 'App',

  data: () => ({
    books: [],
  }),
  methods: {
    async getBooks() {
      const { data } = await axios({
        url: 'http://localhost:3000/books',
        method: 'get',
      });
      this.books = data;
    },
    async deleteBook() {},
    async editBook() {},
    // deleteBook(book) {
    //   const index = this.books.findIndex((q) => q.id === book.id);
    //   console.log(book);
    //   this.books[index] = book;
    //   this.books = this.books.filter((el) => el.isDeleted == false);
    // },
    // editBook(book) {
    //   const index = this.books.findIndex((q) => q.id === book.id);
    //   console.log(book);
    //   this.books[index] = book;
    // },
  },
};
</script>
