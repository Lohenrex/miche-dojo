# frozen_string_literal: true

# Gets the number of available hosts between two IPs
class IpConverter
  OCTETS = 4
  BIT_SIZE = 8
  BASE = 2
  attr_reader :start, :ending

  def initialize(start, ending)
    @start = start
    @ending = ending
  end

  def ips_between
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
    ip.split('.').reverse.each_with_index { |byte, i| output += byte.to_i * ((BASE**BIT_SIZE)**i) }
    output
  end
end
