--
-- Caca Clicker
-- game.lua
--

local Game = {}
local States = require("src.core.states")
local config = require("src.core.config")
local sprites = require("src.graphics.sprite_loader").loadSpritesFromConfig(config)

Game.data =
{
    config = config,
    sprites = sprites,
    currentState = 0,
    cacaScore = 0,
    clickMultiplier = 1
}

Game.states =
{
    inMenu = 0,
    inGame = 1,
    inOption = 2
}

Game.stateHandlers =
{
    [Game.states.inMenu] = {
        draw = function() States.drawMenu(Game) end,
        update = function(dt) States.updateMenu(Game, dt) end,
        mousepressed = function(x, y, button) States.handleMenuClick(Game, x, y, button) end,
        keypressed = function(key) States.handleMenuKey(Game, key) end
    },
    [Game.states.inGame] = {
        draw = function() States.drawGame(Game) end,
        update = function(dt) States.updateGame(Game, dt) end,
        mousepressed = function(x, y, button) States.handleGameClick(Game, x, y, button) end,
        keypressed = function(key) States.handleGameKey(Game, key) end
    },
    [Game.states.inOption] = {
        -- optional: handle option menu logic
        keypressed = function(key)
            if key == "escape" then
                Game.data.currentState = Game.states.inMenu
            end
        end
    }
}

Game.events =
{
    leftClic = 1
}

Game.musics =
{
    main = love.audio.newSource("assets/musics/mainMusic.ogg", "stream")
}

Game.sounds =
{
    click = love.audio.newSource("assets/sounds/click.ogg", "static")
}

Game.fonts =
{
    main = love.graphics.newFont(Game.data.config.fonts.main.asset, 110)
}

return Game
