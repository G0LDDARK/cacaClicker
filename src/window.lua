--
-- Caca Clicker
-- window
--

local Sprite = require("src.sprite")
local TiledSprite = require("src.tiledSprite")
local json = require("dkjson")
local config
local background
local poopSprite

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

local function setupWindow()
    love.window.setTitle("Caca Clicker")
    love.window.setMode(config.window.width, config.window.height, {
        resizable = config.window.resizable,
        vsync = config.window.vsync,
        fullscreen = config.window.fullscreen,
    })
end

function love.load()
    loadConfig()
    setupWindow()

    background = TiledSprite.new(config.background, 0.9, 0.9)
    poopSprite = Sprite.new(config.poopSprite, 150, 300)
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
