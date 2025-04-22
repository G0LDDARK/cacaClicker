--
-- Caca Clicker
-- love.lua
--

local config = require("src.config")
local Sprite = require("src.sprite")
local TiledSprite = require("src.tiledSprite")
local Creature = require("src.creature")

local jouage

local background
local sprites = {}

local chickenCreature

local music
local clickSound

function love.load()
    jouage = -1

    background = TiledSprite.new(config.backgrounds.main)

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

function love.draw()
    background:draw()

    for name, sprite in pairs(sprites) do
        if jouage == 1 then
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
        if sprites.poop:isHovered(x, y) then
            if clickSound:isPlaying() then clickSound:stop() end
            clickSound:play()
        end

        if jouage == -1 then
            if sprites.jouation:isHovered(x, y) then
                jouage = 1
            elseif sprites.partirement:isHovered(x, y) then
                love.event.quit()
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
