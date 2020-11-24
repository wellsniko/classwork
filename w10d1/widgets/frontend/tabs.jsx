import React from 'react';




export default class Tabs extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            selectedIdx: 0
        }
        // this.selectedTab = this.selectedTab.bind(this)
    }

    selectedTab(idx){
        this.setState({selectedIdx: idx});
    }

    render() {
        return (
            <div>
                <ul>
                    {this.props.panes.map((pane, i)=>(
                        <button key={i} onClick={() => this.selectedTab(i)}>{pane.title}</button>
                    ))}
                </ul>
                <h2> 
                    {this.props.panes[this.state.selectedIdx].content}
                </h2>
            </div>
        )
    }
}

{/* 
<button onClick={() => this.setLocation('San Francisco')}>San Francisco</button>
<button onClick={this.setLocation2('Los Angeles')}>Los Angeles</button>
<button onClick={this.setLocation3.bind(this)}>New York</button>
*/}