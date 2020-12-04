import {RECEIVE_SINGLE_POKEMON} from '../actions/pokemon_actions'


const movesReducer = (state = {}, action) => {
    Object.freeze(state);
    const nextState = Object.assign({}, state);
    switch (action.type) {
        case RECEIVE_SINGLE_POKEMON:
            nextState = action.pokemon.moves;
            return nextState;
        default:
            return state;
    }
}

export default movesReducer;