
local Star_layout = class("Star_layout",function()
    return display.newNode()
end)



function Star_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(cc.p(0.0,0.0))
	self:ignoreAnchorPointForPosition(false)

	local menu_1 = display.newNode()
	menu_1:setAnchorPoint(cc.p(0.5,0.5))
	menu_1:setPosition(CCBNodeExtend.ccb_pos(0.0,0.0,0,self))
	menu_1:ignoreAnchorPointForPosition(true)


	self:addChild(menu_1)


	self.CCMenu = menu_1
	local menuitemimage_2 = cc.ui.UIPushButton.new({
		normal = "battle_win/daxingxing_1.png",
		pressed = "battle_win/daxingxing_2.png",
	})
	:onButtonClicked(handler(_owner, assert(_owner.onBtnClick,"onBtnClick")))
	menuitemimage_2:setAnchorPoint(cc.p(0.5,0.5))
	menuitemimage_2:ignoreAnchorPointForPosition(false)


	menu_1:addChild(menuitemimage_2)


	self.CCMenuItemImage = menuitemimage_2



end

return Star_layout