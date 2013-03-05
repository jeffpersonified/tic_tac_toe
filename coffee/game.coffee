# $ coffee --bare -o js/ -cw coffee/ 
# 
# var g = new Game()

class Game
  constructor: ->
    @board = new Board()
    $('#output').text(@board.getSpaces())

  new: ->
    @board.reset()
    @result = false
    @side = "X"
    @bot = new Bot "O"
    @moves = 0

  firstTurn: ->
    # Production
    # space = prompt "What space are you playing?"
    # @makeMove space

    # Testing
    @board.setSpaces ['X',1,2,3,'O',5,6,7,8] # Testing – Bot should output 1 for calMove
    @makeMove 2

  makeMove: (space) =>
    @board.setSpace(space, @side)
    @moves += 1
    @concludeTurn()

  listenForMove: ->
    space = prompt "What space are you playing?"
    @makeMove space

  concludeTurn: ->
    @result = checkGameOver @board
    console.log "Result is #{@result}"

    if @result is 'X' or @result is 'O' or @result is 'tie'
      alert "Game.concludeTurn: game is over, heading into gameOver"
      return @gameOver @result 
    @changeTurn()

  changeTurn: ->
    @side = if @side is 'X' then 'O' else 'X'
    console.log "in change turn, side is now #{@side}"
    @listenForMove() if @side is 'X'

    console.log "Game.changeTurn: bot (#{@bot}) is about to calc move"
    @makeMove(@bot.calculateMove @board) if @side is 'O'
    
    # placement = @bot.calculateMove @board if @side is 'O'
    # console.log placement
    # @board.setSpace(placement, 'O') # give a secondary argument to makeMove and remove
    # @concludeTurn()


  gameOver: (winner) ->
    console.log "Game.concludeTurn: winner is #{@result}"
    return
    # answer = prompt "Winner is #{winner}! Would you like to play again?"
    # @playAgain answer

  # playAgain: (answer) ->
  #   alert "Suite yourself" if answer is false
  #   @new() if answer is true


# check if game is over
# check moves
#   if even then human
# else 
#   bot
# 
# increment moves?

# reset grid
# turn = "X"
# move = 0

g = new Game()
# g.new()
# g.firstTurn()


