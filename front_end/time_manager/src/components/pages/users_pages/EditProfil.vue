<template>
  <div id="UserEdit">
    <v-form
        ref="form"
        v-model="valid"
        lazy-validation
    >
      <v-text-field
          v-model="username"
          :counter="16"
          :rules="nameRules"
          label="Username"
          required
      ></v-text-field>
      <v-text-field
          v-model="password"
          :rules="passwordRules"
          label="Nouveau password"
          required
      ></v-text-field>
      <div id="buttons">
        <v-btn
            :disabled="!valid"
            class="buttons mr-4 success"
            @click="validate"
        >Valider</v-btn>
        <v-btn
            class="buttons mr-4 error"
            @click="reset"
        >Reset</v-btn>
        <v-btn
            class="buttons mr-4 cancel"
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
    username: null,
    password: null,
    nameRules: [
      v => !!v || 'Username nécéssaire',
      v => (v && v.length <= 16) || 'Le Username doit faire maximum 16 chars',
    ],
    passwordRules: [
      v => !!v || 'Password nécéssaire'
    ],
  }),
  methods: {
    validate () {
      this.$refs.form.validate()
      if (this.name.length>0 && this.name.length<=16 && this.password.length>0) {
        Axios
            .put("http://localhost:4000/edit/" + this.user.userid,
                {
                  header: {
                    Authorization: Store.state.token
                  },
                  body: {
                    user: {
                      username: this.username,
                      password: this.password
                    }
                  }
                },
            )
            .then((response) => {
              Store.state.user = response.data
              this.$router.push("/profil")
            })
            .catch((error) => console.error(error))
      }
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
  margin: 0 5px 5px;
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
  color: white !important;
}

#UserEdit {
  position: relative;
  left: 30%;
  width: 40%;
  text-align: center;
}

</style>