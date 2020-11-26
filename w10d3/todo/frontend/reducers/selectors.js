
export const allTodos = (state) => {

    return Object.keys(state.todos).map(id => state.todos[id]); // an array of keys 

}

// const initialState = {
//     1: {
//       id: 1,
//       title: "wash car",
//       body: "with soap",
//       done: false
//     },
//     2: {
//       id: 2,
//       title: "wash dog",
//       body: "with shampoo",
//       done: true
//     }
//   };


// export const selectAllTeas = (state) => {
//     return Object.values(state.teas); // 
// }