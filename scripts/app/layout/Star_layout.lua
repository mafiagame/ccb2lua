
local Star_layout = class("Star_layout",function()
    return display.newNode()
end)



function Star_layout:ctor(_owner)
	self:setAnchorPoint(ccp(0.0,0.0))
	self:setScaleX(1)
	self:setScaleY(1)
	self:setIgnoreAnchorPointForPosition(false)

	local sprite_1 = display.newSprite()
	sprite_1:setAnchorPoint(ccp(0.5,0.5))
	sprite_1:setScaleX(1)
	sprite_1:setScaleY(1)
	sprite_1:setIgnoreAnchorPointForPosition(false)
	sprite_1:setDisplayFrame(CCBNodeExtend.ccb_display_frame("battle_win/daxingxing_2.png"))


	self:addChild(sprite_1)


	self._daxingxing_2 = sprite_1
	local sprite_2 = display.newSprite()
	CCBNodeExtend.addTouchListener(sprite_2, handler(_owner, assert(_owner.onBtnClick),"onBtnClick"))
	sprite_2:setPosition(CCBNodeExtend.ccb_pos(0.0,30,0,self))
	sprite_2:setAnchorPoint(ccp(0.5,0.5))
	sprite_2:setScaleX(1)
	sprite_2:setScaleY(1)
	sprite_2:setIgnoreAnchorPointForPosition(false)
	sprite_2:setDisplayFrame(CCBNodeExtend.ccb_display_frame("battle_win/daxingxing_1.png"))


	self:addChild(sprite_2)


	self._daxingxing_1 = sprite_2


end

return Star_layout