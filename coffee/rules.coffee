# Rules.checkGameOver(board)
# true/false, winner, placement
#   -> true

checkGameOver = (board) ->
  opportunities = 8
  result        = false

  check = (space) ->
    board.getSpace(space)

  winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],
                         [1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  for combo in winningCombinations
    console.log board
    console.log combo
    firstPlay       = combo[0]
    secondPlay      = combo[1]
    thirdPlay       = combo[2]

    if typeof check(firstPlay) is "string" and 
    typeof check(secondPlay) is "string" and 
    typeof check(thirdPlay) is "string"
      opportunities -= 1
      console.log "checkGameOver: opportunities decreased to #{opportunities}"

    if check(firstPlay) is check(secondPlay) is check(thirdPlay)
      # alert "Winner is #{board.getSpace(firstPlay)}"
      return result = board.getSpace(firstPlay)
    
    if opportunities is 0
      # alert "tie"
      return result = "tie"

  return result

    # else
    #   return "YO!"
    # else
    #   alert "Game still going"
    #   return result

# class Rules
#   @checkGameOver: (board) ->
#     winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],
#                          [1,4,7],[2,5,8],[0,4,8],[2,4,6]];
#     patterns = [[[0, 2], [0, 1], [0, 0]], # Left.
#                 [[0, 0], [1, 0], [2, 0]], # Top.
#                 [[2, 0], [2, 1], [2, 2]], # Right.
#                 [[2, 2], [1, 2], [0, 2]], # Bottom.
#                 [[0, 1], [1, 1], [2, 1]], # Horizontal middle.
#                 [[1, 0], [1, 1], [1, 2]], # Vertical middle.
#                 [[0, 0], [1, 1], [2, 2]], # Top-left to bottom-right.
#                 [[0, 2], [1, 1], [2, 0]]] # Bottom-left to top-right.
#     for row in patterns
#       for column in patterns
#         