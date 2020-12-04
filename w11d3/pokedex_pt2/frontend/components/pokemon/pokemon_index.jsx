import React from 'react';
import PokemonIndexItem from './pokemon_index_item'

class PokemonIndex extends React.Component {
    constructor(props) {
        super(props);
    }

    componentDidMount(){
        this.props.requestAllPokemon()
    }

    render() { 
 

        return (  
            <div>
                <section className="pokedex">
                <ul>
                {this.props.pokemon.map(poke => (
                    <PokemonIndexItem poke={poke} key={poke.id}/>
                ))}
                </ul>
                </section>
            </div>
        );
    }
}
export default PokemonIndex;

