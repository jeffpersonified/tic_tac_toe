class Board 
  constructor: ->
    @spaces = [0,1,2,3,4,5,6,7,8]

    console.log "created a new board!"
    $('#output').text(@spaces)

  reset: ->
    @spaces = [0,1,2,3,4,5,6,7,8]

  setSpace: (index, side) ->
    console.log "board.setSpace: played at index #{index} with side #{side}"
    @spaces[index] = side
    $('#output').text(@spaces)

  setSpaces: (array) ->
    @spaces = array

  getSpace: (index) ->
    @spaces[index]

  getSpaces: ->
    @spaces