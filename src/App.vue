<template>
<div id="app">
  <h3><p>Have a cup of coffee <font-awesome-icon icon="coffee" /> or choose one topic:</p></h3>
  <h4>
    <router-link class="link" to="/data/form-list"><font-awesome-icon icon="list"/> List Forms</router-link> |
    <router-link class="link" to="/data/form-detail"><font-awesome-icon icon="file-invoice"/> Detail Forms</router-link> |
    <router-link class="link" to="/data/form-login"><font-awesome-icon icon="sign-in"/> Login Forms</router-link> |
    <router-link class="link" to="/data/formatter"><font-awesome-icon icon="spray-can"/> Formatters</router-link>
  </h4>
  <router-view></router-view>
</div>
</template>
