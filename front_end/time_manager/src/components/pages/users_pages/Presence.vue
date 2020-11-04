<template>
  <div id="Presence">
    <div v-if="presence">
      <h1>
        Vous êtes n'avez pas débuté votre journée
      </h1>
      <br>
      <br>
      <button type="button" class="v-btn v-btn--contained theme--light v-size--default custom-color" @click="presence = !presence">
        Je débute ma journée
      </button>
    </div>
    <div v-else>
      <h1>
        Vous êtes avez débuté votre journée
      </h1>
      <br>
      <br>
      <button type="button" class="v-btn v-btn--contained theme--light v-size--default custom-color" @click="presence = !presence">
        Je termine ma journée
      </button>
    </div>
  </div>
</template>

<script>
import Axios from "axios";
import Store from "@/store";

export default {
  name: "Presence",
  data() {
    return {
      presence: false,
    }
  },
  mounted() {
    if (Store.state.token==null || Store.state.user.role < 2) {
      console.error("Action impossible, permissions insufisante.");
      document.title = "Accueil";
      this.$router.push("/");
      return;// -> Retour direct à Home
    }
    document.title = "Signer sa présence";
    Axios
        .get("http://localhost:4000/users/getDay/" + Store.state.user.userid)
        .then((response) => this.presence = response.data)
        .catch((error) => console.error(error))
  }
}
</script>

<style scoped>

</style>