import React from 'react';

import TodoListItem from './todo_list_item';

class TodoList extends React.Component {

  render() {
    const { todos, receiveTodo } = this.props;
    const todoItems = todos.map((todo,idx) => (
        <TodoListItem
            key={idx}
            todo={todo}
            receiveTodo={receiveTodo}/>

      )
    );

    return(
      <div>
        <ul className="todo-list">
          { todoItems }

        </ul>

      </div>
    );
  }
}

export default TodoList;
