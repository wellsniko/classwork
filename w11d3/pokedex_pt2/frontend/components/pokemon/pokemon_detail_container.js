import {connect} from 'react-redux';
import {requestSinglePokemon} from '../../actions/pokemon_actions'
import PokemonDetail from './pokemon_detail'


const mapStateToProps = state => ({
  pokemon: selectAllPokemon(state)
});

const mapDispatchToProps = dispatch => ({
  requestAllPokemon: () => dispatch(requestAllPokemon())// dispatch requestAllPokemon action.
});




export default connect(mapStateToProps, mapDispatchToProps)(PokemonIndex);