
Page manager, pour afficher:
- La liste des utilisateurs de l'équipe
- La liste des managers de l'équipe
- Bouton pour ajouter un utilisateur à l'équipe

<template>
  <div id="Team">
    Team
    <div v-if="teams!=null">
      <ul>
        <li v-for="team in teams" :key="team.teamid">
          {{team.manage_id}}
        </li>
      </ul>
    </div>
    <div v-else>
      Vous n'avez aucune équipe.
    </div>
    <br/>
    <br/>
    <div class="addteam">
      <button type="button" class="v-btn v-btn--contained theme--light v-size--default custom-color" @click="addTeamArea = !addTeamArea">Créer une équipe</button>
    </div>
    <div class="createteam" v-if="addTeamArea">
      <br/>
      <br/>
      <form @submit.prevent="submit">
        <div class="form-group" :class="{ 'form-group--error': $v.newteamname.$error }">
          <label class="form__label">Nom de l'équipe</label>
          <label>
            <input class="form__input" v-model.trim="$v.newteamname.$model"/>
          </label>
        </div>
        <div class="error" v-if="!$v.newteamname.required">Nom d'équipe à remplir</div>
        <div class="error" v-if="!$v.newteamname.minLength">Merci de mettre au moins {{$v.newteamname.$params.minLength.min}} lettres.</div>
        <button class="button" type="submit" :disabled="submitStatus === 'PENDING'">Ajouter</button>
        <p class="typo__p" v-if="submitStatus === 'OK'">Équipe crée!</p>
        <p class="typo__p" v-if="submitStatus === 'ERROR'">Champ trop court.</p>
        <p class="typo__p" v-if="submitStatus === 'PENDING'">Envoi...</p>
        <p class="typo__p" v-if="submitStatus === 'CATCH'">Erreur base de donnée.</p>
      </form>
    </div>
  </div>
</template>

<script>
import Axios from "axios";
import Store from "@/store"
import { required, minLength } from 'vuelidate/lib/validators'

export default {
  name: "Team",
  data() {
    return {
      addTeamArea: false,
      teams: null,
      newteamname: '',
      submitStatus: null,
    }
  },
  validations: {
    newteamname: {
      required,
      minLength: minLength(4)
    }
  },
  methods: {
    submit() {
      console.log("Submit équipe: " + this.newteamname)
      this.$v.$touch()
      if (this.$v.$invalid) {
        this.submitStatus = 'ERROR'
      } else {
        this.submitStatus = 'PENDING'
        Axios
            .post("http://localhost:4000/createTeam",
                {
                  params:
                      {
                        token: Store.state.token,
                        team_name: this.newteamname
                      }
                }
            )
            .then((response) => {
                  Store.state.user.manage_id.push(response.data.teamid)
                  this.submitStatus = 'OK'
                }
            )
            .catch((error) => {
                  console.error(error)
                  this.submitStatus = 'CATCH'
                }
            )
      }
    }
  },
  mounted() {
    // Si user null ou pas level 2+, retour à l'accueil
    if (Store.state.token==null || Store.state.user.role < 2) {
      console.error("Action impossible, permissions insufisante.");
      document.title = "Accueil";
      this.$router.push("/");
      return;// -> Retour direct à Home
    }
    document.title = "Équipes de " + Store.state.user.username;
    /*
    Axios.get(`http://localhost:4000/viewManaged/${Store.state.user.userid}`,
        { params:
              {
                token: Store.state.token
              }
        })
        .then((response) => {
          this.teams = response.data
        })
        .catch(error => {
          console.error(error);
        })
     */
  }
}
</script>

<style scoped>

.addteam button {
  color: white !important;
  background-color: lightseagreen !important;
}

.createteam {
  box-sizing: border-box;
  display: inline-block;
  position: relative;
  width: 30%;
  padding: 0 20px;
}

.createteam button {
  font-size: 1rem;
  color: #fff;
  line-height: 1.4;
  padding: 1% 6% 1%;
  box-sizing: border-box;
  position: relative;
  display: inline-block;
  background: lightseagreen;
  border: none;
  border-radius: 5px;
  z-index: 1;
  overflow: hidden;
  outline: none;
  vertical-align: middle;
  transition: 0.1s background ease, 0.1s border-color ease, 0.1s color ease;
  border-bottom: 3px solid darkcyan;
  text-decoration: none;
  text-transform: uppercase;
}

.form__input {
  font-family: "Lato", sans-serif;
  font-size: 1rem;
  font-weight: 300;
  color: #374853;
  line-height: 2rem;
  min-height: 2rem;
  position: relative;
  border: 1px solid #E8E8E8;
  border-radius: 5px;
  background: #fff;
  padding: 0 1rem;
  width: 100%;
  transition: border .1s ease;
  box-sizing: border-box;
}

</style>