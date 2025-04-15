--
-- Caca Clicker
-- love.lua
--

local config = require("src.config")
local Sprite = require("src.sprite")
local TiledSprite = require("src.tiledSprite")

local background
local poopSprite
local music
local clickSound

function love.load()
    background = TiledSprite.new(config.backgrounds.main)
    poopSprite = Sprite.new(config.sprites.poop)

    music = love.audio.newSource("assets/musics/mainMusic.ogg", "stream")
    music:setLooping(true)     -- Loop the music
    music:setVolume(0.5)       -- Set volume (0.0 to 1.0)
    music:play()

    clickSound = love.audio.newSource("assets/sounds/click.ogg", "static")
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
        if clickSound:isPlaying() then clickSound:stop() end
        clickSound:play()
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
