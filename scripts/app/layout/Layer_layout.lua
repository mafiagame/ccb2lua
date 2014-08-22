
local Layer_layout = class("Layer_layout",function()
    return display.newLayer()
end)


function Layer_layout:ctor(_owner)
	self:setContentSize(CCBNodeExtend.ccb_size(100,100,1,nil))
	self:setAnchorPoint(ccp(0.5,0.5))
	self:setScaleX(1)
	self:setScaleY(1)
	self:setIgnoreAnchorPointForPosition(true)

	local mask = CCLayerColor:create()
	mask:setContentSize(CCBNodeExtend.ccb_size(100,100,1,self))
	mask:setAnchorPoint(ccp(0.5,0.5))
	mask:setScaleX(1)
	mask:setScaleY(1)
	mask:setIgnoreAnchorPointForPosition(true)
	mask:setColor(ccc3(170,121,65))
	mask:setOpacity(150)

	self:addChild(mask)


	local node = display.newNode()
	node:setPosition(CCBNodeExtend.ccb_pos(50,50,4,self))
	node:setAnchorPoint(ccp(0.0,0.0))
	node:setScaleX(1)
	node:setScaleY(1)
	node:setIgnoreAnchorPointForPosition(false)

	self:addChild(node)


	local sprite = display.newSprite()
	CCBNodeExtend.touchSprite(sprite,handler(_owner, _owner.onBtnReady),200)
	sprite:setPosition(CCBNodeExtend.ccb_pos(-316.80007934570312,86.639984130859375,0,node))
	sprite:setAnchorPoint(ccp(0.5,0.5))
	sprite:setScaleX(0.69999998807907104)
	sprite:setScaleY(0.69999998807907104)
	sprite:setIgnoreAnchorPointForPosition(false)
	sprite:setDisplayFrame(CCBNodeExtend.ccb_display_frame("battle_win/guang.png"))

	node:addChild(sprite)


	local ccb = require("app.layout.Star_layout").new()
	ccb:setPosition(CCBNodeExtend.ccb_pos(0.0,150,0,node))
	ccb:setScaleX(1)
	ccb:setScaleY(1)

	node:addChild(ccb)


	local ccb = require("app.layout.Star_layout").new()
	ccb:setPosition(CCBNodeExtend.ccb_pos(-150,230,0,node))
	ccb:setScaleX(1)
	ccb:setScaleY(1)

	node:addChild(ccb)


	local ccb = require("app.layout.Star_layout").new()
	ccb:setPosition(CCBNodeExtend.ccb_pos(150,230,0,node))
	ccb:setScaleX(1)
	ccb:setScaleY(1)

	node:addChild(ccb)


	local ttf = CCLabelTTF:create("您赢了", "Helvetica", 80)
	ttf:setPosition(CCBNodeExtend.ccb_pos(0.0,40,0,node))
	ttf:setAnchorPoint(ccp(0.5,0.5))
	ttf:setScaleX(1)
	ttf:setScaleY(1)
	ttf:setIgnoreAnchorPointForPosition(false)
	ttf:setColor(ccc3(0,0,0))

	node:addChild(ttf)


	local sprite9 = CCScale9Sprite:create("battle_win/luxietiaodi.png")
	sprite9:setCapInsets(CCBNodeExtend.cap_insets(0.0,0.0,0.0,0.0))
	sprite9:setPosition(CCBNodeExtend.ccb_pos(-270,-60,0,node))
	sprite9:setAnchorPoint(ccp(0.0,0.5))
	sprite9:setScaleX(1)
	sprite9:setScaleY(1)
	sprite9:setIgnoreAnchorPointForPosition(false)
	sprite9:setPreferredSize(CCBNodeExtend.ccb_size(600,50,0,node))
	sprite9:setOpacity(255)
	sprite9:setColor(ccc3(255,255,255))


	node:addChild(sprite9)


	local sprite9 = CCScale9Sprite:create("battle_win/luxietiao.png")
	sprite9:setCapInsets(CCBNodeExtend.cap_insets(0.0,0.0,0.0,0.0))
	sprite9:setPosition(CCBNodeExtend.ccb_pos(-267,-60,0,node))
	sprite9:setAnchorPoint(ccp(0.0,0.5))
	sprite9:setScaleX(1)
	sprite9:setScaleY(1)
	sprite9:setIgnoreAnchorPointForPosition(false)
	sprite9:setPreferredSize(CCBNodeExtend.ccb_size(300,42,0,node))
	sprite9:setOpacity(255)
	sprite9:setColor(ccc3(255,255,255))


	node:addChild(sprite9)





	local sprite = display.newSprite()
	sprite:setPosition(CCBNodeExtend.ccb_pos(50,48.4375,4,self))
	sprite:setAnchorPoint(ccp(0.5,0.5))
	sprite:setScaleX(1)
	sprite:setScaleY(1)
	sprite:setIgnoreAnchorPointForPosition(false)
	sprite:setDisplayFrame(CCBNodeExtend.ccb_display_frame("battle_win/tiao.png"))

	self:addChild(sprite)


	local menu = CCMenu:create()
	menu:setPosition(CCBNodeExtend.ccb_pos(50.092079162597656,-6500,4,sprite))
	menu:setAnchorPoint(ccp(0.5,0.5))
	menu:setScaleX(1)
	menu:setScaleY(1)
	menu:setIgnoreAnchorPointForPosition(true)

	sprite:addChild(menu)


	local menuitemimage = ui.newImageMenuItem({
		image = "battle_win/qianjin_1.png",
		imageSelected = "battle_win/qianjin_2.png",
		listener = handler(_owner, _owner.onBtnNext),
	})
	menuitemimage:setPosition(CCBNodeExtend.ccb_pos(120,0.0,0,menu))
	menuitemimage:setAnchorPoint(ccp(0.5,0.5))
	menuitemimage:setScaleX(1)
	menuitemimage:setScaleY(1)
	menuitemimage:setIgnoreAnchorPointForPosition(false)

	menu:addChild(menuitemimage)


	local menuitemimage = ui.newImageMenuItem({
		image = "battle_win/gognlai_1.png",
		imageSelected = "battle_win/gognlai_2.png",
		listener = handler(_owner, _owner.onBtnAgain),
	})
	menuitemimage:setPosition(CCBNodeExtend.ccb_pos(-120,0.0,0,menu))
	menuitemimage:setAnchorPoint(ccp(0.5,0.5))
	menuitemimage:setScaleX(1)
	menuitemimage:setScaleY(1)
	menuitemimage:setIgnoreAnchorPointForPosition(false)

	menu:addChild(menuitemimage)








	local scroll = CCScrollView:create()
	scroll:setContainer(require("app.layout.Star_layout").new())
	scroll:setDirection(kCCScrollViewDirectionVertical)
	scroll:setContentSize(CCBNodeExtend.ccb_size(100,100,0,self))
	scroll:setAnchorPoint(ccp(0.5,0.5))
	scroll:setScale(1)
	scroll:setIgnoreAnchorPointForPosition(true)

	self:addChild(scroll)






end

return Layer_layout