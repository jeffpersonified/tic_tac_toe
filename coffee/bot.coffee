# function integer minimax(node, depth)
#     if node is a terminal node or depth <= 0:
#         return the heuristic value of node
#     α = -∞
#     for child in node:                       # evaluation is identical for both players 
#         α = max(α, -minimax(child, depth-1))
#     return α


# alpha-beta(player,board,alpha,beta)
#     if(game over in current board position)
#         return winner

#     children = all legal moves for player from this board
#     if(max's turn)
#         for each child
#             score = alpha-beta(other player,child,alpha,beta)
#             if score > alpha then alpha = score (we have found a better best move)
#             if alpha >= beta then return alpha (cut off)
#         return alpha (this is our best move)
#     else (min's turn)
#         for each child
#             score = alpha-beta(other player,child,alpha,beta)
#             if score < beta then beta = score (opponent has found a better worse move)
#             if alpha >= beta then return beta (cut off)
#         return beta (this is the opponent's best move)


# # check if at search bound
# if node is at depthLimit
#    return staticEval(node)

# # check if leaf
# children = successors(node)
# if len(children) == 0
#    if node is root
#       bestMove = [] 
#    return staticEval(node)

# # initialize bestMove
# if node is root
#    bestMove = operator of first child
#    # check if there is only one option
#    if len(children) == 1
#       return None

# if it is MAX's turn to move
#    for child in children
#       result = alphaBetaMinimax(child, alpha, beta)
#       if result > alpha
#          alpha = result
#          if node is root
#             bestMove = operator of child
#       if alpha >= beta
#          return alpha
#    return alpha

# if it is MIN's turn to move
#    for child in children
#       result = alphaBetaMinimax(child, alpha, beta)
#       if result < beta
#          beta = result
#          if node is root
#             bestMove = operator of child
#       if beta <= alpha
#          return beta
#    return beta

class Bot
  constructor: (side) ->
    console.log "created a new bot!"
    @name = "Gandalf"
    @infinity = 99
    @side = side


  calculateMove: (board) ->
    boardCopy = jQuery.extend({}, board) # this copies the board 
                                         # but still refers to the same spaces 
                                         # in the copy
    # debugger                                     
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

    

    console.log "about to call Bot.move"
    move = @search(boardCopy, @side, 0, -@infinity, +@infinity)

    # if move is 0
    #   throw 'ArtificialIntelligence.calculateMove: draw game, no move found.'
    return move

  search: (board, side, depth, alpha, beta)->
    # needs to return the index of the move

    
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
        return alpha if alpha >= beta 
      return alpha

    if side is 'X'
      for move in moves
        boardCopy.setSpace(move, side)
        score = @search(boardCopy, otherside, depth + 1, beta, alpha)
        beta = score if score < beta
        return beta if alpha >= beta

  

    # # debugger
    # # alert "in Bot.search"
    # console.log "Bot.search: board is #{board.getSpaces()}"
    # console.log "Bot.search: side is #{side}"
    # console.log "Bot.search: depth is #{depth}"


    # value = @nodeValue(board, side)

    # console.log "Bot.search: depth is #{depth}"
    # console.log "Bot.search: value is #{value}"

    # if value isnt 0
    #   if value > 0 then return value - depth else return value + depth


    # moves = @generateMoves board
    # debugger
    # return value if moves.length is 0

    # otherside = if side is 'X' then 'O' else 'X'
    # console.log "Bot.search: otherside is #{otherside}"

    # for move in moves
    #   console.log "Bot.search: #{move} in moves" 
    #   console.log "(the above ought to increment)"
    #   boardSpaces = board.getSpaces()
    #   # boardCopy = jQuery.extend({}, board)  # this copies the board but 
    #   #                                       # but maintains changes the original board as well
    #   boardCopy = new Board()
    #   boardCopy.setSpaces(boardSpaces) # This could be rolled into a optional argument 
    #                                    # on the board constructor
    #   console.log boardCopy

    #   @makeMove(boardCopy, move, side)
    #   console.log "before calling potential alph board is #{board.getSpaces()}"
    #   potentialAlpha = -@search(board, otherside, depth + 1, -beta, -alpha)
    #   console.log "Bot.search: potentialAlpha"
    #   @undoMove(board, move)  # THINK ITS SOMETHING WITH THE BOARD BEING USED
    #   console.log "Bot.search: undoMove, board is now #{board.getSpaces()}"
    #   break if beta <= alpha

    #   if potentialAlpha > alpha
    #     alpha = potentialAlpha
    #     if depth is 0
    #       bestMove = move
    
    # if depth isnt 0 then return alpha else return bestMove

  nodeValue: (board, side) ->
    # debugger
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

