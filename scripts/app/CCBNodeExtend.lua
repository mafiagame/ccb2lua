--
-- Author: wangbilt<wangbilt@gmail.com>
-- Date: 2014-08-17 23:40:23
--

CCBNodeExtend = {}

function CCBNodeExtend.extend(target)
    local t = tolua.getpeer(target)
    if not t then
        t = {}
        tolua.setpeer(target, t)
    end

    for k,v in pairs(CCBNodeExtend) do
    	if k ~= "extend" then
    		assert(target[k] == nil)
    		target[k] = v
    	end
	end
    
    return target
end

function CCBNodeExtend:ccb_anchor(x,y)
	self:setAnchorPoint(ccp(x,y))
end

function CCBNodeExtend:ccb_pos(x,y,flag)
	self:setPosition(ccp(x,y))
end

function CCBNodeExtend:ccb_scale(x,y,flag)
	self:setScaleX(x)
	self:setScaleY(y)
end

function CCBNodeExtend:ccb_ignore_anchor_for_position(is)
	self:setIgnoreAnchorPointForPosition(is)
end

function CCBNodeExtend:ccb_display_frame(name)
	local frame = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(name)
	if not frame then
		local texture = CCTextureCache:sharedTextureCache():addImage(name)
		frame = CCSpriteFrame:createWithTexture(texture, CCRect(0, 0, texture:getContentSize().width, texture:getContentSize().height))
	end

	self:setDisplayFrame(frame)
end

function CCBNodeExtend:ccb_sizs(w,h,flag)
	self:setContentSize(CCSize(w,h))
end

function CCBNodeExtend:ccb_color(r,g,b)
	self:setColor(ccc3(r,g,b))
end

function CCBNodeExtend:ccb_opacity(opacity)
	self:setOpacity(opacity)
end

