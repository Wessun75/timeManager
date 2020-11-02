<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>

let localuser = null;
let localteamofuser = null;

export default {
  name: "App",
  created() {
    if (this.getUser==null) {
      this.$router.push("/register")
    } else {
      document.title = "Accueil"
    }
  },
  data() {
    return {
      getUser: localuser,
      getTeam: localteamofuser,
    }
  },
  methods: {
    setUser(user) {
      console.log("User défini: " + user.username);
      localuser = user;
    },
    setTeam(team) {
      console.log("Ajout d'équipe: " + team.teamname);
      localteamofuser = team;
    },
    push(page) {
      this.$router.push(page);
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
