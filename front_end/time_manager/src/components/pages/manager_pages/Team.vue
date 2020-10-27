
Page manager, pour afficher:
- La liste des utilisateurs de l'équipe
- La liste des managers de l'équipe
- Bouton pour ajouter un utilisateur à l'équipe

<template>
  <div id="Team">
    Team
    <div v-if="teams">
      <ul>
        <li v-for="team in teams" :key="team.teamid">
          {{team.name}}
        </li>
      </ul>
    </div>
    <div v-else>
      Vous n'avez aucune équipe.
      <p/>"
      Vous pouvez en créer une ici
    </div>
  </div>
</template>

<script>
import Home from "../../../../../OLD/Home";
import Axios from "axios";

export default {
  name: "Team",
  data() {
    return {
      teams: []
    }
  },

  mounted() {
    // Si user null ou pas level 2+, retour à l'accueil
    if (!Home.data().getUser || Home.data().getUser.rank <= 2) {
      console.error("Action impossible, permissions insufisante.");
      document.title = "Accueil";
      this.$router.push("/");
      return;// -> Retour direct à Home
    }
    Axios.get(`http://localhost:4000/viewManaged/${Home.data().getUser.userid}`,
        { params:
              {
                token: Home.data().getUser.LOCALTOKEN
              }
        })
        .then(response => {
          console.debug(response);
          this.teams = response.data;
        })
        .catch(error => {
          console.error(error);
        })
  }
}
</script>