def rgb(r, g, b)
	[r, g, b].inject("#") { |accum, x| accum << x.clamp(0, 255).to_s(16).rjust(2, "0").upcase }
end

p rgb(10, 0, 255) #0A00FF
p rgb(255, 234435, -243) #FFFF00
p rgb(63, 200, 4) #3FC804