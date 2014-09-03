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


function CCBNodeExtend.newButton(params)
    local normal  = params.normal
    local select  = params.select
    local disable = params.disable
    local listener= params.listener

    if normal then normal:retain() end
    if select then select:retain() end
    if disable then disable:retain() end


    local button = CCNodeExtend.extend(CCSprite:createWithSpriteFrame(normal))
    button.enable = true
    button:setTouchEnabled(true)
    button:addTouchEventListener(function(event,x,y)
        if not button.enable then
            return
        end
        if event == "began" then
            if select then
                button:setDisplayFrame(select)
            else
                button:setOpacity(200)
            end
            time = os.clock()
            return 1
        elseif event == "moved" then
            button.isMoved =true
        elseif event == "ended" then
            if select then
                button:setDisplayFrame(normal)
            else
                button:setOpacity(255)
            end
            if listener and (not button.isMoved or os.clock() - time <= 0.03) then
                listener(button)
            end
            button.isMoved = false
        end
    end)

    function button:setEnabled(enable)
        if self.enable ~= enable and disable then
            if enable then
                self:setDisplayFrame(normal)
            else
                self:setDisplayFrame(disable)
            end
        end
        self.enable = enable
    end

    return button
end

function CCBNodeExtend.banTouch(_scale9, _callfunc)
    assert(tolua.cast(_scale9, "CCScale9Sprite"),"Only CCScale9Sprite could add ban touch!")

    _scale9:setTouchEnabled(true)
    _scale9:addTouchEventListener(function(event,x,y)
        if event == "began" then
            print("banTouch")
            return 1
        elseif event == "ended" then
            if _callfunc then _callfunc(x,y) end
        end
    end,false,-129,true)
end

function CCBNodeExtend.addBanSpriteLayer(target,opacity,zorder,pos,callfunc)
    zorder  = zorder or 0
    opacity = opacity or 0
    pos     = pos or ccp(0,0)
    
    assert(target._____banTouch == nil, "Target already have ban layer!!!")
    target._____banTouch = display.newScale9Sprite("mask.png", 0, 0, CCSize(display.width,display.height))
    target._____banTouch:setOpacity(opacity)
    CCBNodeExtend.banTouch(target._____banTouch, _callfunc)
    target:addChild(target._____banTouch,zorder)

    return target._____banTouch
end

function CCBNodeExtend.removeBanSpriteLayer(target)
    assert(target._____banTouch ~= nil, "Target doesn't have ban layer!!!")
    target._____banTouch:removeFromParent()
    target._____banTouch = nil
end


