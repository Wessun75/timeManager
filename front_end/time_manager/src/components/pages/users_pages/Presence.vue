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
    document.title = "Signer sa présence";
    Axios
        .get("http://localhost:4000/workingtimes/" + Store.state.user.id,
            {
              headers: {
                'Authorization': Store.state.token
              }
            })
        .then((response) => {
          this.presence = response.data
        })
        .catch((error) => console.error(error))
  }
}
</script>

<style scoped>

</style>