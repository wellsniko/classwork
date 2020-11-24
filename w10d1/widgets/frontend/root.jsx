import React from 'react';
import Clock from './clock';
import Tabs from './tabs';
import Weather from './weather';

export default class Root extends React.Component {
    constructor(props){
        super(props);
        
    }


    
    render() {
        const tabViews = [
            {title: 'one', content: 'I am the first'},
            {title: 'two', content: 'I am the second'},
            {title: 'three', content: 'I am the third'}
        ];

        return (
            <div>
                <div>
                    <Clock/>
                </div>
                <div>
                    <Tabs panes={tabViews}/>
                </div>
                {/* <div>
                    <Weather/>
                </div> */}
            </div>
        )
    }
}



