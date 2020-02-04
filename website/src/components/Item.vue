<template>
  <div class="col-4 col-sm-4 mb-3 mt-3 d-flex flex-column">
    <div class="flex-column bg-white rounded-1 box-shadow border text-inherit no-underline">
      <div class="d-flex flex-row">
        <div class="col-sm-2 v-align-middle pt-1 pl-1">
          <expandable-image 
            v-if="item.has_image"
            v-bind:src="item.image_url"
            :close-on-background-click="true"
          />
          <img 
            v-else
            :src="item.image_url"
          />
        </div>
        <div class="col-sm-10 text-left cursor-pointer" @click="download">
          <h3 class="h4 px-3 pt-3">{{item.name}}</h3>
          <p class="text-gray lh-condensed px-3 pb-3">{{item.description}}</p>
        </div>
      </div>
      <div
        class="text-gray-light pr-2 py-2 bg-gray-light border-top"
        style="margin-top: auto; border-bottom-left-radius: 0; border-bottom-right-radius: 0;"
      >
        <div class="d-flex flex-row">
          <div class="col-2">
            <span class="v-align-baseline">{{item.version}}</span>
          </div>
          <div class="col-8"></div>
          <div class="col-2 cursor-pointer" @click="download">
            <font-awesome-icon :icon="['fas', 'cloud-download-alt']" />
            <span class="v-align-middle">{{item.download_count}}</span>
          </div>
          <div class="col-2 cursor-pointer" @click="stargazer">
            <font-awesome-icon icon="star" />
            <span class="v-align-middle">{{item.stargazers_count}}</span>
          </div>
          <div class="col-2 cursor-pointer" @click="openURL">
            <font-awesome-icon :icon="['fab', 'github']" />
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
    openURL() {
      window.open(this.item.html_url);
    },
    download() {
      window.open(this.item.download_url);
    },
    stargazer() {
      window.open(
        this.item.stargazers_url.replace("api.github.com/repos", "github.com")
      );
    },
    github() {
      window.open(this.item.html_url);
    }
  },
  created() {
    this.item = this.passedItem;
    if (this.item) {
      this.item.has_image = this.item.image_url != null;
      if (!this.item.has_image) {
        this.item.image_url="https://eu.ui-avatars.com/api/?name="+encodeURIComponent(this.item.name)+"&rounded=true&background=0D8ABC&color=fff";
      }
    }
  }
};
</script>

<style>
.image { 

}
</style>