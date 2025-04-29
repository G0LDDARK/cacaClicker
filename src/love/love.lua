--
-- Caca Clicker
-- love.lua
--

local config = require("src.config")
local Sprite = require("src.sprite")
local TiledSprite = require("src.tiledSprite")
local Creature = require("src.creature")

local jouage

local font
local background
local sprites = {}

local chickenCreature

local music
local clickSound

local cacaScore = 0
local clickMultiplier = 1

function love.load()
    jouage = -1

    background = TiledSprite.new(config.backgrounds.main)

    font = love.graphics.newFont("assets/fonts/mainFont.ttf", 110)
    love.graphics.setFont(font)

    for name, spriteConfig in pairs(config.sprites) do
        local sprite = Sprite.new(spriteConfig)
        sprites[name] = sprite
    end

    chickenCreature = Creature:new(config.creatures.chicken, config.sprites.chicken)

    music = love.audio.newSource("assets/musics/mainMusic.ogg", "stream")
    music:setLooping(true)
    music:setVolume(0.5)
    music:play()

    clickSound = love.audio.newSource("assets/sounds/click.ogg", "static")
end

function love.update(dt)
    if jouage == 1 then
        chickenCreature:update(dt)
    end
end

function getScoreOffset(nb)
    local digitnb = 0
    local offset = 22
    if nb == 0 then
        digitnb = 1
    else
        digitnb = math.floor(math.log10(math.abs(nb))) + 1
    end
    return offset * digitnb
end

function love.draw()
    background:draw()

    for name, sprite in pairs(sprites) do
        if jouage == 1 then
            love.graphics.setColor(0.68, 0.45, 0.39)
            love.graphics.print(cacaScore, (config.window.width / 2) - getScoreOffset(cacaScore), config.window.height / 8)
            love.graphics.print("Score:", (config.window.width / 2) - 110, config.window.height / 35)
            love.graphics.setColor(1, 1, 1, 1)
            if name == "poop" then
                sprite:draw()
                break
            end
        elseif jouage == -1 then
            if name ~= "chicken" and name ~= "poop" then
                sprite:draw()
            end
        end
    end

    chickenCreature:draw()
end

function love.mousepressed(x, y, button)
    if button == 1 then
        if jouage == -1 then
            if sprites.jouation:isHovered(x, y) then
                jouage = 1
            elseif sprites.partirement:isHovered(x, y) then
                love.event.quit()
            end
        else
            if sprites.poop:isHovered(x, y) then
                if clickSound:isPlaying() then clickSound:stop() end
                clickSound:play()
                cacaScore = cacaScore + clickMultiplier
            end
        end
    end
end

function love.keypressed(key)
    if key == "escape" then
        if jouage == 1 then
            jouage = -1
        elseif jouage == -1 then
            love.event.quit()
        end
    end
end

function love.quit()
    print("Game quitted.")
end
