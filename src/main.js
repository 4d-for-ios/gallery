import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

import { library } from '@fortawesome/fontawesome-svg-core'

import { faSignIn } from '@fortawesome/pro-solid-svg-icons'
library.add(faSignIn)
import { faStar } from '@fortawesome/free-solid-svg-icons'
library.add(faStar)
import { faList } from '@fortawesome/free-solid-svg-icons'
library.add(faList)


import { faCoffee } from '@fortawesome/free-solid-svg-icons'
library.add(faCoffee)
import { faGithub } from '@fortawesome/free-brands-svg-icons'
library.add(faGithub)

import { faDownload } from '@fortawesome/pro-solid-svg-icons' // import { faCloudDownloadAlt } from '@fortawesome/free-solid-svg-icons'
library.add(faDownload) // library.add(faCloudDownloadAlt)

import { faQuestionCircle } from '@fortawesome/pro-solid-svg-icons'
library.add(faQuestionCircle)
import { faFileInvoice } from '@fortawesome/pro-solid-svg-icons'
library.add(faFileInvoice)

import { faSprayCan } from '@fortawesome/pro-solid-svg-icons'
library.add(faSprayCan)

import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

import VueExpandableImage from 'vue-expandable-image'
Vue.use(VueExpandableImage)

Vue.component('font-awesome-icon', FontAwesomeIcon)

import App from './App.vue'
import Data from './components/Data.vue'

const routes = [
  { path: '/data/:type', component: Data }
]

const router = new VueRouter({
  routes
})

new Vue({
  el: '#app',
  router,
  render: h => h(App)
})
