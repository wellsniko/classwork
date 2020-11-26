export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";

export const receiveTodos = (todos) => ({
    type: RECEIVE_TODOS,
    todos
});

export const receiveTodo = (todo) => ({
    type: RECEIVE_TODO,
    todo
});




// export const RECEIVE_TEA = "RECEIVE_TEA";

// export const receiveTea = (tea) => ({
//     type: RECEIVE_TEA,
//     tea: tea
// });n