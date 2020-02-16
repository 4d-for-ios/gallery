import Vue from 'vue'
import VueRouter from 'vue-router'
Vue.use(VueRouter);

// Icons
import { library } from '@fortawesome/fontawesome-svg-core'

import { faStar } from '@fortawesome/free-solid-svg-icons'
library.add(faStar);
import { faGithub } from '@fortawesome/free-brands-svg-icons'
library.add(faGithub);
import { faQuestionCircle } from '@fortawesome/free-solid-svg-icons'
library.add(faQuestionCircle);
import { faCloudDownloadAlt } from '@fortawesome/free-solid-svg-icons'
library.add(faCloudDownloadAlt);
import { faPlus } from '@fortawesome/free-solid-svg-icons'
library.add(faPlus);

import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
Vue.component('font-awesome-icon', FontAwesomeIcon);

import VueImg from 'v-img';
Vue.use(VueImg, {
  altAsTitle: false,
  sourceButton: true,
  thumbnails: false,
});
// App

export const serverBus = new Vue();

import App from './App.vue'
import Data from './components/Data.vue'

// Routes
const routes = [
  { path: '/', redirect: '/type/form-list' },
  { path: '/type/:type', component: Data, props: true},
  { path: '/type/:type/picker/:picker', component: Data, props: true}
]

const router = new VueRouter({
  routes
});

// Run
new Vue({
  el: '#app',
  router,
  render: h => h(App)
});
