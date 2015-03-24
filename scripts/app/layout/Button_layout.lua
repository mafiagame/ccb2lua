
local Button_layout = class("Button_layout",function()
    return display.newLayer()
end)



function Button_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(ccbutils.ccb_size(100,100,1,nil))
	self:ignoreAnchorPointForPosition(true)

	self._title = display.newTTFLabel({
		text = "Button测试",
		font = "Helvetica",
		size = 30,
	})
	self._title:setAnchorPoint(cc.p(0.5,0.5))
	self._title:setPosition(ccbutils.ccb_pos(50,80,4,self))
	self._title:ignoreAnchorPointForPosition(false)


	self:addChild(self._title)


	local ccmenu_2 = display.newNode()
	ccmenu_2:setAnchorPoint(cc.p(0.5,0.5))
	ccmenu_2:setPosition(ccbutils.ccb_pos(0.0,0.0,0,self))
	ccmenu_2:ignoreAnchorPointForPosition(true)


	self:addChild(ccmenu_2)


	local ccmenuitemimage_3 = cc.ui.UIPushButton.new({
		normal = "qianjin_1.png",
		pressed = "qianjin_2.png",
	})
	:onButtonClicked(handler(_owner, _owner.onBtnClick))
	ccmenuitemimage_3:setAnchorPoint(cc.p(0.5,0.5))
	ccmenuitemimage_3:setPosition(ccbutils.ccb_pos(96.768013000488281,402.62405395507812,0,ccmenu_2))
	ccmenuitemimage_3:ignoreAnchorPointForPosition(false)


	ccmenu_2:addChild(ccmenuitemimage_3)


	local ccmenuitemimage_4 = cc.ui.UICheckBoxButton.new({
		on = "CheckBoxButton2On.png",
		off = "CheckBoxButton2Off.png"
	})
	:onButtonClicked(handler(_owner, _owner.onBtnClick))
	ccmenuitemimage_4:setAnchorPoint(cc.p(0.5,0.5))
	ccmenuitemimage_4:setPosition(ccbutils.ccb_pos(356.76800537109375,402.62405395507812,0,ccmenu_2))
	ccmenuitemimage_4:ignoreAnchorPointForPosition(false)


	ccmenu_2:addChild(ccmenuitemimage_4)



	local cclabelttf_5 = display.newTTFLabel({
		text = "普通两态按钮",
		font = "Helvetica",
		size = 30,
	})
	cclabelttf_5:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_5:setPosition(ccbutils.ccb_pos(9.6799945831298828,52.459995269775391,4,self))
	cclabelttf_5:ignoreAnchorPointForPosition(false)


	self:addChild(cclabelttf_5)


	local cclabelttf_6 = display.newTTFLabel({
		text = "开关按钮",
		font = "Helvetica",
		size = 30,
	})
	cclabelttf_6:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_6:setPosition(ccbutils.ccb_pos(37.8125,52.5,4,self))
	cclabelttf_6:ignoreAnchorPointForPosition(false)


	self:addChild(cclabelttf_6)


	local cccontrolbutton_7 = cc.ui.UIPushButton.new({
		normal = "Button01.png",
		pressed = "Button01Pressed.png"
	},{scale9 = true})
	:setButtonSize(200,50)
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
	cccontrolbutton_7:setPosition(ccbutils.ccb_pos(632.44805908203125,397.44003295898438,0,self))
	cccontrolbutton_7:ignoreAnchorPointForPosition(false)


	self:addChild(cccontrolbutton_7)


	local cclabelttf_8 = display.newTTFLabel({
		text = "Control按钮",
		font = "Helvetica",
		size = 30,
	})
	cclabelttf_8:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_8:setPosition(ccbutils.ccb_pos(65.9375,52.5,4,self))
	cclabelttf_8:ignoreAnchorPointForPosition(false)


	self:addChild(cclabelttf_8)



end

function Button_layout:onBtnClick(_tag, _sprite)
	print("You should override this methed: <onBtnClick>",_tag)
end


return Button_layout