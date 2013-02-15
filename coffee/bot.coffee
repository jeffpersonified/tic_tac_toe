# clone = (obj) ->
#   console.log "cloning #{obj}"
#   return obj if obj is null or typeof obj isnt "object"
#   temp = obj.constructor()
#   for key of obj
#     temp[key] = clone(obj[key])
#   console.log "finished cloning #{obj}"
#   console.log "temp is now #{temp}"
#   temp


class Bot
  constructor: (side) ->
    console.log "created a new bot!"
    @name = "Gandalf"
    @infinity = 99
    @side = side


  calculateMove: (board) ->
  # IMPLEMENT TO HAVE BOT PLAY FIRST OR ITSELF
    isBoardEmpty = (board) ->
      for column in board
        for row in column
          return false if row isnt '*'
      return true
    return 5 if isBoardEmpty(board)
    console.log "Bot.calculateMove with #{board}"

    # boardCopy = clone board
    console.log "about to call Bot.move"
    move = @search(boardCopy, @side, 0, -@infinity, +@infinity)
    if move is 0
      throw 'ArtificialIntelligence.calculateMove: draw game, no move found.'
    return move

  search: (board, side, depth, alpha, beta)->
    value = @nodeValue(board, side)

    if value isnt 0
      if value > 0 then return value - depth else return value + depth

    moves = @generateMoves board
    return value if moves.length is 0
    otherside = if side is 'X' then 'O' else 'X'

    for move in moves
      @makeMove(board, move, side)
      potentialAlpha = -@search(board, otherside, depth + 1, -beta, -alpha)
      @undoMove(board, move)
      break if beta <= alpha

      if potentialAlpha > alpha
        alpha = potentialAlpha
        if depth is 0
          bestMove = move

    if depth isnt 0 then return alpha else return bestMove

  nodeValue: (board, side) ->                                              #####
    gameResult = Rules.checkGameOver(board)
    if gameResult is null or gameResult['draw']
      return 0 
    else if gameResult['winner'] is side 
      return @infinity
    else 
      return -@infinity

  generateMoves: (board) ->
    moves = []

    for column in board
      for row in column
        if row is '*'
          moves.push([row, column])                                         #####
        # [row, column] is really just the number of the square
        # could just set the value of the 

    return moves

  makeMove: (board, move, side) ->
    board[move[1]][move[0]] = side                                          #####

  undoMove: (grid, move) ->
    board[move[1]][move[0]] = "*"                                           #####

# minimax = (player, board) ->

# minimax (player, board) ->
# 	winner if gameOver(currentPosition)

