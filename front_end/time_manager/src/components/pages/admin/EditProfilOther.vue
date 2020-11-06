<template>
  <div id="AdminEdit" data-app>
    <h1>Édition d'un utilisateur</h1>
    <br/>
    <br/>
    <v-autocomplete
        v-model="selected"
        :items="userlist"
        item-text="username"
        item-value="id"
        clearable
        dense
        filled
        rounded
        solo
        return-object
        hide-details
        label="Sélectioner un utilisateur"
    ></v-autocomplete>
    <div id="UserEdit" v-if="selected!=null && !(selected==='no user found')">
      <br/>
      <br/>
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
        ></v-text-field>
        <v-text-field
            v-model="password"
            :rules="passwordRules"
            label="Changer password"
        ></v-text-field>
        <v-text-field
            v-model="password"
            :rules="passwordRules"
            label="Id de l'équipe"
        ></v-text-field>
        <v-text-field
            v-model="role"
            :rules="roleRules"
            label="Niveau de permission"
        ></v-text-field>
        <v-text-field
            v-model="password"
            :rules="passwordRules"
            label="Équipes gérées"
        ></v-text-field>
        <br/>
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
  </div>
</template>

<script>
import Axios from "axios";
import Store from "@/store";

//  From : https://stackoverflow.com/questions/1129216/sort-array-of-objects-by-string-property-value
function compare( a, b ) {
  if ( a.id < b.id ){
    return -1;
  }
  if ( a.id > b.id ){
    return 1;
  }
  return 0;
}

export default {
  name: "EditProfilOther",
  data: () => ({
    userlist: ["no user found"],
    selected: null,
    valid: true,
    username: null,
    password: null,
    role: null,
    nameRules: [
      v => !!v || 'Username nécéssaire',
      v => (v && v.length <= 16) || 'Le Username doit faire maximum 16 chars',
    ],
    passwordRules: [
      v => !!v || 'Password nécéssaire'
    ],
    roleRules: [
      v => (v && v>0 && v<4) || '1 = User, 2 = Manager, 3 = Général Manager'
    ]
  }),
  methods: {
    validate () {
      this.$refs.form.validate()
      if (this.username.length>0 && this.username.length<=16 && this.password.length>0) {
        Axios
            .put("http://localhost:4000/api/users/" + this.user.user_id,
                {
                  params: {
                    username: this.username,
                    password: this.password
                  }
                },{
                  headers: {
                    'Authorization': Store.state.token
                  }
                },
            )
            .then((response) => {
              Store.state.user.username = response.data.data.username
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
  },
  created() {
    Axios
        .get("http://localhost:4000/api/users",
            {
              headers: {
                'Authorization': Store.state.token
              }
            })
        .then(response => {
          this.userlist = response.data.data
          this.userlist.sort(compare)
        })
        .catch(error => console.log(error))
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

#AdminEdit {
  position: relative;
  justify-content: center;
  left: 30%;
  width: 40%;
}

</style>