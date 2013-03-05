class Bot
  constructor: (side) ->
    console.log "created a new bot!"
    @name = "Gandalf"
    @infinity = 99
    @side = side


  calculateMove: (board) ->
    console.log "Bot.calculateMove with #{board.getSpaces()}"
    debugger 

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
                                         # in the copy. Necessary?
    console.log "about to call Bot.move"
    move = @search(boardCopy, @side, 0, -@infinity, +@infinity)

    # if moves is 0 # This no longer works, but a similar exception should apply
    #   throw 'ArtificialIntelligence.calculateMove: draw game, no move found.'
    return move

  search: (board, side, depth, alpha, beta)->
    # needs to return the index of the move
    debugger

    ##### TRY 1 #####
    #################    
    value = @nodeValue(board, side)
    if value isnt 0
      if value > 0 then return value - depth else return value + depth

    otherside = if side is 'X' then 'O' else 'X'
    moves = @generateMoves board


    boardSpaces = board.getSpaces()
    boardCopy = new Board()
    boardCopy.setSpaces(boardSpaces) 
    

    if side is 'O'
      for move in moves
        boardCopy.setSpace(move, side)
        score = @search(boardCopy, otherside, depth + 1, beta, alpha)
        alpha = score if score > alpha
        @undoMove(boardCopy, move)
        return alpha if alpha >= beta

    if side is 'X'
      for move in moves
        boardCopy.setSpace(move, side)
        score = @search(boardCopy, otherside, depth + 1, beta, alpha)
        beta = score if score < beta
        @undoMove(boardCopy, move)
        return beta if alpha >= beta

    # if depth isnt 0 then return alpha else return bestMove

    # outcomes.push

    ##### TRY 2 #####
    #################    
    # value = @nodeValue(board, side)
    # console.log "Bot.search: depth is #{depth}"
    # console.log "Bot.search: value is #{value}"

    # if value isnt 0
    #   if value > 0 then return value - depth else return value + depth

    # moves = @generateMoves board

    # return value if moves.length is 0

    # otherside = if side is 'X' then 'O' else 'X'

    # for move in moves
    #   console.log "Bot.search: #{move} in moves" 

    #   boardSpaces = board.getSpaces()
    #   boardCopy = new Board()
    #   boardCopy.setSpaces(boardSpaces) # This could be rolled into a optional argument 
    #                                    # on the board constructor

    #   @makeMove(boardCopy, move, side)
    #   potentialAlpha = -@search(board, otherside, depth + 1, -beta, -alpha)
    #   @undoMove(boardCopy, move)  # THINK ITS SOMETHING WITH THE BOARD BEING USED
    #   break if beta <= alpha

    #   if potentialAlpha > alpha
    #     alpha = potentialAlpha
    #     if depth is 0
    #       bestMove = move
    
    # if depth isnt 0 then return alpha else return bestMove
    

    ##### TRY 3 #####
    #################
    # value = @nodeValue(board, side)
    # console.log "Bot.search: depth is #{depth}"
    # console.log "Bot.search: value is #{value}"

    # if value isnt 0
    #   if value > 0 then return value - depth else return value + depth

    # moves = @generateMoves board

    # return value if moves.length is 0 # ?

    # otherside = if side is 'X' then 'O' else 'X'

    # boardSpaces = board.getSpaces()
    # boardCopy = new Board()
    # boardCopy.setSpaces(boardSpaces) # This could be rolled into a optional argument 
    #                                  # on the board constructor
    # if side is 'O'
    #   for move in moves

    #     boardCopy.setSpace(move, side)
    #     score = @search(boardCopy, otherside, depth + 1, beta, alpha)
    #     alpha = score if score > alpha
    #     return alpha if alpha >= beta
    #     break if beta > alpha

    # else
    #   for move in moves
    #     boardCopy.setSpace(move, side)
    #     score = @search(boardCopy, otherside, depth + 1, beta, alpha)
    #     beta = score if score < beta
    #     return beta if alpha >= beta
    #     break if alph > beta


  nodeValue: (board, side) ->
    console.log "Bot.nodeValue: board is #{board.getSpaces()} and side is #{side}"
    gameResult = checkGameOver board
    console.log "Bot.nodeValue: gameResult is #{gameResult}"
    if gameResult is false or gameResult is 'tie'
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

