
    Vue pour le profil Utilisateur, contient:
    - Affichage du profil personnel (Username, Mail, Grade)
    - Affichage du nom de l'équipe à laquelle l'user appartient (Nom équipe, liste des managers)
    - Champ + bouton pour changer l'username, le mail ou le password,
      il faut taper le password actuel pour valider le changement

<template>
  <div id="Profil">
    {{ user.username }}
  </div>
</template>

<script>
import Axios from "axios"
import App from "@/App";

export default {
  name: "Profil",
  computed: {
    user: App.data().getUser
  },
  created() {
    // Si user null, retour à l'accueil cette page n'est dispo que si User log !
    if (App.data().getUser == null) {
      console.error("Action impossible, utilisateur non connecté.")
//      document.title = "Accueil"
      this.$router.push("/");
      return;// -> Retour direct à Home
    }
  },
  methods: {
    updateUser(userfields) {
      console.log(userfields)
      Axios.put(
          "http://localhost:4000/edit/" + App.data().getUser.userid,
          { params:
                {
                  token: App.data().getUser.LOCALTOKEN
                }
          })
          .then(response => {
            // Mise à jour de l'user
            App.methods.setUser(response);
            this.$forceUpdate();
            }
          )
          .catch( error =>
            {
              console.log(error)
              /*Erreur ici*/
            }
          );
    }
  }
}
</script>

<style scoped>

</style>