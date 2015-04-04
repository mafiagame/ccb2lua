
local CCB_layout = class("CCB_layout",function()
    return display.newLayer()
end)





function CCB_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(cc.size(display.width * 1.0, display.height * 1.0))
	self:ignoreAnchorPointForPosition(true)

	self._title = display.newTTFLabel({
		text = "CCB测试",
		font = "Helvetica",
		size = 30,
	})
	self._title:setAnchorPoint(cc.p(0.5,0.5))
	self._title:setPosition(cc.p(self:getContentSize().width * 0.5018, self:getContentSize().height * 0.89375))
	self._title:ignoreAnchorPointForPosition(false)

	self:addChild(self._title)

	self._num1 = require("app.widgets.Myccb").new(_owner)
	self._num1:setPosition(cc.p(150.336, 452.7361))

	self:addChild(self._num1)

	self._num2 = require("app.widgets.Myccb").new(_owner)
	self._num2:setPosition(cc.p(340.336, 452.7361))

	self:addChild(self._num2)

	self._num3 = require("app.widgets.Myccb").new(_owner)
	self._num3:setPosition(cc.p(530.336, 452.7361))

	self:addChild(self._num3)

	self._num4 = require("app.widgets.Myccb").new(_owner)
	self._num4:setPosition(cc.p(730.336, 452.7361))

	self:addChild(self._num4)


end



return CCB_layout