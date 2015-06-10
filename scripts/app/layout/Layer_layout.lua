
local Layer_layout = class("Layer_layout",function()
    return display.newLayer()
end)





function Layer_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(cc.size(display.width * 1.0, display.height * 1.0))
	self:ignoreAnchorPointForPosition(true)

	self._title = display.newTTFLabel({
		text = "Sprite测试",
		font = "Helvetica",
		size = 30,
	})
	self._title:setAnchorPoint(cc.p(0.5,0.5))
	self._title:setPosition(cc.p(self:getContentSize().width * 0.5, self:getContentSize().height * 0.909375))
	self._title:ignoreAnchorPointForPosition(false)

	self:addChild(self._title)

	local cclayercolor_2 = cc.LayerColor:create(cc.c4b(255,0,0,255))
	cclayercolor_2:setBlendFunc(770, 771)
	cclayercolor_2:setAnchorPoint(cc.p(0.5,0.5))
	cclayercolor_2:setPosition(cc.p(222.944, 411.264))
	cclayercolor_2:setContentSize(cc.size(200, 100))
	cclayercolor_2:ignoreAnchorPointForPosition(true)

	self:addChild(cclayercolor_2)

	local cclabelttf_3 = display.newTTFLabel({
		text = "ColorLayer",
		font = "Helvetica",
		size = 30,
	})
	cclabelttf_3:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_3:setPosition(cc.p(324.896, 362.88))
	cclabelttf_3:ignoreAnchorPointForPosition(false)

	self:addChild(cclabelttf_3)

	local ccscrollview_4 = cc.ScrollView:create()

	ccscrollview_4:setViewSize(cc.size(200, 100))
	ccscrollview_4:setContainer(require("app.widgets.Myccb").new(_owner))
	ccscrollview_4:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
	ccscrollview_4:setAnchorPoint(cc.p(0.5,0.5))
	ccscrollview_4:setPosition(cc.p(459.168, 419.9041))
	ccscrollview_4:ignoreAnchorPointForPosition(true)

	self:addChild(ccscrollview_4)

	local cclabelttf_5 = display.newTTFLabel({
		text = "CCScrollView",
		font = "Helvetica",
		size = 30,
	})
	cclabelttf_5:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_5:setPosition(cc.p(544.896, 362.88))
	cclabelttf_5:ignoreAnchorPointForPosition(false)

	self:addChild(cclabelttf_5)

	local cclayer_6 = display.newLayer()
	cclayer_6:setAnchorPoint(cc.p(0.5,0.5))
	cclayer_6:setPosition(cc.p(11.216, 381.888))
	cclayer_6:setContentSize(cc.size(200, 100))
	cclayer_6:ignoreAnchorPointForPosition(true)

	self:addChild(cclayer_6)

	local ccbfile_7 = require("app.widgets.Myccb").new(_owner)
	ccbfile_7:setPosition(cc.p(cclayer_6:getContentSize().width * 0.5, cclayer_6:getContentSize().height * 0.5))

	cclayer_6:addChild(ccbfile_7)

	local cclabelttf_8 = display.newTTFLabel({
		text = "CCLayer(因为看不见,所以加了东西)",
		font = "Helvetica",
		size = 25,
		align = 0,
		valign = 0,
		dimensions = cc.size(200, 200),
	})
	cclabelttf_8:setAnchorPoint(cc.p(0.5,1))
	cclabelttf_8:setPosition(cc.p(124.896, 362.88))
	cclabelttf_8:ignoreAnchorPointForPosition(false)

	self:addChild(cclabelttf_8)

	local cclabelttf_9 = display.newTTFLabel({
		text = "CCLayerGradient(因为不常用,所以没有实现)",
		font = "Helvetica",
		size = 25,
		align = 0,
		valign = 0,
		dimensions = cc.size(200, 200),
	})
	cclabelttf_9:setAnchorPoint(cc.p(0.5,1))
	cclabelttf_9:setPosition(cc.p(784.896, 372.88))
	cclabelttf_9:ignoreAnchorPointForPosition(false)

	self:addChild(cclabelttf_9)


end



return Layer_layout