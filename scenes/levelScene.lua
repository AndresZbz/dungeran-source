local sti = require("libs.sti")
local gameMap

local menuScene = {}
menuScene.__index = menuScene

function menuScene.new()
    local self = setmetatable({}, menuScene)
    
    -- Try loading the map
    self.gameMap = sti("levels/map.lua")
    
    return self
end

function menuScene:draw()
    love.graphics.setColor(1, 1, 1)
    
    -- Fixed map drawing
    if self.gameMap then
        self.gameMap:draw()
    end
end

function menuScene:keypressed(key)

end

return menuScene