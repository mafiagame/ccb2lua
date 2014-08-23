
local Layer_layout = class("Layer_layout",function()
    return display.newLayer()
end)


function Layer_layout:ctor(_owner)
	self:setContentSize(CCBNodeExtend.ccb_size(100,100,1,nil))
	self:setAnchorPoint(ccp(0.5,0.5))
	self:setScaleX(1)
	self:setScaleY(1)
	self:setIgnoreAnchorPointForPosition(true)

	local mask_3 = CCLayerColor:create()
	mask_3:setContentSize(CCBNodeExtend.ccb_size(100,100,1,self))
	mask_3:setAnchorPoint(ccp(0.5,0.5))
	mask_3:setScaleX(1)
	mask_3:setScaleY(1)
	mask_3:setIgnoreAnchorPointForPosition(true)
	mask_3:setColor(ccc3(170,121,65))
	mask_3:setOpacity(150)


	self:addChild(mask_3)


	local sprite9_4 = CCScale9Sprite:create("battle_win/luxietiao.png")
	sprite9_4:setCapInsets(CCBNodeExtend.cap_insets(0.0,0.0,0.0,0.0))
	sprite9_4:setPosition(CCBNodeExtend.ccb_pos(50,0.0,0,self))
	sprite9_4:setScaleX(1)
	sprite9_4:setScaleY(1)
	sprite9_4:setIgnoreAnchorPointForPosition(false)
	sprite9_4:setPreferredSize(CCBNodeExtend.ccb_size(300,42,0,self))
	sprite9_4:setOpacity(255)
	sprite9_4:setColor(ccc3(255,255,255))


	self:addChild(sprite9_4)


	local node_5 = display.newNode()
	node_5:setPosition(CCBNodeExtend.ccb_pos(50,50,4,self))
	node_5:setAnchorPoint(ccp(0.0,0.0))
	node_5:setScaleX(1)
	node_5:setScaleY(1)
	node_5:setIgnoreAnchorPointForPosition(false)


	self:addChild(node_5)


	local sprite_6 = display.newSprite()
	CCBNodeExtend.touchSprite(sprite_6,handler(_owner, _owner.onBtnReady),200)
	sprite_6:setPosition(CCBNodeExtend.ccb_pos(-316.80007934570312,86.639984130859375,0,node_5))
	sprite_6:setAnchorPoint(ccp(0.5,0.5))
	sprite_6:setScaleX(0.69999998807907104)
	sprite_6:setScaleY(0.69999998807907104)
	sprite_6:setIgnoreAnchorPointForPosition(false)
	sprite_6:setDisplayFrame(CCBNodeExtend.ccb_display_frame("battle_win/guang.png"))


	node_5:addChild(sprite_6)


	_owner["_guang"] = sprite_6
	local ccb_7 = require("app.layout.Star_layout").new()
	ccb_7:setPosition(CCBNodeExtend.ccb_pos(0.0,150,0,node_5))
	ccb_7:setScaleX(1)
	ccb_7:setScaleY(1)


	node_5:addChild(ccb_7)


	local ccb_8 = require("app.layout.Star_layout").new()
	ccb_8:setPosition(CCBNodeExtend.ccb_pos(-150,230,0,node_5))
	ccb_8:setScaleX(1)
	ccb_8:setScaleY(1)


	node_5:addChild(ccb_8)


	local ccb_9 = require("app.layout.Star_layout").new()
	ccb_9:setPosition(CCBNodeExtend.ccb_pos(150,230,0,node_5))
	ccb_9:setScaleX(1)
	ccb_9:setScaleY(1)


	node_5:addChild(ccb_9)


	local ttf_10 = CCLabelTTF:create("您赢了", "Helvetica", 80)
	ttf_10:setPosition(CCBNodeExtend.ccb_pos(0.0,40,0,node_5))
	ttf_10:setAnchorPoint(ccp(0.5,0.5))
	ttf_10:setScaleX(1)
	ttf_10:setScaleY(1)
	ttf_10:setIgnoreAnchorPointForPosition(false)
	ttf_10:setColor(ccc3(0,0,0))


	node_5:addChild(ttf_10)


	local sprite9_11 = CCScale9Sprite:create("battle_win/luxietiaodi.png")
	sprite9_11:setCapInsets(CCBNodeExtend.cap_insets(0.0,0.0,0.0,0.0))
	sprite9_11:setPosition(CCBNodeExtend.ccb_pos(-270,-60,0,node_5))
	sprite9_11:setAnchorPoint(ccp(0.0,0.5))
	sprite9_11:setScaleX(1)
	sprite9_11:setScaleY(1)
	sprite9_11:setIgnoreAnchorPointForPosition(false)
	sprite9_11:setPreferredSize(CCBNodeExtend.ccb_size(600,50,0,node_5))
	sprite9_11:setOpacity(255)
	sprite9_11:setColor(ccc3(255,255,255))


	node_5:addChild(sprite9_11)


	local sprite9_12 = CCScale9Sprite:create("battle_win/luxietiao.png")
	sprite9_12:setCapInsets(CCBNodeExtend.cap_insets(0.0,0.0,0.0,0.0))
	sprite9_12:setPosition(CCBNodeExtend.ccb_pos(-267,-60,0,node_5))
	sprite9_12:setAnchorPoint(ccp(0.0,0.5))
	sprite9_12:setScaleX(1)
	sprite9_12:setScaleY(1)
	sprite9_12:setIgnoreAnchorPointForPosition(false)
	sprite9_12:setPreferredSize(CCBNodeExtend.ccb_size(300,42,0,node_5))
	sprite9_12:setOpacity(255)
	sprite9_12:setColor(ccc3(255,255,255))


	node_5:addChild(sprite9_12)



	local sprite_13 = display.newSprite()
	sprite_13:setPosition(CCBNodeExtend.ccb_pos(50,48.4375,4,self))
	sprite_13:setAnchorPoint(ccp(0.5,0.5))
	sprite_13:setScaleX(1)
	sprite_13:setScaleY(1)
	sprite_13:setIgnoreAnchorPointForPosition(false)
	sprite_13:setDisplayFrame(CCBNodeExtend.ccb_display_frame("battle_win/tiao.png"))


	self:addChild(sprite_13)


	local menu_14 = CCMenu:create()
	menu_14:setPosition(CCBNodeExtend.ccb_pos(50.092079162597656,-6500,4,sprite_13))
	menu_14:setAnchorPoint(ccp(0.5,0.5))
	menu_14:setScaleX(1)
	menu_14:setScaleY(1)
	menu_14:setIgnoreAnchorPointForPosition(true)


	sprite_13:addChild(menu_14)


	local menuitemimage_15 = CCMenuItemImage:create()
	CCBNodeExtend.addListener(menuitemimage_15, handler(_owner, _owner.onBtnNext))
	menuitemimage_15:setNormalSpriteFrame(CCBNodeExtend.ccb_display_frame("battle_win/qianjin_1.png"))
	menuitemimage_15:setSelectedSpriteFrame(CCBNodeExtend.ccb_display_frame("battle_win/qianjin_2.png"))
	menuitemimage_15:setPosition(CCBNodeExtend.ccb_pos(120,0.0,0,menu_14))
	menuitemimage_15:setAnchorPoint(ccp(0.5,0.5))
	menuitemimage_15:setScaleX(1)
	menuitemimage_15:setScaleY(1)
	menuitemimage_15:setIgnoreAnchorPointForPosition(false)


	menu_14:addChild(menuitemimage_15)


	local menuitemimage_16 = CCMenuItemImage:create()
	CCBNodeExtend.addListener(menuitemimage_16, handler(_owner, _owner.onBtnAgain))
	menuitemimage_16:setNormalSpriteFrame(CCBNodeExtend.ccb_display_frame("fanhui_1.png", "button.plist"))
	menuitemimage_16:setSelectedSpriteFrame(CCBNodeExtend.ccb_display_frame("battle_win/gognlai_2.png"))
	menuitemimage_16:setPosition(CCBNodeExtend.ccb_pos(-120,0.0,0,menu_14))
	menuitemimage_16:setAnchorPoint(ccp(0.5,0.5))
	menuitemimage_16:setScaleX(1)
	menuitemimage_16:setScaleY(1)
	menuitemimage_16:setIgnoreAnchorPointForPosition(false)


	menu_14:addChild(menuitemimage_16)




	local scroll_17 = CCScrollView:create()
	scroll_17:setContainer(require("app.layout.Star_layout").new())
	scroll_17:setDirection(kCCScrollViewDirectionVertical)
	scroll_17:setContentSize(CCBNodeExtend.ccb_size(100,100,0,self))
	scroll_17:setAnchorPoint(ccp(0.0,0.0))
	scroll_17:setScale(1)
	scroll_17:setIgnoreAnchorPointForPosition(true)


	self:addChild(scroll_17)


	local cccb_18 = CCControlButton:create()
	cccb_18:setTitleForState(CCString:create("按我"),CCControlStateNormal)
	cccb_18:setTitleTTFForState("Helvetica",CCControlStateNormal)
	cccb_18:setTitleTTFSizeForState(20,CCControlStateNormal)
	cccb_18:setTitleColorForState(ccc3(254,251,0),CCControlStateNormal)
	cccb_18:setBackgroundSpriteFrameForState(CCBNodeExtend.ccb_display_frame("battle_win/luxietiao.png"),CCControlStateNormal)
	cccb_18:setTitleColorForState(ccc3(255,38,0),CCControlStateSelected)
	cccb_18:setBackgroundSpriteFrameForState(CCBNodeExtend.ccb_display_frame("battle_win/luxietiaodi.png"),CCControlStateSelected)
	cccb_18:setTitleColorForState(ccc3(254,251,0),CCControlStateDisabled)

	cccb_18:setPreferredSize(CCBNodeExtend.ccb_size(120,50,0,self))

	cccb_18:setEnabled(true)
	cccb_18:addHandleOfControlEvent(handler(_owner, _owner.onBtnCCC),CCControlEventTouchDown)
	cccb_18:addHandleOfControlEvent(handler(_owner, _owner.onBtnCCC),CCControlEventTouchDragInside)
	cccb_18:addHandleOfControlEvent(handler(_owner, _owner.onBtnCCC),CCControlEventTouchDragOutside)
	cccb_18:addHandleOfControlEvent(handler(_owner, _owner.onBtnCCC),CCControlEventTouchDragEnter)
	cccb_18:addHandleOfControlEvent(handler(_owner, _owner.onBtnCCC),CCControlEventTouchDragExit)
	cccb_18:addHandleOfControlEvent(handler(_owner, _owner.onBtnCCC),CCControlEventTouchUpInside)
	cccb_18:addHandleOfControlEvent(handler(_owner, _owner.onBtnCCC),CCControlEventTouchUpOutside)
	cccb_18:addHandleOfControlEvent(handler(_owner, _owner.onBtnCCC),CCControlEventTouchCancel)

	cccb_18:setPosition(CCBNodeExtend.ccb_pos(784.8001708984375,141.12002563476562,0,self))
	cccb_18:setAnchorPoint(ccp(0.5,0.5))
	cccb_18:setScaleX(1)
	cccb_18:setScaleY(1)
	cccb_18:setIgnoreAnchorPointForPosition(false)
	cccb_18:setPreferredSize(CCBNodeExtend.ccb_size(120,50,0,self))


	self:addChild(cccb_18)


	_owner["_btnCCC"] = cccb_18


end

return Layer_layout