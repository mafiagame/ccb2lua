--
-- Author: justbilt
-- Date: 2014-08-23 17:09:15
--


local Star = class("Star",require("app.layout.Star_layout"))

function Star:ctor()
	Star.super.ctor(self)

	self._daxingxing_1:setScale(0.5)
	self._daxingxing_1:runAction(CCScaleTo:create(1, 1))
end


function Star:onBtnClick()
	print("onBtnClick !!!")
end

return Star