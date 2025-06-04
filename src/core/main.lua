--
-- Caca Clicker
-- main
--

require("src.core.window")
require("src.core.run")

local Game = require("src.core.game")
local TiledSprite = require("src.graphics.tiled_sprite")

local background

function love.load()
    background = TiledSprite.new(Game.data.config.backgrounds.main)

    love.graphics.setFont(Game.fonts.main)


    Game.musics.main:setLooping(true)
    Game.musics.main:setVolume(0.5)
    Game.musics.main:play()
end

function love.draw()
    background:draw()
    local handler = Game.stateHandlers[Game.data.currentState]
    if handler and handler.draw then
        handler.draw()
    end
end

function love.update(dt)
    local handler = Game.stateHandlers[Game.data.currentState]
    if handler and handler.update then
        handler.update(dt)
    end
end

function love.mousepressed(x, y, button)
    local handler = Game.stateHandlers[Game.data.currentState]
    if handler and handler.mousepressed then
        handler.mousepressed(x, y, button)
    end
end

function love.keypressed(key)
    local handler = Game.stateHandlers[Game.data.currentState]
    if handler and handler.keypressed then
        handler.keypressed(key)
    end
end

function love.quit()
    print("Game quitted.")
end
