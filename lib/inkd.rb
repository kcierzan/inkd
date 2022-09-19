# frozen_string_literal: true

require 'constants'
require 'package'
require 'thor'
require 'utils'

class InkdCLI < Thor
  include AppAutoloader

  desc 'color COLORSCHEME', 'Generate colorscheme files and reload apps'
  option :list, type: :boolean
  def color(colorscheme = nil, shade = 'dark')
    return print_themes if options[:list] || invalid_colorscheme?(colorscheme)

    create_output_directory
    apply_theme!(colorscheme: colorscheme, shade: shade)
  end

  desc 'font FONT', 'Generate font files and reload apps'
  option :list, type: :boolean
  def font(font = nil)
    return print_fonts if options[:list] || invalid_font?(font)

    kitty.apply_font! font
    sketchybar.apply_font! font
  end

  private

  def apply_theme!(colorscheme:, shade:)
    theme = ColorschemeBuilder.load(theme: colorscheme, shade: shade)
    apps.each { |app| app.apply_theme! theme.colors_for_app(app.name) }
  end

  def invalid_font?(font)
    !Constants::FONTS.keys.include?(font.to_sym)
  end

  def invalid_colorscheme?(colorscheme)
    !Package.theme_names.include?(colorscheme)
  end

  def create_output_directory
    Utils::Filesystem.create_output_directory
  end

  def print_themes
    puts 'Enter one of the follow colorschemes:'
    Package.theme_names.each { |name| puts name }
  end

  def print_fonts
    puts 'Enter one of the following fonts:'
    Constants::FONTS.each_key { |font| puts font }
  end

  def kitty
    @kitty ||= Kitty.new
  end

  def sketchybar
    @sketchybar ||= Sketchybar.new
  end

  def apps
    Package.supported_app_names.map do |app|
      eval "#{app.capitalize}.new", binding, __FILE__, __LINE__
    end
  end
end
