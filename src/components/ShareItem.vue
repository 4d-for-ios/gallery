<template>
  <div class="col-lg-4 col-md-6 mb-3 mt-3 d-flex flex-column">
    <div class="item-card">
      <div
        class="d-flex flex-column flex-1 rounded-1 border border-dashed border-gray-dark link-gray no-underline"
      >
        <h3 class="h4 px-3 pt-3" @click="share">
          <svg
            class="octicon octicon-plus v-align-text-bottom"
            viewBox="0 0 12 16"
            version="1.1"
            width="12"
            height="16"
            aria-hidden="true"
          >
            <path fill-rule="evenodd" d="M12 9H7v5H5V9H0V7h5V2h2v5h5v2z" />
          </svg>
          Share your own
        </h3>
        <p
          class="lh-condensed px-3 pb-3"
          @click="share"
        >Is your project is ready for prime time? Submit it.</p>

        <div
            class="text-gray-light pl-3 pr-2 py-2 bg-gray-light border-top"
            style="margin-top: auto; border-bottom-left-radius: 0; border-bottom-right-radius: 0;"
          >
            <div class="d-flex flex-row">
              <div
                class="col-3 tooltipped tooltipped-s"
                aria-label="247 installations"
              >
              <a
          href="https://github.com/4d-for-ios/gallery/blob/master/.github/CONTRIBUTING.md">Contributing_guide</a>
              <div class="col-9 text-right"></div>
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
  props: ["type"],
  data() {
    return {
      item: {}
    };
  },
  methods: {
    share() {
      var detailURL =
        "https://github.com/4d-for-ios/gallery/edit/master/4d-for-ios-" +
        this.type +
        ".txt";
      window.open(detailURL);
    }
  }
};
</script>
