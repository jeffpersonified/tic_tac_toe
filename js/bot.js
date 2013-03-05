// Generated by CoffeeScript 1.4.0
var Bot;

Bot = (function() {

  function Bot(side) {
    console.log("created a new bot!");
    this.name = "Gandalf";
    this.infinity = 99;
    this.side = side;
  }

  Bot.prototype.calculateMove = function(board) {
    var boardCopy, isBoardEmpty, move;
    console.log("Bot.calculateMove with " + (board.getSpaces()));
    debugger;
    isBoardEmpty = function(board) {
      var boardSpaces, space, _i, _len;
      console.log("Bot.calculateMove: board is " + (board.getSpaces()));
      boardSpaces = board.getSpaces();
      for (_i = 0, _len = boardSpaces.length; _i < _len; _i++) {
        space = boardSpaces[_i];
        console.log("Bot.calculateMove: checking if space " + space + " is empty");
        if (typeof space === "string") {
          console.log("Bot.calculateMove: board isn't empty");
          return false;
        }
      }
      return true;
    };
    if (isBoardEmpty(board)) {
      return 4;
    }
    boardCopy = jQuery.extend({}, board);
    console.log("about to call Bot.move");
    move = this.search(boardCopy, this.side, 0, -this.infinity, +this.infinity);
    return move;
  };

  Bot.prototype.search = function(board, side, depth, alpha, beta) {
    debugger;
    var boardCopy, boardSpaces, move, moves, otherside, score, value, _i, _j, _len, _len1;
    value = this.nodeValue(board, side);
    if (value !== 0) {
      if (value > 0) {
        return value - depth;
      } else {
        return value + depth;
      }
    }
    otherside = side === 'X' ? 'O' : 'X';
    moves = this.generateMoves(board);
    boardSpaces = board.getSpaces();
    boardCopy = new Board();
    boardCopy.setSpaces(boardSpaces);
    if (side === 'O') {
      for (_i = 0, _len = moves.length; _i < _len; _i++) {
        move = moves[_i];
        boardCopy.setSpace(move, side);
        score = this.search(boardCopy, otherside, depth + 1, beta, alpha);
        if (score > alpha) {
          alpha = score;
        }
        this.undoMove(boardCopy, move);
        if (alpha >= beta) {
          return alpha;
        }
      }
    }
    if (side === 'X') {
      for (_j = 0, _len1 = moves.length; _j < _len1; _j++) {
        move = moves[_j];
        boardCopy.setSpace(move, side);
        score = this.search(boardCopy, otherside, depth + 1, beta, alpha);
        if (score < beta) {
          beta = score;
        }
        this.undoMove(boardCopy, move);
        if (alpha >= beta) {
          return beta;
        }
      }
    }
  };

  Bot.prototype.nodeValue = function(board, side) {
    var gameResult;
    console.log("Bot.nodeValue: board is " + (board.getSpaces()) + " and side is " + side);
    gameResult = checkGameOver(board);
    console.log("Bot.nodeValue: gameResult is " + gameResult);
    if (gameResult === false || gameResult === 'tie') {
      console.log("returning 0 for nodeValue");
      return 0;
    } else if (gameResult === side) {
      console.log("returning " + this.infinity + " for nodeValue");
      return this.infinity;
    } else {
      console.log("returning " + (-this.infinity) + " for nodeValue");
      return -this.infinity;
    }
  };

  Bot.prototype.generateMoves = function(board) {
    var boardSpaces, moves, space, _i, _len;
    console.log("Bot.generateMoves: board is " + (board.getSpaces()));
    moves = [];
    boardSpaces = board.getSpaces();
    for (_i = 0, _len = boardSpaces.length; _i < _len; _i++) {
      space = boardSpaces[_i];
      if (typeof space === "number") {
        moves.push(space);
      }
    }
    console.log("Bot.generateMoves: moves are " + moves);
    return moves;
  };

  Bot.prototype.makeMove = function(board, move, side) {
    console.log("makeMove: board before makeMove with move " + move + " is " + (board.getSpaces()));
    board.setSpace(move, side);
    console.log("makeMove: board after makeMove is " + (board.getSpaces()));
    return board;
  };

  Bot.prototype.undoMove = function(board, move) {
    var boardSpaces;
    console.log(board.getSpaces());
    boardSpaces = board.getSpaces();
    board.setSpace(move, move);
    console.log(board.getSpaces());
    return board;
  };

  return Bot;

})();
