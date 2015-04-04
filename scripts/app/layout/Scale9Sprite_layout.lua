
local Scale9Sprite_layout = class("Scale9Sprite_layout",function()
    return display.newLayer()
end)



function Scale9Sprite_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(cc.size(display.width * 1.0, display.height * 1.0))
	self:ignoreAnchorPointForPosition(true)

	self._title = display.newTTFLabel({
		text = "Scale9Sprite测试",
		font = "Helvetica",
		size = 30,
	})
	self._title:setAnchorPoint(cc.p(0.5,0.5))
	self._title:setPosition(ccbutils.ccb_pos(50,90.9375,4,self))
	self._title:ignoreAnchorPointForPosition(false)


	self:addChild(self._title)


	local ccscale9sprite_2 = display.newScale9Sprite("diban.png")
	ccscale9sprite_2:setPreferredSize(cc.size(200, 94))
	ccscale9sprite_2:setAnchorPoint(cc.p(0.5,0.5))
	ccscale9sprite_2:setPosition(ccbutils.ccb_pos(20,78.125,4,self))
	ccscale9sprite_2:ignoreAnchorPointForPosition(false)

	

	self:addChild(ccscale9sprite_2)


	local cclabelttf_3 = display.newTTFLabel({
		text = "普通Scale9Sprite",
		font = "Helvetica",
		size = 20,
	})
	cclabelttf_3:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_3:setPosition(ccbutils.ccb_pos(185.76,439.2,0,self))
	cclabelttf_3:ignoreAnchorPointForPosition(false)


	self:addChild(cclabelttf_3)


	local ccscale9sprite_4 = display.newScale9Sprite("diban.png")
	ccbutils.addTouchListener(ccscale9sprite_4, handler(_owner, _owner.onBtnClick))
	ccscale9sprite_4:setPreferredSize(cc.size(200, 94))
	ccscale9sprite_4:setAnchorPoint(cc.p(0.5,0.5))
	ccscale9sprite_4:setPosition(ccbutils.ccb_pos(50,78.125,4,self))
	ccscale9sprite_4:ignoreAnchorPointForPosition(false)

	

	self:addChild(ccscale9sprite_4)


	local cclabelttf_5 = display.newTTFLabel({
		text = "点按Scale9Sprite",
		font = "Helvetica",
		size = 20,
	})
	cclabelttf_5:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_5:setPosition(ccbutils.ccb_pos(475.76,439.2,0,self))
	cclabelttf_5:ignoreAnchorPointForPosition(false)


	self:addChild(cclabelttf_5)


	local ccscale9sprite_6 = display.newScale9Sprite("diban.png")
	ccbutils.addTouchListenerEx(ccscale9sprite_6, handler(_owner, _owner.onBtnClick))
	ccscale9sprite_6:setPreferredSize(cc.size(200, 94))
	ccscale9sprite_6:setAnchorPoint(cc.p(0.5,0.5))
	ccscale9sprite_6:setPosition(ccbutils.ccb_pos(80,78.125,4,self))
	ccscale9sprite_6:ignoreAnchorPointForPosition(false)

	

	self:addChild(ccscale9sprite_6)


	local cclabelttf_7 = display.newTTFLabel({
		text = "点按Scale9Sprite",
		font = "Helvetica",
		size = 20,
	})
	cclabelttf_7:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_7:setPosition(ccbutils.ccb_pos(770.76,439.2,0,self))
	cclabelttf_7:ignoreAnchorPointForPosition(false)


	self:addChild(cclabelttf_7)


	local ccscale9sprite_8 = display.newScale9Sprite("diban.png")
	ccscale9sprite_8:setInsetLeft(20);ccscale9sprite_8:setInsetRight(20);
	ccscale9sprite_8 = cc.ui.UIInput.new({
		image = ccscale9sprite_8,
		size = cc.size(self:getContentSize().width * 0.2, self:getContentSize().height * 0.15),
	})
	ccscale9sprite_8:setFontSize(20)
	ccscale9sprite_8:setAnchorPoint(cc.p(0.5,0.5))
	ccscale9sprite_8:setPosition(ccbutils.ccb_pos(20,55,4,self))
	ccscale9sprite_8:ignoreAnchorPointForPosition(false)


	self:addChild(ccscale9sprite_8)


	local cclabelttf_9 = display.newTTFLabel({
		text = "输入框",
		font = "Helvetica",
		size = 20,
	})
	cclabelttf_9:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_9:setPosition(ccbutils.ccb_pos(185.76,289.2,0,self))
	cclabelttf_9:ignoreAnchorPointForPosition(false)


	self:addChild(cclabelttf_9)



end

function Scale9Sprite_layout:onBtnClick(_tag, _sprite)
	error("You should override this methed: <onBtnClick>")
end


return Scale9Sprite_layout