--
-- Author: justbilt
-- Date: 2015-03-15 00:01:00
--


local LabelLayer = class("LabelLayer", require("app.layout.Label_layout"))

function LabelLayer:ctor()
	LabelLayer.super.ctor(self)

	self.count = 0
end

function LabelLayer:onBtnClick()
	print("LabelLayer:onBtnClick")

	self.count = self.count + 1

	self._title:setString("onBtnClick"..self.count)
end

return LabelLayer