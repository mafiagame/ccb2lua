
local CCB_layout = class("CCB_layout",function()
    return display.newLayer()
end)



function CCB_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(CCBNodeExtend.ccb_size(100,100,1,nil))
	self:ignoreAnchorPointForPosition(true)

	self._title = display.newTTFLabel({
		text = "CCB测试",
		font = "Helvetica",
		size = 30,
	})
	self._title:setAnchorPoint(cc.p(0.5,0.5))
	self._title:setPosition(CCBNodeExtend.ccb_pos(50.180000305175781,89.375,4,self))
	self._title:ignoreAnchorPointForPosition(false)


	self:addChild(self._title)


	self._num1 = require("app.widgets.Myccb").new(_owner)
	self._num1:setPosition(CCBNodeExtend.ccb_pos(150.33601379394531,452.73605346679688,0,self))


	self:addChild(self._num1)


	self._num2 = require("app.widgets.Myccb").new(_owner)
	self._num2:setPosition(CCBNodeExtend.ccb_pos(340.33599853515625,452.73605346679688,0,self))


	self:addChild(self._num2)


	self._num3 = require("app.widgets.Myccb").new(_owner)
	self._num3:setPosition(CCBNodeExtend.ccb_pos(530.33599853515625,452.73605346679688,0,self))


	self:addChild(self._num3)


	self._num4 = require("app.widgets.Myccb").new(_owner)
	self._num4:setPosition(CCBNodeExtend.ccb_pos(730.33599853515625,452.73605346679688,0,self))


	self:addChild(self._num4)



end



return CCB_layout