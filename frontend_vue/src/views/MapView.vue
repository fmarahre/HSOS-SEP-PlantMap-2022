<template>
  <div id="map"></div>
</template>

<script lang="ts">
import L from "leaflet";
import axios from "axios";
import { BedsStore } from "@/stores/bedsStore.ts";
import { storeToRefs } from "pinia";
import { defineComponent } from "vue";

export default defineComponent({
  name: "MapView",
  setup() {
    console.log("SETUP");
    const main = BedsStore();
    const beds = storeToRefs(main).beds;
    var map = {};
    console.log(beds);
    return {
      beds,
      map,
    };
  },
  mounted() {
    console.log(this.beds);
    console.log("MOUNTED");
    this.map = L.map("map").setView([52.234, 8.3234], 13);

    L.tileLayer(
      "https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}",
      {
        attribution:
          'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 18,
        id: "mapbox/streets-v11",
        tileSize: 512,
        zoomOffset: -1,
        accessToken:
          "pk.eyJ1IjoiZm1hcmFocmUiLCJhIjoiY2wxcnR2aTdmMHEyMzNlbzNvOHY1ZmpmZyJ9.MwR6id1xytR7IgPFxYC_qQ",
      }
    ).addTo(this.map);
    console.log(this.beds);
    this.setMarker();
    console.log(this.map);
    console.log("MOUNTED END");
  },
  methods: {
    setMarker() {
      console.log("SetMarker()");
      console.log(this.beds);
      this.beds.forEach(function (bed) {
        console.log("FOREACH!!!!");
        console.log(bed);
        console.log(this.map);
        // var marker = L.marker([bed.lat, bed.lon]).addTo(this.map);
      });
    },
  },
});
</script>

<style scoped>
#map {
  height: 100vh;
  width: 100%;
}
</style>
