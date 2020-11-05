<template>
  <v-app>
    <v-container class="fill-height" fluid>
      <v-row align="center" justify="center">
        <v-col cols="12" sm="8" md="8"></v-col>
        <v-card class="elevation-12">
          <v-window v-model="step">
            <v-window-item :value="1">
              <v-row>
                <v-col cols ="12" md="8">
                  <v-card-text class="mt-12">
                    <h1 class="text-center display-2 cyan--text text--darken-2">Sign in to TimeShare</h1>
                    <h4 class="text-center mlt-4"></h4>
                    <v-form>
                      <v-text-field
                          label ="Username"
                          name="Username"
                          prepend-icon="person"
                          type="text"
                          color="cyan darken-2"
                          v-model="login.username"
                      />
                      <v-text-field
                          label ="Password"
                          id="Password"
                          name="Password"
                          prepend-icon="lock"
                          color="cyan darken-2"
                          v-model="login.password"
                      />
                    </v-form>
                    <h3 class="text-center mt-3">Forgot your password ?</h3>
                  </v-card-text>
                  <div class="text-center mt-3">
                    <v-btn rounded color ="cyan darken-3" dark @click.prevent="submit()">Login</v-btn>
                  </div>
                </v-col>
                <v-col cols="12" md="4" class="cyan darken-2">
                  <v-card-text class="white--text mt-12">
                    <h1 class="text-center display-1">Hello New Users !</h1>
                    <h5 class="text-center">Register here if you do not have an account already</h5>
                  </v-card-text>
                  <div class="text-center">
                    <v-btn rounded outlined="" dark @click="reg()">Register</v-btn>
                  </div>
                </v-col>
              </v-row>
            </v-window-item>
            <v-window-item :value="2">
              <v-row class="fill-height">
                <v-col cols="12" md="4" class="cyan darken-2">
                  <v-card-text class="white--text mt-12">
                    <h1 class="text-center display-1">Welcome Back !</h1>
                    <h5 class="text-center">Login here if you already have an account</h5>
                  </v-card-text>
                  <div class="text-center">
                    <v-btn rounded outlined="" dark @click="log()" >Login</v-btn>
                  </div>
                </v-col>
                <v-col cols ="12" md="8">
                  <v-card-text class="mt-12">
                    <h1 class="text-center display-2 cyan--text text--darken-2">Create An Account</h1>
                    <h4 class="text-center mlt-4"></h4>
                    <v-form>
                      <v-text-field
                          label ="Username"
                          id="Username"
                          name="Username"
                          prepend-icon="person"
                          color="cyan darken-2"
                          v-model="register.username"
                      />
                      <v-text-field
                          label ="Password"
                          id="Password"
                          name="Password"
                          prepend-icon="lock"
                          color="cyan darken-2"
                          v-model="register.password"
                      />
                      <v-text-field
                          label ="Confirm Password"
                          id="CPassword"
                          name="CPassword"
                          prepend-icon="lock"
                          color="cyan darken-2"
                          
                      />
                    </v-form>
                  </v-card-text>
                  <div class="text-center mt-3">
                    <v-btn rounded color ="cyan darken-3" dark @click.prevent = "submitReg()">Register</v-btn>
                  </div>
                </v-col>
              </v-row>
            </v-window-item>
          </v-window>
        </v-card>
      </v-row>
    </v-container>
  </v-app>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  name: "Log",
  
  data () {
    return {
        step:1,
        login : {
            username: null,
            password: null
        },
        register : {
          username: null,
          email: null,
          password: null
        }
  }

  },
  props: {
    source: String
  },
  methods: {
    ...mapActions({
      signIn: 'auth/signIn',
      signUp: 'auth/signUp'
    }),
    submit(){
      this.signIn(this.login)
    },
    submitReg(){
      this.signUp(this.register)
    },
    reg(){
      
      this.login.username=null
      this.login.password=null
      this.step++
    },
    log(){
      this.step--;
      this.register.username=null;
      this.register.password=null;
    }
  },
  beforeMount() {
    document.title = "Login"
  }
}
</script>