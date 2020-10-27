
    Vue principale doit toujours être chargée
    Elle contient les vars à transmettre aux vues

<template>
  <div id="Home">
    Home --> Ici mettre la navbar + les bouton pour login / logout
    <router-view/>
  </div>
</template>

<script>

let logeduser = null;
let userteam = null;

export default {
  name: "Home",
  created() {
    document.title = "Accueil"
  },
  data() {
    return {
      getUser: logeduser,
      getTeam: userteam,
    }
  },
  methods: {
    setUser(user) {
      console.log("User défini: " + user.username)
      logeduser = user
    },
    setTeam(team) {
      userteam = team
    }
  }
}
</script>

<style scoped>

</style>