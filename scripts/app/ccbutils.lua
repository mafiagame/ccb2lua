--
-- Author: wangbilt<wangbilt@gmail.com>
-- Date: 2014-08-17 23:40:23
--

ccbutils = {}

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
