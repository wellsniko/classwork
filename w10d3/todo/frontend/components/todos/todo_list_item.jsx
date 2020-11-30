import React from 'react';


class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {props};
    

  }


  render() {
    const { todo , receiveTodo } = this.props;
    const { title} = todo;
 
    return (
      <li className="todo-list-item">
        <div>
          <h3>{ title }</h3>
        </div>
      </li>
    );
  }
}

export default TodoListItem;
