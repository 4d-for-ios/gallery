<template>
  <div class="col-6 col-sm-6 mb-3 mt-3 d-flex flex-column cursor-pointer">
    <div class="item-card">
      <div
        class="d-flex flex-column flex-1 rounded-1 border border-dashed border-gray-dark link-gray no-underline"
      >
        <h3 class="h4 px-3 pt-3 text-left" @click="share">
          <font-awesome-icon :icon="['fas', 'plus']" />
          Share your own
        </h3>
        <p
          class="lh-condensed px-3 pb-3 text-left"
          @click="share"
        >Is your project is ready for prime time? Submit it.</p>

        <div
          class="text-gray-light pl-3 pr-2 py-2 bg-gray-light border-top"
          style="margin-top: auto; border-bottom-left-radius: 0; border-bottom-right-radius: 0;"
        >
          <div class="d-flex flex-row">
            
            <div class="col-3">
              <a href="https://github.com/4d-for-ios/gallery/blob/master/.github/CONTRIBUTING.md">
                <font-awesome-icon icon="question-circle" />
                <span class="v-align-baseline">Guide</span>  
              </a>
            </div>
            <div class="col-9">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["type"],
  data() {
    return {
      item: {}
    };
  },
  methods: {
    share() {
      window.open(
        "https://github.com/4d-for-ios/gallery/blob/master/.github/CONTRIBUTING.md#how-do-you-add-a-package"
      );
    }
  }
};
</script>
