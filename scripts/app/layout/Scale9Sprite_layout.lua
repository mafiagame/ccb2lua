
local Scale9Sprite_layout = class("Scale9Sprite_layout",function()
    return display.newLayer()
end)



function Scale9Sprite_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(CCBNodeExtend.ccb_size(100,100,1,nil))
	self:ignoreAnchorPointForPosition(true)

	self._title = display.newTTFLabel({
		text = "Scale9Sprite测试",
		font = "Helvetica",
		size = 30,
	})
	self._title:setAnchorPoint(cc.p(0.5,0.5))
	self._title:setPosition(CCBNodeExtend.ccb_pos(50,90.9375,4,self))
	self._title:ignoreAnchorPointForPosition(false)


	self:addChild(self._title)


	local ccscale9sprite_2 = display.newScale9Sprite("diban.png")
	CCBNodeExtend.cap_insets(ccscale9sprite_2,0.0,0.0,0.0,0.0)
	ccscale9sprite_2:setAnchorPoint(cc.p(0.5,0.5))
	ccscale9sprite_2:setPosition(CCBNodeExtend.ccb_pos(20,78.125,4,self))
	ccscale9sprite_2:setPreferredSize(CCBNodeExtend.ccb_size(200,94,0,self))
	ccscale9sprite_2:ignoreAnchorPointForPosition(false)


	self:addChild(ccscale9sprite_2)


	local cclabelttf_3 = display.newTTFLabel({
		text = "普通Scale9Sprite",
		font = "Helvetica",
		size = 20,
	})
	cclabelttf_3:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_3:setPosition(CCBNodeExtend.ccb_pos(185.760009765625,439.20001220703125,0,self))
	cclabelttf_3:ignoreAnchorPointForPosition(false)


	self:addChild(cclabelttf_3)


	local ccscale9sprite_4 = display.newScale9Sprite("diban.png")
	CCBNodeExtend.addTouchListener(ccscale9sprite_4, handler(_owner, _owner.onBtnClick))
	CCBNodeExtend.cap_insets(ccscale9sprite_4,0.0,0.0,0.0,0.0)
	ccscale9sprite_4:setAnchorPoint(cc.p(0.5,0.5))
	ccscale9sprite_4:setPosition(CCBNodeExtend.ccb_pos(50,78.125,4,self))
	ccscale9sprite_4:setPreferredSize(CCBNodeExtend.ccb_size(200,94,0,self))
	ccscale9sprite_4:ignoreAnchorPointForPosition(false)


	self:addChild(ccscale9sprite_4)


	local cclabelttf_5 = display.newTTFLabel({
		text = "点按Scale9Sprite",
		font = "Helvetica",
		size = 20,
	})
	cclabelttf_5:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_5:setPosition(CCBNodeExtend.ccb_pos(475.760009765625,439.20001220703125,0,self))
	cclabelttf_5:ignoreAnchorPointForPosition(false)


	self:addChild(cclabelttf_5)


	local ccscale9sprite_6 = display.newScale9Sprite("diban.png")
	CCBNodeExtend.addTouchListenerEx(ccscale9sprite_6, handler(_owner, _owner.onBtnClick))
	CCBNodeExtend.cap_insets(ccscale9sprite_6,0.0,0.0,0.0,0.0)
	ccscale9sprite_6:setAnchorPoint(cc.p(0.5,0.5))
	ccscale9sprite_6:setPosition(CCBNodeExtend.ccb_pos(80,78.125,4,self))
	ccscale9sprite_6:setPreferredSize(CCBNodeExtend.ccb_size(200,94,0,self))
	ccscale9sprite_6:ignoreAnchorPointForPosition(false)


	self:addChild(ccscale9sprite_6)


	local cclabelttf_7 = display.newTTFLabel({
		text = "点按Scale9Sprite",
		font = "Helvetica",
		size = 20,
	})
	cclabelttf_7:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_7:setPosition(CCBNodeExtend.ccb_pos(770.760009765625,439.20001220703125,0,self))
	cclabelttf_7:ignoreAnchorPointForPosition(false)


	self:addChild(cclabelttf_7)


	local ccscale9sprite_8 = display.newScale9Sprite("diban.png")
	CCBNodeExtend.cap_insets(ccscale9sprite_8,20,0.0,20,0.0)
	ccscale9sprite_8 = cc.ui.UIInput.new({
		image = ccscale9sprite_8,
		size = CCBNodeExtend.ccb_size(200,94,0,self),
	})
	ccscale9sprite_8:setFontSize(20)
	ccscale9sprite_8:setAnchorPoint(cc.p(0.5,0.5))
	ccscale9sprite_8:setPosition(CCBNodeExtend.ccb_pos(20,55,4,self))
	ccscale9sprite_8:ignoreAnchorPointForPosition(false)


	self:addChild(ccscale9sprite_8)


	local cclabelttf_9 = display.newTTFLabel({
		text = "输入框",
		font = "Helvetica",
		size = 20,
	})
	cclabelttf_9:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_9:setPosition(CCBNodeExtend.ccb_pos(185.760009765625,289.20001220703125,0,self))
	cclabelttf_9:ignoreAnchorPointForPosition(false)


	self:addChild(cclabelttf_9)



end

function Scale9Sprite_layout:onBtnClick(_tag, _sprite)
	print("You should override this methed: <onBtnClick>",_tag)
end


return Scale9Sprite_layout