class Clock {
  constructor() {
    // 1. Create a Date object.
    let date = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.hours = new Date().getHours();
    this.minutes = new Date().getMinutes();
    this.seconds = new Date().getSeconds();
    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.
    setInterval(this._tick.bind(this),1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    let formatted = `${this.hours}:${this.minutes}:${this.seconds}`;
    // Use console.log to print it.
    console.log(formatted);m  
  }

  _tick() {
    // 1. Increment the time by one second.
    this.seconds += 1;
    // 2. Call printTime.
    this.printTime();
  }
}

const clock = new Clock();