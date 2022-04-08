<template>
  <div class="about">
    <h1>This is an about page</h1>
    <div v-for="bed in beds" v-bind:key="bed.id">
      <h2>{{ bed.id }}</h2>
    </div>
  </div>
</template>

<script>
import { defineComponent } from "vue";
import axios from "axios";

export default defineComponent({
  name: "bedsTableView",
  // setup() {

  // },
  data() {
    return {
      beds: [],
    };
  },
  mounted() {
    this.getBeds();
  },
  methods: {
    getBeds() {
      axios({
        method: "get",
        url: "http://127.0.0.1:8000/beds/",
      }).then((response) => (this.beds = response.data));
    },
  },
});
</script>

export default { }

<style>
@media (min-width: 1024px) {
  .about {
    min-height: 100vh;
    display: flex;
    align-items: center;
  }
}
</style>
