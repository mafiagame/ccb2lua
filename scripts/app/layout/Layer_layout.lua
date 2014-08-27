
local Layer_layout = class("Layer_layout",function()
    return display.newLayer()
end)



function Layer_layout:ctor(_owner)
	self:setContentSize(CCBNodeExtend.ccb_size(100,100,1,nil))
	self:setAnchorPoint(ccp(0.5,0.5))
	self:setScaleX(1)
	self:setScaleY(1)
	self:setIgnoreAnchorPointForPosition(true)

	local mask_1 = CCLayerColor:create()
	mask_1:setContentSize(CCBNodeExtend.ccb_size(100,100,1,self))
	mask_1:setAnchorPoint(ccp(0.5,0.5))
	mask_1:setScaleX(1)
	mask_1:setScaleY(1)
	mask_1:setIgnoreAnchorPointForPosition(true)
	mask_1:setColor(ccc3(170,121,65))
	mask_1:setOpacity(150)


	self:addChild(mask_1)


	local sprite9_2 = CCScale9Sprite:createWithSpriteFrame(CCBNodeExtend.ccb_display_frame("jia.png", "button.plist"))
	CCBNodeExtend.touchSprite(sprite9_2, self, _owner, "onBtnBack")
	sprite9_2:setAnchorPoint(ccp(0,0))
	CCBNodeExtend.cap_insets(sprite9_2,0.0,0.0,0.0,0.0)
	sprite9_2:setPosition(CCBNodeExtend.ccb_pos(328,0.0,0,self))
	sprite9_2:setScaleX(1)
	sprite9_2:setScaleY(1)
	sprite9_2:setIgnoreAnchorPointForPosition(false)
	sprite9_2:setPreferredSize(CCBNodeExtend.ccb_size(200,116,0,self))
	sprite9_2:setOpacity(255)
	sprite9_2:setColor(ccc3(255,255,255))


	self:addChild(sprite9_2)


	local node_3 = display.newNode()
	node_3:setPosition(CCBNodeExtend.ccb_pos(50,50,4,self))
	node_3:setAnchorPoint(ccp(0.0,0.0))
	node_3:setScaleX(1)
	node_3:setScaleY(1)
	node_3:setIgnoreAnchorPointForPosition(false)


	self:addChild(node_3)


	local sprite_4 = display.newSprite()
	CCBNodeExtend.touchSprite(sprite_4, self, _owner, "onBtnReady")
	sprite_4:setPosition(CCBNodeExtend.ccb_pos(-296.80007934570312,96.639984130859375,0,node_3))
	sprite_4:setAnchorPoint(ccp(0.5,0.5))
	sprite_4:setScaleX(0.69999998807907104)
	sprite_4:setScaleY(0.69999998807907104)
	sprite_4:setIgnoreAnchorPointForPosition(false)
	sprite_4:setDisplayFrame(CCBNodeExtend.ccb_display_frame("battle_win/guang.png"))


	node_3:addChild(sprite_4)


	self._guang = sprite_4
	local ccb_5 = require("app.scenes.Star").new()
	ccb_5:setPosition(CCBNodeExtend.ccb_pos(0.0,150,0,node_3))
	ccb_5:setScaleX(1)
	ccb_5:setScaleY(1)
	ccb_5:setTag(1)


	node_3:addChild(ccb_5)


	local ccb_6 = require("app.scenes.Star").new()
	ccb_6:setVisible(false)
	ccb_6:setPosition(CCBNodeExtend.ccb_pos(-150,230,0,node_3))
	ccb_6:setScaleX(1)
	ccb_6:setScaleY(1)
	ccb_6:setTag(2)


	node_3:addChild(ccb_6)


	local ccb_7 = require("app.scenes.Star").new()
	ccb_7:setPosition(CCBNodeExtend.ccb_pos(150,230,0,node_3))
	ccb_7:setScaleX(1)
	ccb_7:setScaleY(1)
	ccb_7:setTag(3)


	node_3:addChild(ccb_7)


	local ttf_8 = CCLabelTTF:create("您\n赢\n了", "Helvetica", 80)
	ttf_8:setPosition(CCBNodeExtend.ccb_pos(393,85,0,node_3))
	ttf_8:setAnchorPoint(ccp(0.5,0.5))
	ttf_8:setScaleX(1)
	ttf_8:setScaleY(1)
	ttf_8:setIgnoreAnchorPointForPosition(false)
	ttf_8:setColor(ccc3(0,0,0))


	node_3:addChild(ttf_8)


	local sprite9_9 = CCScale9Sprite:create("battle_win/luxietiaodi.png")
	CCBNodeExtend.cap_insets(sprite9_9,0.0,0.0,0.0,0.0)
	sprite9_9:setPosition(CCBNodeExtend.ccb_pos(-270,-60,0,node_3))
	sprite9_9:setAnchorPoint(ccp(0.0,0.5))
	sprite9_9:setScaleX(1)
	sprite9_9:setScaleY(1)
	sprite9_9:setIgnoreAnchorPointForPosition(false)
	sprite9_9:setPreferredSize(CCBNodeExtend.ccb_size(600,50,0,node_3))
	sprite9_9:setOpacity(255)
	sprite9_9:setColor(ccc3(255,255,255))


	node_3:addChild(sprite9_9)


	local sprite9_10 = CCScale9Sprite:create("battle_win/luxietiao.png")
	CCBNodeExtend.cap_insets(sprite9_10,0.0,0.0,0.0,0.0)
	sprite9_10:setPosition(CCBNodeExtend.ccb_pos(-267,-60,0,node_3))
	sprite9_10:setAnchorPoint(ccp(0.0,0.5))
	sprite9_10:setScaleX(1)
	sprite9_10:setScaleY(1)
	sprite9_10:setIgnoreAnchorPointForPosition(false)
	sprite9_10:setPreferredSize(CCBNodeExtend.ccb_size(300,42,0,node_3))
	sprite9_10:setOpacity(255)
	sprite9_10:setColor(ccc3(255,255,255))


	node_3:addChild(sprite9_10)



	local sprite_11 = display.newSprite()
	sprite_11:setPosition(CCBNodeExtend.ccb_pos(50,48.4375,4,self))
	sprite_11:setAnchorPoint(ccp(0.5,0.5))
	sprite_11:setScaleX(1)
	sprite_11:setScaleY(1)
	sprite_11:setIgnoreAnchorPointForPosition(false)
	sprite_11:setDisplayFrame(CCBNodeExtend.ccb_display_frame("battle_win/tiao.png"))


	self:addChild(sprite_11)


	local menu_12 = CCMenu:create()
	menu_12:setContentSize(CCSize(0,0))
	menu_12:setPosition(CCBNodeExtend.ccb_pos(50.092079162597656,-6500,4,sprite_11))
	menu_12:setAnchorPoint(ccp(0.5,0.5))
	menu_12:setScaleX(0.5)
	menu_12:setScaleY(0.5)
	menu_12:setIgnoreAnchorPointForPosition(true)


	sprite_11:addChild(menu_12)


	local menuitemimage_13 = CCMenuItemImage:create()
	CCBNodeExtend.addListener(menuitemimage_13, self, _owner, "onBtnNext")
	menuitemimage_13:setNormalSpriteFrame(CCBNodeExtend.ccb_display_frame("battle_win/qianjin_1.png"))
	menuitemimage_13:setSelectedSpriteFrame(CCBNodeExtend.ccb_display_frame("battle_win/qianjin_2.png"))
	menuitemimage_13:setPosition(CCBNodeExtend.ccb_pos(120,0.0,0,menu_12))
	menuitemimage_13:setAnchorPoint(ccp(0.5,0.5))
	menuitemimage_13:setScaleX(1)
	menuitemimage_13:setScaleY(1)
	menuitemimage_13:setIgnoreAnchorPointForPosition(false)


	menu_12:addChild(menuitemimage_13)


	local menuitemimage_14 = CCMenuItemImage:create()
	CCBNodeExtend.addListener(menuitemimage_14, self, _owner, "onBtnAgain")
	menuitemimage_14:setNormalSpriteFrame(CCBNodeExtend.ccb_display_frame("fanhui_1.png", "button.plist"))
	menuitemimage_14:setSelectedSpriteFrame(CCBNodeExtend.ccb_display_frame("battle_win/gognlai_2.png"))
	menuitemimage_14:setPosition(CCBNodeExtend.ccb_pos(-120,0.0,0,menu_12))
	menuitemimage_14:setAnchorPoint(ccp(0.5,0.5))
	menuitemimage_14:setScaleX(1)
	menuitemimage_14:setScaleY(1)
	menuitemimage_14:setIgnoreAnchorPointForPosition(false)


	menu_12:addChild(menuitemimage_14)




	local scroll_15 = CCScrollView:create()
	scroll_15:setViewSize(CCBNodeExtend.ccb_size(100,100,0,self))
	scroll_15:setContainer(require("app.scenes.Star").new())
	scroll_15:setDirection(kCCScrollViewDirectionVertical)
	scroll_15:setContentSize(CCBNodeExtend.ccb_size(100,100,0,self))
	scroll_15:setAnchorPoint(ccp(0.0,0.0))
	scroll_15:setScale(1)
	scroll_15:setIgnoreAnchorPointForPosition(true)


	self:addChild(scroll_15)


	local cccb_16 = CCControlButton:create()
	cccb_16:setTitleForState(CCString:create("按我"),CCControlStateNormal)
	cccb_16:setTitleTTFForState("Helvetica",CCControlStateNormal)
	cccb_16:setTitleTTFSizeForState(20,CCControlStateNormal)
	cccb_16:setTitleColorForState(ccc3(254,251,0),CCControlStateNormal)
	cccb_16:setBackgroundSpriteFrameForState(CCBNodeExtend.ccb_display_frame("battle_win/luxietiao.png"),CCControlStateNormal)
	cccb_16:setTitleColorForState(ccc3(255,38,0),CCControlStateSelected)
	cccb_16:setBackgroundSpriteFrameForState(CCBNodeExtend.ccb_display_frame("battle_win/luxietiaodi.png"),CCControlStateSelected)
	cccb_16:setTitleColorForState(ccc3(254,251,0),CCControlStateDisabled)

	cccb_16:setPreferredSize(CCBNodeExtend.ccb_size(120,50,0,self))

	cccb_16:setEnabled(true)
	cccb_16:addHandleOfControlEvent(handler(_owner, _owner.onBtnCCC),CCControlEventTouchDown)
	cccb_16:addHandleOfControlEvent(handler(_owner, _owner.onBtnCCC),CCControlEventTouchDragInside)
	cccb_16:addHandleOfControlEvent(handler(_owner, _owner.onBtnCCC),CCControlEventTouchDragOutside)
	cccb_16:addHandleOfControlEvent(handler(_owner, _owner.onBtnCCC),CCControlEventTouchDragEnter)
	cccb_16:addHandleOfControlEvent(handler(_owner, _owner.onBtnCCC),CCControlEventTouchDragExit)
	cccb_16:addHandleOfControlEvent(handler(_owner, _owner.onBtnCCC),CCControlEventTouchUpInside)
	cccb_16:addHandleOfControlEvent(handler(_owner, _owner.onBtnCCC),CCControlEventTouchUpOutside)
	cccb_16:addHandleOfControlEvent(handler(_owner, _owner.onBtnCCC),CCControlEventTouchCancel)

	cccb_16:setPosition(CCBNodeExtend.ccb_pos(784.8001708984375,141.12002563476562,0,self))
	cccb_16:setAnchorPoint(ccp(0.5,0.5))
	cccb_16:setScaleX(1)
	cccb_16:setScaleY(1)
	cccb_16:setIgnoreAnchorPointForPosition(false)
	cccb_16:setPreferredSize(CCBNodeExtend.ccb_size(120,50,0,self))


	self:addChild(cccb_16)


	self._btnCCC = cccb_16


end

return Layer_layout