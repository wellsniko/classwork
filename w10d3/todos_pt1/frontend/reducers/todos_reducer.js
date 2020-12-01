import {RECEIVE_TODOS, RECEIVE_TODO} from '../actions/todos_action'

const initialState = {
    1: {
      id: 1,
      title: "wash car",
      body: "with soap",
      done: false
    },
    2: {
      id: 2,
      title: "wash dog",
      body: "with shampoo",
      done: true
    }
  };

//   [{ id: 4, title: 'drink' }, { id: 5, title: 'party' }]

const todosReducer = (state = initialState, action) => {
    Object.freeze(state);
    let nextState = Object.assign({}, state);
    
    switch (action.type) {
        case RECEIVE_TODOS:
            let newTodos = {};
            action.todos.forEach(todo => {
                newTodos[todo.id] = todo
            });
            return newTodos; 
        case RECEIVE_TODO:
            nextState[action.todo.id] = action.todo
            return nextState; 
        default:
            return state;
    }
};

export default todosReducer;


// const teasReducer = (currentState = {}, action) => {
//     // helps prevent us from accidently mutating currentState
//     Object.freeze(currentState);

//     // this does not mutate original state, nextState has new objectId
//     let nextState = Object.assign({}, currentState); // creates shallow copy of currentState
//     // let nextState = {...currentState}; fancy

//     switch (action.type) {
//         case RECEIVE_TEA:
//             // this only mutates nextState
//             nextState[action.tea.id] = action.tea; // adds a key of whatever action.tea.id is
//             return nextState;
//         default:
//             return currentState;
//     }
// }
// http://127.0.0.1:5502/index.html