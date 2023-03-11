local base = {}
dump['state']= 'Base'

function base:update(dt)
    -- Update the base screen
end

function base:draw()
    -- Draw the base screen
    love.graphics.setBackgroundColor(0.9, 0.2, 0.3)
end

function base:keypressed(key)
    if key == "return" then
        currentGameState = gameState.gameplay
    end
end

return base
