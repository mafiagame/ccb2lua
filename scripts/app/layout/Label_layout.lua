
local Label_layout = class("Label_layout",function()
    return display.newLayer()
end)





function Label_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(cc.size(display.width * 1.0, display.height * 1.0))
	self:ignoreAnchorPointForPosition(true)

	self._title = display.newTTFLabel({
		text = "Lable测试",
		font = "Helvetica",
		size = 30,
	})
	self._title:setAnchorPoint(cc.p(0.5,0.5))
	self._title:setPosition(cc.p(self:getContentSize().width * 0.5, self:getContentSize().height * 0.89375))
	self._title:ignoreAnchorPointForPosition(false)

	self:addChild(self._title)

	local cclabelttf_2 = display.newTTFLabel({
		text = "这是一个普通label",
		font = "Helvetica",
		size = 30,
	})
	cclabelttf_2:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_2:setPosition(cc.p(self:getContentSize().width * 0.171575, self:getContentSize().height * 0.6789))
	cclabelttf_2:ignoreAnchorPointForPosition(false)

	self:addChild(cclabelttf_2)

	local cclabelbmfont_3 = display.newBMFontLabel({
		text = "0123456789",
		font = "fonts/hurtnumbers.fnt",
	})
	cclabelbmfont_3:setAnchorPoint(cc.p(0.5,0.5))
	cclabelbmfont_3:setPosition(cc.p(279.2, 352.512))
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
	cclabelttf_4:setPosition(cc.p(self:getContentSize().width * 0.05, self:getContentSize().height * 0.44375))
	cclabelttf_4:ignoreAnchorPointForPosition(false)

	self:addChild(cclabelttf_4)

	local cclabelttf_5 = display.newTTFLabel({
		text = "自动换行测试,自动换行测试,自动换行测试,自动换行测试,自动换行测试,自动换行测试,自动换行测试,自动换行测试,",
		font = "Helvetica",
		size = 20,
		align = 0,
		valign = 0,
		dimensions = cc.size(300, 150),
	})
	cclabelttf_5:setAnchorPoint(cc.p(0.0,1))
	cclabelttf_5:setPosition(cc.p(self:getContentSize().width * 0.046875, self:getContentSize().height * 0.365625))
	cclabelttf_5:ignoreAnchorPointForPosition(false)

	self:addChild(cclabelttf_5)

	local cclabelttf_6 = display.newTTFLabel({
		text = "Costome Font!!!",
		font = "fonts/Herculanum.ttf",
		size = 30,
	})
	cclabelttf_6:setAnchorPoint(cc.p(0.0,0.5))
	cclabelttf_6:setPosition(cc.p(self:getContentSize().width * 0.046875, self:getContentSize().height * 0.75625))
	cclabelttf_6:ignoreAnchorPointForPosition(false)

	self:addChild(cclabelttf_6)


end

function Label_layout:onBtnClick(_tag, _sprite)
	error("You should override this methed: <onBtnClick>")
end


return Label_layout