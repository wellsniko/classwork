import React from 'react';
import ReactDOM from 'react-dom';
import {receiveAllPokemon, requestAllPokemon, receiveSinglePokemon, requestSinglePokemon} from './actions/pokemon_actions'
import {fetchAllPokemon} from './util/api_util'
import configureStore from './store/store'
import {selectAllPokemon } from './reducers/selectors'
import Root from './components/root'


document.addEventListener('DOMContentLoaded', () => {  
    const store = configureStore();
    //test
    window.requestSinglePokemon = requestSinglePokemon;
    window.selectAllPokemon  = selectAllPokemon ;
    window.receiveSinglePokemon = receiveSinglePokemon
    window.store = store;
    window.getState = store.getState;
    window.dispatch = store.dispatch;
    window.requestAllPokemon = requestAllPokemon;
    window.receiveAllPokemon = receiveAllPokemon;
    window.fetchAllPokemon = fetchAllPokemon;
    //end

    const rootEl = document.getElementById('root');
    ReactDOM.render(<Root store={store}/>, rootEl);
});

