--
-- Author: justbilt
-- Date: 2015-03-15 00:01:00
--


local ButtonLayer = class("ButtonLayer", require("app.layout.Button_layout"))

function ButtonLayer:ctor()
	ButtonLayer.super.ctor(self)

	self.count = 0
end

-- function ButtonLayer:onBtnClick()
-- 	print("ButtonLayer:onBtnClick")

-- 	self.count = self.count + 1

-- 	self._title:setString("onBtnClick"..self.count)
-- end

return ButtonLayer