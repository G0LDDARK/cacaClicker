--
-- Caca Clicker
-- window
--

local background
local json = require("dkjson")
local config

local function loadConfig()
    local file = io.open("config.json", "r")
    if file then
        local content = file:read("*a")
        file:close()
        config = json.decode(content)
    else
        error("Could not open config.json")
    end
end


function love.load()
    loadConfig()
    background = love.graphics.newImage(config.background)
    background:setFilter("nearest", "nearest")
    love.window.setTitle("Caca Clicker")
    love.window.setMode(config.width, config.height, {
        resizable = config.resizable,
        vsync = config.vsync,
        fullscreen = config.fullscreen,
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
