import React from 'react';
import ReactDOM from 'react-dom';
import {receiveAllPokemon, requestAllPokemon} from './actions/pokemon_actions'
import {fetchAllPokemon} from './util/api_util'
import configureStore from './store/store'


document.addEventListener('DOMContentLoaded', () => {  
    const store = configureStore();
    //test
    window.store = store;
    window.getState = store.getState;
    window.dispatch = store.dispatch;
    window.requestAllPokemon = requestAllPokemon;
    window.receiveAllPokemon = receiveAllPokemon;
    window.fetchAllPokemon = fetchAllPokemon;
    const rootEl = document.getElementById('root');
    ReactDOM.render(<h1>Pokedex</h1>, rootEl);
});



// getState(); // should return initial app state

// const getSuccess = pokemon => dispatch(receiveAllPokemon(pokemon));
// fetchAllPokemon().then(getSuccess);

// getState(); // should return the app state populated with pokemon