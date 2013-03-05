// Generated by CoffeeScript 1.4.0
var Game, g,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

Game = (function() {

  function Game() {
    this.makeMove = __bind(this.makeMove, this);
    this.board = new Board();
    $('#output').text(this.board.getSpaces());
  }

  Game.prototype["new"] = function() {
    this.board.reset();
    this.result = false;
    this.side = "X";
    this.bot = new Bot("O");
    return this.moves = 0;
  };

  Game.prototype.firstTurn = function() {
    this.board.setSpaces(['X', 1, 2, 3, 'O', 5, 6, 7, 8]);
    return this.makeMove(2);
  };

  Game.prototype.makeMove = function(space) {
    this.board.setSpace(space, this.side);
    this.moves += 1;
    return this.concludeTurn();
  };

  Game.prototype.listenForMove = function() {
    var space;
    space = prompt("What space are you playing?");
    return this.makeMove(space);
  };

  Game.prototype.concludeTurn = function() {
    this.result = checkGameOver(this.board);
    console.log("Result is " + this.result);
    if (this.result === 'X' || this.result === 'O' || this.result === 'tie') {
      alert("Game.concludeTurn: game is over, heading into gameOver");
      return this.gameOver(this.result);
    }
    return this.changeTurn();
  };

  Game.prototype.changeTurn = function() {
    this.side = this.side === 'X' ? 'O' : 'X';
    console.log("in change turn, side is now " + this.side);
    if (this.side === 'X') {
      this.listenForMove();
    }
    console.log("Game.changeTurn: bot (" + this.bot + ") is about to calc move");
    if (this.side === 'O') {
      return this.makeMove(this.bot.calculateMove(this.board));
    }
  };

  Game.prototype.gameOver = function(winner) {
    console.log("Game.concludeTurn: winner is " + this.result);
  };

  return Game;

})();

g = new Game();
