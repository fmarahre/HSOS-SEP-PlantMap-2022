import { createRouter, createWebHistory } from "vue-router";
import BedsTableView from "@/views/BedsTableView.vue";
import MapView from "@/views/MapView.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/beds",
      name: "beds",
      component: BedsTableView,
    },
    {
      path: "/map",
      name: "map",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: MapView,
    },
  ],
});

export default router;
