<template>
  <div class="col-6 col-sm-6 mb-3 mt-3 d-flex flex-column">
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
          <div v-tooltip.top-center="Download" class="col-2 cursor-pointer" @click="download">
            <font-awesome-icon :icon="['fas', 'cloud-download-alt']" />
            <span class="v-align-middle">{{item.download_count}}</span>
          </div>
          <div class="col-2 cursor-pointer" @click="stargazer">
            <font-awesome-icon icon="star" />
            <span class="v-align-middle">{{item.stargazers_count}}</span>
          </div>
          <div v-tooltip.top-center="Open project page" class="col-2 cursor-pointer " @click="openURL" >
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

<style>
.image { 

}
.tooltip {
  display: block !important;
  z-index: 10000;

  .tooltip-inner {
    background: black;
    color: white;
    border-radius: 16px;
    padding: 5px 10px 4px;
  }

  .tooltip-arrow {
    width: 0;
    height: 0;
    border-style: solid;
    position: absolute;
    margin: 5px;
    border-color: black;
    z-index: 1;
  }

  &[x-placement^="top"] {
    margin-bottom: 5px;

    .tooltip-arrow {
      border-width: 5px 5px 0 5px;
      border-left-color: transparent !important;
      border-right-color: transparent !important;
      border-bottom-color: transparent !important;
      bottom: -5px;
      left: calc(50% - 5px);
      margin-top: 0;
      margin-bottom: 0;
    }
  }

  &[x-placement^="bottom"] {
    margin-top: 5px;

    .tooltip-arrow {
      border-width: 0 5px 5px 5px;
      border-left-color: transparent !important;
      border-right-color: transparent !important;
      border-top-color: transparent !important;
      top: -5px;
      left: calc(50% - 5px);
      margin-top: 0;
      margin-bottom: 0;
    }
  }

  &[x-placement^="right"] {
    margin-left: 5px;

    .tooltip-arrow {
      border-width: 5px 5px 5px 0;
      border-left-color: transparent !important;
      border-top-color: transparent !important;
      border-bottom-color: transparent !important;
      left: -5px;
      top: calc(50% - 5px);
      margin-left: 0;
      margin-right: 0;
    }
  }

  &[x-placement^="left"] {
    margin-right: 5px;

    .tooltip-arrow {
      border-width: 5px 0 5px 5px;
      border-top-color: transparent !important;
      border-right-color: transparent !important;
      border-bottom-color: transparent !important;
      right: -5px;
      top: calc(50% - 5px);
      margin-left: 0;
      margin-right: 0;
    }
  }

  &[aria-hidden='true'] {
    visibility: hidden;
    opacity: 0;
    transition: opacity .15s, visibility .15s;
  }

  &[aria-hidden='false'] {
    visibility: visible;
    opacity: 1;
    transition: opacity .15s;
  }
}
</style>
