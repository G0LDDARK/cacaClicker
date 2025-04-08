--
-- Caca Clicker
-- window
--

-- local Sprite = require("src.sprite")
-- local background
-- local poop
-- local poopX, poopY
-- local poopWidth, poopHeight
local Sprite = require("src.sprite")
local TiledSprite = require("src.tiledSprite")

local background
local poop

function love.load()
    love.window.setTitle("Caca Clicker")
    love.window.setMode(385, 760, {
        resizable = false,
        vsync = true,
        fullscreen = false
    })

    background = TiledSprite.new("assets/background.png", 0.9, 0.9)
    poop = Sprite.new("assets/poop.png", 150, 300)
end

function love.draw()
    -- local screenWidth = love.graphics.getWidth()
    -- local screenHeight = love.graphics.getHeight()
    -- local scaleX = 0.9
    -- local scaleY = 0.9

    -- for x = 0, screenWidth, background:getWidth() * scaleX do
    --     for y = 0, screenHeight, background:getHeight() * scaleY do
    --         love.graphics.draw(background, x, y, 0, scaleX, scaleY)
    --     end
    -- end
    background:draw()
    poop:draw()
end

function love.mousepressed(x, y, button)
    if button == 1 and poop:isHovered(x, y) then
        print("Poop clicked!")
    end
end
