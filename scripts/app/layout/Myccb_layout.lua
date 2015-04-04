
local Myccb_layout = class("Myccb_layout",function()
    return display.newSprite()
end)





function Myccb_layout:ctor(_owner)
	 _owner = _owner or self
	self:setSpriteFrame(ccbutils.ccb_display_frame("daxingxing_1.png"))
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:ignoreAnchorPointForPosition(false)

	self._name = display.newTTFLabel({
		text = "第一名",
		font = "Helvetica",
		size = 20,
	})
	self._name:setAnchorPoint(cc.p(0.5,0.5))
	self._name:setColor(cc.c3b(0,0,0))
	self._name:setPosition(cc.p(self:getContentSize().width * 0.5, self:getContentSize().height * 0.5))
	self._name:ignoreAnchorPointForPosition(false)

	self:addChild(self._name)

	self._score = display.newTTFLabel({
		text = "500",
		font = "Helvetica",
		size = 20,
	})
	self._score:setAnchorPoint(cc.p(0.5,0.5))
	self._score:setColor(cc.c3b(0,0,0))
	self._score:setPosition(cc.p(self:getContentSize().width * 0.5, self:getContentSize().height * 0.34127))
	self._score:ignoreAnchorPointForPosition(false)

	self:addChild(self._score)


end



return Myccb_layout