<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
import Store from "@/store"

export default {
  name: "App",
  Store,
  /*
  data() {
    return {
      getUser: store.state.user,
      getToken: store.state.token,
    }
  }*/
  beforeMount() {
    //Init d'un user fake
    Store.state.user = {
      user_id: 1,
      username: "Arthur",
      role: 3,
      team: {
        team_id: 1,
        team_name: "Team-1"
      },
      managed: null,
    };
    Store.state.token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJKb2tlbiIsImV4cCI6MTYwNDYxOTgzOSwiaWF0IjoxNjA0NjEyNjM5LCJpc3MiOiJKb2tlbiIsImp0aSI6IjJwMmJsY2RqZHF2dWVlYWlyMDAwMDBhMiIsIm5iZiI6MTYwNDYxMjYzOX0.G4s_IbavsC95-WlILv3zvWqRL67yBsC8cdFjAxhzTTY";
  }
}
</script>

<style>
html, body {
  height: 95%;
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}
</style>
