# frozen_string_literal: true

gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require_relative 'extract_ids'

# Test file for the extract_ids.rb file
class ExtractIdsTest < Minitest::Test
  def test_a_random_hash
    data = {
      id: 1,
      items: [
        { id: 3 },
        { id: 4, items: [
          { id: 6 },
          { id: 7 },
          { id: 8, items: [{ id: 9 }] }
        ] }
      ]
    }

    assert_equal IdExtractor.new(data).execute!, [1, 3, 4, 6, 7, 8, 9]
  end

  def test_a_second_random_hash
    data = {
      id: 1,
      items: [
        { id: 2 },
        { id: 3, items: [
          { id: 4 },
          { id: 5 }
        ] }
      ]
    }

    assert_equal IdExtractor.new(data).execute!, [1, 2, 3, 4, 5]
  end

  def test_a_random_hash_with_differently_named_properties
    data = {
      id: 1,
      items: [
        { id: 2 },
        { id: 3, zam: [
          { id: 4 },
          { id: 5 }
        ] }
      ]
    }

    assert_equal IdExtractor.new(data).execute!, [1, 2, 3]
  end

  def test_empty_input
    assert_equal IdExtractor.new({}).execute!, []
  end

  def test_with_a_not_empty_non_hash
    exception = assert_raises(StandardError) { IdExtractor.new('aabbcc').execute! }
    assert_equal('This $|-|!T is not a hash!', exception.message)
  end
end
