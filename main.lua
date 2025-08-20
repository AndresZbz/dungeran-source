local globals = require("globals")
local sceneManager = require("scenes.sceneManager")
local menu = require("scenes.menuScene")

function love.load()
    sceneManager = sceneManager.new()
    sceneManager:add("menu", menu.new())

    love.window.setMode(globals.WINDOW_WIDTH, globals.WINDOW_HEIGHT)
    love.window.setTitle(globals.WINDOW_NAME)

    sceneManager:load("menu")
end

function love.update(dt)
    sceneManager:update(dt)
end

function love.draw()
    sceneManager:draw()
end

function love.keypressed(key, scancode, isrepeat)
    sceneManager:keypressed(key, scancode, isrepeat)
end

function love.keyreleased(key, scancode)
    sceneManager:keyreleased(key, scancode)
end