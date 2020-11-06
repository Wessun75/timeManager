<template>
  <div id="Home">
    <NavBar/>
    <router-view/>
    <div id="Accueil" v-if="this.$route.path==='/'">
      <br/>
      <h2>Bonjour, bienvenue sur la page d'accueil {{user.username}}</h2>
    </div>
    <Footer/>
  </div>
</template>

<script>
import Footer from "@/components/public/Footer";
import NavBar from "@/components/public/NavBar";
import Store from "@/store";

export default {
  name: "Home",
  components: {
    NavBar,
    Footer,
  },
  computed: {
      user:{
        get() {
          return Store.state.user
        }
      }
  },
  beforeMount() {
    if (Store.state.token == null) {
      this.$router.push("/login");
      return;// -> Retour direct à Home
    }
  },

  created() {
    document.title = "Accueil";
  }
}
</script>

<style scoped>

</style>