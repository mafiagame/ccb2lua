--
-- Author: justbilt
-- Date: 2015-03-15 00:01:00
--


local SpriteLayer = class("SpriteLayer", require("app.layout.Sprite_layout"))

function SpriteLayer:ctor()
	SpriteLayer.super.ctor(self)

	self.count = 0
end

function SpriteLayer:onBtnClick()
	print("SpriteLayer:onBtnClick")

	self.count = self.count + 1

	self._title:setString("onBtnClick"..self.count)
end

return SpriteLayer