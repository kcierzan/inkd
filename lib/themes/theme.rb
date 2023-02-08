# frozen_string_literal: true

require 'rgb'
require 'yaml'
require 'package'

class Theme
  def initialize(palette)
    raise InvalidPaletteError unless valid_palette? palette

    @palette = theme_data['palettes'][palette]
  end

  def blend(target_color, mix_color, percent)
    target = RGB::Color.from_rgb_hex target_color
    mixer = RGB::Color.from_rgb_hex mix_color
    target.mix!(mixer, percent)
    target.to_rgb_hex
  end

  def palettes
    theme_data['palettes'].keys
  end

  def valid_palette?(palette)
    palettes.include?(palette)
  end

  def colors_for_app(app)
    theme = theme_data[app.to_s]
    deep_apply_palette theme
  end

  private

  def deep_apply_palette(theme)
    theme.transform_values do |val|
      case val
      when Hash
        deep_apply_palette val
      when String
        val % palette.transform_keys(&:to_sym)
      else
        val
      end
    end
  end

  attr_reader :palette

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

class InvalidPaletteError < StandardError
end
