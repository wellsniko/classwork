import React from 'react';

export default class Clock extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            time: new Date()
        };
       
    };

    tick() {
        this.setState(
            {time: new Date()}
        );
    };

    componentDidMount() {
       this.intervalId = setInterval(this.tick.bind(this), 1000);
       
    };

    componentWillUnmount(){
        clearInterval(this.intervalId);
    };

    render() {
        
        
        return (
        <h1>{this.state.time.getHours()}:{this.state.time.getMinutes()}:{this.state.time.getSeconds()}</h1>
        )
    };
}

