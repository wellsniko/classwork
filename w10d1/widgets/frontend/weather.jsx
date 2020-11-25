import React from 'react';

export default class Weather extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            weather: 0
        }
        // this.pollWeather = this.pollWeather.bind(this);
    }

    componentDidMount() {
        // this.location = navigator.geolocation.getCurrentPosition()
        // this.getWeather(this.location);
        // this.location = Geolocation.getCurrentPosition(this)
        // console.log(this.location)
        // this.pollWeather(this.location)
        this.pollWeather = this.pollWeather.bind(this);
        console.log(this.poll)
    }

    pollWeather(location){
    
    let uri = `api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=ec6bdb291666e651669c60894a240c75`
    // url += toQueryString(params);
    const apiKey = 'f816d7f39052e3a98b21952097a43076';
        



    }

    render() {
        return(
        <h2>hi</h2>
        )
    }
}


// fetchJobListings() {
//     return $.ajax({
//       url: `https://79vzv34gc4.execute-api.us-west-1.amazonaws.com/default/jobListings?location=${this.state.city}`,
//       method: "GET",
//     }).then((res) => this.setState({listings: res}));
//   }