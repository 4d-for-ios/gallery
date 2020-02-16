<template>
  <div id="app">
    <Header v-if="picker"/>
    <div v-if="picker" class="bg-gray-light navPusher">
      <router-view></router-view>
    </div>
    <div v-else class="bg-gray-light">
      <router-view></router-view>
    </div>
    <Footer v-if="picker"/>
  </div>
</template>

<script>
import Header from "./components/Header.vue";
import Footer from "./components/Footer.vue";

export default {
  props: ["type"],
  data() {
    return {
      picker: this.$route.params.picker == undefined
    };
  },
  components: {
    Header,
    Footer
  }
};
</script>
<style lang="sass">
@import "~primer-css/index.scss"
</style>
<style scoped>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
.bg-gray-light {
  background-color: #fafbfc !important;
}
</style>