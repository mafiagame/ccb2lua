
local Myccb_layout = class("Myccb_layout",function()
    return display.newSprite()
end)



function Myccb_layout:ctor(_owner)
	 _owner = _owner or self
	self:setSpriteFrame(CCBNodeExtend.ccb_display_frame("daxingxing_1.png"))
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:ignoreAnchorPointForPosition(false)

	self._name = display.newTTFLabel({
		text = "第一名",
		font = "Helvetica",
		size = 20,
	})
	self._name:setAnchorPoint(cc.p(0.5,0.5))
	self._name:setColor(cc.c3b(0,0,0))
	self._name:setPosition(CCBNodeExtend.ccb_pos(50,50,4,self))
	self._name:ignoreAnchorPointForPosition(false)


	self:addChild(self._name)


	self._score = display.newTTFLabel({
		text = "500",
		font = "Helvetica",
		size = 20,
	})
	self._score:setAnchorPoint(cc.p(0.5,0.5))
	self._score:setColor(cc.c3b(0,0,0))
	self._score:setPosition(CCBNodeExtend.ccb_pos(50,34.126983642578125,4,self))
	self._score:ignoreAnchorPointForPosition(false)


	self:addChild(self._score)



end



return Myccb_layout