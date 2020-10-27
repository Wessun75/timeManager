
//    Vue principale doit toujours être chargée sauf pendant le login / register
//    Elle contient les vars à transmettre aux vues

<template>
  <div id="Home">
    <div v-if="localuser==null">
      <router-link to="/register"/>
    </div>
    <div v-else>

    </div>
    <router-view/>
  </div>
</template>

<script>

let localuser = null;
let localteamofuser = null;

export default {
  name: "Home",
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

<style scoped>

</style>