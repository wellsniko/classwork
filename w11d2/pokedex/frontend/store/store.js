import {createStore, applyMiddleware} from 'redux';
import rootReducer from '../reducers/root_reducer'
import logger from 'redux-logger'
import thunk from '../middleware/thunk';

const configureStore = (preloadedState = {}) => (
  createStore(
    rootReducer,
    preloadedState,
    applyMiddleware(thunk, logger)
  )
);

// const configureStore = (preloadedState={}) => {
//     return createStore(rootReducer, preloadedState, applyMiddleware(logger));
// }


export default configureStore