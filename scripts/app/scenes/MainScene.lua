
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    self:addChild(self:createMenu({
        "CCB",
        "Layer",
        "LabelLayer",
        "ButtonLayer",
        "Scale9SpriteLayer",
        "SpriteLayer",
        "ParticleSystemLayer",
    }, function(v)
        local scene = display.newScene()
        require("app.scenes."..v).new()
            :addTo(scene)
        display.replaceScene(scene)
    end))
end

function MainScene:createMenu(items, callback)
    local menu = cc.ui.UIListView.new {
        viewRect = cc.rect(display.cx - 200, display.bottom + 100, 400, display.height - 200),
        direction = cc.ui.UIScrollView.DIRECTION_VERTICAL}
        :onScroll(function(event)
                if "moved" == event.name then
                elseif "ended" == event.name then
                end
            end)

    for i, v in ipairs(items) do
        local item = menu:newItem()
        local content

        content = cc.ui.UIPushButton.new()
            :setButtonSize(200, 40)
            :setButtonLabel(cc.ui.UILabel.new({text = v, size = 24, color = display.COLOR_BLUE}))
            :onButtonClicked(function(event)
                callback(v)
            end)
        content:setTouchSwallowEnabled(false)
        item:addContent(content)
        item:setItemSize(120, 40)

        menu:addItem(item)
    end
    menu:reload()

    return menu
end

return MainScene
