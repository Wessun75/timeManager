<template>
  <div id="UserEdit">
    <v-form
        ref="form"
        v-model="valid"
        lazy-validation
    >
      <v-text-field
          v-model="name"
          :counter="16"
          :rules="nameRules"
          label="Name"
          required
      ></v-text-field>

      <v-text-field
          v-model="password"
          label="Votre MDP"
          required
      ></v-text-field>
      <div class="buttons">
        <v-btn
            :disabled="!valid"
            class="mr-4 success"
            @click="validate"
        >Valider</v-btn>
        <v-btn
            class="mr-4 error"
            @click="reset"
        >Reset des champs</v-btn>
        <v-btn
            class="mr-4 cancel"
            @click="cancel"
        >Cancel</v-btn>
      </div>
    </v-form>
  </div>
</template>

<script>
import Store from "@/store"
import Axios from "axios";

export default {
  name: "EditProfil",
  computed: {
    user: {
      get() {
        return Store.state.user;
      }
    }
  },
  data: () => ({
    valid: true,
    name: '',
    password: '',
    nameRules: [
      v => !!v || 'Name is required',
      v => (v && v.length <= 10) || 'Name must be less than 10 characters',
    ],

  }),
  methods: {
    updateuser () {
      console.log("validation")
      Axios.put(
          "http://localhost:4000/edit/" + this.user.userid,
          {
            params:
                {
                  token: this.token
                }
          })
          .then(() => {
                // Mise à jour de l'user
                //this.$forceUpdate();
              }
          )
          .catch(error => {
                console.log(error)
                /*Erreur ici*/
              }
          );

    },
    validate () {
      this.$refs.form.validate()
    },
    reset () {
      this.$refs.form.reset()
    },
    cancel () {
      this.$router.push("/profil")
    }
  }
}
</script>

<style scoped>

.buttons {
  padding-left: 5px;
}

.success {
  background-color: #4caf50 !important;
  border-color: #4caf50 !important;
}

.error {
  background-color: #ff5252 !important;
  border-color: #ff5252 !important;
}

.cancel {
  background-color: #fb8c00 !important;
  border-color: #fb8c00 !important;
  color: white;
}

#UserEdit {
  position: relative;
  left: 30%;
  width: 40%;
  text-align: center;
}

</style>