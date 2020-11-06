<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
import Store from "@/store"

export default {
  name: "App",
  data() {
    return {
      getUser: Store.state.user,
      getToken: Store.state.token,
    }
  },
  beforeMount() {
    //Init d'un user fake
    Store.state.user = {
      userid: 1,
      username: "Arthur",
      role: 3,
      team_id: 1,
      manage_id: [1,2]
    };
    Store.state.token = "YOLOTOKEN";
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
