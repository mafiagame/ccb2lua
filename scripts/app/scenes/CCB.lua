--
-- Author: justbilt
-- Date: 2015-03-16 23:27:52
--

--
-- Author: justbilt
-- Date: 2015-03-15 00:01:00
--


local CCB = class("CCB", require("app.layout.CCB_layout"))

function CCB:ctor()
	CCB.super.ctor(self)

	for i=1,4 do
		local view = self["_num"..i]
		view:refresh({id = i, score = i*100})
	end
end


return CCB