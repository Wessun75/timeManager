<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>

import Store from "@/store"

let localteamofuser = null;

export default {
  name: "App",
  data() {
    return {
      getUser: Store.state.user,
      getTeam: localteamofuser,
      getToken: Store.state.token,
    }
  },
  methods: {
    setTeam(team) {
      console.log("Ajout d'équipe: " + team.teamname);
      localteamofuser = team;
    }
  },
  beforeMount() {
    //Init d'un user fake
    Store.state.user = {
      userid: 1,
      username: "Arthur",
      email: "arthur@epitech.eu",
      role: 2,
      team_id: null,
      manage_id: [1,2,3]
    };
    Store.state.token = "YOLOTOKEN";
  }
}
</script>

<style>
html, body {
  height: 95%;
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}
</style>
