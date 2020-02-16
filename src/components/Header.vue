<template>
  <div class="fixedHeaderContainer">
    <div class="headerWrapper wrapper">
      <header>
        <a href="https://developer.4d.com/4d-for-ios/">
          <h2 class="headerTitle">4D for iOS</h2>
        </a>
        <div class="navigationWrapper navigationSlider">
          <nav class="slidingNav">
            <ul class="nav-site nav-site-internal">
              <li>
                <router-link class="link" to="/type/form-list"><b>List Forms</b></router-link>
              </li>
              <li>
                <router-link class="link" to="/type/form-detail"><b>Detail Forms</b></router-link>
              </li>
              <li>
                <router-link class="link" to="/type/form-login"><b>Login Forms</b></router-link>
              </li>
              <li>
                <router-link class="link" to="/type/formatter"><b>Formatters</b></router-link>
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
</template>

<style>
@media screen and (min-width: 1024px)
.navPusher {
    display: -webkit-box;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    flex-direction: column;
    min-height: calc(100vh - 50px);
    padding-top: 50px;
}
.navPusher {
  left: 0;
  min-height: 100%;
  padding-top: 100px;
  position: relative;
  z-index: 99;
}
@media only screen and (min-width: 1024px)
.navigationSlider .slidingNav ul li a {
    border: 0;
    color: white;
    display: -webkit-box;
    display: flex;
    font-size: 16px;
    font-size: 1em;
    font-weight: 300;
    height: 32px;
    line-height: 1.2em;
    margin: 0;
    padding: 6px 10px;
}
@media only screen and (min-width: 1024px)
.fixedHeaderContainer {
    flex-shrink: 0;
}
.fixedHeaderContainer header {
  display: -webkit-box;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
  flex-flow: row nowrap;
  position: relative;
  text-align: left;
}
</style>