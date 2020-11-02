import Vue from "vue";
import Router from "vue-router";
import Profil from "@/components/pages/users_pages/Profil";
import Team from "@/components/pages/manager_pages/Team";
import Login from "@/components/authentication/Login";
import Register from "@/components/authentication/Register";
import Home from "@/components/public/Home";

Vue.use(Router);

export default new Router({
    //  Permet de retirer le /#/
    mode: "history",
    //  Liste des routes avec leur path
    routes: [
        {
            path: "/",
            name: "Accueil",
            component: Home,
            children: [
                {
                    name: "Profil",
                    path: "profil",
                    component:  Profil,
                },
                {
                    name: "Team",
                    path: "equipe",
                    component: Team,
                }
            ]
        },
        {
            path: "/login",
            name: "login",
            component: Login
        },
        {
            path: "/register",
            name: "register",
            component: Register
        }
    ]
});