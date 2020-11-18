const MovingObject = require("./moving_object")



document.addEventListener("DOMContentLoaded", function () {

    const canvasEl = document.getElementById("game-canvas");
    const ctx = canvasEl.getContext('2d');
    window.MovingObject = MovingObject;
    window.ctx = ctx
    // canvasEl.height = window.innerHeight;
    // canvasEl.width = window.innerWidth;
});
