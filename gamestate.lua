local gamestate = {}

gamestate.currentState = require("title")

function gamestate.switch(newState)
  gamestate.currentState = newState
  gamestate.currentState.load()
  love.update = gamestate.currentState.update
  love.draw = gamestate.currentState.draw
end

return gamestate

