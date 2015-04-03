--
-- Author: wangbilt<wangbilt@gmail.com>
-- Date: 2014-08-17 23:40:23
--

ccbutils = {}

function ccbutils.ccb_pos(x, y, flag, parent)
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

function ccbutils.cap_insets(self, left, top, right, bottom)
    self:setInsetLeft(left);
    self:setInsetTop(top);
    self:setInsetRight(right);
    self:setInsetBottom(bottom);
end

local sharedSpriteFrameCache = cc.SpriteFrameCache:getInstance()
local sharedTextureCache     = cc.Director:getInstance():getTextureCache()

function ccbutils.ccb_display_frame(name, plist)
    if plist then
        local img_name = string.gsub(plist,".plist$",".png")
        sharedSpriteFrameCache:addSpriteFramesWithFile(plist,img_name)
    end
    local frame = sharedSpriteFrameCache:getSpriteFrame(name)
    if not frame then
        local texture = sharedTextureCache:addImage(name)
        if texture then
            frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(0, 0, texture:getContentSize().width, texture:getContentSize().height))
        end
    end
    return frame
end

function ccbutils.addTouchListenerEx(sprite, listener)
    sprite:setTouchEnabled(true)
    sprite:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
        if event.name == "began" then
            sprite.____pos = cc.p(event.x,event.y)
            return 1
        elseif event.name == "moved" then
        elseif event.name == "ended" then
            if cc.pGetDistance( sprite.____pos, cc.p(event.x,event.y)) < TOUCHALLOWAREA then
                listener(sprite)
            end
        end
    end)
    return sprite
end

function ccbutils.addTouchListener(sprite, listener, opacity)
    local src_opacity = 0
    opacity = opacity or 200
    sprite:setTouchEnabled(true)
    sprite:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
        if event.name == "began" then
            src_opacity = sprite:getOpacity()
            sprite:setOpacity(opacity)
            sprite.____pos = cc.p(event.x,event.y)
            return 1
        elseif event.name == "moved" then
        elseif event.name == "ended" then
            sprite:setOpacity(src_opacity)
            if cc.pGetDistance( sprite.____pos, cc.p(event.x,event.y)) < TOUCHALLOWAREA then
                listener(sprite)
            end
        end
    end)
    return sprite
end

function ccbutils.addTouchEventListener(sprite, listener, opacity)
    local src_opacity = 0
    opacity = opacity or 200
    sprite:setTouchEnabled(true)
    sprite:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
        if event.name == "began" then
            src_opacity = sprite:getOpacity()
            sprite:setOpacity(150)
        elseif event.name == "ended" then
            sprite:setOpacity(src_opacity)
        end
    
        return listener(event)
    end)
end


function ccbutils.banTouch(_sprite, _callfunc)
    _sprite:setTouchEnabled(true)
    _sprite:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event,x,y)
        if event.name == "began" then
            print("banTouch")
            return 1
        elseif event.name == "ended" then
            if _callfunc then _callfunc(x,y) end
        end
    end,false,-129,true)
end
