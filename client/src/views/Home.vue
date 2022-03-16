<template>
  <div>
    <p class="text-h3 text-center mt-4"><v-icon class="text-h3 red--text">mdi-heart</v-icon> Willkommen! <v-icon class="text-h3 red--text">mdi-heart</v-icon></p>
    <v-data-table :headers="headers" :items="books" class="elevation-1">
      <template v-slot:item.imageLink="{ item }">
        <v-img
          max-height="100"
          max-width="50"
          :src="`${item.imageLink}`"
          @click="
            imageDialog = true;
            image = item.imageLink;
          "
        >
        </v-img>
      </template>

      <template v-slot:item.actions="{ item }">
        <v-icon small color="teal darken-1" class="mr-2" @click="openEditMenu(item)"> mdi-pencil </v-icon>
        <v-icon small color="red darken-1" @click="deleteItem(item)"> mdi-delete </v-icon>
      </template>
    </v-data-table>

    <v-dialog v-model="imageDialog" width="500">
      <v-card>
        <v-img :src="image" max-width="500"> </v-img>

        <v-divider></v-divider>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn text @click="imageDialog = false"> Close </v-btn>
          <v-spacer></v-spacer>
        </v-card-actions>
      </v-card>
    </v-dialog>

    <v-dialog v-model="editDialog" persistent max-width="400px">
      <v-card>
        <v-card-title>
          <span class="text-h5">Edit Book</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
              <v-col cols="12">
                <v-text-field label="Title" v-model="newValues.title"></v-text-field>
              </v-col>
              <v-col cols="12">
                <v-text-field label="Country" v-model="newValues.country"></v-text-field>
              </v-col>
            </v-row>
          </v-container>
          <small>*indicates required field</small>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="blue darken-1" text @click="editDialog = false"> Close </v-btn>
          <v-btn color="blue darken-1" text @click="editItem()"> Save </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      image: '',
      activeItem: {},
      newValues: {
        title: '',
        country: '',
      },
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
      imageDialog: false,
      editDialog: false,
    };
  },
  methods: {
    editItem() {
      let newItem = this.activeItem;
      newItem.title = this.newValues.title;
      newItem.country = this.newValues.country;
      this.editDialog = false;
      this.$emit('edit', newItem);
    },
    deleteItem(item) {
      item.isDeleted = true;
      this.$emit('delte', item);
    },
    openEditMenu(item) {
      this.activeItem = item;
      console.log(this.activeItem);
      this.newValues.title = item.title;
      this.newValues.country = item.country;
      this.editDialog = true;
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
