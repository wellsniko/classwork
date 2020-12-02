import React from 'react';


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
                <ul>
                {this.props.pokemon.map((poke, idx) => (
                    <li key={idx}>
                        <span>{poke.name}</span>
                        <img src={poke.imageUrl}/>
                    </li>
                ))}
                </ul>
            </div>
        );
    }
}
export default PokemonIndex;

