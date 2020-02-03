<template>
<div id="app">
  <h2 v-if="picker">Gallery</h2>
  <h4 v-if="picker">
    <router-link class="link" to="/type/form-list">List Forms</router-link> |
    <router-link class="link" to="/type/form-detail">Detail Forms</router-link> |
    <router-link class="link" to="/type/form-login">Login Forms</router-link> |
    <router-link class="link" to="/type/formatter">Formatters</router-link>
  </h4>
  <router-view></router-view>
</div>
</template>

<script>
export default {
  props: ["type"],
  data() {
    return {
      picker: (this.$route.params.picker == undefined)
    };
  }
};
</script>
<style lang="sass">
@import "~primer-css/index.scss"
</style>