def ipsBetween(start, ending)
  available_hosts?(diff_ips(start, ending))
end

def diff_ips(start, ending)
  ip1 = start.split('.')
  ip2 = ending.split('.')
  ip3 = []
  (0...4).each do |i|
   ip3 << ip2[i].to_i - ip1[i].to_i
  end
  ip3.join('.')
end

def available_hosts?(ip)
  output = 0
  ip.split(".").reverse.each_with_index { |byte, i| output += byte.to_i * (256**i)  }
  output
end