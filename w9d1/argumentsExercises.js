
function firstSum(){
    let total = 0;
    for (let i = 0; i < arguments.length; i++) {
        total += arguments[i];
    }
    return total;
}


function otherSum(...args) {
    let total = 0;
    for (let i = 0; i < args.length; i++) {
        total += args[i];
    }
    return total;
 }
    
// console.log(otherSum(1, 2, 3, 4))





Function.prototype.myBind = function(ctx, ...args) {
    const that = this;
    return function (...callArgs) {
        return that.apply(ctx, args.concat(callArgs));
    };
};

let newFunc = function sayHello(phrase) {

}


//ES6
Function.prototype.myBind2 = function (ctx, ...bindArgs) {
    return (...callArgs) => this.apply(ctx, bindArgs.concat(callArgs));
};


// function curriedSum(numArgs) {
//     let nums = [];

//     function _curriedSum(num) {
//         nums.push(num);

//         let currentSum = arguments.reduce((acc, el) =>
//             acc + el);
//         return _curriedSum;
//     }
// }

function curriedSum(numArgs) {
    const numbers = [];

    function _curriedSum(num) {
        numbers.push(num);

        if (numbers.length === numArgs) {
            let total = 0;

            numbers.forEach((n) => { total += n; });

            return total;
        } else {
            return _curriedSum;
        }
    }

    return _curriedSum;
}
const sum = curriedSum(5);
sum(5)(30)(20);// => 56
sum(4);
console.log(sum(41));

const sum2 = curriedSum(5)
sum2(5)(30)(20) // => 56
sum2(5)
console.log(sum2(41))

function combineString() {
    let result = "";
    for (let i = 0; i < arguments.length; i++) {
        result += arguments[i];
    }
    return result;
}


Function.prototype.curry = function(numArgs) {
    const args = [];
    const fn = this
        function _curriedFn(arg) {
            args.push(arg);
            if (args.length === numArgs) {
                return fn(...args);
            
            } else {
                return _curriedFn
            }
        }
                    

return _curriedFn

}  

function sumThree(num1, num2, num3) {
    return num1 + num2 + num3;
}

// sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!
// let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30

// or more briefly:
console.log(firstSum.curry(2)(4)(20)); // == 30

let niko = combineString.curry(3)("I ")("am ")
console.log(niko("Niko"))