--
-- Caca Clicker
-- structure.lua
--

local Game = {}

Game.states =
{
    inMenu = 0,
    inGame = 1,
    inOption = 2
}

Game.events =
{
    leftClic = 1
}

Game.musics =
{
    main = love.audio.newSource("assets/musics/mainMusic.ogg", "stream")
}

Game.sounds =
{
    click = love.audio.newSource("assets/sounds/click.ogg", "static")
}

Game.data =
{
    config = {},
    sprites = {},
    currentState = 0,
}

return Game
