def rgb(r, g, b)
	[r, g, b].inject("") do |accum, x| 

		x = 0 if x.negative?
		x = 255 if x > 255
		accum << (x.to_s(16) * 2).slice(0..1).upcase

	end
end

binding.irb

rgb(10, 0, 255)
rgb(255, 234435, -243)
rgb(63, 200, 4)