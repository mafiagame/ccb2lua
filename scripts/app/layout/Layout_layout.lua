
local Layout_layout = class("Layout_layout",function()
    return display.newLayer()
end)



function Layout_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(ccp(0.5,0.5))
	self:setContentSize(CCBNodeExtend.ccb_size(100,100,1,nil))
	self:setIgnoreAnchorPointForPosition(true)

	local mask_1 = CCLayerColor:create()
	mask_1:setAnchorPoint(ccp(0.5,0.5))
	mask_1:setColor(ccc3(169,169,169))
	mask_1:setContentSize(CCBNodeExtend.ccb_size(100,100,1,self))
	mask_1:setIgnoreAnchorPointForPosition(true)


	self:addChild(mask_1)


	self.CCLayerColor = mask_1
	local scroll_2 = AutoLayout.new()
	scroll_2:setViewSize(CCBNodeExtend.ccb_size(450,500,0,self))
	scroll_2:setDirection(kCCScrollViewDirectionVertical)
	scroll_2:setAnchorPoint(ccp(0.5,0.5))
	scroll_2:setPosition(CCBNodeExtend.ccb_pos(240.31999206542969,340.16000366210938,0,self))
	scroll_2:setIgnoreAnchorPointForPosition(false)


	self:addChild(scroll_2)


	self._vl = scroll_2
	local scroll_3 = AutoLayout.new()
	scroll_3:setViewSize(CCBNodeExtend.ccb_size(450,500,0,self))
	scroll_3:setDirection(kCCScrollViewDirectionHorizontal)
	scroll_3:setAnchorPoint(ccp(0.5,0.5))
	scroll_3:setPosition(CCBNodeExtend.ccb_pos(721.1424560546875,336.20159912109375,0,self))
	scroll_3:setIgnoreAnchorPointForPosition(false)


	self:addChild(scroll_3)


	self._hl = scroll_3
	local ttf_4 = CCLabelTTF:create("纵向", "Helvetica", 30)
	ttf_4:setAnchorPoint(ccp(0.5,0.5))
	ttf_4:setPosition(CCBNodeExtend.ccb_pos(174.18241882324219,35.888031005859375,0,self))
	ttf_4:setIgnoreAnchorPointForPosition(false)


	self:addChild(ttf_4)


	self.CCLabelTTF = ttf_4
	local ttf_5 = CCLabelTTF:create("横向", "Helvetica", 30)
	ttf_5:setAnchorPoint(ccp(0.5,0.5))
	ttf_5:setPosition(CCBNodeExtend.ccb_pos(734.169677734375,41.011241912841797,0,self))
	ttf_5:setIgnoreAnchorPointForPosition(false)


	self:addChild(ttf_5)


	self.CCLabelTTF = ttf_5


end

return Layout_layout