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
        local img_name = string.gsub(plist,".plist$",".png")
        CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile(plist,img_name)
    end
    local frame = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(name)
    if not frame then
        local texture = CCTextureCache:sharedTextureCache():addImage(name)
        if texture then
            frame = CCSpriteFrame:createWithTexture(texture, CCRect(0, 0, texture:getContentSize().width, texture:getContentSize().height))
        end
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

function CCBNodeExtend.addTouchListenerEx(sprite, listener)
    sprite:setTouchEnabled(true)
    sprite:addTouchEventListener(function(event,x,y)
        if event == "began" then
            sprite.____pos = ccp(x,y)
            return 1
        elseif event == "moved" then
        elseif event == "ended" then
            if ccpDistance( sprite.____pos, ccp(x,y)) < TOUCHALLOWAREA then
                listener(sprite)
            end
        end
    end)
    return sprite
end

function CCBNodeExtend.addTouchListener(sprite, listener, opacity)
    local src_opacity = 0
    opacity = opacity or 200
    sprite:setTouchEnabled(true)
    sprite:addTouchEventListener(function(event,x,y)
        if event == "began" then
            src_opacity = sprite:getOpacity()
            sprite:setOpacity(150)
            sprite.____pos = ccp(x,y)
            return 1
        elseif event == "moved" then
        elseif event == "ended" then
            sprite:setOpacity(src_opacity)
            if ccpDistance( sprite.____pos, ccp(x,y)) < TOUCHALLOWAREA then
                listener(sprite)
            end
        end
    end)
    return sprite
end

function CCBNodeExtend.addTouchEventListener(sprite, listener, opacity)
    local src_opacity = 0
    opacity = opacity or 200
    sprite:setTouchEnabled(true)
    sprite:addTouchEventListener(function(event,x,y)
        if event == "began" then
            src_opacity = sprite:getOpacity()
            sprite:setOpacity(150)
        elseif event == "ended" then
            sprite:setOpacity(src_opacity)
        end
    
        return listener(event,x,y)
    end)
end

function CCBNodeExtend.newEditBox(_params)
    local pos = ccp(_params.scale9:getPosition())
    local anchor = ccp(_params.scale9:getAnchorPoint())

    local editbox = CCEditBox:create(_params.scale9:getPreferredSize(), _params.scale9,nil,nil)

    if editbox then
        CCNodeExtend.extend(editbox)
        if _params.listener then editbox:addEditBoxEventListener(_params.listener) end
        print("newEditBox:", _params.scale9:getPosition())
        editbox:setPosition(pos)
        editbox:setAnchorPoint(anchor)
    end
    return editbox
end

function CCBNodeExtend.newProgressBar(_scale9)
    CCNodeExtend.extend(_scale9)

    _scale9.full = _scale9:getPreferredSize().width
    _scale9.precentage = 100
    _scale9.min = _scale9:getInsetLeft() + _scale9:getInsetRight()
    
    function _scale9:getPercentage(precentage)
        return self.precentage
    end

    function _scale9:setProgress(precentage)
        self.precentage = precentage
        local value = self.full*(precentage/100)
        self:setVisible(value > self.min)
        self:setPreferredSize(CCSize(math.max(self.min,value), self:getContentSize().height))
    end

    function _scale9:progressFromTo(from,to,time,callfunc,callfunc2)
        from = from or self.precentage
        local pre = to - from
        local cur_time = 0
        self:scheduleUpdate(function(dt)
            cur_time = cur_time + dt
            if callfunc2 then callfunc2(math.min(1,cur_time/time)) end
            if cur_time >= time then
                self:unscheduleUpdate()
                if callfunc then callfunc() end
            end
            from = math.min(100,from + (dt/time)*pre)
            self:setProgress(from)
        end)
    end


    return _scale9
end

function CCBNodeExtend.newSwitchButton(params)
    local states = {params.normal, params.select, params.disable}
    for k,v in pairs(states) do v:retain() end

    local button = CCNodeExtend.extend(CCSprite:createWithSpriteFrame(states[1]))
    button.state = 1
    button.state_count = #(states)
    button.enable = true
    button:setTouchEnabled(true)
    button:setNodeEventEnabled(true)
    button:addTouchEventListener(function(event,x,y)
        if not button.enable then
            return
        end
        if event == "began" then
            button:setOpacity(200)
            button.____pos = ccp(x,y)
            return 1
        elseif event == "moved" then
        elseif event == "ended" then
            if ccpDistance( button.____pos, ccp(x,y)) < TOUCHALLOWAREA then
                button:setOpacity(255)
                local new_state = button.state + 1
                if new_state > button.state_count then new_state = 1 end
                button:setState(new_state, true)
            end
        end
    end)

    function button:setState(_state, _auto)
        assert(_state>=1 and _state<=self.state_count)
        if self.state ~= _state then
            self.state = _state
            self:setDisplayFrame(states[self.state])
            if params.listener then params.listener(button, button.state, _auto) end
        end
    end

    function button:getState()
        return self.state
    end

    function button:setEnabled(enable)
        self.enable = enable
    end

    function button:onDestroy()
        for i,v in ipairs(states) do
            v:release()
        end
    end

    return button
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
    button:setNodeEventEnabled(true)
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
            button.____pos = ccp(x,y)
            return 1
        elseif event == "moved" then
        elseif event == "ended" then
            if select then
                button:setDisplayFrame(normal)
            else
                button:setOpacity(255)
            end
            if listener and ccpDistance( button.____pos, ccp(x,y)) < TOUCHALLOWAREA then
                -- GameAudio.playSound(string.format("sound/ui/%s.mp3","back"))
                GameAudio.dispatchEvent("pop",false)
                listener(button)
            end
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

    function button:onDestroy()
        if normal then normal:release() end
        if select then select:release() end
        if disable then disable:release() end
    end

    return button
end

function CCBNodeExtend.newProgressRadial(_frame)
    local progress = CCNodeExtend.extend(CCProgressTimer:create(CCSprite:createWithSpriteFrame(_frame)))
    progress:setType(kCCProgressTimerTypeRadial)
    progress:setPercentage(100)
    return progress
end

function CCBNodeExtend.banTouch(_sprite, _callfunc)
    -- assert(tolua.cast(_sprite, "CCScale9Sprite"),"Only CCScale9Sprite could add ban touch!")

    _sprite:setTouchEnabled(true)
    _sprite:addTouchEventListener(function(event,x,y)
        if event == "began" then
            print("banTouch")
            return 1
        elseif event == "ended" then
            if _callfunc then _callfunc(x,y) end
        end
    end,false,-129,true)
end

function CCBNodeExtend.addBanSpriteLayer(target,opacity,zorder,pos,callfunc,size)
    zorder  = zorder or 0
    opacity = opacity or 0
    pos     = pos or ccp(0,0)
    size    = size or CCSize(display.width,display.height)
    
    assert(target._____banTouch == nil, "Target already have ban layer!!!")
    target._____banTouch = display.newScale9Sprite("ui/common_mask.png", 0, 0, size)
    target._____banTouch:setOpacity(opacity)
    target._____banTouch:setPosition(pos)
    CCBNodeExtend.banTouch(target._____banTouch, callfunc)
    target:addChild(target._____banTouch,zorder)

    return target._____banTouch
end

function CCBNodeExtend.removeBanSpriteLayer(target)
    assert(target._____banTouch ~= nil, "Target doesn't have ban layer!!!")
    target._____banTouch:removeFromParent()
    target._____banTouch = nil
end

function CCBNodeExtend.LayoutExtend(_scroll)
    function _scroll:init(_padding, _container)
        _container = _container or display.newNode()

        self.padding = _padding or 0
        self.items = {}

        self:setContainer(_container)
    end
    
    function _scroll:addItem(_item, _relayout, _padding, _size)
        _size = _size or _item:getContentSize()
        _padding = _padding or self.padding

        self:getContainer():addChild(_item)
        table.insert(self.items, {item = _item, size = _size, padding = _padding})

        if _relayout then
            self:relayout()
        end
    end

    function _scroll:relayout(_keep)
        print("You should overwrite this function !!!")
    end
end


function CCBNodeExtend.newVerticalLayout(_scroll)
    _scroll = _scroll or CCScrollView:create()
    CCNodeExtend.extend(_scroll)
    CCBNodeExtend.LayoutExtend(_scroll)

    function _scroll:relayout(_keep)
        local container = self:getContainer()
        local val = nil
        local size = CCSize(0,0)
        local padding = 0
        for i= #(self.items), 1, -1 do
            val = self.items[i]
            val.item:setPosition(self:getViewSize().width/2,size.height + val.size.height/2)

            size.height = size.height + val.size.height + val.padding
            size.width = math.max(size.width, val.size.width)
        end

        self:setContentSize(size)

        if not _keep then
            self:setContentOffset(ccp(0,- (size.height - self:getViewSize().height)))
        end
    end

    return _scroll
end


function CCBNodeExtend.newHorizontalLayout(_scroll)
    _scroll = _scroll or CCScrollView:create()
    CCNodeExtend.extend(_scroll)
    CCBNodeExtend.LayoutExtend(_scroll)

    function _scroll:relayout(_keep)
        local container = self:getContainer()
        local val = nil
        local size = CCSize(0,0)
        local padding = 0
        for i= 1,#(self.items), 1 do
            val = self.items[i]
            val.item:setPosition(size.width + val.size.width/2 ,self:getViewSize().height/2)

            size.width = size.width + val.size.width + val.padding
            size.height = math.max(size.height, val.size.height)
        end

        self:setContentSize(size)

        if not _keep then
            self:setContentOffset(ccp(0, 0))
        end
    end

    return _scroll
end

function CCBNodeExtend.newGridLayout(_scroll)
    _scroll = _scroll or CCScrollView:create()
    CCNodeExtend.extend(_scroll)
    CCBNodeExtend.LayoutExtend(_scroll)

    function _scroll:relayout(_stripe, _keep)
        local container = self:getContainer()
        local val = nil
        local size = CCSize(0,0)
        local count = 0
        local max_width = 0
        local max_height = 0
        local width = 0
        for i,v in ipairs(self.items) do
            if count >= _stripe then
                count = 0
                width = size.width
                size.width = 0
                size.height = size.height + v.size.height + v.padding.height
            end
            size.width = size.width + v.size.width + v.padding.width

            max_width = math.max(max_width, size.width)
            width = math.max(width, size.width)
            count = count + 1

            val = v
        end

        max_height = size.height
        max_width = math.max(max_width, self:getViewSize().width)

        if (#self.items)%_stripe ~= 0 then
            max_height = size.height+val.size.height + val.padding.height
        end
        
        if (#self.items)%_stripe ~= 0 or size.height < self:getViewSize().height + val.size.height then
            
            self:setContentSize(CCSize(max_width, size.height+val.size.height + val.padding.height))
        else
            self:setContentSize(CCSize(max_width, size.height))
        end 
    
        count = 0
        size.width = 0        
        for i,v in ipairs(self.items) do
            if count >= _stripe then
                count = 0
                size.width = 0
                size.height = size.height - v.size.height - v.padding.height
            end
            v.item:setPosition((max_width-width)/2 + size.width + v.size.width/2, size.height + v.size.height/2)

            size.width = size.width + v.size.width + v.padding.width

            count = count + 1
        end

        if not _keep then
            self:setContentOffset(ccp(0,- (self:getContentSize().height - self:getViewSize().height)))
        end

        self:setTouchEnabled(max_height > self:getViewSize().height)
    end

    return _scroll
end
