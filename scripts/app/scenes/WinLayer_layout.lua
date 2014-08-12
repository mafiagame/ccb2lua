--
-- Author: justbilt
-- Date: 2014-08-11 22:58:08
--


local WinLayer_layout = class("WinLayer_layout",function()
	return display.newLayer()
end)

function WinLayer_layout:ctor()
	local node = display.newNode()
		:addTo(self)
end

return WinLayer_layout