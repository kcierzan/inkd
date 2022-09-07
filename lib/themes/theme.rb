# frozen_string_literal: true

require 'rgb'
require 'yaml'
require 'package'

class Theme
  def blend(target_color, mix_color, percent)
    target = RGB::Color.from_rgb_hex target_color
    mixer = RGB::Color.from_rgb_hex mix_color
    mixed = target.mix!(mixer, percent)
    RGB::Color.from_fractions(*mixed).to_rgb_hex
  end

  def palette
    theme_data['palette']
  end

  def data_for_app(app)
    theme_data[app.to_s]
  end

  private

  def basename
    self.class.to_s.split(/(?=[A-Z])/).first.downcase
  end

  def theme_filename
    "#{File.dirname __FILE__}/#{basename}.yml"
  end

  def theme_data
    @theme_data ||= YAML.load_file theme_filename
  end
end
