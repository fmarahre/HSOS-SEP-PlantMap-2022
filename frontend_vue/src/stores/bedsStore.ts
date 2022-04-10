import { defineStore } from "pinia";
import axios from "axios";

export const BedsStore = defineStore({
  id: "beds",
  state: () => ({
    beds: [],
  }),
  getters: {
    getBeds(): any {
      //TODO
      console.log("getBeds()");
      return this.beds; // || [];
    },
  },
  actions: {
    getBedsFromAPI() {
      console.log("getBedsFromAPI");
      axios({
        method: "get",
        url: "http://127.0.0.1:8000/beds/",
      }).then((response) => (this.beds = response.data));
    },
  },
});
