
local Myccb_layout = class("Myccb_layout",function()
    return display.newSprite()
end)



function Myccb_layout:ctor(_owner)
	 _owner = _owner or self
	self:setSpriteFrame(CCBNodeExtend.ccb_display_frame("daxingxing_1.png"))
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:ignoreAnchorPointForPosition(false)

	local ttf_1 = display.newTTFLabel({
		text = "第一名",
		font = "Helvetica",
		size = 20,
	})
	ttf_1:setAnchorPoint(cc.p(0.5,0.5))
	ttf_1:setColor(cc.c3b(0,0,0))
	ttf_1:setPosition(CCBNodeExtend.ccb_pos(50,50,4,self))
	ttf_1:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_1)


	self._name = ttf_1
	local ttf_2 = display.newTTFLabel({
		text = "500",
		font = "Helvetica",
		size = 20,
	})
	ttf_2:setAnchorPoint(cc.p(0.5,0.5))
	ttf_2:setColor(cc.c3b(0,0,0))
	ttf_2:setPosition(CCBNodeExtend.ccb_pos(50,34.126983642578125,4,self))
	ttf_2:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_2)


	self._score = ttf_2

end



return Myccb_layout