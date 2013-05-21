
collection @act
attributes :id, :name
	child :chapters do
			attributes :id, :name
			child :topics do
				attributes :id, :name, :description
			end
	end