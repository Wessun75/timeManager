<template>
  <div id="app">
    <Header/>
    <div v-if="localuser==null">
      <router-link to="/register"/>
    </div>
    <div v-else>
      <NavBar/>
      <router-view/>
    </div>
    <Footer/>
  </div>
</template>

<script>
import NavBar from "@/components/tools/NavBar";
import Header from "@/components/tools/Header";
import Footer from "@/components/tools/Footer";

let localuser = null;
let localteamofuser = null;

export default {
  name: "App",
  components: {
    Footer,
    Header,
    NavBar,
  },
  created() {
    document.title = "Accueil"
  },
  computed: {
    localuser,
  },
  data() {
    return {
      getUser: localuser,
      getTeam: localteamofuser,
    }
  },
  methods: {
    setUser(user) {
      console.log("User défini: " + user.username)
      localuser = user
    },
    setTeam(team) {
      console.log("Ajout d'équipe: " + team.teamname)
      localteamofuser = team
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
