function love.load()
    screenWidth = love.graphics.getWidth()
    screenHeight = love.graphics.getHeight()

    menuFont = love.graphics.newFont("tmp/DirtyBrush.ttf", 40)
    textFont = love.graphics.newFont("tmp/Sono-Regular.ttf", 16)
    love.graphics.setFont(textFont)

    dump = {}
    function dumpAdd(string)
        local string
        dump[#dump+1] = string
    end
    -- Set up the game states
    gameState = {
        menu = {
            module = require("menu")(currentGameState),
            name = 'Menu',
        },
        base = {
            module = require("base"),
            name = 'Base',
        },
        raid = {
            module = require("raid"),
            name = 'Raid',
        },
    }

    -- Set the current game state to the menu
    currentGameState = gameState.menu

    -- Load the persistent data from file, if it exists
    if love.filesystem.getInfo("save.lua") then
        baseData = love.filesystem.load("save.lua")()
    else
        baseData = {} -- Default data if file doesn't exist
    end
end

function love.update(dt)
    currentGameState.module:update(dt)
end

function love.draw()
    currentGameState.module:draw()
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.print('Game State: ' ..  currentGameState.name)

end

function love.quit()
    -- Save the persistent data to file
    love.filesystem.write("save.lua", table.concat(baseData, "\n"))
end
