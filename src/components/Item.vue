<template>
  <div class="col-lg-4 col-md-6 mb-3 mt-3 d-flex flex-column">
    <div class="item-card">
      <div class="flex-column d-flex bg-white rounded-1 box-shadow border text-inherit no-underline flex-1">
   
        <div class="d-flex flex-row">
          <div class="col-lg-2">
              <expandable-image v-bind:src="item.imageURL"/>
          </div>
          <div class="col-10 text-left" @click="goToItem">
            <h3 class="h4 px-3 pt-3">{{item.name}}</h3>
            <p class="text-gray lh-condensed px-3 pb-3">{{item.description}}</p>
          </div>

          </div>
          <div
            class="text-gray-light pl-3 pr-2 py-2 bg-gray-light border-top"
            style="margin-top: auto; border-bottom-left-radius: 0; border-bottom-right-radius: 0;"
          >
            <div class="d-flex flex-row">
              <div
                class="col-3"
                @click="download"
              >
                <font-awesome-icon icon="download" />
                <span class="v-align-middle"></span>
              </div>

              <div class="col-3" @click="stargazer">
                <font-awesome-icon icon="star" />
                <span class="v-align-middle">{{item.stargazers_count}}</span>
              </div>
              <div class="col-9 text-right" @click="github">

                <font-awesome-icon icon="github" />

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
    if (this.item) {
      if (this.type == "formatter") {
      this.item.imageURL="https://github.com/"+this.item.full_name+"/blob/master/formatter.png?raw=true";
      } else {
      this.item.imageURL="https://github.com/"+this.item.full_name+"/blob/master/template.gif?raw=true";
      }
    }
  }
};
</script>
