local menu = {}
currentGameState = menu
local menuButtons = {}
menuButtons[0] = {text='New Game'}
menuButtons[1] = {text='Quit'}
local menuBox = {
    w = 500,
    h = #menuButtons*200,
    x = (screenWidth/2)-(menuBox.w/2),
    y = 200
}
function menu:update(dt)
    -- Update the menu
    function love.keypressed(key)
        if isScancodeDown == "escape" then
            love.event.quit()
        end
    end
end

function menu:draw()
    love.graphics.setBackgroundColor(0.1, 0.8, 0.1)
    -- Draw the menu
    love.graphics.setColor(1, 1, 1, 0.4)
    love.graphics.rectangle('fill', menuBox.x, menuBox.y, menuBox.w, menuBox.h)
    drawButtons()
end

function drawButtons(text, color)
    local loop = 1 
    for k, v in pairs(menuButtons) do
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.rectangle('fill', 100, (loop*100), 300, 50)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.print(v.text, 100, (loop*100), 0, 2, 2)
        loop = loop + 1
    end
end
return menu
