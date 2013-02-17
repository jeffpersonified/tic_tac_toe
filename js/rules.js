// Generated by CoffeeScript 1.4.0
var checkGameOver;

checkGameOver = function(board) {
  var check, combo, firstPlay, opportunities, result, secondPlay, thirdPlay, winningCombinations, _i, _len, _ref;
  opportunities = 8;
  result = false;
  check = function(space) {
    return board.getSpace(space);
  };
  winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]];
  for (_i = 0, _len = winningCombinations.length; _i < _len; _i++) {
    combo = winningCombinations[_i];
    console.log(board);
    console.log(combo);
    firstPlay = combo[0];
    secondPlay = combo[1];
    thirdPlay = combo[2];
    if (typeof check(firstPlay) === "string" && typeof check(secondPlay) === "string" && typeof check(thirdPlay) === "string") {
      opportunities -= 1;
      console.log("checkGameOver: opportunities decreased to " + opportunities);
    }
    if ((check(firstPlay) === (_ref = check(secondPlay)) && _ref === check(thirdPlay))) {
      alert("Winner is " + (board.getSpace(firstPlay)));
      return result = board.getSpace(firstPlay);
    }
    if (opportunities === 0) {
      alert("tie");
      return "tie";
    }
  }
};