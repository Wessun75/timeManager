import Vue from "vue";
import Router from "vue-router";
import Profil from "@/components/pages/users_pages/Profil";
import Team from "@/components/pages/manager_pages/Team";
import Log from "@/components/authentication/Log";
import Home from "@/components/public/Home";
import Presence from "@/components/pages/users_pages/Presence";
import EditProfil from "@/components/pages/users_pages/EditProfil";

Vue.use(Router);

export default new Router({
    //  Permet de retirer le /#/
    mode: "history",
    //  Liste des routes avec leur path
    routes:
        [
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
                    },
                    {
                        name: "Presence",
                        path: "presence",
                        component: Presence,
                    },
                    {
                        name: "",
                        path: "editprofil",
                        component: EditProfil,
                    }
                ]
            },
            {
                path: "/login",
                name: "login",
                component: Log
            }
        ]
});