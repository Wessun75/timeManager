
Vue pour le profil Utilisateur, contient:
- Affichage du profil personnel (Username, Mail, Grade)
- Affichage du nom de l'équipe à laquelle l'user appartient (Nom équipe, liste des managers)
- Champ + bouton pour changer l'username, le mail ou le password,
il faut taper le password actuel pour valider le changement

<template>
  <div id="Profil">
    <h1>Votre profil</h1>
    <div id="ProfilLockForm">
      <br>
      <br>
      <label class="form__label">Username</label>
      <label>
        <input disabled class="form__input" v-bind:value="user.username"/>
      </label>
      <br>
      <br>
      <label class="form__label">Niveau de permission</label>
      <label>
        <input disabled class="form__input" v-bind:value="userrank"/>
      </label>
      <br>
      <br>
      <div id="UserTeam" v-if="user.team!=null">
        <label class="form__label">Vous appartenez à l'équipe</label>
        <label>
          <input disabled class="form__input" v-bind:value="user.team.team_name"/>
        </label>
      </div>
      <br>
      <div id="ManagedTeams" v-if="user.manage_id!=null && user.manage_id.length>0">
        <label class="form__label">Vous êtes le manager de {{user.manage_id.length}} équipe<a v-if="user.manage_id.length>1">s</a></label>
      </div>
      <br>
      <br>
      <br>
      <div id="EditProfilButton">
        <router-link :to="'/editprofil'" type="button">Modifier vos infos</router-link>
      </div>
    </div>
  </div>
</template>

<script>
import Store from "@/store"

export default {
  name: "Profil",
  computed: {
    user: {
      get() {
        return Store.state.user;
      }
    },
    userrank: {
      get() {
        switch (Store.state.user.role) {
          case 1: {
            return "Utilisateur"
          }
          case 2: {
            return "Manager"
          }
          case 3: {
            return "Général Manager"
          }
          default: {
            return "Erreur"
          }
        }
      }
    },
    token: {
      get() {
        return Store.state.token;
      }
    }
  },
  created() {
    // Si user null, retour à l'accueil cette page n'est dispo que si User log !
    document.title = "Profil de " + Store.state.user.username;
  }
}
</script>

<style scoped>

#ProfilLockForm {
  position: relative;
  left: 30%;
  width: 40%;
  text-align: center;
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
  text-align: center;
}

</style>