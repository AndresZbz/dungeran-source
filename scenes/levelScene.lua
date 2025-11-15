local sti = require("libs.sti")
local gameMap

local levelScene = {}
levelScene.__index = levelScene

function levelScene.new()
    local self = setmetatable({}, levelScene)
    
    -- Try loading the map
    self.gameMap = sti("levels/map.lua")
    
    return self
end

function levelScene:draw()
    love.graphics.setColor(1, 1, 1)
    
    -- Fixed map drawing
    if self.gameMap then
        self.gameMap:draw()
    end
end

function levelScene:keypressed(key)

end

return levelScene