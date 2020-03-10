$("turbolinks:load", function(){
  $(function(){
    const canvas = document.getElementById("canvas");
    const ctx = canvas.getContext("2d"); // canvasに描画するためのAPIにアクセスするオブジェクト
    const animFrame = window.requestAnimationFrame ||
                    window.mozRequestAnimationFrame ||
                    window.webkitRequestAnimationFrame ||
                    window.msRequestAnimationFrame;

    const snowflakes = [];

    let w = ctx.canvas.width = window.innerWidth;
    let h = ctx.canvas.height = window.innerHeight;

    // random()関数はmin以上max以下の間でランダムな数値を返す
    // Math.randomはランダムな不動小数点による数を返す
    function random(min, max) {
      let rand = Math.floor((min + (max - min + 1) * Math.random()));
      return rand;
    }

    // 雪を作る関数
    function Snow() {
      this.x = random(0, w); // 雪のx座標を指定
      this.y = random(-h, 0); // 雪のy座標を指定
      this.radius = random(0.5, 3.0); // 雪の半径を指定
      this.speed = random(2, 3); // 雪が垂直（y軸）にどれくらいのスピードで移動するか指定
      this.wind = random(-0.5, 1.0); // 雪が水平（x軸）にどれくらいのスピードで移動するか指定
    }

    // 生成したSnow()コンストラクタにdrawメソッド（雪を描画）を設定
    Snow.prototype.draw = function() {
      ctx.beginPath(); // 雪の書き始めを宣言
      // 雪を描画（arcで円弧を作成）
      // arc（x座標, y座標, 半径, 円弧の開始角度, 円弧の終了角度）、Math.PIはπを取得でき、２πで一周できる
      ctx.arc(this.x, this.y, this.radius, 0, 2*Math.PI);
      ctx.fillStyle = "#fff"; // 色の指定
      ctx.fill(); // fillで塗りつぶす
      ctx.closePath();
    }

    // 生成したSnow()コンストラクタにupdateメソットを設定
    // 雪を次に描画する座標にupdateする
    Snow.prototype.update = function() {
      this.x += this.wind; // 雪を水平（x軸）に動かす
      this.y += this.speed; // 雪を垂直（y軸）に動かす

      if (this.y > h) {
        this.x = random(0, w);
        this.y = 0;
      }
    }

    // 配列snowflakesに雪を引数の数値分入れる
    function createSnow(count) {
      for (let i = 0; i < count; i++) {
        snowflakes[i] = new Snow();
      }
    }

    function draw() {
      ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height); // clearRect()は、指定した範囲のcanvasの中身を透明にする
      for (let i = 0; i < snowflakes.length; i++) {
        snowflakes[i].draw(); // Snow.prototype.drowで定義したもの
      }
    }

    function update() {
      for (let i = 0; i < snowflakes.length; i++) {
        snowflakes[i].update(); // Snow.prototype.updateで定義したもの
      }
    }

    function loop() {
      draw();
      update();
      animFrame(loop);
    }

    createSnow(100);
    loop();

  });
});