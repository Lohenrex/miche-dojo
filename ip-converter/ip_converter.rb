class IpConverter
	OCTETS = 4.freeze
	BIT_SIZE = 8.freeze
	BASE = 2.freeze
	attr_reader :start, :ending

	def initialize(start, ending)
		@start = start
		@ending = ending
	end

	def ipsBetween
	  available_hosts?(diff_ips)
	end

	private

	def diff_ips
	  ip1 = start.split('.')
	  ip2 = ending.split('.')
	  ip3 = []
	  (0...OCTETS).each do |i|
	   ip3 << ip2[i].to_i - ip1[i].to_i
	  end
	  ip3.join('.')
	end

	def available_hosts?(ip)
	  output = 0
	  ip.split(".").reverse.each_with_index { |byte, i| output += byte.to_i * ((BASE ** BIT_SIZE) ** i)  }
	  output
	end	
end