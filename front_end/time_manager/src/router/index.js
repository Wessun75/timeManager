import Vue from "vue";
import Router from "vue-router";
import Home from "@/components/Home";
import Profil from "@/components/Profil";
import Team from "@/components/Team";

//  Activation du router
Vue.use(Router);

export default new Router({
    //  Permet de retirer le /#/
    mode: "history",
    //  Liste des routes avec leur path
    routes: [
        {
            path: "/",
            name: "Home",
            component: Home,
            props: false,
            children: [
                {
                    path: "profil",
                    component: Profil
                },
                {
                    path: "equipe",
                    component: Team
                }
            ]
        }
    ]
});