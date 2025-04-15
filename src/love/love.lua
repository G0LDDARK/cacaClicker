--
-- Caca Clicker
-- love.lua
--

local config = require("src.config")
local Sprite = require("src.sprite")
local TiledSprite = require("src.tiledSprite")

local background
local poopSprite

function love.load()
    background = TiledSprite.new(config.backgrounds.main)
    poopSprite = Sprite.new(config.sprites.poop)
end

function love.update(dt)
end

function love.draw()
    background:draw()
    poopSprite:draw()
end

function love.mousepressed(x, y, button)
    if button == 1 and poopSprite:isHovered(x, y) then
        print("Poop clicked!")
    end
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.quit()
    print("Game quitted.")
end
