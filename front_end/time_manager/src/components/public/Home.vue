<template>
  <div id="Home">
    <div id="NavBar">
      <NavBar/>
    </div>
    <router-view/>
    <div id="Accueil" v-if="this.$route.path==='/'">
      Accueil
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
  beforeMount() {
    if (Store.state.token == null) {
      console.error("Action impossible, utilisateur non connecté.")
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

#NavBar {
  padding-bottom: 8%;
}

</style>