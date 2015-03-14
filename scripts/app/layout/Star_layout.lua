
local Star_layout = class("Star_layout",function()
    return display.newNode()
end)



function Star_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(ccp(0.0,0.0))
	self:setIgnoreAnchorPointForPosition(false)

	local menu_1 = display.newNode()
	menu_1:setAnchorPoint(ccp(0.5,0.5))
	menu_1:setPosition(CCBNodeExtend.ccb_pos(0.0,0.0,0,self))
	menu_1:setIgnoreAnchorPointForPosition(true)


	self:addChild(menu_1)


	self.CCMenu = menu_1
	local params = {
		normal = CCBNodeExtend.ccb_display_frame("battle_win/daxingxing_1.png"),
		select = CCBNodeExtend.ccb_display_frame("battle_win/daxingxing_2.png"),
		disable = nil,
		listener = handler(_owner, assert(_owner.onBtnClick,"onBtnClick")),
	}
	local menuitemimage_2 = CCBNodeExtend.newButton(params)
	menuitemimage_2:setAnchorPoint(ccp(0.5,0.5))
	menuitemimage_2:setIgnoreAnchorPointForPosition(false)


	menu_1:addChild(menuitemimage_2)


	self.CCMenuItemImage = menuitemimage_2



end

return Star_layout