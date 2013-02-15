// Generated by CoffeeScript 1.4.0
var Board;

Board = (function() {

  function Board() {
    this.spaces = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    console.log("created a new board!");
    $('#output').text(this.spaces);
  }

  Board.prototype.reset = function() {
    return this.spaces = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  };

  Board.prototype.setSpace = function(index, side) {
    console.log("board.setSpace: played at index " + index + " with side " + side);
    this.spaces[index] = side;
    return $('#output').text(this.spaces);
  };

  Board.prototype.getSpace = function(index) {
    return this.spaces[index];
  };

  return Board;

})();
