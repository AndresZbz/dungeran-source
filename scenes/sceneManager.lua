-- Scene manager
--[[Description:
    Simple scene manager with Input handling methods, 
    heavily inspired on hump.gamestate.
]]

local sceneManager = {}
sceneManager.__index = sceneManager

function sceneManager.new()
    local self = setmetatable({}, sceneManager)
    self.scenes = {}
    self.current = nil
    return self
end

function sceneManager:add(name, scene)
    self.scenes[name] = scene
end

function sceneManager:load(name, ...)
    if self.current then
        if self.scenes[self.current].exit then
            self.scenes[self.current]:exit()
        end
    end

    self.current = name

    if self.scenes[name].enter then
        self.scenes[name]:enter(...)
    end
end

function sceneManager:update(dt)
    if self.current and self.scenes[self.current].update then
        self.scenes[self.current]:update(dt)
    end
end

function sceneManager:draw()
    if self.current and self.scenes[self.current].draw then
        self.scenes[self.current]:draw()
    end
end

function sceneManager:keypressed(key, scancode, isrepeat)
    if self.current and self.scenes[self.current].keypressed then
        self.scenes[self.current]:keypressed(key, scancode, isrepeat)
    end
end

function sceneManager:keyreleased(key, scancode)
    if self.current and self.scenes[self.current].keyreleased then
        self.scenes[self.current]:keyreleased(key, scancode)
    end
end

return sceneManager