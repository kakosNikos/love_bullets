print("main.lua loaded") -- debug

debug = require("unik_debug")

function love.load()
    screenWidth = love.graphics.getWidth()
    screenHeight = love.graphics.getHeight()

    menuFont = love.graphics.newFont("assets/DirtyBrush.ttf", 40)
    textFont = love.graphics.newFont("assets/Sono-Regular.ttf", 16)
    love.graphics.setFont(textFont)

    -- Set the save game slots
    Save = {}
    Save.default = {playerBaseLevel = 1, playerLevel = 1,}
    baseData = {}
    baseData.baseLevel = 0
    baseData.playerLevel = 0
    -- Set up the game states
    gameState = {
        menu = {
            module = require("menu"),
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
        print("getInfo: ", love.filesystem.getInfo("save.lua")) -- debug
        -- baseData = love.filesystem.load("save.lua")()
        baseData = {baseLevel = 2, playerLevel = 2} -- Default data if file doesn't exist
        return baseData
    else
        baseData = {baseLevel = 1, playerLevel = 1} -- Default data if file doesn't exist
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
    -- Write debug log.file
    debug.saveDebugLog()
    -- Save the persistent data to file
    if love.filesystem.getInfo("save.lua") then
        print("save.lua exists - Scope: love.quit()") -- debug
        love.filesystem.write("save.lua", love.data.encode("string", "base64", tostring(baseData)))
    end
end
