<template>
  <div class="col-4 col-sm-4 mb-3 mt-3 d-flex flex-column cursor-pointer">
      <div
        class="flex-column bg-white rounded-1 box-shadow border text-inherit no-underline"
      >
        <div class="d-flex flex-row">
          <div class="text-left" @click="goToItem">
            <h3 class="h4 px-3 pt-3">{{item.name}}</h3>
            <p class="text-gray lh-condensed px-3 pb-3">{{item.description}}</p>
          </div>
        </div>
        <div
          class="text-gray-light pr-2 py-2 bg-gray-light border-top"
          style="margin-top: auto; border-bottom-left-radius: 0; border-bottom-right-radius: 0;"
        >
          <div class="d-flex flex-row">
            <div class="col-3" @click="download">
              <font-awesome-icon icon="download" />
              <span class="v-align-baseline">{{item.release}}</span>
            </div>
            <div class="col-3" @click="stargazer">
              <font-awesome-icon icon="star" />
              <span class="v-align-middle">{{item.stargazers_count}}</span>
            </div>
            <div class="col-6">
            </div>
          </div>
        </div>
      </div>
  </div>
</template>

<script>
export default {
  props: ["passedItem", "type"],
  data() {
    return {
      item: {}
    };
  },
  methods: {
    goToItem() {
      window.open(this.item.html_url);
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
      window.open(this.item.stargazer_url);
    },
    github() {
      window.open(this.item.html_url);
    }
  },
  created() {
    this.item = this.passedItem;
    if (this.item) {
      if (this.type == "formatter") {
        this.item.imageURL =
          "https://github.com/" +
          this.item.full_name +
          "/blob/master/formatter.png?raw=true";
      } else {
        this.item.imageURL =
          "https://github.com/" +
          this.item.full_name +
          "/blob/master/template.gif?raw=true";
      }
    }
  }
};
</script>
