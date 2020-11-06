import Vue from "vue";
import Router from "vue-router";
import Profil from "@/components/pages/users_pages/Profil";
import Team from "@/components/pages/manager_pages/Team";
import Log from "@/components/authentication/Log";
import Home from "@/components/public/Home";
import Presence from "@/components/pages/users_pages/Presence";
import EditProfil from "@/components/pages/users_pages/EditProfil";
import EditProfilOther from "@/components/pages/admin/EditProfilOther";

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
                        name: "Board",
                        path: "board",
                        component: Presence,
                    },
                    {
                        name: "UserEditProfil",
                        path: "editprofil",
                        component: EditProfil,
                    },
                    {
                        name: "AdminEditProfil",
                        path: "admin-editprofil",
                        component: EditProfilOther,
                    },
                ]
            },
            {
                path: "/login",
                name: "login",
                component: Log
            }
        ]
});