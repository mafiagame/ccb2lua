
local subdir_layout = class("subdir_layout",function()
    return display.newSprite()
end)





function subdir_layout:ctor(_owner)
	 _owner = _owner or self
	self:setSpriteFrame(ccbutils.ccb_display_frame("daxingxing_1.png"))
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:ignoreAnchorPointForPosition(false)

	self._name = display.newTTFLabel({
		text = "第一名",
		font = "Helvetica",
		size = 20,
	})
	self._name:setAnchorPoint(cc.p(0.5,0.5))
	self._name:setColor(cc.c3b(0,0,0))
	self._name:setPosition(cc.p(self:getContentSize().width * 0.5, self:getContentSize().height * 0.5))
	self._name:ignoreAnchorPointForPosition(false)

	self:addChild(self._name)

	self._score = display.newTTFLabel({
		text = "500",
		font = "Helvetica",
		size = 20,
	})
	self._score:setAnchorPoint(cc.p(0.5,0.5))
	self._score:setColor(cc.c3b(0,0,0))
	self._score:setPosition(cc.p(self:getContentSize().width * 0.5, self:getContentSize().height * 0.34))
	self._score:ignoreAnchorPointForPosition(false)

	self:addChild(self._score)

	local ccbfile_3 = require("app.layout.subdir.subButton_layout").new(_owner)
	ccbfile_3:setPosition(cc.p(-272, -180))

	self:addChild(ccbfile_3)


end



return subdir_layout