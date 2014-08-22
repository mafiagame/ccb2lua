
local Star_layout = class("Star_layout",function()
    return display.newNode()
end)


function Star_layout:ctor(_owner)
	self:setAnchorPoint(ccp(0.0,0.0))
	self:setScaleX(1)
	self:setScaleY(1)
	self:setIgnoreAnchorPointForPosition(false)

	local sprite = display.newSprite()
	sprite:setAnchorPoint(ccp(0.5,0.5))
	sprite:setScaleX(1)
	sprite:setScaleY(1)
	sprite:setIgnoreAnchorPointForPosition(false)
	sprite:setDisplayFrame(CCBNodeExtend.ccb_display_frame("battle_win/daxingxing_2.png"))
	sprite:setDisplayFrame(CCBNodeExtend.ccb_display_frame("battle_win/daxingxing_2.png"))

	self:addChild(sprite)


	local sprite = display.newSprite()
	sprite:setAnchorPoint(ccp(0.5,0.5))
	sprite:setScaleX(1)
	sprite:setScaleY(1)
	sprite:setIgnoreAnchorPointForPosition(false)
	sprite:setDisplayFrame(CCBNodeExtend.ccb_display_frame("battle_win/daxingxing_1.png"))
	sprite:setDisplayFrame(CCBNodeExtend.ccb_display_frame("battle_win/daxingxing_1.png"))

	self:addChild(sprite)






end

return Star_layout