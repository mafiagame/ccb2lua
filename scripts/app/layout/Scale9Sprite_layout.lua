
local Scale9Sprite_layout = class("Scale9Sprite_layout",function()
    return display.newLayer()
end)



function Scale9Sprite_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(CCBNodeExtend.ccb_size(100,100,1,nil))
	self:ignoreAnchorPointForPosition(true)

	local ttf_1 = display.newTTFLabel({
		text = "Scale9Sprite测试",
		font = "Helvetica",
		size = 30,
	})
	ttf_1:setAnchorPoint(cc.p(0.5,0.5))
	ttf_1:setPosition(CCBNodeExtend.ccb_pos(50,90.9375,4,self))
	ttf_1:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_1)


	self._title = ttf_1
	local sprite9_2 = display.newScale9Sprite("diban.png")
	CCBNodeExtend.cap_insets(sprite9_2,0.0,0.0,0.0,0.0)
	sprite9_2:setAnchorPoint(cc.p(0.5,0.5))
	sprite9_2:setPosition(CCBNodeExtend.ccb_pos(20,78.125,4,self))
	sprite9_2:setPreferredSize(CCBNodeExtend.ccb_size(200,94,0,self))
	sprite9_2:ignoreAnchorPointForPosition(false)


	self:addChild(sprite9_2)


	self.CCScale9Sprite = sprite9_2
	local ttf_3 = display.newTTFLabel({
		text = "普通Scale9Sprite",
		font = "Helvetica",
		size = 20,
	})
	ttf_3:setAnchorPoint(cc.p(0.5,0.5))
	ttf_3:setPosition(CCBNodeExtend.ccb_pos(185.760009765625,439.20001220703125,0,self))
	ttf_3:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_3)


	self.CCLabelTTF = ttf_3
	local sprite9_4 = display.newScale9Sprite("diban.png")
	CCBNodeExtend.addTouchListener(sprite9_4, handler(_owner, assert(_owner.onBtnClick,"onBtnClick")))
	CCBNodeExtend.cap_insets(sprite9_4,0.0,0.0,0.0,0.0)
	sprite9_4:setAnchorPoint(cc.p(0.5,0.5))
	sprite9_4:setPosition(CCBNodeExtend.ccb_pos(50,78.125,4,self))
	sprite9_4:setPreferredSize(CCBNodeExtend.ccb_size(200,94,0,self))
	sprite9_4:ignoreAnchorPointForPosition(false)


	self:addChild(sprite9_4)


	self.CCScale9Sprite = sprite9_4
	local ttf_5 = display.newTTFLabel({
		text = "点按Scale9Sprite",
		font = "Helvetica",
		size = 20,
	})
	ttf_5:setAnchorPoint(cc.p(0.5,0.5))
	ttf_5:setPosition(CCBNodeExtend.ccb_pos(475.760009765625,439.20001220703125,0,self))
	ttf_5:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_5)


	self.CCLabelTTF = ttf_5
	local sprite9_6 = display.newScale9Sprite("diban.png")
	CCBNodeExtend.addTouchListenerEx(sprite9_6, handler(_owner, assert(_owner.onBtnClick,"onBtnClick")))
	CCBNodeExtend.cap_insets(sprite9_6,0.0,0.0,0.0,0.0)
	sprite9_6:setAnchorPoint(cc.p(0.5,0.5))
	sprite9_6:setPosition(CCBNodeExtend.ccb_pos(80,78.125,4,self))
	sprite9_6:setPreferredSize(CCBNodeExtend.ccb_size(200,94,0,self))
	sprite9_6:ignoreAnchorPointForPosition(false)


	self:addChild(sprite9_6)


	self.CCScale9Sprite = sprite9_6
	local ttf_7 = display.newTTFLabel({
		text = "点按Scale9Sprite",
		font = "Helvetica",
		size = 20,
	})
	ttf_7:setAnchorPoint(cc.p(0.5,0.5))
	ttf_7:setPosition(CCBNodeExtend.ccb_pos(770.760009765625,439.20001220703125,0,self))
	ttf_7:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_7)


	self.CCLabelTTF = ttf_7
	local sprite9_8 = display.newScale9Sprite("diban.png")
	CCBNodeExtend.cap_insets(sprite9_8,20,0.0,20,0.0)
	sprite9_8 = cc.ui.UIInput.new({
		image = sprite9_8,
		size = CCBNodeExtend.ccb_size(200,94,0,self),
	})
	sprite9_8:setFontSize(20)
	sprite9_8:setAnchorPoint(cc.p(0.5,0.5))
	sprite9_8:setPosition(CCBNodeExtend.ccb_pos(20,55,4,self))
	sprite9_8:ignoreAnchorPointForPosition(false)


	self:addChild(sprite9_8)


	self.CCScale9Sprite = sprite9_8
	local ttf_9 = display.newTTFLabel({
		text = "输入框",
		font = "Helvetica",
		size = 20,
	})
	ttf_9:setAnchorPoint(cc.p(0.5,0.5))
	ttf_9:setPosition(CCBNodeExtend.ccb_pos(185.760009765625,289.20001220703125,0,self))
	ttf_9:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_9)


	self.CCLabelTTF = ttf_9


end

return Scale9Sprite_layout