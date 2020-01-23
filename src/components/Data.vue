<template>
<div class="col-md-12">
  <Item
    v-for="(item, index) in items"
    key="index"
    :passed-item="item"
    :type="type"
  />
  <ShareItem 
    :type="type"
  />
</div>
</template>

<script>
import Item from './Item.vue'
import ShareItem from './ShareItem.vue'

export default {
  data() {
    return {
      type: this.$route.params.type,
      items: []
    }
  },
  watch: {
    '$route': 'fetchItems'
  },
  methods: {
    fetchItems() {
      this.items = []
      this.type = this.$route.params.type

      fetch(`https://raw.githubusercontent.com/4d-for-ios/topic-workflow/master/4d-for-ios-${this.type}.json`, {
        method: 'GET'
      })
        .then(response => response.json())
        .then(json => this.items = json.items)
    }
  },
  created() {
    this.fetchItems()
  },
  components: {
    Item, ShareItem
  }
}
</script>
