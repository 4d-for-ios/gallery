<template>
  <div class="col-sm-12 d-md-flex flex-wrap gutter flex-auto">
    <Item v-for="(item, index) in items" v-bind:key="index" :passed-item="item" :type="type" />
    <ShareItem :type="type" />
  </div>
</template>

<script>
import Item from "./Item.vue";
import ShareItem from "./ShareItem.vue";
import api from "@4d-for-ios/gallery_api";

export default {
  data() {
    return {
      type: this.$route.params.type,
      items: []
    };
  },
  watch: {
    $route: "fetchItems"
  },
  methods: {
    fetchItems() {
      this.items = [];
      this.type = this.$route.params.type;

      api
        .repositories("4d-for-ios-" + this.type)
        .then(json => (this.items = json.items));
    }
  },
  created() {
    this.fetchItems();
  },
  components: {
    Item,
    ShareItem
  }
};
</script>
