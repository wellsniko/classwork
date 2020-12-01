
import TodoList from './todo_list';
import { connect } from 'react-redux'
import { allTodos } from '../../reducers/selectors';
import { receiveTodos, receiveTodo } from '../../actions/todos_action';

const mapStateToProps = state =>({
    todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
    receiveTodo: todo => dispatch(receiveTodo(todo))
})

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);


