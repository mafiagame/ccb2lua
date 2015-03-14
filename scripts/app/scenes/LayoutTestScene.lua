--
-- Author: justbilt
-- Date: 2015-02-25 17:36:46
--


local LayoutTestScene = class("LayoutTestScene", function()
    return display.newScene("LayoutTestScene")
end)


function LayoutTestScene:ctor()
    local ui = require("app.layout.Layout_layout").new(self)
        :addTo(self)

    for i=1,10 do
        local node = display.newScale9Sprite("battle_win/diban.png")
        	:size(ui._vl:getViewSize().width-20,100)
        local label = CCLabelTTF:create("您赢了"..i, "Helvetica", 20)
        label:setPosition(node:getContentSize().width/2,node:getContentSize().height/2)
        node:addChild(label)

        ui._vl:push(node)
    end
    ui._vl:layout(true)


	ui._hl:push(self:newNode2())

	local layout = AutoLayout:newLayout()
	layout:push(self:newNode2())
	layout:push(self:newNode2())
	ui._hl:pushLayout(layout, kCCScrollViewDirectionVertical)

	local layout = AutoLayout:newLayout()
	layout:push(self:newNode2())
	layout:push(self:newNode2())
	layout:push(self:newNode2())
	ui._hl:pushLayout(layout, kCCScrollViewDirectionVertical)

	local layout = AutoLayout:newLayout()
	layout:push(self:newNode2())
	layout:push(self:newNode2())
	layout:push(self:newNode2())
	layout:push(self:newNode2())
	ui._hl:pushLayout(layout, kCCScrollViewDirectionVertical)

	local layout = AutoLayout:newLayout()
	layout:push(self:newNode2())
	layout:push(self:newNode2())
	layout:push(self:newNode2())
	layout:push(self:newNode2())
	layout:push(self:newNode2())
	ui._hl:pushLayout(layout, kCCScrollViewDirectionVertical)

    ui._hl:layout(true)

end

local count = 1
function LayoutTestScene:newNode2()
    local node = display.newSprite("battle_win/daxingxing_1.png")
    local label = CCLabelTTF:create("您赢了"..count, "Helvetica", 20)
    label:setPosition(node:getContentSize().width/2,node:getContentSize().height/2)
    node:addChild(label)
    count = count + 1

    return node
end

return LayoutTestScene