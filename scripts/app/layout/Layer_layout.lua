
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
	CCBNodeExtend.addTouchListener(sprite9_2, handler(_owner, assert(_owner.onBtnBack,"onBtnBack")))
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
	CCBNodeExtend.addTouchListener(sprite_4, handler(_owner, assert(_owner.onBtnReady),"onBtnReady"))
	sprite_4:setPosition(CCBNodeExtend.ccb_pos(-283.36007690429688,153.19998168945312,0,node_3))
	sprite_4:setAnchorPoint(ccp(0.5,0.5))
	sprite_4:setScaleX(0.69999998807907104)
	sprite_4:setScaleY(0.69999998807907104)
	sprite_4:setIgnoreAnchorPointForPosition(false)
	sprite_4:setDisplayFrame(CCBNodeExtend.ccb_display_frame("battle_win/guang.png"))


	node_3:addChild(sprite_4)


	self._guang = sprite_4
	local ccb_5 = require("app.scenes.Star").new(_owner)
	ccb_5:setPosition(CCBNodeExtend.ccb_pos(0.0,150,0,node_3))
	ccb_5:setScaleX(1)
	ccb_5:setScaleY(1)
	ccb_5:setTag(1)


	node_3:addChild(ccb_5)


	local ccb_6 = require("app.scenes.Star").new(_owner)
	ccb_6:setVisible(false)
	ccb_6:setPosition(CCBNodeExtend.ccb_pos(-150,230,0,node_3))
	ccb_6:setScaleX(1)
	ccb_6:setScaleY(1)
	ccb_6:setTag(2)


	node_3:addChild(ccb_6)


	local ccb_7 = require("app.scenes.Star").new(_owner)
	ccb_7:setPosition(CCBNodeExtend.ccb_pos(151,230,0,node_3))
	ccb_7:setScaleX(1)
	ccb_7:setScaleY(1)
	ccb_7:setTag(3)


	node_3:addChild(ccb_7)


	local ttf_8 = CCLabelTTF:create("您\n赢\n了", "Helvetica", 80)
	ttf_8:setPosition(CCBNodeExtend.ccb_pos(409.3599853515625,40.520008087158203,0,node_3))
	ttf_8:setAnchorPoint(ccp(0.5,0.5))
	ttf_8:setScaleX(1)
	ttf_8:setScaleY(1)
	ttf_8:setIgnoreAnchorPointForPosition(false)
	ttf_8:setColor(ccc3(0,249,0))


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


	local ttf_11 = CCLabelTTF:create("1如果实在要买电脑，旧电脑怎么处理才比较安全？拿了硬盘？拿了主板？还是？2win8能装03的office么？不要烧死，我试过用07的做，一些功能我用07的做出来效果不一样了，不是我要的那种。","Helvetica", 25, CCBNodeExtend.ccb_size(500,200,0,node_3), 2, 0)
	ttf_11:setPosition(CCBNodeExtend.ccb_pos(-228.56004333496094,220.92001342773438,0,node_3))
	ttf_11:setAnchorPoint(ccp(0.5,0.5))
	ttf_11:setScaleX(1)
	ttf_11:setScaleY(1)
	ttf_11:setIgnoreAnchorPointForPosition(false)
	ttf_11:setColor(ccc3(0,0,0))


	node_3:addChild(ttf_11)



	local sprite_12 = display.newSprite()
	sprite_12:setPosition(CCBNodeExtend.ccb_pos(50,48.4375,4,self))
	sprite_12:setAnchorPoint(ccp(0.5,0.5))
	sprite_12:setScaleX(1)
	sprite_12:setScaleY(1)
	sprite_12:setIgnoreAnchorPointForPosition(false)
	sprite_12:setDisplayFrame(CCBNodeExtend.ccb_display_frame("battle_win/tiao.png"))


	self:addChild(sprite_12)


	local menu_13 = CCMenu:create()
	menu_13:setContentSize(CCSize(0,0))
	menu_13:setPosition(CCBNodeExtend.ccb_pos(50.092079162597656,-6500,4,sprite_12))
	menu_13:setAnchorPoint(ccp(0.5,0.5))
	menu_13:setScaleX(0.5)
	menu_13:setScaleY(0.5)
	menu_13:setIgnoreAnchorPointForPosition(true)


	sprite_12:addChild(menu_13)


	local menuitemimage_14 = CCMenuItemImage:create()
	menuitemimage_14:registerScriptTapHandler(handler(_owner, assert(_owner.onBtnNext,"onBtnNext")))
	menuitemimage_14:setNormalSpriteFrame(CCBNodeExtend.ccb_display_frame("battle_win/qianjin_1.png"))
	menuitemimage_14:setSelectedSpriteFrame(CCBNodeExtend.ccb_display_frame("battle_win/qianjin_2.png"))
	menuitemimage_14:setPosition(CCBNodeExtend.ccb_pos(120,0.0,0,menu_13))
	menuitemimage_14:setAnchorPoint(ccp(0.5,0.5))
	menuitemimage_14:setScaleX(1)
	menuitemimage_14:setScaleY(1)
	menuitemimage_14:setIgnoreAnchorPointForPosition(false)


	menu_13:addChild(menuitemimage_14)


	local menuitemimage_15 = CCMenuItemImage:create()
	menuitemimage_15:registerScriptTapHandler(handler(_owner, assert(_owner.onBtnAgain,"onBtnAgain")))
	menuitemimage_15:setNormalSpriteFrame(CCBNodeExtend.ccb_display_frame("fanhui_1.png", "button.plist"))
	menuitemimage_15:setSelectedSpriteFrame(CCBNodeExtend.ccb_display_frame("battle_win/gognlai_2.png"))
	menuitemimage_15:setPosition(CCBNodeExtend.ccb_pos(482,414,0,menu_13))
	menuitemimage_15:setAnchorPoint(ccp(0.5,0.5))
	menuitemimage_15:setScaleX(1)
	menuitemimage_15:setScaleY(1)
	menuitemimage_15:setIgnoreAnchorPointForPosition(false)


	menu_13:addChild(menuitemimage_15)




	local scroll_16 = CCScrollView:create()
	scroll_16:setViewSize(CCBNodeExtend.ccb_size(100,100,0,self))
	scroll_16:setContainer(require("app.scenes.Star").new(_owner))
	scroll_16:setDirection(kCCScrollViewDirectionVertical)
	scroll_16:setContentSize(CCBNodeExtend.ccb_size(100,100,0,self))
	scroll_16:setAnchorPoint(ccp(0.0,0.0))
	scroll_16:setScale(1)
	scroll_16:setIgnoreAnchorPointForPosition(true)


	self:addChild(scroll_16)


	local cccb_17 = CCControlButton:create()
	cccb_17:setTitleForState(CCString:create("按我"),CCControlStateNormal)
	cccb_17:setTitleTTFForState("Helvetica",CCControlStateNormal)
	cccb_17:setTitleTTFSizeForState(20,CCControlStateNormal)
	cccb_17:setTitleColorForState(ccc3(254,251,0),CCControlStateNormal)
	cccb_17:setBackgroundSpriteFrameForState(CCBNodeExtend.ccb_display_frame("battle_win/luxietiao.png"),CCControlStateNormal)
	cccb_17:setTitleColorForState(ccc3(255,38,0),CCControlStateSelected)
	cccb_17:setBackgroundSpriteFrameForState(CCBNodeExtend.ccb_display_frame("battle_win/luxietiaodi.png"),CCControlStateSelected)
	cccb_17:setTitleColorForState(ccc3(254,251,0),CCControlStateDisabled)

	cccb_17:setPreferredSize(CCBNodeExtend.ccb_size(120,50,0,self))

	cccb_17:setEnabled(true)
	cccb_17:addHandleOfControlEvent(function() _owner:onBtnCCC(cccb_17:getTag(), cccb_17) end,CCControlEventTouchDown)
	cccb_17:setPosition(CCBNodeExtend.ccb_pos(786.24017333984375,141.12002563476562,0,self))
	cccb_17:setAnchorPoint(ccp(0.5,0.5))
	cccb_17:setScaleX(1)
	cccb_17:setScaleY(1)
	cccb_17:setIgnoreAnchorPointForPosition(false)
	cccb_17:setPreferredSize(CCBNodeExtend.ccb_size(120,50,0,self))


	self:addChild(cccb_17)




end

return Layer_layout