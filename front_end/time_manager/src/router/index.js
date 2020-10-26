import Vue from "vue";
import Router from "vue-router";
import Home from "@/components/Home";

//  Activation du router
Vue.use(Router);

export default new Router({
    routes: [
        {
            path: "/",
            name: "Home",
            components: Home,
            props: false
        }
    ]
});