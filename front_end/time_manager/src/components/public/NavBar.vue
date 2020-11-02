<template>
  <nav>
    <ul class="nav-links">
      <li v-for="list in navLinks" :key="list.key">
        <a v-if="list.dropdown === false" :href="list.link">{{ list.name }}</a>
        <div class="dropdown-link" v-else>
          <a :href="list.link">
            {{ list.name }}
            <span>&#x2193;</span>
          </a>
        </div>
      </li>
    </ul>
  </nav>
</template>

<script>
export default {
  name: 'NavBar',
  props: ['name', 'navLinks'],
}
</script>

<style scoped>
nav {
  display: flex;
  justify-content: space-around;
  align-items: center;
  background-color: #fe8888;
  min-height: 8vh;
  font-family: 'Montserrat', sans-serif;
}
ul.nav-links {
  display: flex;
  justify-content: space-between;
  width: 40%;
  line-height: 75px;
}
ul.nav-links li {
  list-style: none;
}
ul.nav-links a {
  text-decoration: none;
  color: #fefefe;
  font-size: 1.2rem;
  font-weight: 500;
  display: block;
}
</style>