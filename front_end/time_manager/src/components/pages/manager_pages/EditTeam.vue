<template>
  <div id="EditTeam">
    <div v-if="team!=null && team.team != null && team.team.team_name != null">
      <h1>Équipe: {{team.team.team_name}}</h1>
      <div v-if="team.users!=null">
        Membres :
        <li v-for="user in team.users" :key="user.id">
          {{user.username}}
        </li>
      </div>
    </div>
  </div>
</template>

<script>
import Store from "@/store";
import Axios from "axios";

export default {
  name: "EditTeam",
  props: {
    team_id: null,
  },
  data() {
    return {
      team: {},
    }
  },
  created() {
    if (Store.state.token==null || Store.state.user.role < 2) {
      console.error("Action impossible, permissions insufisante.");
      document.title = "Accueil";
      this.$router.push("/");
      return;// -> Retour direct à Home
    }
    if (this.team_id==null) {
      console.error("Équipe non reconnue.");
      document.title = "Vos équipes";
      this.$router.push("/equipe");
      return;// -> Retour direct à la page d'équipe
    }
    Axios
        .get("http://localhost:4000/api/teams/users/" + this.team_id,
            {
              headers:
                  {
                    'Authorization': Store.state.token,
                  },
            })
        .then(response => {
          this.team.users = response.data.data
        })
        .catch(error => console.log(error))
    Axios
        .get("http://localhost:4000/api/teams/" + this.team_id,
            {
              headers:
                  {
                    'Authorization': Store.state.token,
                  },
            })
        .then(response => {
          this.team.team = response.data.data
        })
        .catch(error => console.log(error))
  }
}
</script>

<style scoped>

</style>