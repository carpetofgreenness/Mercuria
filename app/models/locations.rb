class Locations
	LOCATIONS = [
		"Mexico City",
		"Atlantis",
		"North Pole",
		"Middle Earth",
		"Casterly Rock",
		"R'lyeh",
		"Toronto",
		"Shangrila",
		"Your Mom's House",
		"Beach City"
	]

	LOCATIONS_SELECT = LOCATIONS.map.with_index { |e, i| [e,i+1]  }
end

[["text",1], ["text2",2]]