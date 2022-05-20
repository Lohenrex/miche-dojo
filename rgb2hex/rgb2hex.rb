def rgb(r, g, b)
	[r, g, b].map do |x| 

		x = 0 if x.negative?
		x = 255 if x > 255
		(x.to_s(16) * 2).slice(0..1) 

	end.reduce(:+).upcase
end

binding.irb

rgb(10, 0, 255)
rgb(255, 234435, -243)
rgb(63, 200, 4)