--
-- Caca Clicker
-- love.lua
--

local Game = require("src.love.structure")
Game.data.config = require("src.config")
local Sprite = require("src.sprite")
local TiledSprite = require("src.tiledSprite")
local Creature = require("src.creature")

local font
local background

local chickenCreature

local cacaScore = 0
local clickMultiplier = 1

function love.load()
    background = TiledSprite.new(Game.data.config.backgrounds.main)

    font = love.graphics.newFont(Game.data.config.fonts.main.asset, 110)
    love.graphics.setFont(font)

    for name, spriteConfig in pairs(Game.data.config.sprites) do
        local sprite = Sprite.new(spriteConfig)
        Game.data.sprites[name] = sprite
    end

    chickenCreature = Creature:new(Game.data.config.creatures.chicken, Game.data.config.sprites.chicken)

    Game.musics.main:setLooping(true)
    Game.musics.main:setVolume(0.5)
    Game.musics.main:play()

end

function love.update(dt)
    if Game.data.currentState == Game.states.inGame then
        chickenCreature:update(dt)
    end
end

local function getScoreOffset(nb)
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

    for name, sprite in pairs(Game.data.sprites) do
        if Game.data.currentState == Game.states.inGame then
            love.graphics.setColor(0.68, 0.45, 0.39)
            love.graphics.print(cacaScore, (Game.data.config.window.width / 2) - getScoreOffset(cacaScore), Game.data.config.window.height / 8)
            love.graphics.print("Score:", (Game.data.config.window.width / 2) - 110, Game.data.config.window.height / 35)
            love.graphics.setColor(1, 1, 1, 1)

            if name == "poop" or name == "toiletPaper" then
                sprite:draw()
            end

        elseif Game.data.currentState == Game.states.inMenu then
            if name ~= "chicken" and name ~= "poop" and name ~= "toiletPaper" then
                sprite:draw()
            end
        end
    end

    chickenCreature:draw()
end

function love.mousepressed(x, y, button)
    if button == Game.events.leftClic then

        if Game.data.currentState == Game.states.inMenu then

            if Game.data.sprites.jouation:isHovered(x, y) then
                Game.data.currentState = Game.states.inGame

            elseif Game.data.sprites.partirement:isHovered(x, y) then
                love.event.quit()

            elseif Game.data.sprites.optionnage:isHovered(x, y) then
                Game.data.currentState = Game.states.inOption
            end

        elseif Game.data.currentState == Game.states.inGame then

            if Game.data.sprites.poop:isHovered(x, y) then
                if Game.sounds.click:isPlaying() then
                    Game.sounds.click:stop()
                end
                Game.sounds.click:play()
                cacaScore = cacaScore + clickMultiplier
            end
        end

        -- elseif Game.data.currentState == Game.states.inOption then
        -- end
    end
end

function love.keypressed(key)
    if key == "escape" then
        if Game.data.currentState == Game.states.inGame or Game.data.currentState == Game.states.inOption then
            Game.data.currentState = Game.states.inMenu
        elseif Game.data.currentState == Game.states.inMenu then
            love.event.quit()
        end
    end
end

function love.quit()
    print("Game quitted.")
end
