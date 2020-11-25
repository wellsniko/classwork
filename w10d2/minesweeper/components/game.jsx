import React from 'react';
import Board from './board';
import * as Minesweeper from './minesweeper.js';

const bombs = () => 10 + Math.floor(Math.random() * 10);

export default class Game extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            board: new Minesweeper.Board(9, bombs())
        };
        this.updateGame = this.updateGame.bind(this);
        this.restartGame = this.restartGame.bind(this);
    }

    updateGame(tile, flagged) {
        if (flagged) {
            tile.toggleFlag();
        } else {
            tile.explore()
        }

        this.setState({board: this.state.board})
    }

    restartGame() {
        this.setState({board: new Minesweeper.Board(9, bombs())})
    }

    render() {
        let modal;
    //     <section id="modal" class="modal is-active">
    //     <article class="modal-content">
    //       <span class="modal-close js-hide-modal">&times;</span>
    
    //       <h1>Hello, Modal!</h1>
    
    //       <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    
    //     </article>
    //     <div class="modal-screen js-hide-modal"></div>
    //   </section>
    
        if (this.state.board.lost() || this.state.board.won()){
            // if (this.state.board.lost()) {
            //     this.state.board.showAll();
            // }
            let text = this.state.board.lost() 
                ? ( this.state.board.showAll(), "You lost!") : "You won!";
            modal = <div className="modal-screen">
                        <div className="modal-content">{text} <br/> <br/>
                            <button onClick={this.restartGame}>Play Again!</button>
                        </div>
                    </div>      
        }
        

        return (
            <>
                <h1> Our Minesweeper</h1>
                <Board 
                    board={this.state.board}
                    updateGame={this.updateGame} 
                />
                {modal}
            </> 
           
        );
    }
}