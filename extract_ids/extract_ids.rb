# frozen_string_literal: true

class IdExtractor
  attr_reader :input, :output

  def initialize(input)
    @input = input
    @output = []
  end

  def execute!
    raise StandardError, 'This $|-|!T is not a hash!' unless input.is_a? Hash

    extract_ids
    output
  end

  def process_items_array(items_array)
    partial = []
    partial_ary = []

    items_array.each do |x|
      case x
      when Hash
        partial << x.fetch(:items) if x.key?(:items)
        output << x.fetch(:id) if x.key?(:id)
      when Array
        partial_ary << x
      end
    end

    partial_ary.flatten!

    partial_ary.each { |x| partial << x } if partial_ary.size.positive?

    process_items_array(partial) if partial.size.positive?
  end

  def extract_ids
    output << input.fetch(:id) if input.key?(:id)
    process_items_array(input.fetch(:items)) if input.key?(:items)
  end
end
