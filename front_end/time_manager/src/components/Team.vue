
    Page manager, pour afficher:
    - La liste des utilisateurs de l'équipe
    - La liste des managers de l'équipe
    - Bouton pour ajouter un utilisateur à l'équipe

<template>
  <div id="Team">
    Team
    <div v-if="ManagedTeams != null">

    </div>
    <div v-else>
      Vous n'avez aucune équipe.
      <p/>
      Vous pouvez en créer une ici
    </div>
  </div>
</template>

<script>
import Home from "@/components/Home";

export default {
  name: "Team",
  computed: {
    ManagedTeams: Home.data().getUser.managed
  },
  created() {
    // Si user null ou pas level 2+, retour à l'accueil
    if (Home.data().getUser==null || !(Home.data().getUser.rank >= 2)) {
      console.error("Action impossible, permissions insufisante.")
      document.title = "Accueil"
      this.$router.push("/");
      return;// -> Retour direct à Home
    }

  }
}
</script>

<style scoped>

</style>