
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    require("app.layout.Layer_layout").new(self)
        :addTo(self)
end

function MainScene:onBtnReady()
    print("onBtnReady!!!")
end

function MainScene:onBtnAgain()
    print("onBtnAgain!!!")
end

function MainScene:onBtnNext()
    print("onBtnNext!!!")
end

function MainScene:onBtnCCC()
    print("onBtnCCC!!!")
end

function MainScene:onEnter()
    if device.platform == "android" then
        -- avoid unmeant back
        self:performWithDelay(function()
            -- keypad layer, for android
            local layer = display.newLayer()
            layer:addKeypadEventListener(function(event)
                if event == "back" then app.exit() end
            end)
            self:addChild(layer)

            layer:setKeypadEnabled(true)
        end, 0.5)
    end
end

function MainScene:onExit()
end

return MainScene
