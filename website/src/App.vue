<template>
<div id="app">
  <h3 v-if="coffee"><p>Have a cup of coffee <font-awesome-icon icon="coffee" /> or choose one topic:</p></h3>
  <h4 v-if="picker">
    <router-link class="link" :to="{path:'/form-list',query:{picker:true}}"><font-awesome-icon icon="list"/> List Forms</router-link> |
    <router-link class="link" to="/form-detail"><font-awesome-icon icon="file-invoice"/> Detail Forms</router-link> |
    <router-link class="link" to="/form-login"><font-awesome-icon icon="sign-in"/> Login Forms</router-link> |
    <router-link class="link" to="/formatter"><font-awesome-icon icon="spray-can"/> Formatters</router-link>
  </h4>
  <router-view></router-view>
</div>
</template>

<script>
var picker = true;
let uri = window.location.search.substring(1); 
let params = new URLSearchParams(uri);
console.log(params.get("picker"));

export default {
  props: ["type"],
  data() {
    return {
      coffee: false,
      picker: picker
    };
  }
};
</script>
<style lang="sass" scoped>
@import ~primer-css/index.scss

</style>