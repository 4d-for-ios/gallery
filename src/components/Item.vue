<template>
  <div class="col-lg-4 col-md-6 mb-3 mt-3 d-flex flex-column" @click="goToItem">
    <div class="item-card">
      <div class="flex-column d-flex bg-white rounded-1 box-shadow border text-inherit no-underline flex-1">
   
          <h3 class="h4 px-3 pt-3">{{item.name}}</h3>
          <p class="text-gray lh-condensed px-3 pb-3">{{item.description}}</p>
          <div
            class="text-gray-light pl-3 pr-2 py-2 bg-gray-light border-top"
            style="margin-top: auto; border-bottom-left-radius: 0; border-bottom-right-radius: 0;"
          >
            <div class="d-flex flex-row">
              <div
                class="col-3"
                @click="download"
              >
                <svg
                  height="16"
                  class="octicon octicon-cloud-download octicon octicon-cloud-download octicon octicon-cloud-download octicon octicon-cloud-download octicon octicon-cloud-download octicon octicon-cloud-download octicon octicon-cloud-download octicon octicon-cloud-download octicon octicon-cloud-download octicon octicon-cloud-download octicon octicon-cloud-download octicon octicon-cloud-download octicon octicon-cloud-download octicon octicon-cloud-download octicon octicon-cloud-download octicon octicon-cloud-download octicon octicon-cloud-download octicon octicon-cloud-download octicon octicon-cloud-download v-align-middle"
                  viewBox="0 0 16 16"
                  version="1.1"
                  width="16"
                  aria-hidden="true"
                >
                  <path
                    fill-rule="evenodd"
                    d="M9 12h2l-3 3-3-3h2V7h2v5zm3-8c0-.44-.91-3-4.5-3C5.08 1 3 2.92 3 5 1.02 5 0 6.52 0 8c0 1.53 1 3 3 3h3V9.7H3C1.38 9.7 1.3 8.28 1.3 8c0-.17.05-1.7 1.7-1.7h1.3V5c0-1.39 1.56-2.7 3.2-2.7 2.55 0 3.13 1.55 3.2 1.8v1.2H12c.81 0 2.7.22 2.7 2.2 0 2.09-2.25 2.2-2.7 2.2h-2V11h2c2.08 0 4-1.16 4-3.5C16 5.06 14.08 4 12 4z"
                  />
                </svg>
                <span class="v-align-middle"></span>
              </div>

              <div class="col-3" @click="stargazer">
                <svg
                  height="16"
                  class="octicon octicon-star octicon v-align-middle"
                  viewBox="0 0 14 16"
                  version="1.1"
                  width="14"
                  aria-hidden="true"
                >
                  <path
                    fill-rule="evenodd"
                    d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"
                  />
                </svg>
                <span class="v-align-middle">{{this.stargazers_count}}</span>
              </div>
              <div class="col-9 text-right" @click="github">

                <svg
                  height="16"
                  class="octicon octicon-github octicon v-align-middle"
                  viewBox="0 0 14 16"
                  version="1.1"
                  width="14"
                  aria-hidden="true"
                >
                  <path
                    fill-rule="evenodd"
                    d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"
                  />
                </svg>

              </div>
            </div>
          </div>
      </div>
    </div>
  </div>
</template>

<script>
//const gallery_api = require('express');
export default {
  props: ["passedItem", "type"],
  data() {
    return {
      item: {}
    };
  },
  methods: {
    goToItem() {
      var detailURL = this.item.html_url;
      window.open(detailURL);
    },
    download() {
      var downloadURL =
        this.item.html_url +
        "/releases/latest/download/" +
        this.item.name +
        ".zip"; // self.item.downloal_url
      window.open(downloadURL);
    },
    stargazer() {
      var stargazer_url = this.item.stargazer_url;
      window.open(stargazer_url);
    },
    github() {
      var detailURL = this.item.html_url;
      window.open(detailURL);
    },
  },
  created() {
    this.item = this.passedItem;
  }
};
</script>
