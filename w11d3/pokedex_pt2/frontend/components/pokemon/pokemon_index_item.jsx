import React from 'react';
import {Link} from 'react-router-dom'

const PokemonIndexItem = ({poke}) =>{
    return(
        <li>
            <Link to={`/pokemon/${poke.id}`}>
                <h1>{poke.id}</h1>
                <h1>{poke.name}</h1>
                <img src={poke.imageUrl}/>
            </Link>
        </li>
    )
}

export default PokemonIndexItem;