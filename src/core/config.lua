--
-- Caca Clicker
-- config.lua
--

local json = require("dkjson")

function LoadConfig()
    local file = io.open("config.json", "r")
    if file then
        local content = file:read("*a")
        file:close()
        return json.decode(content)
    else
        error("Could not open config.json")
    end
end

return LoadConfig()
