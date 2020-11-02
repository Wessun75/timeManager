import store from '@/store'
import axios from 'axios'

store.subs((mutation) => {
    //setting axios headers and localStorage
    switch(mutation.type) {
        case 'auth/SET_TOKEN':
            if(mutation.payload){
                //set the axios header to token if there was no error
                axios.defaults.headers.common['Authorization'] = `Bearer ${mutation.payload}`
            }else{//set the axios header to null because there was an error recieving
                //the token from the api
                axios.defaults.headers.common['Authorization']='null'
            }
        break;
    }
})