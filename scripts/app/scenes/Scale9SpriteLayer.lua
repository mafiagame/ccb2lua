--
-- Author: justbilt
-- Date: 2015-03-15 09:27:50
--

local Scale9SpriteLayer = class("Scale9SpriteLayer", require("app.layout.Scale9Sprite_layout"))

function Scale9SpriteLayer:ctor()
	Scale9SpriteLayer.super.ctor(self)

	self.count = 0
end

function Scale9SpriteLayer:onBtnClick()
	print("Scale9SpriteLayer:onBtnClick")

	self.count = self.count + 1

	self._title:setString("onBtnClick"..self.count)
end

return Scale9SpriteLayer