
local Sprite_layout = class("Sprite_layout",function()
    return display.newLayer()
end)





function Sprite_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(cc.size(display.width * 1.0, display.height * 1.0))
	self:ignoreAnchorPointForPosition(true)

	local ccsprite_1 = display.newSprite("daxingxing_1.png")
	ccsprite_1:setPosition(cc.p(self:getContentSize().width * 0.2, self:getContentSize().height * 0.5))
	ccsprite_1:setAnchorPoint(cc.p(0.5,0.5))
	ccsprite_1:ignoreAnchorPointForPosition(false)

	self:addChild(ccsprite_1)

	local cclabelttf_2 = display.newTTFLabel({
		text = "无响应",
		font = "Helvetica",
		size = 20,
	})
	cclabelttf_2:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_2:setPosition(cc.p(ccsprite_1:getContentSize().width * 0.5, ccsprite_1:getContentSize().height * -0.5))
	cclabelttf_2:ignoreAnchorPointForPosition(false)

	ccsprite_1:addChild(cclabelttf_2)

	local ccsprite_3 = display.newSprite("daxingxing_1.png")
	ccbutils.addTouchListener(ccsprite_3, handler(_owner, _owner.onBtnClick))	
	ccsprite_3:setPosition(cc.p(self:getContentSize().width * 0.8, self:getContentSize().height * 0.5))
	ccsprite_3:setAnchorPoint(cc.p(0.5,0.5))
	ccsprite_3:ignoreAnchorPointForPosition(false)

	self:addChild(ccsprite_3)

	local cclabelttf_4 = display.newTTFLabel({
		text = "响应并变色(Doc root var)",
		font = "Helvetica",
		size = 20,
	})
	cclabelttf_4:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_4:setPosition(cc.p(ccsprite_3:getContentSize().width * 0.5, ccsprite_3:getContentSize().height * -0.5))
	cclabelttf_4:ignoreAnchorPointForPosition(false)

	ccsprite_3:addChild(cclabelttf_4)

	local ccsprite_5 = display.newSprite("daxingxing_1.png")
	ccbutils.addTouchListenerEx(ccsprite_5, handler(_owner, _owner.onBtnClick))	
	ccsprite_5:setPosition(cc.p(self:getContentSize().width * 0.5, self:getContentSize().height * 0.5))
	ccsprite_5:setAnchorPoint(cc.p(0.5,0.5))
	ccsprite_5:ignoreAnchorPointForPosition(false)

	self:addChild(ccsprite_5)

	local cclabelttf_6 = display.newTTFLabel({
		text = "响应(Owner var)",
		font = "Helvetica",
		size = 20,
	})
	cclabelttf_6:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_6:setPosition(cc.p(ccsprite_5:getContentSize().width * 0.5, ccsprite_5:getContentSize().height * -0.5))
	cclabelttf_6:ignoreAnchorPointForPosition(false)

	ccsprite_5:addChild(cclabelttf_6)

	self._title = display.newTTFLabel({
		text = "Sprite测试",
		font = "Helvetica",
		size = 30,
	})
	self._title:setAnchorPoint(cc.p(0.5,0.5))
	self._title:setPosition(cc.p(self:getContentSize().width * 0.5, self:getContentSize().height * 0.8))
	self._title:ignoreAnchorPointForPosition(false)

	self:addChild(self._title)


end

function Sprite_layout:onBtnClick(_tag, _sprite)
	error("You should override this methed: <onBtnClick>")
end


return Sprite_layout