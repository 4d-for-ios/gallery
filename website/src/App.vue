<template>
  <div id="app">
    <div v-if="picker" class="fixedHeaderContainer">
      <div class="headerWrapper wrapper">
        <header>
          <a href="https://developer.4d.com/4d-for-ios/">
            <h2 class="headerTitle">4D for iOS</h2>
          </a>
          <div class="navigationWrapper navigationSlider">
            <nav class="slidingNav">
              <ul class="nav-site nav-site-internal">
                <li class>
                  <router-link class="link" to="/type/form-list">List Forms</router-link>
                </li>
                <li class>
                   <router-link class="link" to="/type/form-detail">Detail Forms</router-link>
                </li>
                <li class>
                   <router-link class="link" to="/type/form-login">Login Forms</router-link>
                </li>
                <li class>
                   <router-link class="link" to="/type/formatter">Formatters</router-link>
                </li>
                <li v-if="search" class="navSearchWrapper reactNavSearchWrapper">
                  <span
                    class="algolia-autocomplete"
                    style="position: relative; display: inline-block; direction: ltr;"
                  >
                    <input
                      type="text"
                      id="search_input_react"
                      placeholder="Search"
                      title="Search"
                      class="aa-input"
                      autocomplete="off"
                      spellcheck="false"
                      role="combobox"
                      aria-autocomplete="list"
                      aria-expanded="false"
                      aria-labelledby="search_input_react"
                      aria-owns="algolia-autocomplete-listbox-0"
                      dir="auto"
                      style="position: relative; vertical-align: top;"
                    />
                    <pre
                      aria-hidden="true"
                      style="position: absolute; visibility: hidden; white-space: pre; font-family: system-ui; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 300; word-spacing: 0px; letter-spacing: normal; text-indent: 0px; text-rendering: auto; text-transform: none;"
                    ></pre>
                    <span
                      class="aa-dropdown-menu"
                      role="listbox"
                      id="algolia-autocomplete-listbox-0"
                      style="position: absolute; top: 100%; z-index: 100; display: none; left: 0px; right: auto;"
                    >
                      <div class="aa-dataset-1"></div>
                    </span>
                  </span>
                </li>
              </ul>
            </nav>
          </div>
        </header>
      </div>
    </div>
    <div v-if="picker" class="bg-gray-ligh navPusher">
      <router-view></router-view>
    </div>
    <div v-else class="bg-gray-ligh">
      <router-view></router-view>
    </div>
    <footer v-if="picker" class="nav-footer" id="footer">
      <section class="sitemap">
        <a href="https://www.4d.com" class="nav-home">
          <img src="https://developer.4d.com/4d-for-ios/img/logohome.png" alt="4D for iOS" />
        </a>
        <div>
          <h5>Community</h5>
          <a href="https://developer.4D.com">4D Developer Center</a>
          <a href="https://blog.4d.com/">4D Blog</a>
          <a href="https://forums.4d.com/">4D Forum</a>
          <a href="https://www.facebook.com/4Dsoftware/">Facebook</a>
          <a href="https://twitter.com/4Dsoftware">Twitter</a>
          <a href="https://www.youtube.com/user/4Dsoftware">Youtube</a>
          <a href="https://github.com/4D/">GitHub</a>
        </div>
        <div>
          <h5>Support</h5>
          <a href="https://doc.4d.com/">
            4D Doc Center
            <i>(Where It All Began)</i>
          </a>
          <a href="http://kb.4d.com/">Knowledge Base</a>
          <a href="https://us.4d.com/product-download">Downloads</a>
          <a href="https://us.4d.com/resources">Resources</a>
          <a href="https://us.4d.com/4d-technical-support">Get Support</a>
        </div>
        <div>
          <h5>Company</h5>
          <a href="https://us.4d.com/about-us">About 4D</a>
          <a href="https://us.4d.com/contact-us">Contact us</a>
          <a href="https://us.4d.com/4d-around-the-world">4D around the world</a>
          <a href="https://us.4d.com/careers">Careers</a>
        </div>
      </section>
      <section class="copyright">© 2020 4D SAS - All rights reserved</section>
      <section class="copyright">
        <a class="cp2" href="https://us.4d.com/terms-and-conditions">Terms &amp; Conditions</a> |
        <a class="cp2" href="https://us.4d.com/legal-notices">Legal Notices</a> |
        <a class="cp2" href="https://us.4d.com/data-policy">Data Policy</a> |
        <a class="cp2" href="https://us.4d.com/cookies-policy">Cookie Policy</a> |
        <a class="cp2" href="https://us.4d.com/license">Product license</a>
      </section>
    </footer>
  </div>
</template>

<script>
export default {
  props: ["type"],
  data() {
    return {
      picker: this.$route.params.picker == undefined
    };
  }
};
</script>
<style lang="sass">
@import "~primer-css/index.scss"
</style>