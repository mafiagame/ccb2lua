
local BattleWinLayer1_layout = class("BattleWinLayer1_layout",function()
    return CCBNodeExtend.extend(display.newLayer())
end)


function BattleWinLayer1_layout:ctor()
	self:ccb_sizs(100,100,1)
	self:ccb_anchor(0.5,0.5)
	self:ccb_scale(1,1,false,0)
	self:ccb_ignore_anchor_for_position(true)

	local sprite = CCBNodeExtend.extend(display.newSprite())
	sprite:ccb_pos(366.5,183.33332824707031,0)
	sprite:ccb_anchor(0.5,0.5)
	sprite:ccb_scale(1,1,false,0)
	sprite:ccb_ignore_anchor_for_position(false)
	sprite:ccb_display_frame("battle_win/tiao.png")

	self:addChild(sprite)


	local node = CCBNodeExtend.extend(display.newNode())
	node:ccb_anchor(0.0,0.0)
	node:ccb_scale(1,1,false,0)
	node:ccb_ignore_anchor_for_position(false)

	sprite:addChild(node)





	local mask = CCBNodeExtend.extend(CCLayerColor:create())
	mask:ccb_sizs(100,100,0)
	mask:ccb_anchor(0.5,0.5)
	mask:ccb_scale(1,1,false,0)
	mask:ccb_ignore_anchor_for_position(true)
	mask:ccb_color(255,0,0)
	mask:ccb_opacity(255)

	self:addChild(mask)


	local sprite = CCBNodeExtend.extend(display.newSprite())
	sprite:ccb_pos(502.01602172851562,420.48001098632812,0)
	sprite:ccb_anchor(0.5,0.5)
	sprite:ccb_scale(1,1,false,0)
	sprite:ccb_ignore_anchor_for_position(false)
	sprite:ccb_display_frame("battle_win/diban.png")

	self:addChild(sprite)






end

return BattleWinLayer1_layout