--
-- Caca Clicker
-- love.lua
--

require("src.window")
local config = require("src.config")
local Sprite = require("src.sprite")
local TiledSprite = require("src.tiledSprite")

local background
local poopSprite

function love.load()
    background = TiledSprite.new(config.backgrounds.main)
    poopSprite = Sprite.new(config.sprites.poop)
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
