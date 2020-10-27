
    Vue pour le profil Utilisateur, contient:
    - Affichage du profil personnel (Username, Mail, Grade)
    - Affichage du nom de l'équipe à laquelle l'user appartient (Nom équipe, liste des managers)
    - Champ + bouton pour changer l'username, le mail ou le password,
      il faut taper le password actuel pour valider le changement

<template>
  <div id="Home">
    Profil
  </div>
</template>

<script>
import Home from "@/components/Home";
import Axios from "axios"

export default {
  name: "Profil",
  created() {
    // Si user null, retour à l'accueil cette page n'est dispo que si User log !
    if (Home.data().getUser == null) {
      console.error("Action impossible, utilisateur non connecté.")
      document.title = "Accueil"
      this.$router.push("/");
      return;// -> Retour direct à Home
    }
    Home.methods.setUser({
      username: "yolo"
    })
    console.log(Home.data().getUser)
  },
  methods: {
    updateUser(userfields) {
      console.log(userfields)
      Axios.get("")
          .then(response => {
            // Mise à jour de l'user
            Home.methods.setUser(response);
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