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
        async signIn( {commit} ,user_info){
            let res = await axios.post('http://localhost:4000/api/users/sign_in', user_info)

            commit('SET_TOKEN',res.data)
            console.log(res.data.token)
            commit('SET_USER',user_info)
        },
        async signUp( {commit} ,user_info){
            let res = await axios.post('http://localhost:4000/api/users/sign_up', user_info)

            commit('SET_TOKEN',res.data)
            commit('SET_USER',user_info)
        },
        
    }
}