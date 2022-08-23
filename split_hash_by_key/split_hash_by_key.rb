# frozen_string_literal: true

def split_hash_by_key(hash_pattern, *args)
  validate_args(hash_pattern, args)
  indexes = index_array(hash_pattern, args)
  indexes.map { |idx_arr| hash_pattern.to_a[idx_arr[0]..idx_arr[1]].to_h }
end

def index_array(hash_pattern, args)
  keys = hash_pattern.keys

  indexes = args.map { |x| [keys.index(x) - 1, keys.index(x)] }.flatten

  indexes.select!(&:positive?)

  indexes.unshift(0) unless indexes.include?(0)

  indexes.push(hash_pattern.length - 1) unless indexes.include?(hash_pattern.length - 1)

  indexes.each_slice(2).to_a
end

def validate_args(hash_pattern, args)
  args.each do |x|
    raise StandardError, 'One of the key given as argument is incorrect!' unless hash_pattern.key?(x)
  end
end
