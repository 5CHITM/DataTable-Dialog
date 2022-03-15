<template>
  <div>
    <p class="text-h3 text-center mt-4"><v-icon class="text-h3 red--text">mdi-heart</v-icon> Willkommen! <v-icon class="text-h3 red--text">mdi-heart</v-icon></p>
    <v-data-table :headers="headers" :items="books" class="elevation-1">
      <template v-slot:item.imageLink="{ item }">
        <v-dialog v-model="dialog" width="500">
          <template v-slot:activator="{ on, attrs }">
            <v-img max-height="100" max-width="50" :src="`${item.imageLink}`" v-bind="attrs" v-on="on"> </v-img>
          </template>

          <v-card>
            <v-img :src="`${item.imageLink}`" max-width="500"> </v-img>

            <v-divider></v-divider>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn text @click="dialog = false"> Close </v-btn>
              <v-spacer></v-spacer>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </template>
      <template v-slot:item.actions="{ item }">
        <v-dialog v-model="dialog" persistent max-width="400px">
          <template v-slot:activator="{ on, attrs }">
            <v-icon small color="teal darken-1" class="mr-2" @click="editItem(item)" v-bind="attrs" v-on="on"> mdi-pencil </v-icon>
          </template>
          <v-card>
            <v-card-title>
              <span class="text-h5">Edit Book</span>
            </v-card-title>
            <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="12">
                    <v-text-field label="Name"></v-text-field>
                  </v-col>
                  <v-col cols="12">
                    <v-text-field label="Title"></v-text-field>
                  </v-col>
                  <v-col cols="12">
                    <v-text-field label="Country"></v-text-field>
                  </v-col>
                </v-row>
              </v-container>
              <small>*indicates required field</small>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="dialog = false"> Close </v-btn>
              <v-btn color="blue darken-1" text @click="dialog = false"> Save </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
        <v-icon small color="red darken-1" @click="deleteItem(item)"> mdi-delete </v-icon>
      </template>
    </v-data-table>
  </div>
</template>

<script>
export default {
  data() {
    return {
      headers: [
        {
          text: 'Title',
          align: 'start',
          sortable: false,
          value: 'title',
        },
        { text: 'Image', value: 'imageLink' },
        { text: 'Country', value: 'country' },
        { text: 'Language', value: 'language' },
        { text: 'Actions', value: 'actions', sortable: false },
      ],
    };
  },
  methods: {
    deleteItem(item) {
      item.isDeleted = true;
      this.$emit('delte', item);
    },
  },

  props: {
    books: {
      type: Array,
    },
  },
  name: 'Home',
};
</script>
