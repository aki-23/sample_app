$("turbolinks:load", function(){
  $(function(){
    const canvas = document.getElementById("canvas");
    const ctx = canvas.getContext("2d");
    const animFrame = window.requestAnimationFrame ||
                    window.mozRequestAnimationFrame ||
                    window.webkitRequestAnimationFrame ||
                    window.msRequestAnimationFrame;
    const cancFrame = window.cancelAnimationFrame ||
                    window.mozcancelAnimationFrame ||
                    window.webkitcancelAnimationFrame ||
                    window.mscancelAnimationFrame;
    const snowflakes = [];

    let handle;
    let w = ctx.canvas.width = window.innerWidth;
    let h = ctx.canvas.height = window.innerHeight;

    function random(min, max) {
      let rand = Math.floor((min + (max - min + 1) * Math.random()));
      return rand;
    }

    function Snow() {
      this.x = random(0, w);
      this.y = random(-h, 0);
      this.radius = random(0.5, 3.0);
      this.speed = random(2, 3);
      this.wind = random(-0.5, 3.0);
    }

    Snow.prototype.draw = function() {
      ctx.beginPath();
      ctx.arc(this.x, this.y, this.radius, 0, 2*Math.PI);
      ctx.fillStyle = "#fff";
      ctx.fill();
      ctx.closePath();
    }

    Snow.prototype.update = function() {
      this.x += this.wind;
      this.y += this.speed;

      if (this.y > h) {
        this.x = random(0, w);
        this.y = 0;
      }
    }

    function createSnow(count) {
      for (let i = 0; i < count; i++) {
        snowflakes[i] = new Snow();
      }
    }

    function draw() {
      ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
      for (let i = 0; i < snowflakes.length; i++) {
        snowflakes[i].draw();
      }
    }

    function update() {
      for (let i = 0; i < snowflakes.length; i++) {
        snowflakes[i].update();
      }
    }

    function loop() {
      draw();
      update();
      handle = animFrame(loop);
    }

    createSnow(100);
    loop();

  });
});