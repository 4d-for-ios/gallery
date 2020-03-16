<template>
  <div class="col-sm-6 mb-3 mt-3 d-flex flex-column">
    <div class="flex-column bg-white rounded-1 box-shadow border text-inherit no-underline">
      <div class="d-flex flex-row">
        <div class="col-3 col-sm-3 v-align-middle pt-1 pl-1">
          <img
            class = "image"
            :src="item.image_url"
          />
        </div>
        <div class="col-9 col-sm-9 text-left cursor-pointer menu-item" @click="mainAction">
          <h3 class="h4 px-3 pt-3">{{item.name}}</h3>
          <p class="text-gray lh-condensed px-3 pb-3">{{item.description}}</p>
        </div>
      </div>
      <div
        class="text-gray-light pr-2 py-2 bg-gray-light border-top"
        style="margin-top: auto; border-bottom-left-radius: 0; border-bottom-right-radius: 0;"
      >
        <div class="d-flex flex-row ml-1">
          <div v-if="picker == null" class="col-3 col-sm-3 cursor-pointer tooltipped tooltipped-s" :aria-label='item.download_count+" installations"' @click="download">
            <font-awesome-icon :icon="['fas', 'cloud-download-alt']" />
            <span class="v-align-baseline">{{item.download_count}}</span>
          </div>
          <div v-if="picker == null" class="col-2 col-sm-2 cursor-pointer tooltipped tooltipped-s" :aria-label='item.stargazers_count+" stars"' @click="stargazer">
            <font-awesome-icon icon="star" />
            <span class="v-align-baseline">{{item.stargazers_count}}</span>
          </div>
          <div v-else class="col-5 col-sm-5"></div> 
          <div class="col-4 col-sm-4"></div>
          <div class="col-1 col-sm-1 cursor-pointer tooltipped tooltipped-s" aria-label="Open on github" @click="openURL" >
            <font-awesome-icon :icon="['fab', 'github']" />
          </div>
          <div class="col-2 col-sm-2 tooltipped tooltipped-s" aria-label="Latest version">
            <span class="v-align-baseline">{{item.version}}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["passedItem", "type", "picker"],
  data() {
    return {
      avatars: { 
        background: "388CDB",
        color: "FFF",
        rounded: "true"
      },
      item: {}
    };
  },
  methods: {
    mainAction() {
      if (this.picker) {
        this.download();
      } else {
        this.openURL();
      }
    },
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
    },
    openG() {
      console.log("Preview full screen");
      var self = this
      setTimeout(function(){ 
      var links = Array.prototype.slice.call(window.document.getElementsByTagName("a"));
      links.forEach(link => {
        if (link.href == self.item.image_url) {
          console.log("replace "+link.href);
          link.href = self.item.download_url;
          console.log("download "+link.href);
          link.id = "downloadLink";
        }
      });
      }, 1000);
    },
    changed(imageIndex) {
      console.log("Changed image "+imageIndex);

      var images = [
            ...document.querySelectorAll(`img[data-vue-img-group="items"]`),
      ];
      var image = images[imageIndex]; // XXX tricky way to get image and download url...
      var download_url = image.dataset.download_url;  
  
      setTimeout(function(){ 
        var link = window.document.getElementById("downloadLink");
        console.log("replace "+link.href);
        link.href = download_url;
        console.log("download "+link.href);
      }, 1000);
    }
  },
  created() {
    this.item = this.passedItem;
    if (this.item) {
        if (this.item.preview_url) {
          this.item.image_url = this.item.preview_url; // for the moment, use preview
          this.item.has_preview = true
      }
      if (this.item.image_url) {
        if (this.item.image_url.includes("http")) {
          // do nothing
        } else {
          var location = window.location
          var rootURL = location.protocol+"//"+location.host+location.pathname
          if (window.location.host.includes("localhost")) {
             rootURL = "https://4d-for-ios.github.io/gallery/" // to test
          }
          this.item.image_url = rootURL + this.item.image_url
        }
      }
      this.item.has_image = this.item.image_url != null;
      if (!this.item.has_image) {
        var query = this.avatars;
        query["name"]=this.item.name;
        var queryString = Object.keys(query).map((key) => {
          return encodeURIComponent(key) + '=' + encodeURIComponent(query[key]);
        }).join('&');
        this.item.image_url="https://eu.ui-avatars.com/api/?"+queryString;
      }
    }
  }
};
</script>
<style scoped>
.preview {
  max-width: 50px;
}
.image {
  max-width: 80px;
}
.cursor-pointer {
  cursor: pointer;
}
</style>
