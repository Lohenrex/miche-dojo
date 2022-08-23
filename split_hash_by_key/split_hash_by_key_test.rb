# frozen_string_literal: true

gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require_relative 'split_hash_by_key'

# Test file for the split_hash_by_key.rb file
class SplitHashByKeyTest < Minitest::Test
  def test_it_returns_array_of_hashes_splitted_by_keys
    assert_equal split_hash_by_key({ a: 1, b: 2, c: 3, d: 4, e: 5, f: 6 }, :c),
                 [{ a: 1, b: 2 }, { c: 3, d: 4, e: 5, f: 6 }]

    assert_equal split_hash_by_key({ a: 1, b: 2, c: 3, d: 4, e: 5, f: 6 }, :c, :e),
                 [{ a: 1, b: 2 }, { c: 3, d: 4 }, { e: 5, f: 6 }]

    assert_equal split_hash_by_key({ 'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6 }, 'd'),
                 [{ 'a' => 1, 'b' => 2, 'c' => 3 }, { 'd' => 4, 'e' => 5, 'f' => 6 }]

    assert_equal split_hash_by_key({ a: 1, b: 2 }, :a),
                 [{ a: 1, b: 2 }]
  end

  def test_it_should_raise_error_if_key_given_as_an_argument_does_not_exist_in_hash
    exception = assert_raises(StandardError) do
      split_hash_by_key({ a: 1, b: 2, c: 3, d: 4, e: 5, f: 6 }, 'c')
    end
    assert_equal('One of the key given as argument is incorrect!', exception.message)
  end
end
