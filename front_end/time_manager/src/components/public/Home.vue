<template>
  <div id="Home">
    <NavBar/>
    <router-view/>
    <Footer/>
  </div>
</template>

<script>
import Footer from "@/components/public/Footer";
import NavBar from "@/components/public/NavBar";

export default {
  name: "Home",
  components: {
    NavBar,
    Footer,
  },
  created() {
    document.title = "Accueil";
  }
}
</script>

<style scoped>

</style>