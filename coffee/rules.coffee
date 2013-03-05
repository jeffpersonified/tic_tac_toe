checkGameOver = (board) ->
  opportunities = 8
  result        = false

  check = (space) ->
    board.getSpace(space)

  winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],
                         [1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  for combo in winningCombinations
    firstPlay       = combo[0]
    secondPlay      = combo[1]
    thirdPlay       = combo[2]

    if typeof check(firstPlay) is "string" and 
    typeof check(secondPlay) is "string" and 
    typeof check(thirdPlay) is "string"
      opportunities -= 1
      console.log "checkGameOver: opportunities decreased to #{opportunities}"

    if check(firstPlay) is check(secondPlay) is check(thirdPlay)
      alert "Winner is #{board.getSpace(firstPlay)}"
      return result = board.getSpace(firstPlay)
        
    if opportunities is 0
      alert "tie"
      return result = "tie"

  return result