--
-- Caca Clicker
-- window
--

local config = require("src.core.config")

function SetupWindow()
    love.window.setTitle("Caca Clicker")
    love.window.setMode(config.window.width, config.window.height, {
        resizable = config.window.resizable,
        vsync = config.window.vsync,
        fullscreen = config.window.fullscreen,
    })
end

return SetupWindow()
