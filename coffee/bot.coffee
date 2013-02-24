class Bot
  constructor: (side) ->
    console.log "created a new bot!"
    @name = "Gandalf"
    @infinity = 99
    @side = side


  calculateMove: (board) ->
    debugger

    console.log "Bot.calculateMove with #{board.getSpaces()}"
    
    isBoardEmpty = (board) -> # works
      console.log "Bot.calculateMove: board is #{board.getSpaces()}"
      boardSpaces = board.getSpaces()
      for space in boardSpaces
        console.log "Bot.calculateMove: checking if space #{space} is empty"
        if typeof space is "string" 
          console.log "Bot.calculateMove: board isn't empty"
          return false
      return true

    return 4 if isBoardEmpty(board)

    boardCopy = jQuery.extend({}, board) # this copies the board 
                                               # but still refers to the same spaces 
                                               # in the copy
    copiedSpaces =  boardCopy.getSpaces()
    console.log "copiedSpaces are: #{copiedSpaces}"
    # 
    console.log "about to call Bot.move"
    move = @search(boardCopy, @side, 0, -@infinity, +@infinity) # breaking in search i think

    # if move is 0
    #   throw 'ArtificialIntelligence.calculateMove: draw game, no move found.'
    return move

  search: (board, side, depth, alpha, beta)->
    # alert "in Bot.search"
    console.log "Bot.search: board is #{board.getSpaces()}"
    console.log "Bot.search: side is #{side}"
    console.log "Bot.search: depth is #{depth}"


    value = @nodeValue(board, side)

    console.log "Bot.search: depth is #{depth}"
    console.log "Bot.search: value is #{value}"

    if value isnt 0
      if value > 0 then return value - depth else return value + depth


    moves = @generateMoves board
    # 
    return value if moves.length is 0

    otherside = if side is 'X' then 'O' else 'X'
    console.log "Bot.search: otherside is #{otherside}"

    for move in moves
      console.log "Bot.search: #{move} in moves" 
      console.log "(the above ought to increment)"
      @makeMove(board, move, side)

      console.log "before calling potential alph board is #{board.getSpaces()}"
      potentialAlpha = -@search(board, otherside, depth + 1, -beta, -alpha)
      console.log "Bot.search: potentialAlpha"
      @undoMove(board, move)  # THINK ITS SOMETHING WITH THE BOARD BEING USED
      console.log "Bot.search: undoMove, board is now #{board.getSpaces()}"
      break if beta <= alpha

      if potentialAlpha > alpha
        alpha = potentialAlpha
        if depth is 0
          bestMove = move
    
    if depth isnt 0 then return alpha else return bestMove

  nodeValue: (board, side) ->
    console.log "Bot.nodeValue: board is #{board.getSpaces()} and side is #{side}"
    gameResult = checkGameOver board
    # problems here; always evaluating gameresult at undefined
    console.log "Bot.nodeValue: gameResult is #{gameResult}"
    if gameResult is false or 'tie'
      console.log "returning 0 for nodeValue"
      return 0 
    else if gameResult is side
      console.log "returning #{@infinity} for nodeValue"
      return @infinity
    else
      console.log "returning #{-@infinity} for nodeValue"
      return -@infinity

  generateMoves: (board) ->
    console.log "Bot.generateMoves: board is #{board.getSpaces()}"
    moves = []
    boardSpaces = board.getSpaces()
    console.log "Bot.generateMoves: got boardSpaces #{boardSpaces}"

    for space in boardSpaces
      if typeof space is "number"
        moves.push(space)

    console.log "Bot.generateMoves: moves are #{moves}"
    return moves

  makeMove: (board, move, side) ->
    console.log "makeMove: board before makeMove with move #{move} is #{board.getSpaces()}"
    board.setSpace(move, side)
    # board[move] = side
    console.log "makeMove: board after makeMove is #{board.getSpaces()}"
    
    return board                                   #####

  undoMove: (board, move) ->
    
    console.log board.getSpaces()
    boardSpaces = board.getSpaces()
    board.setSpace(move, move)
    console.log board.getSpaces()
    
    return board 

# minimax = (player, board) ->

# minimax (player, board) ->
#   winner if gameOver(currentPosition)

