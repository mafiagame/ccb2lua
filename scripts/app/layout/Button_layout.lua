
local Button_layout = class("Button_layout",function()
    return display.newLayer()
end)



function Button_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(CCBNodeExtend.ccb_size(100,100,1,nil))
	self:ignoreAnchorPointForPosition(true)

	local ttf_1 = display.newTTFLabel({
		text = "Button测试",
		font = "Helvetica",
		size = 30,
	})
	ttf_1:setAnchorPoint(cc.p(0.5,0.5))
	ttf_1:setPosition(CCBNodeExtend.ccb_pos(50,80,4,self))
	ttf_1:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_1)


	self._title = ttf_1
	local menu_2 = display.newNode()
	menu_2:setAnchorPoint(cc.p(0.5,0.5))
	menu_2:setPosition(CCBNodeExtend.ccb_pos(0.0,0.0,0,self))
	menu_2:ignoreAnchorPointForPosition(true)


	self:addChild(menu_2)


	self.CCMenu = menu_2
	local menuitemimage_3 = cc.ui.UIPushButton.new({
		normal = "qianjin_1.png",
		pressed = "qianjin_2.png",
	})
	:onButtonClicked(handler(_owner, assert(_owner.onBtnClick,"onBtnClick")))
	menuitemimage_3:setAnchorPoint(cc.p(0.5,0.5))
	menuitemimage_3:setPosition(CCBNodeExtend.ccb_pos(96.768013000488281,402.62405395507812,0,menu_2))
	menuitemimage_3:ignoreAnchorPointForPosition(false)


	menu_2:addChild(menuitemimage_3)


	self.CCMenuItemImage = menuitemimage_3
	local menuitemimage_4 = cc.ui.UICheckBoxButton.new({
		on = "CheckBoxButton2On.png",
		off = "CheckBoxButton2Off.png"
	})
	:onButtonClicked(handler(_owner, assert(_owner.onBtnClick,"onBtnClick")))
	menuitemimage_4:setAnchorPoint(cc.p(0.5,0.5))
	menuitemimage_4:setPosition(CCBNodeExtend.ccb_pos(356.76800537109375,402.62405395507812,0,menu_2))
	menuitemimage_4:ignoreAnchorPointForPosition(false)


	menu_2:addChild(menuitemimage_4)


	self.CCMenuItemImage = menuitemimage_4

	local ttf_5 = display.newTTFLabel({
		text = "普通两态按钮",
		font = "Helvetica",
		size = 30,
	})
	ttf_5:setAnchorPoint(cc.p(0.5,0.5))
	ttf_5:setPosition(CCBNodeExtend.ccb_pos(9.6799945831298828,52.459995269775391,4,self))
	ttf_5:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_5)


	self.CCLabelTTF = ttf_5
	local ttf_6 = display.newTTFLabel({
		text = "开关按钮",
		font = "Helvetica",
		size = 30,
	})
	ttf_6:setAnchorPoint(cc.p(0.5,0.5))
	ttf_6:setPosition(CCBNodeExtend.ccb_pos(37.8125,52.5,4,self))
	ttf_6:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_6)


	self.CCLabelTTF = ttf_6
	local cccb_7 = cc.ui.UIPushButton.new({
		normal = "Button01.png",
		pressed = "Button01Pressed.png"
	},{scale9 = true})
	:setButtonSize(200,50)
	:onButtonClicked(handler(_owner, assert(_owner.onBtnClick,"onBtnClick")))
	local label = cc.ui.UILabel.new({
            UILabelType = 2,
            font = "Helvetica",
            text = "按钮",
            size = 24,
            color = cc.c3b(255,255,255),
        })
	label:setAnchorPoint(cc.p(0.5,0.5))
	cccb_7:setButtonLabel("normal", label)
	cccb_7:setAnchorPoint(cc.p(0.5,0.5))
	cccb_7:setPosition(CCBNodeExtend.ccb_pos(632.44805908203125,397.44003295898438,0,self))
	cccb_7:ignoreAnchorPointForPosition(false)


	self:addChild(cccb_7)


	self.CCControlButton = cccb_7
	local ttf_8 = display.newTTFLabel({
		text = "Control按钮",
		font = "Helvetica",
		size = 30,
	})
	ttf_8:setAnchorPoint(cc.p(0.5,0.5))
	ttf_8:setPosition(CCBNodeExtend.ccb_pos(65.9375,52.5,4,self))
	ttf_8:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_8)


	self.CCLabelTTF = ttf_8


end

return Button_layout