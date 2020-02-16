<template>
  <div class="col-sm-6 mb-3 mt-3 d-flex flex-column">
    <div class="flex-column bg-white rounded-1 box-shadow border text-inherit no-underline">
      <div class="d-flex flex-row">
        <div class="col-sm-3 v-align-middle pt-1 pl-1">
          <img 
            v-if="item.has_image"
            v-bind:src="item.image_url"
            v-img:items='{title: item.name}'
            class = "image"
            @click="onImageClick"
          />
          <img
            v-else
            v-img:items='{title: item.name}'
            :src="item.image_url"
          />
        </div>
        <div class="col-sm-9 text-left cursor-pointer" @click="mainAction">
          <h3 class="h4 px-3 pt-3">{{item.name}}</h3>
          <p class="text-gray lh-condensed px-3 pb-3">{{item.description}}</p>
        </div>
      </div>
      <div
        class="text-gray-light pr-2 py-2 bg-gray-light border-top"
        style="margin-top: auto; border-bottom-left-radius: 0; border-bottom-right-radius: 0;"
      >
        <div class="d-flex flex-row">
          <div class="col-sm-2 tooltipped tooltipped-s" aria-label="Latest version">
            <span class="v-align-baseline">{{item.version}}</span>
          </div>
          <div class="col-sm-8"></div>
          <div class="col-sm-2 cursor-pointer tooltipped tooltipped-s" :aria-label='item.download_count+" installations"' @click="download">
            <font-awesome-icon :icon="['fas', 'cloud-download-alt']" />
            <span class="v-align-middle">{{item.download_count}}</span>
          </div>
          <div class="col-sm-2 cursor-pointer tooltipped tooltipped-s" :aria-label='item.stargazers_count+" stars"' @click="stargazer">
            <font-awesome-icon icon="star" />
            <span class="v-align-middle">{{item.stargazers_count}}</span>
          </div>
          <div class="col-sm-2 cursor-pointer tooltipped tooltipped-s" aria-label="Open on github" @click="openURL" >
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
      download();
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
    onImageClick() {
      // Replace link to download image to download project
      setTimeout(() => {
        var links = Array.prototype.slice.call(window.document.getElementsByTagName("a"));
        links.forEach(link => {
          if (link.href == this.item.image_url) {
            link.href = this.item.download_url;
            console.log("download "+link.href);
            link.id = "image_download";
            var self = this
            var observer = new MutationObserver(function(mutations) {
            mutations.forEach(function(mutation) {
              if (mutation.type == "attributes") {
                if (self.item.download_url != link.href ) {
                  link.href = self.item.download_url;
                  console.log("download "+link.href);
                }
              }
              });
            });
            observer.observe(link, {
              attributes: true //configure it to listen to attribute changes
            });
          };
        }); 
      }, 500);
    }
  },
  created() {
    this.item = this.passedItem;
    if (this.item) {
      if (this.type == "formatter") {
        this.item.image_url = this.item.html_url+"/blob/master/formatter.png?raw=true"
      } else {
        this.item.image_url = this.item.html_url+"/blob/master/template.gif?raw=true"
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
.image {
  max-width: 50px;
}
</style>