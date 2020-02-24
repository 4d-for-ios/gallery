<template>
  <div class="col-sm-12 d-md-flex flex-wrap gutter flex-auto ml-1">
    <Item v-for="item in filtered" v-bind:key="item.html_url" :passed-item="item" :type="type" :picker="picker" />
    <GalleryItem v-if="picker" :type="type" />
    <ShareItem v-else :type="type" />
  </div>
</template>

<script>
import Item from "./Item.vue";
import ShareItem from "./ShareItem.vue";
import GalleryItem from "./GalleryItem.vue";
import api from "@4d-for-ios/gallery_api";

import { serverBus } from '../main.js';

export default {
  data() {
    return {
      type: this.$route.params.type,
      picker: this.$route.params.picker,
      items: [],
      filtered: [],
      searchTerm: "",
    };
  },
  watch: {
    $route: "fetchItems"
  },
  methods: {
    fetchItems() {
      this.items = [];
      this.type = this.$route.params.type;
      console.log("fetch");
      api
        .repositories("4d-for-ios-" + this.type)
        .then(json => {
          this.items = json.items;
          this.filter();
          console.log("fetched");
        });
    },
    filter() {
          if (this.searchTerm) {
            var search = this.searchTerm.toLowerCase();
            this.filtered = this.items.filter(item => item.name.toLowerCase().includes(search) || item.description.toLowerCase().includes(search) || item.author.toLowerCase().includes(search));
            console.log(this.filtered.map(item => item.name));
          } else {
            this.filtered = this.items.slice();
            console.log("no more search");
          }
    }
  },
  created() {
    this.fetchItems();
    serverBus.$on('search', (searchTerm) => {
      console.log("search term: " + searchTerm);
      this.searchTerm = searchTerm;
      this.filter();
    });
  },
  components: {
    Item,
    ShareItem,
    GalleryItem
  }
};
</script>
