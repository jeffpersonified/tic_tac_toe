// Generated by CoffeeScript 1.4.0
var Board;

Board = (function() {

  function Board() {
    this.spaces = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  }

  Board.prototype.reset = function() {
    return this.spaces = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  };

  Board.prototype.setSpace = function(index, side) {
    console.log("board.setSpace: played at index " + index + " with side " + side);
    this.spaces[index] = side;
    return $('#output').text(this.spaces);
  };

  Board.prototype.setSpaces = function(array) {
    return this.spaces = array;
  };

  Board.prototype.getSpace = function(index) {
    return this.spaces[index];
  };

  Board.prototype.getSpaces = function() {
    return this.spaces;
  };

  return Board;

})();
