# frozen_string_literal: true

def rgb(red, green, blue)
  [red, green, blue].inject('#') { |accum, x| accum << x.clamp(0, 255).to_s(16).rjust(2, '0').upcase }
end
