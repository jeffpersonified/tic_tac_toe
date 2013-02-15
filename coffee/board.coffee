class Board 
  constructor: ->
    @spaces = [1,2,3,4,5,6,7,8,9]

    console.log "created a new board!"
    $('#output').text(@spaces)

  reset: ->
    @spaces = [1,2,3,4,5,6,7,8,9]

  setSpace: (index, side) ->
    console.log "board.setSpace: played at index #{index} with side #{side}"
    @spaces[index] = side
    $('#output').text(@spaces)

  getSpace: (index) ->
    @spaces[index]