
local menuButtons = {
    {text='New Game'},
    {text='Quit'}
}

local menuBox = {
    x = love.graphics.getWidth()/2 - 250,
    y = 120
}

menuBox.w = 500
menuBox.h = #menuButtons*200

local menu = {}

function menu:create(currentGameState)
    self.currentGameState = currentGameState
end


function menu:update(dt)
    -- Update the menu
    if love.mouse.isDown(1) then
        self.currentGameState = gameState.base
    end

end

function menu:draw()
    love.graphics.setBackgroundColor(0.1, 0.8, 0.1)
    -- Draw the menu
    love.graphics.setColor(1, 1, 1, 0.4)
    love.graphics.rectangle('fill', menuBox.x, menuBox.y, menuBox.w, menuBox.h)
    drawButtons()
end

function drawButtons()
    local loop = 1 
    love.graphics.setFont(menuFont)
    for k, v in pairs(menuButtons) do
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.rectangle('fill', (screenWidth/2) - 150, (loop*100) + 50, 300, 50)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.print(v.text, ((screenWidth/2) - (menuFont:getWidth(v.text)/2)), (loop*100) + 57, 0, 1, 1)
        loop = loop + 1
    end
    love.graphics.setFont(textFont)
end


function love.keypressed(key)
    if key  == "escape" then
        love.event.quit()
    end
end

return function(currentGameState)
    return menu
end
