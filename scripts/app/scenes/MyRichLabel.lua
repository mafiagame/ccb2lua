local MyRichLabel = class("MyRichLabel", RichLabel)

function MyRichLabel:ctor(_params)
	MyRichLabel.super.ctor()
	self.dimensions = _params.dimensions
	self.size = _params.size
end


return MyRichLabel