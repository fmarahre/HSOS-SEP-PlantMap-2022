<template>
  <div class="container">
    <table class="table table-striped mt-5">
      <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Latitude</th>
          <th scope="col">Longitude</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="bed in beds" v-bind:key="bed.id">
          <th scope="row">{{ bed.id }}</th>
          <td>{{ bed.lat }}</td>
          <td>{{ bed.lon }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script lang="ts">
import axios from "axios";
import { BedsStore } from "@/stores/bedsStore.ts";
import { storeToRefs } from "pinia";

export default {
  setup() {
    const main = BedsStore();
    console.log(main);
    const beds = storeToRefs(main).beds;
    console.log(beds);
    return {
      beds,
    };
  },
  // created() {
  //     console.log("CREATED");
  //     this.getBeds();
  // },
  // methods: {
  //     getBeds() {
  //         axios({
  //             method: "get",
  //             url: "http://127.0.0.1:8000/beds/",
  //         }).then((response) => (this.beds = response.data));
  //     },
  // },
};
</script>

<style scoped></style>
