
local Label_layout = class("Label_layout",function()
    return display.newLayer()
end)



function Label_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(CCBNodeExtend.ccb_size(100,100,1,nil))
	self:ignoreAnchorPointForPosition(true)

	local ttf_1 = display.newTTFLabel({
		text = "Lable测试",
		font = "Helvetica",
		size = 30,
	})
	ttf_1:setAnchorPoint(cc.p(0.5,0.5))
	ttf_1:setPosition(CCBNodeExtend.ccb_pos(50,89.375,4,self))
	ttf_1:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_1)


	self._title = ttf_1
	local ttf_2 = display.newTTFLabel({
		text = "这是一个普通label",
		font = "Helvetica",
		size = 30,
	})
	ttf_2:setAnchorPoint(cc.p(0.5,0.5))
	ttf_2:setPosition(CCBNodeExtend.ccb_pos(17.157495498657227,67.889999389648438,4,self))
	ttf_2:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_2)


	self.CCLabelTTF = ttf_2
	local ttf_3 = display.newBMFontLabel({
		text = "0123456789",
		font = "fonts/hurtnumbers.fnt",
	})
	ttf_3:setAnchorPoint(cc.p(0.5,0.5))
	ttf_3:setPosition(CCBNodeExtend.ccb_pos(279.20004272460938,352.51202392578125,0,self))
	ttf_3:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_3)


	self.CCLabelBMFont = ttf_3
	local ttf_4 = cc.ui.UIInput.new({
		x=0,
		y=0,
		UIInputType = 2,
		text = "这是一个UIInput",
		font = "Helvetica",
		fontSize = 30,
		listener = handler(_owner, assert(_owner.onBtnClick,"onBtnClick")),
	})
	ttf_4:setAnchorPoint(cc.p(0.0,0.5))
	ttf_4:setPosition(CCBNodeExtend.ccb_pos(5,44.375,4,self))
	ttf_4:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_4)


	self.CCLabelTTF = ttf_4
	local ttf_5 = display.newTTFLabel({
		text = "自动换行测试,自动换行测试,自动换行测试,自动换行测试,自动换行测试,自动换行测试,自动换行测试,自动换行测试,",
		font = "Helvetica",
		size = 20,
		align = 0,
		valign = 0,
		dimensions = CCBNodeExtend.ccb_size(300,150,0,self),
	})
	ttf_5:setAnchorPoint(cc.p(0.0,1))
	ttf_5:setPosition(CCBNodeExtend.ccb_pos(4.6875,36.5625,4,self))
	ttf_5:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_5)


	self.CCLabelTTF = ttf_5
	local ttf_6 = display.newTTFLabel({
		text = "Costome Font!!!",
		font = "fonts/Herculanum.ttf",
		size = 30,
	})
	ttf_6:setAnchorPoint(cc.p(0.0,0.5))
	ttf_6:setPosition(CCBNodeExtend.ccb_pos(4.6875,75.625,4,self))
	ttf_6:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_6)


	self.CCLabelTTF = ttf_6

end

function Label_layout:onBtnClick(_tag, _sprite)
	print("You should override this methed: <onBtnClick>",_tag)
end


return Label_layout