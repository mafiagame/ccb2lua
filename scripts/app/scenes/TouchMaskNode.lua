--
-- Author: justbilt
-- Date: 2014-11-19 11:47:40
--


local TouchMaskNode = class("TouchMaskNode", function(_frame)
	return display.newScale9Sprite(_frame)
end)


function TouchMaskNode:setOpacity(_value)
	self:updateDisplayedOpacity(0)
end

function TouchMaskNode:addTouchListener(_callfunc)
    self:setTouchEnabled(true)
    self:addTouchEventListener(function(event,x,y)
        if event == "began" then
            self.____pos = ccp(x,y)
            return 1
        elseif event == "moved" then
        elseif event == "ended" then
            if ccpDistance(self.____pos, ccp(x,y)) < 20 then
                _callfunc(self)
            end
        end
    end)
    return self
end

return TouchMaskNode