
local subdir_subButton_layout = class("subdir_subButton_layout",function()
    return display.newLayer()
end)





function subdir_subButton_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(cc.size(display.width * 1.0, display.height * 1.0))
	self:ignoreAnchorPointForPosition(true)

	self._title = display.newTTFLabel({
		text = "Button测试",
		font = "Helvetica",
		size = 30,
	})
	self._title:setAnchorPoint(cc.p(0.5,0.5))
	self._title:setPosition(cc.p(self:getContentSize().width * 0.5, self:getContentSize().height * 0.8))
	self._title:ignoreAnchorPointForPosition(false)

	self:addChild(self._title)

	local ccmenu_2 = display.newNode()
	ccmenu_2:setAnchorPoint(cc.p(0.5,0.5))
	ccmenu_2:ignoreAnchorPointForPosition(true)

	self:addChild(ccmenu_2)

	local ccmenuitemimage_3 = cc.ui.UIPushButton.new({
		normal = "qianjin_1.png",
		pressed = "qianjin_2.png",
	})
	:onButtonClicked(handler(_owner, _owner.onBtnClick))
	ccmenuitemimage_3:setAnchorPoint(cc.p(0.5,0.5))
	ccmenuitemimage_3:setPosition(cc.p(96.768, 402.6241))
	ccmenuitemimage_3:ignoreAnchorPointForPosition(false)

	ccmenu_2:addChild(ccmenuitemimage_3)

	local ccmenuitemimage_4 = cc.ui.UICheckBoxButton.new({
		on = "CheckBoxButton2On.png",
		off = "CheckBoxButton2Off.png"
	})
	:onButtonClicked(handler(_owner, _owner.onBtnClick))
	ccmenuitemimage_4:setAnchorPoint(cc.p(0.5,0.5))
	ccmenuitemimage_4:setPosition(cc.p(356.768, 402.6241))
	ccmenuitemimage_4:ignoreAnchorPointForPosition(false)

	ccmenu_2:addChild(ccmenuitemimage_4)

	local cclabelttf_5 = display.newTTFLabel({
		text = "普通两态按钮",
		font = "Helvetica",
		size = 30,
	})
	cclabelttf_5:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_5:setPosition(cc.p(self:getContentSize().width * 0.0968, self:getContentSize().height * 0.5246))
	cclabelttf_5:ignoreAnchorPointForPosition(false)

	self:addChild(cclabelttf_5)

	local cclabelttf_6 = display.newTTFLabel({
		text = "开关按钮",
		font = "Helvetica",
		size = 30,
	})
	cclabelttf_6:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_6:setPosition(cc.p(self:getContentSize().width * 0.378125, self:getContentSize().height * 0.525))
	cclabelttf_6:ignoreAnchorPointForPosition(false)

	self:addChild(cclabelttf_6)

	local cccontrolbutton_7 = cc.ui.UIPushButton.new({
		normal = "Button01.png",
		pressed = "Button01Pressed.png"
	},{scale9 = true})
	:setButtonSize(self:getContentSize().width * 0.2, self:getContentSize().height * 0.08)
	:onButtonClicked(handler(_owner, _owner.onBtnClick))
	local label = cc.ui.UILabel.new({
            UILabelType = 2,
            font = "Helvetica",
            text = "按钮",
            size = 24,
            color = cc.c3b(255,255,255),
        })
	label:setAnchorPoint(cc.p(0.5,0.5))
	cccontrolbutton_7:setButtonLabel("normal", label)
	cccontrolbutton_7:setAnchorPoint(cc.p(0.5,0.5))
	cccontrolbutton_7:setPosition(cc.p(632.4481, 397.44))
	cccontrolbutton_7:ignoreAnchorPointForPosition(false)

	self:addChild(cccontrolbutton_7)

	local cclabelttf_8 = display.newTTFLabel({
		text = "Control按钮",
		font = "Helvetica",
		size = 30,
	})
	cclabelttf_8:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_8:setPosition(cc.p(self:getContentSize().width * 0.659375, self:getContentSize().height * 0.525))
	cclabelttf_8:ignoreAnchorPointForPosition(false)

	self:addChild(cclabelttf_8)


end

function subdir_subButton_layout:onBtnClick(_tag, _sprite)
	error("You should override this methed: <onBtnClick>")
end


return subdir/subButton_layout