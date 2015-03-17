
require("config")
require("framework.init")
require("framework.shortcodes")
require("framework.cc.init")

require("app.CCBNodeExtend")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
    
    cc.FileUtils:getInstance():addSearchPath("res/")
    -- display.addSpriteFrames("button.plist", "button.png")
end

function MyApp:run()
    self:enterScene("MainScene")
end

return MyApp
