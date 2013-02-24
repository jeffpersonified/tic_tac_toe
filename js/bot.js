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
    debugger;
    var boardCopy, copiedSpaces, isBoardEmpty, move;
    console.log("Bot.calculateMove with " + (board.getSpaces()));
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
    copiedSpaces = boardCopy.getSpaces();
    console.log("copiedSpaces are: " + copiedSpaces);
    console.log("about to call Bot.move");
    move = this.search(boardCopy, this.side, 0, -this.infinity, +this.infinity);
    return move;
  };

  Bot.prototype.search = function(board, side, depth, alpha, beta) {
    var bestMove, move, moves, otherside, potentialAlpha, value, _i, _len;
    console.log("Bot.search: board is " + (board.getSpaces()));
    console.log("Bot.search: side is " + side);
    console.log("Bot.search: depth is " + depth);
    value = this.nodeValue(board, side);
    console.log("Bot.search: depth is " + depth);
    console.log("Bot.search: value is " + value);
    if (value !== 0) {
      if (value > 0) {
        return value - depth;
      } else {
        return value + depth;
      }
    }
    moves = this.generateMoves(board);
    if (moves.length === 0) {
      return value;
    }
    otherside = side === 'X' ? 'O' : 'X';
    console.log("Bot.search: otherside is " + otherside);
    for (_i = 0, _len = moves.length; _i < _len; _i++) {
      move = moves[_i];
      console.log("Bot.search: " + move + " in moves");
      console.log("(the above ought to increment)");
      this.makeMove(board, move, side);
      console.log("before calling potential alph board is " + (board.getSpaces()));
      potentialAlpha = -this.search(board, otherside, depth + 1, -beta, -alpha);
      console.log("Bot.search: potentialAlpha");
      this.undoMove(board, move);
      console.log("Bot.search: undoMove, board is now " + (board.getSpaces()));
      if (beta <= alpha) {
        break;
      }
      if (potentialAlpha > alpha) {
        alpha = potentialAlpha;
        if (depth === 0) {
          bestMove = move;
        }
      }
    }
    if (depth !== 0) {
      return alpha;
    } else {
      return bestMove;
    }
  };

  Bot.prototype.nodeValue = function(board, side) {
    var gameResult;
    console.log("Bot.nodeValue: board is " + (board.getSpaces()) + " and side is " + side);
    gameResult = checkGameOver(board);
    console.log("Bot.nodeValue: gameResult is " + gameResult);
    if (gameResult === false || 'tie') {
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
    console.log("Bot.generateMoves: got boardSpaces " + boardSpaces);
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
