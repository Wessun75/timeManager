<template>
  <div v-bind:class="{'topnav': !dropdown, 'topnav responsive': dropdown}" id="NavBar">
    <router-link v-for="list in NavBarList" v-bind:key="list.id" :to=list.url>{{ list.name }}</router-link>
    <a class="icon" @click="dropdown = !dropdown">
      <i class="fa fa-bars"></i>
    </a>
  </div>
</template>

<script>
import Store from '@/store'

let bar = null;
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
  name: 'NavBar',
  computed: {
    NavBarList: {
      get() {
        return bar
      }
    }
  },
  data() {
    return {
      dropdown: false
    }
  },
  created() {
    bar = [
      {
        id: 1,
        name: "Votre profil",
        url: "profil"
      },
      {
        id: 2,
        name: "Présence",
        url: ""
      },
      {
        id: 3,
        name: "Vos récapitulatifs",
        url: ""
      }
    ]
    if (Store.state.user.manage_id) {
      bar.push({
        id: 5,
        name: "Équipe",
        url: "equipe"
      });
      bar.sort(compare)
    }
  }
}
</script>

<style scoped>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: darkcyan;
}

.topnav .icon {
  display: none;
}

@media screen and (max-width: 600px) {
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 600px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}
</style>