print("Raid module loaded") -- debug
local debug = require('debug')

local raid = {}

function raid:update(dt)
    -- Update the game state
end

function raid:draw()
    -- Draw the game state
    love.graphics.setBackgroundColor(0.1, 0.2, 0.9)
end

function raid:keypressed(key)
    -- Handle player input in the game state
end

return raid
