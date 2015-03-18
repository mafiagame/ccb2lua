
local Layer_layout = class("Layer_layout",function()
    return display.newLayer()
end)



function Layer_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(CCBNodeExtend.ccb_size(100,100,1,nil))
	self:ignoreAnchorPointForPosition(true)

	local ttf_1 = display.newTTFLabel({
		text = "Sprite测试",
		font = "Helvetica",
		size = 30,
	})
	ttf_1:setAnchorPoint(cc.p(0.5,0.5))
	ttf_1:setPosition(CCBNodeExtend.ccb_pos(50,90.9375,4,self))
	ttf_1:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_1)


	self._title = ttf_1
	local mask_2 = cc.LayerColor:create(cc.c4b(255,0,0,255))
	mask_2:setAnchorPoint(cc.p(0.5,0.5))
	mask_2:setPosition(CCBNodeExtend.ccb_pos(222.94400024414062,411.2640380859375,0,self))
	mask_2:setContentSize(CCBNodeExtend.ccb_size(200,100,0,self))
	mask_2:ignoreAnchorPointForPosition(true)


	self:addChild(mask_2)


	self.CCLayerColor = mask_2
	local ttf_3 = display.newTTFLabel({
		text = "ColorLayer",
		font = "Helvetica",
		size = 30,
	})
	ttf_3:setAnchorPoint(cc.p(0.5,0.5))
	ttf_3:setPosition(CCBNodeExtend.ccb_pos(324.89602661132812,362.88003540039062,0,self))
	ttf_3:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_3)


	self.CCLabelTTF = ttf_3
	local scroll_4 = cc.ScrollView:create()

	scroll_4:setViewSize(CCBNodeExtend.ccb_size(200,100,0,self))
	scroll_4:setContainer(require("app.widgets.Myccb").new(_owner))
	scroll_4:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
	scroll_4:setAnchorPoint(cc.p(0.5,0.5))
	scroll_4:setPosition(CCBNodeExtend.ccb_pos(459.16802978515625,419.904052734375,0,self))
	scroll_4:ignoreAnchorPointForPosition(true)


	self:addChild(scroll_4)


	self.CCScrollView = scroll_4
	local ttf_5 = display.newTTFLabel({
		text = "CCScrollView",
		font = "Helvetica",
		size = 30,
	})
	ttf_5:setAnchorPoint(cc.p(0.5,0.5))
	ttf_5:setPosition(CCBNodeExtend.ccb_pos(544.89599609375,362.88003540039062,0,self))
	ttf_5:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_5)


	self.CCLabelTTF = ttf_5
	local layer_6 = display.newLayer()
	layer_6:setAnchorPoint(cc.p(0.5,0.5))
	layer_6:setPosition(CCBNodeExtend.ccb_pos(11.216009140014648,381.88803100585938,0,self))
	layer_6:setContentSize(CCBNodeExtend.ccb_size(200,100,0,self))
	layer_6:ignoreAnchorPointForPosition(true)


	self:addChild(layer_6)


	self.CCLayer = layer_6
	local ccb_7 = require("app.widgets.Myccb").new(_owner)
	ccb_7:setPosition(CCBNodeExtend.ccb_pos(50,50,4,layer_6))


	layer_6:addChild(ccb_7)


	self.CCBFile = ccb_7

	local ttf_8 = display.newTTFLabel({
		text = "CCLayer(因为看不见,所以加了东西)",
		font = "Helvetica",
		size = 25,
		align = 0,
		valign = 0,
		dimensions = CCBNodeExtend.ccb_size(200,200,0,self),
	})
	ttf_8:setAnchorPoint(cc.p(0.5,1))
	ttf_8:setPosition(CCBNodeExtend.ccb_pos(124.89602661132812,362.88003540039062,0,self))
	ttf_8:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_8)


	self.CCLabelTTF = ttf_8
	local ttf_9 = display.newTTFLabel({
		text = "CCLayerGradient(因为不常用,所以没有实现)",
		font = "Helvetica",
		size = 25,
		align = 0,
		valign = 0,
		dimensions = CCBNodeExtend.ccb_size(200,200,0,self),
	})
	ttf_9:setAnchorPoint(cc.p(0.5,1))
	ttf_9:setPosition(CCBNodeExtend.ccb_pos(784.89599609375,372.88003540039062,0,self))
	ttf_9:ignoreAnchorPointForPosition(false)


	self:addChild(ttf_9)


	self.CCLabelTTF = ttf_9

end



return Layer_layout