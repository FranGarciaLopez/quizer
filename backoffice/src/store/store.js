import Vuex from 'vuex';
import axios from 'axios';


const getDefaultState = () => {
    return {
      user: null,
    };
};

export default new Vuex.Store({

    state: getDefaultState(),
    mutations: {
        
        SET_USER_DATA (state, userData) {
            state.user = userData
            localStorage.setItem('user', JSON.stringify(userData))
            axios.defaults.headers.common['Authorization'] = `Bearer ${userData.AccessToken}`
        },
        CLEAR_USER_DATA(){
            localStorage.removeItem('user')
            location.reload()
        }
    },
    actions: {
        async login ({ commit }, credentials) {
            const { data } = await axios.post('http://127.0.0.1:3000/login', credentials);
            commit('SET_USER_DATA', data);
        },
        logout ({ commit }) {
            commit('CLEAR_USER_DATA');
        },
        setUser ({ commit }, user) {
            commit('SET_USER_DATA', user);
        },
        
    },
    getters:{
        loggedIn(state){
            return !!state.user
        }
    }
});
  