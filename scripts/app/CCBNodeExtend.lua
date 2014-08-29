--
-- Author: wangbilt<wangbilt@gmail.com>
-- Date: 2014-08-17 23:40:23
--

CCBNodeExtend = {}

function CCBNodeExtend.ccb_pos(x, y, flag, parent)
	if flag == 4 then
		if parent then
			return parent:getContentSize().width*(x/100), parent:getContentSize().height*(y/100)
		else
			return display.width*x, display.height*y
		end
	else
		return x,y
	end
end

function CCBNodeExtend.cap_insets(self, left, top, right, bottom)
	self:setInsetLeft(left);
	self:setInsetTop(top);
	self:setInsetRight(right);
	self:setInsetBottom(bottom);
end

function CCBNodeExtend.ccb_display_frame(name, plist)
	if plist then
		CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile(plist)
	end
	local frame = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(name)
	if not frame then
		local texture = CCTextureCache:sharedTextureCache():addImage(name)
		frame = CCSpriteFrame:createWithTexture(texture, CCRect(0, 0, texture:getContentSize().width, texture:getContentSize().height))
	end
	return frame
end

function CCBNodeExtend.ccb_size(w, h, flag, parent)
	if flag == 1 then
		if parent then
			return CCSize(parent:getContentSize().width*(w/100),parent:getContentSize().height*(h/100))
		else
			return CCSize(display.width*(w/100),display.height*(h/100))
		end
	else
		return CCSize(w,h)
	end
end

function CCBNodeExtend.addTouchListener(sprite, listener)
    sprite:setTouchEnabled(true)
    sprite:addTouchEventListener(function(event,x,y)
        if event == "began" then
            sprite:setOpacity(150)
            time = os.clock()
            return 1
        elseif event == "moved" then
            sprite.isMoved =true 
        elseif event == "ended" then
            sprite:setOpacity(255)
            if not sprite.isMoved or os.clock() - time <= 0.03 then
                listener(sprite)
            end
            sprite.isMoved = false
        end
    end)
    return sprite
end

