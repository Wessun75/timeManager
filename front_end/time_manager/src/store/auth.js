import axios from 'axios'

export default {
    namespaced: true,
    state: {
        token:'',
        user:{}
    },

    getters:{/*
        authenticated(state){
            
            return state.token && state.user
        },

        user(){
            return state.user
        }*/
    },

    mutations:{
        SET_TOKEN(state,token){
            state.token = token
        },
        SET_USER(state, data){
            state.user = data
        }
    },

    actions:{
        async signIn( {dispatch} ,user_info){
            let res = await axios.post('http://localhost:4000/api/users/sign_in', user_info)

            dispatch('attempt',res.data.token)
        },
            //get the token 
        async attempt({commit, state },token){
            if(token) {
                commit('SET_TOKEN',token)
            }

            if(!state.token){
                return
            }

            //check that the user's token works
            try {
                let res = await axios.get('http://localhost:4000/api/users/sign_in',{
                    headers: 
                   { 'Authorization' : 'Bearer'+ token }
                })
                //where the response should be
                //set all of the data received from the api
                
            } catch (e) {
                commit('SET_TOKEN',null)
                commit('SET_USER',null)
            }
        }
    }
}