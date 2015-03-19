
local Layer_layout = class("Layer_layout",function()
    return display.newLayer()
end)



function Layer_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(CCBNodeExtend.ccb_size(100,100,1,nil))
	self:ignoreAnchorPointForPosition(true)

	self._title = display.newTTFLabel({
		text = "Sprite测试",
		font = "Helvetica",
		size = 30,
	})
	self._title:setAnchorPoint(cc.p(0.5,0.5))
	self._title:setPosition(CCBNodeExtend.ccb_pos(50,90.9375,4,self))
	self._title:ignoreAnchorPointForPosition(false)


	self:addChild(self._title)


	local cclayercolor_2 = cc.LayerColor:create(cc.c4b(255,0,0,255))
	cclayercolor_2:setAnchorPoint(cc.p(0.5,0.5))
	cclayercolor_2:setPosition(CCBNodeExtend.ccb_pos(222.94400024414062,411.2640380859375,0,self))
	cclayercolor_2:setContentSize(CCBNodeExtend.ccb_size(200,100,0,self))
	cclayercolor_2:ignoreAnchorPointForPosition(true)


	self:addChild(cclayercolor_2)


	local cclabelttf_3 = display.newTTFLabel({
		text = "ColorLayer",
		font = "Helvetica",
		size = 30,
	})
	cclabelttf_3:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_3:setPosition(CCBNodeExtend.ccb_pos(324.89602661132812,362.88003540039062,0,self))
	cclabelttf_3:ignoreAnchorPointForPosition(false)


	self:addChild(cclabelttf_3)


	local ccscrollview_4 = cc.ScrollView:create()

	ccscrollview_4:setViewSize(CCBNodeExtend.ccb_size(200,100,0,self))
	ccscrollview_4:setContainer(require("app.widgets.Myccb").new(_owner))
	ccscrollview_4:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
	ccscrollview_4:setAnchorPoint(cc.p(0.5,0.5))
	ccscrollview_4:setPosition(CCBNodeExtend.ccb_pos(459.16802978515625,419.904052734375,0,self))
	ccscrollview_4:ignoreAnchorPointForPosition(true)


	self:addChild(ccscrollview_4)


	local cclabelttf_5 = display.newTTFLabel({
		text = "CCScrollView",
		font = "Helvetica",
		size = 30,
	})
	cclabelttf_5:setAnchorPoint(cc.p(0.5,0.5))
	cclabelttf_5:setPosition(CCBNodeExtend.ccb_pos(544.89599609375,362.88003540039062,0,self))
	cclabelttf_5:ignoreAnchorPointForPosition(false)


	self:addChild(cclabelttf_5)


	local cclayer_6 = display.newLayer()
	cclayer_6:setAnchorPoint(cc.p(0.5,0.5))
	cclayer_6:setPosition(CCBNodeExtend.ccb_pos(11.216009140014648,381.88803100585938,0,self))
	cclayer_6:setContentSize(CCBNodeExtend.ccb_size(200,100,0,self))
	cclayer_6:ignoreAnchorPointForPosition(true)


	self:addChild(cclayer_6)


	local ccbfile_7 = require("app.widgets.Myccb").new(_owner)
	ccbfile_7:setPosition(CCBNodeExtend.ccb_pos(50,50,4,cclayer_6))


	cclayer_6:addChild(ccbfile_7)



	local cclabelttf_8 = display.newTTFLabel({
		text = "CCLayer(因为看不见,所以加了东西)",
		font = "Helvetica",
		size = 25,
		align = 0,
		valign = 0,
		dimensions = CCBNodeExtend.ccb_size(200,200,0,self),
	})
	cclabelttf_8:setAnchorPoint(cc.p(0.5,1))
	cclabelttf_8:setPosition(CCBNodeExtend.ccb_pos(124.89602661132812,362.88003540039062,0,self))
	cclabelttf_8:ignoreAnchorPointForPosition(false)


	self:addChild(cclabelttf_8)


	local cclabelttf_9 = display.newTTFLabel({
		text = "CCLayerGradient(因为不常用,所以没有实现)",
		font = "Helvetica",
		size = 25,
		align = 0,
		valign = 0,
		dimensions = CCBNodeExtend.ccb_size(200,200,0,self),
	})
	cclabelttf_9:setAnchorPoint(cc.p(0.5,1))
	cclabelttf_9:setPosition(CCBNodeExtend.ccb_pos(784.89599609375,372.88003540039062,0,self))
	cclabelttf_9:ignoreAnchorPointForPosition(false)


	self:addChild(cclabelttf_9)



end



return Layer_layout