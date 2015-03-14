
local Layer_layout = class("Layer_layout",function()
    return display.newLayer()
end)



function Layer_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(ccp(0.5,0.5))
	self:setContentSize(CCBNodeExtend.ccb_size(100,100,1,nil))
	self:setIgnoreAnchorPointForPosition(true)

	local mask_1 = CCLayerColor:create()
	mask_1:setOpacity(150)
	mask_1:setAnchorPoint(ccp(0.5,0.5))
	mask_1:setColor(ccc3(170,121,65))
	mask_1:setContentSize(CCBNodeExtend.ccb_size(100,100,1,self))
	mask_1:setIgnoreAnchorPointForPosition(true)


	self:addChild(mask_1)


	self.CCLayerColor = mask_1
	local node_2 = display.newNode()
	node_2:setPosition(CCBNodeExtend.ccb_pos(50,50,4,self))
	node_2:setAnchorPoint(ccp(0.0,0.0))
	node_2:setIgnoreAnchorPointForPosition(false)


	self:addChild(node_2)


	self.CCNode = node_2
	local sprite_3 = display.newSprite()
	CCBNodeExtend.addTouchListenerEx(sprite_3, handler(_owner, assert(_owner.onBtnReady,"onBtnReady")))
	sprite_3:setDisplayFrame(CCBNodeExtend.ccb_display_frame("battle_win/guang.png"))
	sprite_3:setPosition(CCBNodeExtend.ccb_pos(-265.36007690429688,120.19998168945312,0,node_2))
	sprite_3:setScale(0.69999998807907104)
	sprite_3:setAnchorPoint(ccp(0.5,0.5))
	sprite_3:setIgnoreAnchorPointForPosition(false)


	node_2:addChild(sprite_3)


	self.guang = sprite_3
	local ccb_4 = require("app.scenes.Star").new(_owner)
	ccb_4:setVisible(false)
	ccb_4:setTag(2)
	ccb_4:setPosition(CCBNodeExtend.ccb_pos(-150,230,0,node_2))


	node_2:addChild(ccb_4)


	self.Star = ccb_4
	local ccb_5 = require("app.scenes.Star").new(_owner)
	ccb_5:setPosition(CCBNodeExtend.ccb_pos(-159.072021484375,-139.72004699707031,0,node_2))
	ccb_5:setTag(3)


	node_2:addChild(ccb_5)


	self.Star = ccb_5
	local ttf_6 = CCLabelTTF:create("您\n赢\n了", "Helvetica", 80)
	ttf_6:setAnchorPoint(ccp(0.5,0.5))
	ttf_6:setColor(ccc3(0,249,0))
	ttf_6:setPosition(CCBNodeExtend.ccb_pos(-441.04010009765625,38.52001953125,0,node_2))
	ttf_6:setIgnoreAnchorPointForPosition(false)


	node_2:addChild(ttf_6)


	self.CCLabelTTF = ttf_6
	local sprite9_7 = CCScale9Sprite:createWithSpriteFrame(CCBNodeExtend.ccb_display_frame("battle_win/luxietiaodi.png"))
	CCBNodeExtend.cap_insets(sprite9_7,0.0,0.0,0.0,0.0)
	sprite9_7:setAnchorPoint(ccp(0.0,0.5))
	sprite9_7:setPosition(CCBNodeExtend.ccb_pos(-270,-60,0,node_2))
	sprite9_7:setPreferredSize(CCBNodeExtend.ccb_size(600,50,0,node_2))
	sprite9_7:setIgnoreAnchorPointForPosition(false)


	node_2:addChild(sprite9_7)


	self.CCScale9Sprite = sprite9_7
	local sprite9_8 = CCScale9Sprite:createWithSpriteFrame(CCBNodeExtend.ccb_display_frame("battle_win/luxietiao.png"))
	CCBNodeExtend.cap_insets(sprite9_8,0.0,0.0,0.0,0.0)
	sprite9_8:setAnchorPoint(ccp(0.0,0.5))
	sprite9_8:setPosition(CCBNodeExtend.ccb_pos(-270,-61,0,node_2))
	sprite9_8:setPreferredSize(CCBNodeExtend.ccb_size(600,42,0,node_2))
	sprite9_8:setIgnoreAnchorPointForPosition(false)

	sprite9_8 = CCBNodeExtend.newProgressBar(sprite9_8)

	node_2:addChild(sprite9_8)


	self._progress = sprite9_8
	local ttf_9 = require("app.scenes.MyTTF").new({
		text = "1如果实在要买电脑，旧电脑怎么处理才比较安全？拿了硬盘？拿了主板？还是？2win8能装03的office么？不要烧死，我试过用07的做，一些功能我用07的做出来效果不一样了，不是我要的那种。",
		font = "Helvetica",
		size = 25,
		align = 2,
		valign = 0,
		tag = 1,
		dimensions = CCBNodeExtend.ccb_size(500,200,0,node_2),
	})
	ttf_9:setAnchorPoint(ccp(0.5,0.5))
	ttf_9:setColor(ccc3(255,38,30))
	ttf_9:setTag(1)
	ttf_9:setPosition(CCBNodeExtend.ccb_pos(-228.56004333496094,220.92001342773438,0,node_2))
	ttf_9:setIgnoreAnchorPointForPosition(false)


	node_2:addChild(ttf_9)


	self.CCLabelTTF = ttf_9
	local sprite9_10 = CCScale9Sprite:createWithSpriteFrame(CCBNodeExtend.ccb_display_frame("battle_win/luxietiao.png"))
	CCBNodeExtend.cap_insets(sprite9_10,0.0,0.0,0.0,0.0)
	sprite9_10:setAnchorPoint(ccp(0.0,0.5))
	sprite9_10:setPosition(CCBNodeExtend.ccb_pos(-193.00003051757812,286.20001220703125,0,node_2))
	sprite9_10:setPreferredSize(CCBNodeExtend.ccb_size(300,42,0,node_2))
	sprite9_10:setIgnoreAnchorPointForPosition(false)

	sprite9_10 = CCBNodeExtend.newEditBox({
		scale9 = sprite9_10,
		listener = handler(_owner, assert(_owner.onEditBoxEvent,"onEditBoxEvent")),
	})

	node_2:addChild(sprite9_10)


	self._editor = sprite9_10
	local ttf_11 = CCLabelTTF:create("您", "Helvetica", 80)
	ttf_11:setAnchorPoint(ccp(0.5,0.5))
	ttf_11:setColor(ccc3(0,249,0))
	ttf_11:setSkewX(40)
	ttf_11:setPosition(CCBNodeExtend.ccb_pos(-323.04010009765625,-53.47998046875,0,node_2))
	ttf_11:setIgnoreAnchorPointForPosition(false)


	node_2:addChild(ttf_11)


	self.CCLabelTTF = ttf_11
	local sprite_12 = display.newSprite()
	sprite_12:setDisplayFrame(CCBNodeExtend.ccb_display_frame("battle_win/guang.png"))
	sprite_12:setPosition(CCBNodeExtend.ccb_pos(192.63992309570312,-33.800018310546875,0,node_2))
	sprite_12:setScaleX(0.20000000298023224)
	sprite_12:setScaleY(0.5)
	sprite_12:setAnchorPoint(ccp(0.5,0.5))
	sprite_12:setIgnoreAnchorPointForPosition(false)


	node_2:addChild(sprite_12)


	self.CCSprite = sprite_12
	local ttf_13 = require("app.scenes.MyRichLabel").new({
		text = "1如果实在要买电脑，旧电脑怎么处理才比较安全？拿了硬盘？拿了主板？还是？2win8能装03的office么？不要烧死，我试过用07的做，一些功能我用07的做出来效果不一样了，不是我要的那种。",
		font = "Helvetica",
		size = 25,
		align = 2,
		valign = 0,
		tag = 1,
		dimensions = CCBNodeExtend.ccb_size(500,200,0,node_2),
	})
	ttf_13:setAnchorPoint(ccp(0.5,0.5))
	ttf_13:setColor(ccc3(255,38,30))
	ttf_13:setTag(1)
	ttf_13:setPosition(CCBNodeExtend.ccb_pos(231.43995666503906,-219.07998657226562,0,node_2))
	ttf_13:setIgnoreAnchorPointForPosition(false)


	node_2:addChild(ttf_13)


	self._richlabel = ttf_13

	local sprite_14 = display.newSprite()
	sprite_14:setDisplayFrame(CCBNodeExtend.ccb_display_frame("battle_win/tiao.png"))
	sprite_14:setPosition(CCBNodeExtend.ccb_pos(50,48.4375,4,self))
	sprite_14:setAnchorPoint(ccp(0.5,0.5))
	sprite_14:setIgnoreAnchorPointForPosition(false)


	self:addChild(sprite_14)


	self.tiao = sprite_14
	local menu_15 = display.newNode()
	menu_15:setScale(0.5)
	menu_15:setAnchorPoint(ccp(0.5,0.5))
	menu_15:setPosition(CCBNodeExtend.ccb_pos(50.092079162597656,-6500,4,sprite_14))
	menu_15:setIgnoreAnchorPointForPosition(true)


	sprite_14:addChild(menu_15)


	self.CCMenu = menu_15
	local menuitemimage_16 = cc.ui.UICheckBoxButton.new({on = "#button_music_normal.png",off = "#button_music_press.png"})
	menuitemimage_16:onButtonClicked(handler(_owner, assert(_owner.onBtnNext,"onBtnNext")))
	menuitemimage_16:setScale(2)
	menuitemimage_16:setAnchorPoint(ccp(0.5,0.5))
	menuitemimage_16:setPosition(CCBNodeExtend.ccb_pos(-4,438,0,menu_15))
	menuitemimage_16:setIgnoreAnchorPointForPosition(false)


	menu_15:addChild(menuitemimage_16)


	self._btnMusic = menuitemimage_16
	local params = {
		normal = CCBNodeExtend.ccb_display_frame("fanhui_1.png","button.plist"),
		select = CCBNodeExtend.ccb_display_frame("battle_win/gognlai_2.png"),
		disable = nil,
		listener = handler(_owner, assert(_owner.onBtnAgain,"onBtnAgain")),
	}
	local menuitemimage_17 = CCBNodeExtend.newButton(params)
	menuitemimage_17:setAnchorPoint(ccp(0.5,0.5))
	menuitemimage_17:setPosition(CCBNodeExtend.ccb_pos(-210.00006103515625,381.19998168945312,0,menu_15))
	menuitemimage_17:setIgnoreAnchorPointForPosition(false)


	menu_15:addChild(menuitemimage_17)


	self.CCMenuItemImage = menuitemimage_17


	local scroll_18 = CCScrollView:create()
	scroll_18:setViewSize(CCBNodeExtend.ccb_size(100,100,0,self))
	scroll_18:setContainer(require("app.scenes.Star").new(_owner))
	scroll_18:setDirection(kCCScrollViewDirectionVertical)
	scroll_18:setAnchorPoint(ccp(0.0,0.0))
	scroll_18:setPosition(CCBNodeExtend.ccb_pos(0.0,-6,0,self))
	scroll_18:setIgnoreAnchorPointForPosition(true)


	self:addChild(scroll_18)


	self.CCScrollView = scroll_18
	local sprite9_19 = CCScale9Sprite:createWithSpriteFrame(CCBNodeExtend.ccb_display_frame("ui/common_mask.png"))
	sprite9_19:setAnchorPoint(ccp(0,0))
	CCBNodeExtend.cap_insets(sprite9_19,0.0,0.0,0.0,0.0)
	sprite9_19:setOpacity(120)
	sprite9_19:setPosition(CCBNodeExtend.ccb_pos(297.66400146484375,329.94403076171875,0,self))
	sprite9_19:setPreferredSize(CCBNodeExtend.ccb_size(200,150,0,self))
	sprite9_19:setIgnoreAnchorPointForPosition(false)

	CCBNodeExtend.banTouch(sprite9_19)

	self:addChild(sprite9_19)


	self._banTouch = sprite9_19
	local cccb_20 = CCControlButton:create()
	cccb_20:setTitleForState(CCString:create("按\n我"),CCControlStateNormal)
	cccb_20:setTitleTTFForState("Helvetica",CCControlStateNormal)
	cccb_20:setTitleTTFSizeForState(20,CCControlStateNormal)
	cccb_20:setTitleColorForState(ccc3(254,251,0),CCControlStateNormal)
	cccb_20:setBackgroundSpriteFrameForState(CCBNodeExtend.ccb_display_frame("battle_win/luxietiao.png"),CCControlStateNormal)
	cccb_20:setTitleColorForState(ccc3(255,38,0),CCControlStateSelected)
	cccb_20:setBackgroundSpriteFrameForState(CCBNodeExtend.ccb_display_frame("battle_win/luxietiaodi.png"),CCControlStateSelected)
	cccb_20:setTitleColorForState(ccc3(254,251,0),CCControlStateDisabled)

	cccb_20:setPreferredSize(CCBNodeExtend.ccb_size(120,100,0,self))

	cccb_20:setEnabled(true)
	cccb_20:addHandleOfControlEvent(function()
		GameAudio.dispatchEvent("pop")
		_owner:onBtnCCC(cccb_20:getTag(), cccb_20) 
	end,CCControlEventTouchUpInside)
	cccb_20:setAnchorPoint(ccp(0.5,0.5))
	cccb_20:setPosition(CCBNodeExtend.ccb_pos(153.04011535644531,127.32002258300781,0,self))
	cccb_20:setPreferredSize(CCBNodeExtend.ccb_size(120,100,0,self))
	cccb_20:setIgnoreAnchorPointForPosition(false)


	self:addChild(cccb_20)


	self.CCControlButton = cccb_20
	local ttf_21 = CCLabelBMFont:create("1000", "fonts/hurtnumbers.fnt")
	ttf_21:setAnchorPoint(ccp(0.5,0.5))
	ttf_21:setPosition(CCBNodeExtend.ccb_pos(135,191,0,self))
	ttf_21:setIgnoreAnchorPointForPosition(false)


	self:addChild(ttf_21)


	self.CCLabelBMFont = ttf_21
	local ccb_22 = require("app.scenes.Star").new(_owner)
	ccb_22:setPosition(CCBNodeExtend.ccb_pos(585.75201416015625,427.78402709960938,0,self))
	ccb_22:setTag(1)


	self:addChild(ccb_22)


	self.Star = ccb_22
	local sprite9_23 = CCScale9Sprite:createWithSpriteFrame(CCBNodeExtend.ccb_display_frame("jia.png","button.plist"))
	CCBNodeExtend.addTouchListener(sprite9_23, handler(_owner, assert(_owner.onBtnBack,"onBtnBack")))
	sprite9_23:setAnchorPoint(ccp(0,0))
	CCBNodeExtend.cap_insets(sprite9_23,0.0,0.0,0.0,0.0)
	sprite9_23:setPosition(CCBNodeExtend.ccb_pos(240.44000244140625,-6.10400390625,0,self))
	sprite9_23:setPreferredSize(CCBNodeExtend.ccb_size(200,116,0,self))
	sprite9_23:setIgnoreAnchorPointForPosition(false)


	self:addChild(sprite9_23)


	self._banTouch2 = sprite9_23
	local ttf_24 = CCLabelTTF:create("1111","Helvetica", 25, CCBNodeExtend.ccb_size(500,0.0,0,self), 2, 0)
	ttf_24:setAnchorPoint(ccp(0.0,1))
	ttf_24:setColor(ccc3(0,0,0))
	ttf_24:setPosition(CCBNodeExtend.ccb_pos(515,641.9200439453125,0,self))
	ttf_24:setIgnoreAnchorPointForPosition(false)


	self:addChild(ttf_24)


	self._labelTest = ttf_24
	local sprite_25 = CCBNodeExtend.newProgressRadial(CCBNodeExtend.ccb_display_frame("battle_win/daxingxing_1.png"))
	sprite_25:setPosition(CCBNodeExtend.ccb_pos(425.4720458984375,501.26406860351562,0,self))
	sprite_25:setAnchorPoint(ccp(0.5,0.5))
	sprite_25:setIgnoreAnchorPointForPosition(false)


	self:addChild(sprite_25)


	self._radial = sprite_25
	local sprite9_26 = require("app.scenes.TouchMaskNode").new(CCBNodeExtend.ccb_display_frame("ui/common_mask.png"))
	sprite9_26:addTouchListener(handler(_owner, assert(_owner.onBtnClick,"onBtnClick")))
	sprite9_26:setAnchorPoint(ccp(0,0))
	CCBNodeExtend.cap_insets(sprite9_26,0.0,0.0,0.0,0.0)
	sprite9_26:setOpacity(120)
	sprite9_26:setPosition(CCBNodeExtend.ccb_pos(758.14398193359375,352.08001708984375,0,self))
	sprite9_26:setPreferredSize(CCBNodeExtend.ccb_size(200,150,0,self))
	sprite9_26:setIgnoreAnchorPointForPosition(false)


	self:addChild(sprite9_26)


	self._banTouch = sprite9_26
	local cccb_27 = require("app.scenes.My").new()
	cccb_27:setTitleForState(CCString:create("按\n我"),CCControlStateNormal)
	cccb_27:setTitleTTFForState("Helvetica",CCControlStateNormal)
	cccb_27:setTitleTTFSizeForState(20,CCControlStateNormal)
	cccb_27:setTitleColorForState(ccc3(254,251,0),CCControlStateNormal)
	cccb_27:setBackgroundSpriteFrameForState(CCBNodeExtend.ccb_display_frame("battle_win/luxietiao.png"),CCControlStateNormal)
	cccb_27:setTitleColorForState(ccc3(255,38,0),CCControlStateSelected)
	cccb_27:setBackgroundSpriteFrameForState(CCBNodeExtend.ccb_display_frame("battle_win/luxietiaodi.png"),CCControlStateSelected)
	cccb_27:setTitleColorForState(ccc3(254,251,0),CCControlStateDisabled)

	cccb_27:setPreferredSize(CCBNodeExtend.ccb_size(120,100,0,self))

	cccb_27:setEnabled(true)
	cccb_27:addHandleOfControlEvent(function()
		GameAudio.dispatchEvent("pop")
		_owner:onBtnCCC(cccb_27:getTag(), cccb_27) 
	end,CCControlEventTouchUpInside)
	cccb_27:setAnchorPoint(ccp(0.5,0.5))
	cccb_27:setPosition(CCBNodeExtend.ccb_pos(894.04010009765625,282.32000732421875,0,self))
	cccb_27:setPreferredSize(CCBNodeExtend.ccb_size(120,100,0,self))
	cccb_27:setIgnoreAnchorPointForPosition(false)


	self:addChild(cccb_27)


	self.CCControlButton = cccb_27
	local cccb_28 = require("app.scenes.My").new()
	cccb_28:setTitleForState(CCString:create("自动布局"),CCControlStateNormal)
	cccb_28:setTitleTTFForState("Helvetica",CCControlStateNormal)
	cccb_28:setTitleTTFSizeForState(20,CCControlStateNormal)
	cccb_28:setTitleColorForState(ccc3(0,0,0),CCControlStateNormal)
	cccb_28:setBackgroundSpriteFrameForState(CCBNodeExtend.ccb_display_frame("battle_win/luxietiao.png"),CCControlStateNormal)
	cccb_28:setTitleColorForState(ccc3(255,38,0),CCControlStateSelected)
	cccb_28:setBackgroundSpriteFrameForState(CCBNodeExtend.ccb_display_frame("battle_win/luxietiaodi.png"),CCControlStateSelected)
	cccb_28:setTitleColorForState(ccc3(254,251,0),CCControlStateDisabled)

	cccb_28:setPreferredSize(CCBNodeExtend.ccb_size(120,50,0,self))

	cccb_28:setEnabled(true)
	cccb_28:addHandleOfControlEvent(function()
		GameAudio.dispatchEvent("pop")
		_owner:onBtnCCC(cccb_28:getTag(), cccb_28) 
	end,CCControlEventTouchUpInside)
	cccb_28:setAnchorPoint(ccp(0.5,0.5))
	cccb_28:setPosition(CCBNodeExtend.ccb_pos(890.04010009765625,605.32000732421875,0,self))
	cccb_28:setPreferredSize(CCBNodeExtend.ccb_size(120,50,0,self))
	cccb_28:setIgnoreAnchorPointForPosition(false)


	self:addChild(cccb_28)


	self.CCControlButton = cccb_28
	local sprite_29 = display.newSprite()
	CCBNodeExtend.banTouch(sprite_29)
	sprite_29:setDisplayFrame(CCBNodeExtend.ccb_display_frame("battle_win/guang.png"))
	sprite_29:setPosition(CCBNodeExtend.ccb_pos(720.639892578125,617.199951171875,0,self))
	sprite_29:setScale(0.5)
	sprite_29:setAnchorPoint(ccp(0.5,0.5))
	sprite_29:setIgnoreAnchorPointForPosition(false)


	self:addChild(sprite_29)


	self.guang = sprite_29
	local sprite9_30 = CCScale9Sprite:createWithSpriteFrame(CCBNodeExtend.ccb_display_frame("ui/common_mask.png"))
	CCBNodeExtend.banTouch(sprite9_30)
	sprite9_30:setAnchorPoint(ccp(0,0))
	CCBNodeExtend.cap_insets(sprite9_30,0.0,0.0,0.0,0.0)
	sprite9_30:setOpacity(120)
	sprite9_30:setPosition(CCBNodeExtend.ccb_pos(587.66400146484375,372.94403076171875,0,self))
	sprite9_30:setPreferredSize(CCBNodeExtend.ccb_size(50,50,0,self))
	sprite9_30:setIgnoreAnchorPointForPosition(false)


	self:addChild(sprite9_30)


	self._banTouch = sprite9_30


end

return Layer_layout