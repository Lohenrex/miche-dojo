require 'minitest/autorun'
require_relative 'ip_converter'

class IpConverterTest < Minitest::Test
  def test_it_works
    assert_equal(IpConverter.new("10.0.0.0", "10.0.0.50").ipsBetween, 50);
    assert_equal(IpConverter.new("20.0.0.10", "20.0.1.0").ipsBetween, 246);
    assert_equal(IpConverter.new('150.0.0.0', '150.0.0.1').ipsBetween, 1);
    assert_equal(IpConverter.new('10.0.0.0', '10.0.0.50').ipsBetween, 50);
    assert_equal(IpConverter.new('20.0.0.10', '20.0.1.0').ipsBetween, 246);
    assert_equal(IpConverter.new('10.11.12.13', '10.11.13.0').ipsBetween, 243);
    assert_equal(IpConverter.new('160.0.0.0', '160.0.1.0').ipsBetween, 256);
    assert_equal(IpConverter.new('170.0.0.0', '170.1.0.0').ipsBetween, 65536);
    assert_equal(IpConverter.new('50.0.0.0', '50.1.1.1').ipsBetween, 65793);
    assert_equal(IpConverter.new('180.0.0.0', '181.0.0.0').ipsBetween, 16777216);
    assert_equal(IpConverter.new('1.2.3.4', '5.6.7.8').ipsBetween, 67372036);
  end
end