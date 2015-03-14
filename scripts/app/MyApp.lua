
require("config")
require("framework.init")
require("framework.shortcodes")
require("framework.cc.init")

require("app.CCBNodeExtend")

RichLabel  = require(cc.PACKAGE_NAME..".quickx-utils.richlabel.RichLabel")
AutoLayout = require(cc.PACKAGE_NAME..".quickx-utils.autolayout.AutoLayout")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
	GameAudio = {}
	GameAudio.dispatchEvent = function() print("GameAudio.dispatchEvent") end

    MyApp.super.ctor(self)
    
    CCFileUtils:sharedFileUtils():addSearchPath("res/")
    display.addSpriteFramesWithFile("button.plist", "button.png")
end

function MyApp:run()
    self:enterScene("MainScene")
end

return MyApp
