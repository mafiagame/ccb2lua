
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    local ui = require("app.layout.Layer_layout").new(self)
        :addTo(self)

    ui._progress:progressFromTo(nil,10,10,function() print("Done.....") end)
    ui._guang:runAction(CCRepeatForever:create(CCRotateBy:create(1, 90)))


    ui._radial:runAction(CCRepeatForever:create(transition.sequence({
            CCProgressFromTo:create(5, 100, 0),
            CCProgressFromTo:create(5, 0, 100),
        })))

    ui._labelTest:setString("1如果实在要买电脑，旧电脑怎么处理才比较安全？拿了硬盘？拿了主板？还是？2win8能装03的office么？不要烧死，我试过用07的做，一些功能我用07的做出来效果不一样了，不是我要的那种。")
end

function MainScene:onEditBoxEvent(event, editbox)
    print(event, editbox)
end

function MainScene:onBtnClick()
    print("MainScene:onBtnClick !!!")
end

function MainScene:onBtnBack()
    print("onBtnBack!!!")
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

function MainScene:onBtnCCC(_tag,_control)
    print("onBtnCCC!!!",_tag, _control)
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
