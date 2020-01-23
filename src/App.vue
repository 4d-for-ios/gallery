<template>
<div id="app">
  <h3><p>Have a cup of coffee <font-awesome-icon icon="coffee" /> or choose topic:</p></h3>
  <h4>
    <router-link class="link" to="/data/form-list">List Forms</router-link> |
    <router-link class="link" to="/data/form-detail">Detail Forms</router-link> |
    <router-link class="link" to="/data/form-login">Login Forms</router-link> |
    <router-link class="link" to="/data/formatter">Formatters</router-link>
  </h4>
  <router-view></router-view>
</div>
</template>
