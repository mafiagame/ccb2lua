
local Sprite_layout = class("Sprite_layout",function()
    return display.newLayer()
end)



function Sprite_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(CCBNodeExtend.ccb_size(100,100,1,nil))
	self:ignoreAnchorPointForPosition(true)

	local sprite_1 = display.newSprite("daxingxing_1.png")
	sprite_1:setPosition(CCBNodeExtend.ccb_pos(20,50,4,self))
	sprite_1:setAnchorPoint(cc.p(0.5,0.5))
	sprite_1:ignoreAnchorPointForPosition(false)


	self:addChild(sprite_1)


	self.CCSprite = sprite_1
	local ttf_2 = display.newTTFLabel({
		text = "无响应",
		font = "Helvetica",
		size = 20,
	})
	ttf_2:setAnchorPoint(cc.p(0.5,0.5))
	ttf_2:setPosition(CCBNodeExtend.ccb_pos(50,-50,4,sprite_1))
	ttf_2:ignoreAnchorPointForPosition(false)


	sprite_1:addChild(ttf_2)


	self.CCLabelTTF = ttf_2

	local sprite_3 = display.newSprite("daxingxing_1.png")
	CCBNodeExtend.addTouchListener(sprite_3, handler(_owner, _owner.onBtnClick))
	sprite_3:setPosition(CCBNodeExtend.ccb_pos(80,50,4,self))
	sprite_3:setAnchorPoint(cc.p(0.5,0.5))
	sprite_3:ignoreAnchorPointForPosition(false)


	self:addChild(sprite_3)


	self.CCSprite = sprite_3
	local ttf_4 = display.newTTFLabel({
		text = "响应并变色(Doc root var)",
		font = "Helvetica",
		size = 20,
	})
	ttf_4:setAnchorPoint(cc.p(0.5,0.5))
	ttf_4:setPosition(CCBNodeExtend.ccb_pos(50,-50,4,sprite_3))
	ttf_4:ignoreAnchorPointForPosition(false)


	sprite_3:addChild(ttf_4)


	self.CCLabelTTF = ttf_4

	local sprite_5 = display.newSprite("daxingxing_1.png")
	CCBNodeExtend.addTouchListenerEx(sprite_5, handler(_owner, _owner.onBtnClick))
	sprite_5:setPosition(CCBNodeExtend.ccb_pos(50,50,4,self))
	sprite_5:setAnchorPoint(cc.p(0.5,0.5))
	sprite_5:ignoreAnchorPointForPosition(false)


	self:addChild(sprite_5)


	self.CCSprite = sprite_5
	local ttf_6 = display.newTTFLabel({
		text = "响应(Owner var)",
		font = "Helvetica",
		size = 20,
	})
	ttf_6:setAnchorPoint(cc.p(0.5,0.5))
	ttf_6:setPosition(CCBNodeExtend.ccb_pos(50,-50,4,sprite_5))
	ttf_6:ignoreAnchorPointForPosition(false)


	sprite_5:addChild(ttf_6)


	self.CCLabelTTF = ttf_6

	local ttf_7 = display.newTTFLabel({
		text = "Sprite测试",
		font = "Helvetica",
		size = 30,
	})
	ttf_7:setAnchorPoint(cc.p(0.5,0.5))
	ttf_7:setPosition(CCBNodeExtend.ccb_pos(50,80,4,self))
	ttf_7:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_7)


	self._title = ttf_7

end

function Sprite_layout:onBtnClick(_tag, _sprite)
	print("You should override this methed: <onBtnClick>",_tag)
end


return Sprite_layout