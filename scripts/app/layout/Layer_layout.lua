
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
	mask_1:setPosition(CCBNodeExtend.ccb_pos(0.0,2,0,self))
	mask_1:setContentSize(CCBNodeExtend.ccb_size(100,100,1,self))
	mask_1:setAnchorPoint(ccp(0.5,0.5))
	mask_1:setScaleX(1)
	mask_1:setScaleY(1)
	mask_1:setIgnoreAnchorPointForPosition(true)
	mask_1:setColor(ccc3(170,121,65))
	mask_1:setOpacity(150)


	self:addChild(mask_1)


	local node_2 = display.newNode()
	node_2:setPosition(CCBNodeExtend.ccb_pos(50,50,4,self))
	node_2:setAnchorPoint(ccp(0.0,0.0))
	node_2:setScaleX(1)
	node_2:setScaleY(1)
	node_2:setIgnoreAnchorPointForPosition(false)


	self:addChild(node_2)


	local sprite_3 = display.newSprite()
	CCBNodeExtend.addTouchListener(sprite_3, handler(_owner, assert(_owner.onBtnReady),"onBtnReady"))
	sprite_3:setPosition(CCBNodeExtend.ccb_pos(-283.36007690429688,153.19998168945312,0,node_2))
	sprite_3:setAnchorPoint(ccp(0.5,0.5))
	sprite_3:setScaleX(0.69999998807907104)
	sprite_3:setScaleY(0.69999998807907104)
	sprite_3:setIgnoreAnchorPointForPosition(false)
	sprite_3:setDisplayFrame(CCBNodeExtend.ccb_display_frame("battle_win/guang.png"))


	node_2:addChild(sprite_3)


	self._guang = sprite_3
	local ccb_4 = require("app.scenes.Star").new(_owner)
	ccb_4:setPosition(CCBNodeExtend.ccb_pos(0.0,150,0,node_2))
	ccb_4:setScaleX(1)
	ccb_4:setScaleY(1)
	ccb_4:setTag(1)


	node_2:addChild(ccb_4)


	local ccb_5 = require("app.scenes.Star").new(_owner)
	ccb_5:setVisible(false)
	ccb_5:setPosition(CCBNodeExtend.ccb_pos(-150,230,0,node_2))
	ccb_5:setScaleX(1)
	ccb_5:setScaleY(1)
	ccb_5:setTag(2)


	node_2:addChild(ccb_5)


	local ccb_6 = require("app.scenes.Star").new(_owner)
	ccb_6:setPosition(CCBNodeExtend.ccb_pos(-20.072017669677734,-184.72004699707031,0,node_2))
	ccb_6:setScaleX(1)
	ccb_6:setScaleY(1)
	ccb_6:setTag(3)


	node_2:addChild(ccb_6)


	local ttf_7 = CCLabelTTF:create("您\n赢\n了", "Helvetica", 80)
	ttf_7:setPosition(CCBNodeExtend.ccb_pos(409.3599853515625,40.520008087158203,0,node_2))
	ttf_7:setAnchorPoint(ccp(0.5,0.5))
	ttf_7:setScaleX(1)
	ttf_7:setScaleY(1)
	ttf_7:setIgnoreAnchorPointForPosition(false)
	ttf_7:setColor(ccc3(0,249,0))


	node_2:addChild(ttf_7)


	local sprite9_8 = CCScale9Sprite:create("battle_win/luxietiaodi.png")
	CCBNodeExtend.cap_insets(sprite9_8,0.0,0.0,0.0,0.0)
	sprite9_8:setPosition(CCBNodeExtend.ccb_pos(-270,-60,0,node_2))
	sprite9_8:setAnchorPoint(ccp(0.0,0.5))
	sprite9_8:setScaleX(1)
	sprite9_8:setScaleY(1)
	sprite9_8:setIgnoreAnchorPointForPosition(false)
	sprite9_8:setPreferredSize(CCBNodeExtend.ccb_size(600,50,0,node_2))
	sprite9_8:setOpacity(255)
	sprite9_8:setColor(ccc3(255,255,255))


	node_2:addChild(sprite9_8)


	local sprite9_9 = CCScale9Sprite:create("battle_win/luxietiao.png")
	CCBNodeExtend.cap_insets(sprite9_9,0.0,0.0,0.0,0.0)
	sprite9_9:setPosition(CCBNodeExtend.ccb_pos(-267,-60,0,node_2))
	sprite9_9:setAnchorPoint(ccp(0.0,0.5))
	sprite9_9:setScaleX(1)
	sprite9_9:setScaleY(1)
	sprite9_9:setIgnoreAnchorPointForPosition(false)
	sprite9_9:setPreferredSize(CCBNodeExtend.ccb_size(300,42,0,node_2))
	sprite9_9:setOpacity(255)
	sprite9_9:setColor(ccc3(255,255,255))


	node_2:addChild(sprite9_9)


	local ttf_10 = CCLabelTTF:create("1如果实在要买电脑，旧电脑怎么处理才比较安全？拿了硬盘？拿了主板？还是？2win8能装03的office么？不要烧死，我试过用07的做，一些功能我用07的做出来效果不一样了，不是我要的那种。","Helvetica", 25, CCBNodeExtend.ccb_size(500,200,0,node_2), 2, 0)
	ttf_10:setPosition(CCBNodeExtend.ccb_pos(-228.56004333496094,220.92001342773438,0,node_2))
	ttf_10:setAnchorPoint(ccp(0.5,0.5))
	ttf_10:setScaleX(1)
	ttf_10:setScaleY(1)
	ttf_10:setIgnoreAnchorPointForPosition(false)
	ttf_10:setColor(ccc3(0,0,0))


	node_2:addChild(ttf_10)



	local sprite_11 = display.newSprite()
	sprite_11:setPosition(CCBNodeExtend.ccb_pos(50,48.4375,4,self))
	sprite_11:setAnchorPoint(ccp(0.5,0.5))
	sprite_11:setScaleX(1)
	sprite_11:setScaleY(1)
	sprite_11:setIgnoreAnchorPointForPosition(false)
	sprite_11:setDisplayFrame(CCBNodeExtend.ccb_display_frame("battle_win/tiao.png"))


	self:addChild(sprite_11)


	local menu_12 = display.newNode()
	menu_12:setPosition(CCBNodeExtend.ccb_pos(50.092079162597656,-6500,4,sprite_11))
	menu_12:setAnchorPoint(ccp(0.5,0.5))
	menu_12:setScaleX(0.5)
	menu_12:setScaleY(0.5)
	menu_12:setIgnoreAnchorPointForPosition(true)


	sprite_11:addChild(menu_12)


	local params = {
		normal = CCBNodeExtend.ccb_display_frame("battle_win/qianjin_1.png"),
		select = CCBNodeExtend.ccb_display_frame("battle_win/qianjin_2.png"),
		disable = CCBNodeExtend.ccb_display_frame("battle_win/qianjin_2.png"),
		listener = handler(_owner, assert(_owner.onBtnNext,"onBtnNext"))
	}
	local menuitemimage_13 = CCBNodeExtend.newButton(params)
	menuitemimage_13:setPosition(CCBNodeExtend.ccb_pos(120,0.0,0,menu_12))
	menuitemimage_13:setAnchorPoint(ccp(0.5,0.5))
	menuitemimage_13:setScaleX(1)
	menuitemimage_13:setScaleY(1)
	menuitemimage_13:setIgnoreAnchorPointForPosition(false)


	menu_12:addChild(menuitemimage_13)


	local params = {
		normal = CCBNodeExtend.ccb_display_frame("fanhui_1.png", "button.plist"),
		select = CCBNodeExtend.ccb_display_frame("battle_win/gognlai_2.png"),
		listener = handler(_owner, assert(_owner.onBtnAgain,"onBtnAgain"))
	}
	local menuitemimage_14 = CCBNodeExtend.newButton(params)
	menuitemimage_14:setPosition(CCBNodeExtend.ccb_pos(482,414,0,menu_12))
	menuitemimage_14:setAnchorPoint(ccp(0.5,0.5))
	menuitemimage_14:setScaleX(1)
	menuitemimage_14:setScaleY(1)
	menuitemimage_14:setIgnoreAnchorPointForPosition(false)


	menu_12:addChild(menuitemimage_14)




	local scroll_15 = CCScrollView:create()
	scroll_15:setViewSize(CCBNodeExtend.ccb_size(100,100,0,self))
	scroll_15:setContainer(require("app.scenes.Star").new(_owner))
	scroll_15:setDirection(kCCScrollViewDirectionVertical)
	scroll_15:setContentSize(CCBNodeExtend.ccb_size(100,100,0,self))
	scroll_15:setAnchorPoint(ccp(0.0,0.0))
	scroll_15:setScale(1)
	scroll_15:setIgnoreAnchorPointForPosition(true)


	self:addChild(scroll_15)


	local cccb_16 = CCControlButton:create()
	cccb_16:setTitleForState(CCString:create("按\n我"),CCControlStateNormal)
	cccb_16:setTitleTTFForState("Helvetica",CCControlStateNormal)
	cccb_16:setTitleTTFSizeForState(20,CCControlStateNormal)
	cccb_16:setTitleColorForState(ccc3(254,251,0),CCControlStateNormal)
	cccb_16:setBackgroundSpriteFrameForState(CCBNodeExtend.ccb_display_frame("battle_win/luxietiao.png"),CCControlStateNormal)
	cccb_16:setTitleColorForState(ccc3(255,38,0),CCControlStateSelected)
	cccb_16:setBackgroundSpriteFrameForState(CCBNodeExtend.ccb_display_frame("battle_win/luxietiaodi.png"),CCControlStateSelected)
	cccb_16:setTitleColorForState(ccc3(254,251,0),CCControlStateDisabled)

	cccb_16:setPreferredSize(CCBNodeExtend.ccb_size(120,100,0,self))

	cccb_16:setEnabled(true)
	cccb_16:addHandleOfControlEvent(function() _owner:onBtnCCC(cccb_16:getTag(), cccb_16) end,CCControlEventTouchDown)
	cccb_16:setPosition(CCBNodeExtend.ccb_pos(786.24017333984375,141.12002563476562,0,self))
	cccb_16:setAnchorPoint(ccp(0.5,0.5))
	cccb_16:setScaleX(1)
	cccb_16:setScaleY(1)
	cccb_16:setIgnoreAnchorPointForPosition(false)
	cccb_16:setPreferredSize(CCBNodeExtend.ccb_size(120,100,0,self))


	self:addChild(cccb_16)


	local ttf_17 = CCLabelBMFont:create("1000", "fonts/hurtnumbers.fnt")
	ttf_17:setPosition(CCBNodeExtend.ccb_pos(135,191,0,self))
	ttf_17:setAnchorPoint(ccp(0.5,0.5))
	ttf_17:setScaleX(1)
	ttf_17:setScaleY(1)
	ttf_17:setIgnoreAnchorPointForPosition(false)


	self:addChild(ttf_17)


	local sprite9_18 = CCScale9Sprite:createWithSpriteFrame(CCBNodeExtend.ccb_display_frame("jia.png", "button.plist"))
	CCBNodeExtend.addTouchListener(sprite9_18, handler(_owner, assert(_owner.onBtnBack,"onBtnBack")))
	sprite9_18:setAnchorPoint(ccp(0,0))
	CCBNodeExtend.banTouch(sprite9_18)
	CCBNodeExtend.cap_insets(sprite9_18,0.0,0.0,0.0,0.0)
	sprite9_18:setPosition(CCBNodeExtend.ccb_pos(443.44000244140625,46.89599609375,0,self))
	sprite9_18:setScaleX(1)
	sprite9_18:setScaleY(1)
	sprite9_18:setIgnoreAnchorPointForPosition(false)
	sprite9_18:setPreferredSize(CCBNodeExtend.ccb_size(200,116,0,self))
	sprite9_18:setOpacity(255)
	sprite9_18:setColor(ccc3(255,255,255))


	self:addChild(sprite9_18)


	self._banTouch2 = sprite9_18
	local sprite9_19 = CCScale9Sprite:create("mask.png")
	sprite9_19:setAnchorPoint(ccp(0,0))
	CCBNodeExtend.banTouch(sprite9_19)
	CCBNodeExtend.cap_insets(sprite9_19,0.0,0.0,0.0,0.0)
	sprite9_19:setPosition(CCBNodeExtend.ccb_pos(585,58,0,self))
	sprite9_19:setScaleX(1)
	sprite9_19:setScaleY(1)
	sprite9_19:setIgnoreAnchorPointForPosition(false)
	sprite9_19:setPreferredSize(CCBNodeExtend.ccb_size(200,150,0,self))
	sprite9_19:setOpacity(255)
	sprite9_19:setColor(ccc3(255,255,255))


	self:addChild(sprite9_19)


	self._banTouch = sprite9_19


end

return Layer_layout