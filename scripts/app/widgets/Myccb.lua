--
-- Author: justbilt
-- Date: 2015-03-16 23:24:41
--

local Myccb = class("Myccb", require("app.layout.Myccb_layout"))


function Myccb:refresh(_params)
	self._name:setString(_params.id)
	self._score:setString(_params.score)
end


return Myccb