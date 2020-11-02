<template>
  <div id="Home">
    <NavBar
        name="Logo Name"
        :navLinks="[
        {
          name: 'Accueil',
          link: '/',
          dropdown: false,
        },
        {
          name: 'Profile',
          link: '/profil',
          dropdown: false
        }
      ]"
    />
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
    document.title = "Accueil"
  }
}
</script>

<style scoped>

</style>