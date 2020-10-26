
    Vue principale doit toujours être chargée
    Elle contient les vars à transmettre aux vues

<template>
  <div id="Home">
  </div>
</template>

<script>
export default {
  name: "Home",
  mounted() {
    document.title = "Accueil"
  }
}
</script>

<style scoped>

</style>