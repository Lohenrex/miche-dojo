# frozen_string_literal: true

gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require_relative 'ip_converter'

# Test file for the ip_converter.rb file
class IpConverterTest < Minitest::Test
  def test_some_ips
    assert_equal(IpConverter.new('10.0.0.0', '10.0.0.50').ips_between, 50)
    assert_equal(IpConverter.new('20.0.0.10', '20.0.1.0').ips_between, 246)
    assert_equal(IpConverter.new('150.0.0.0', '150.0.0.1').ips_between, 1)
    assert_equal(IpConverter.new('10.11.12.13', '10.11.13.0').ips_between, 243)
    assert_equal(IpConverter.new('160.0.0.0', '160.0.1.0').ips_between, 256)
  end

  def test_large_differences
    assert_equal(IpConverter.new('170.0.0.0', '170.1.0.0').ips_between, 65_536)
    assert_equal(IpConverter.new('50.0.0.0', '50.1.1.1').ips_between, 65_793)
    assert_equal(IpConverter.new('180.0.0.0', '181.0.0.0').ips_between, 16_777_216)
    assert_equal(IpConverter.new('1.2.3.4', '5.6.7.8').ips_between, 67_372_036)
  end
end
