local menuScene = {}
menuScene.__index = menuScene

function menuScene.new(sceneManager)
    local self = setmetatable({}, menuScene)
    self.buttons = {"Start Game", "Options", "Exit"}
    self.selected = 1
    self.sceneManager = sceneManager
    return self
end

function menuScene:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Main Menu scene test", 100, 50)
    
    for i, text in ipairs(self.buttons) do
        if i == self.selected then
            love.graphics.setColor(1, 0, 0)
        else
            love.graphics.setColor(1, 1, 1)
        end
        love.graphics.print(text, 100, 100 + i * 30)
    end
end

function menuScene:keypressed(key)
    if key == "up" then
        self.selected = math.max(1, self.selected - 1)
    elseif key == "down" then
        self.selected = math.min(#self.buttons, self.selected + 1)
    elseif key == "return" then
        if self.selected == 1 then
            self.sceneManager:load("game")
        elseif self.selected == 3 then
            love.event.quit()
        end
    end
end

return menuScene