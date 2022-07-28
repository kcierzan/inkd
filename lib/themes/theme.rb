# frozen_string_literal: true

require 'rgb'

class Theme
  def blend(target_color, mix_color, percent)
    target = RGB::Color.from_rgb_hex target_color
    mixer = RGB::Color.from_rgb_hex mix_color
    mixed = target.mix!(mixer, percent)
    RGB::Color.from_fractions(*mixed).to_rgb_hex
  end
end
