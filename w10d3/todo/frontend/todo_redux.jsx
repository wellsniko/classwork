import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store'
import {receiveTodos, receiveTodo} from './actions/todos_action'
import App from './components/app'
import Root from './components/root'
import {allTodos} from './reducers/selectors'

document.addEventListener('DOMContentLoaded', ()=>{

    // const preloadedState = {
    //     todos: 'buy alcohol'
    // }

    const store = configureStore();
    window.store = store;
    window.receiveTodo = receiveTodo; 
    window.receiveTodos = receiveTodos;
    window.allTodos = allTodos; 

    const root = document.getElementById('root');
    ReactDOM.render(<Root store={store}/>, root)
});




// const newTodos = [{ id: 1, ...etc }, { id: 2, ...etc }, ...etc];
// store.getState(); // should return default state object
// store.dispatch(receiveTodo({ id: 1, title: "New Todo" }));
// store.getState(); // should include the newly added todo
// store.dispatch(receiveTodos(newTodos));
// store.getState(); // should return only the new todos

// const newTodos =[{ id: 4, title: 'drink' }, { id: 5, title: 'party' }]
// store.dispatch(receiveTodos(newTodos));