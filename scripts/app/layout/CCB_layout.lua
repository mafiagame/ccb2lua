
local CCB_layout = class("CCB_layout",function()
    return display.newLayer()
end)



function CCB_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(CCBNodeExtend.ccb_size(100,100,1,nil))
	self:ignoreAnchorPointForPosition(true)

	local ttf_1 = display.newTTFLabel({
		text = "CCB测试",
		font = "Helvetica",
		size = 30,
	})
	ttf_1:setAnchorPoint(cc.p(0.5,0.5))
	ttf_1:setPosition(CCBNodeExtend.ccb_pos(50.180000305175781,89.375,4,self))
	ttf_1:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_1)


	self._title = ttf_1
	local ccb_2 = require("app.widgets.Myccb").new(_owner)
	ccb_2:setPosition(CCBNodeExtend.ccb_pos(150.33601379394531,452.73605346679688,0,self))


	self:addChild(ccb_2)


	self._num1 = ccb_2
	local ccb_3 = require("app.widgets.Myccb").new(_owner)
	ccb_3:setPosition(CCBNodeExtend.ccb_pos(340.33599853515625,452.73605346679688,0,self))


	self:addChild(ccb_3)


	self._num2 = ccb_3
	local ccb_4 = require("app.widgets.Myccb").new(_owner)
	ccb_4:setPosition(CCBNodeExtend.ccb_pos(530.33599853515625,452.73605346679688,0,self))


	self:addChild(ccb_4)


	self._num3 = ccb_4
	local ccb_5 = require("app.widgets.Myccb").new(_owner)
	ccb_5:setPosition(CCBNodeExtend.ccb_pos(730.33599853515625,452.73605346679688,0,self))


	self:addChild(ccb_5)


	self._num4 = ccb_5


end

return CCB_layout