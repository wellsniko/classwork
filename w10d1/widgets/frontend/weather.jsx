import React from 'react';

export default class Weather extends React.Component {
    constructor(props){
        super(props);
        this.state = {
        }
    
    }

    componentDidMount() {
        this.location = navigator.geolocation.getCurrentPosition()
        this.getWeather(this.location);
    }

    getWeather(location){
        let uri = []//http://.......
    }

    // render() {
    //     <h2>{this.props.location}</h2>
        
    // }
}


// fetchJobListings() {
//     return $.ajax({
//       url: `https://79vzv34gc4.execute-api.us-west-1.amazonaws.com/default/jobListings?location=${this.state.city}`,
//       method: "GET",
//     }).then((res) => this.setState({listings: res}));
//   }