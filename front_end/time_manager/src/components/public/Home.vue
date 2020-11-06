<template>
  <div id="Home">
    <NavBar/>
    <router-view/>
    <div id="Accueil" v-if="this.$route.path==='/'">
      Accueil
      {{user}}
    </div>
    <Footer/>
  </div>
</template>

<script>
import Footer from "@/components/public/Footer";
import NavBar from "@/components/public/NavBar";
import Store from "@/store";
import {mapGetters} from "vuex";

export default {
  name: "Home",
  components: {
    NavBar,
    Footer,
  },
  beforeMount() {
    if (Store.state.token == null) {
      console.error("Action impossible, utilisateur non connecté.")
      this.$router.push("/");
      return;// -> Retour direct à Home
    }
  },
  computed: {
    ...mapGetters({
      authenticated: 'auth/authentication',
      user: 'auth/user',
    })
    },
  created() {
    document.title = "Accueil";
  }
}
</script>

<style scoped>

</style>