--
-- Caca Clicker
-- window
--

local background

function love.load()
    background = love.graphics.newImage("assets/background.png")
    background:setFilter("nearest", "nearest")
    love.window.setTitle("Caca Clicker")
    love.window.setMode(385, 760, {
        resizable = false,
        vsync = true,
        fullscreen = false
    })
end

function love.draw()
    local screenWidth = love.graphics.getWidth()
    local screenHeight = love.graphics.getHeight()
    local scaleX = 0.9
    local scaleY = 0.9

    for x = 0, screenWidth, background:getWidth() * scaleX do
        for y = 0, screenHeight, background:getHeight() * scaleY do
            love.graphics.draw(background, x, y, 0, scaleX, scaleY)
        end
    end
end
