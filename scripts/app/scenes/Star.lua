--
-- Author: justbilt
-- Date: 2014-08-23 17:09:15
--


local Star = class("Star",require("app.layout.Star_layout"))

function Star:ctor(_owner)
	print("Star",_owner.__cname)

	Star.super.ctor(self, _owner)

	self._daxingxing_1:setScale(0.5)
	self._daxingxing_1:runAction(CCScaleTo:create(1, 1))
end


function Star:onBtnClick()
	print("Star:onBtnClick !!!")
end

return Star