import axios from 'axios'

export default {
    namespaced: true,
    state: {
        token:'',
        user:{}
    },

    getters:{
        authenticated(state){
            
            return state.token && state.user
        },

        user(){
            return state.user
        }
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
        async login({dispatch},user_info){
            let res = await axios.post('users', user_info)

            dispatch('attempt',res.data.token)
        },
            //get the token 
        async attempt({commit,state },token){
            if(token) {
                commit('SET_TOKEN',token)
            }

            if(!state.token){
                return
            }

            //check that the user's tikon works
            try {
                let res = await axios.get('api_token_address')
                //where the response should be
                //set all of the data received from the api
                commit('SET_USER',res.data)
            } catch (e) {
                commit('SET_TOKEN',null)
                commit('SET_USER',null)
            }
        }
    }
}