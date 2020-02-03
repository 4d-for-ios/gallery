<template>
<div id="app">
  <h2 v-if="picker">Gallery</h2>
  <h3 v-if="coffee"><p>Have a cup of coffee <font-awesome-icon icon="coffee" /> or choose one topic:</p></h3>
  <h4 v-if="picker">
    <router-link class="link" to="/type/form-list"><font-awesome-icon icon="list"/> List Forms</router-link> |
    <router-link class="link" to="/type/form-detail"><font-awesome-icon icon="file-invoice"/> Detail Forms</router-link> |
    <router-link class="link" to="/type/form-login"><font-awesome-icon icon="sign-in"/> Login Forms</router-link> |
    <router-link class="link" to="/type/formatter"><font-awesome-icon icon="spray-can"/> Formatters</router-link>
  </h4>
  <router-view></router-view>
</div>
</template>

<script>
export default {
  props: ["type"],
  data() {
    return {
      coffee: false,
      picker: (this.$route.params.picker == undefined)
    };
  }
};
</script>
<style lang="sass">
@import "~primer-css/index.scss"
</style>