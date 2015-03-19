
local Label_layout = class("Label_layout",function()
    return display.newLayer()
end)



function Label_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(CCBNodeExtend.ccb_size(100,100,1,nil))
	self:ignoreAnchorPointForPosition(true)

	self._title = display.newTTFLabel({
		text = "Lable测试",
		font = "Helvetica",
		size = 30,
	})
	self._title:setAnchorPoint(cc.p(0.5,0.5))
	self._title:setPosition(CCBNodeExtend.ccb_pos(50,89.375,4,self))
	self._title:ignoreAnchorPointForPosition(false)


	self:addChild(self._title)


	local cclabelttf_2 = display.newTTFLabel({
		text = "这是一个普通label",
		font = "Helvetica",
		size = 30,
	})
	cclabelttf_2:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_2:setPosition(CCBNodeExtend.ccb_pos(17.157495498657227,67.889999389648438,4,self))
	cclabelttf_2:ignoreAnchorPointForPosition(false)


	self:addChild(cclabelttf_2)


	local cclabelbmfont_3 = display.newBMFontLabel({
		text = "0123456789",
		font = "fonts/hurtnumbers.fnt",
	})
	cclabelbmfont_3:setAnchorPoint(cc.p(0.5,0.5))
	cclabelbmfont_3:setPosition(CCBNodeExtend.ccb_pos(279.20004272460938,352.51202392578125,0,self))
	cclabelbmfont_3:ignoreAnchorPointForPosition(false)


	self:addChild(cclabelbmfont_3)


	local cclabelttf_4 = cc.ui.UIInput.new({
		x=0,
		y=0,
		UIInputType = 2,
		text = "这是一个UIInput",
		font = "Helvetica",
		fontSize = 30,
		listener = handler(_owner, _owner.onBtnClick),
	})
	cclabelttf_4:setAnchorPoint(cc.p(0.0,0.5))
	cclabelttf_4:setPosition(CCBNodeExtend.ccb_pos(5,44.375,4,self))
	cclabelttf_4:ignoreAnchorPointForPosition(false)


	self:addChild(cclabelttf_4)


	local cclabelttf_5 = display.newTTFLabel({
		text = "自动换行测试,自动换行测试,自动换行测试,自动换行测试,自动换行测试,自动换行测试,自动换行测试,自动换行测试,",
		font = "Helvetica",
		size = 20,
		align = 0,
		valign = 0,
		dimensions = CCBNodeExtend.ccb_size(300,150,0,self),
	})
	cclabelttf_5:setAnchorPoint(cc.p(0.0,1))
	cclabelttf_5:setPosition(CCBNodeExtend.ccb_pos(4.6875,36.5625,4,self))
	cclabelttf_5:ignoreAnchorPointForPosition(false)


	self:addChild(cclabelttf_5)


	local cclabelttf_6 = display.newTTFLabel({
		text = "Costome Font!!!",
		font = "fonts/Herculanum.ttf",
		size = 30,
	})
	cclabelttf_6:setAnchorPoint(cc.p(0.0,0.5))
	cclabelttf_6:setPosition(CCBNodeExtend.ccb_pos(4.6875,75.625,4,self))
	cclabelttf_6:ignoreAnchorPointForPosition(false)


	self:addChild(cclabelttf_6)



end

function Label_layout:onBtnClick(_tag, _sprite)
	print("You should override this methed: <onBtnClick>",_tag)
end


return Label_layout