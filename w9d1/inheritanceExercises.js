


function MovingObject(velocity) { 

        this.velocity = velocity;
    };


function Ship() { 
    
}

Ship.inherits(MovingObject);

function Asteroid() { 

}

Asteroid.inherits(MovingObject);
//correct #1
//Surrogate pattern
Function.prototype.inherits = function(SuperClass) {
    function Surrogate() {}
    Surrogate.prototype = SuperClass.prototype;
    this.prototype = new Surrogate()
    this.prototype.constructor = this;
}

inherits(Rectangle, Shape)
inherits(Circle, Shape)


//Correct #2
//Object.create
// Rectangle.prototype = Object.create(Shape.prototype)
// Rectangle.prototype.constructor = Rectangle;

// Circle.prototype = Object.create(Shape.prototype)
// Circle.prototype.constructor = Circle;