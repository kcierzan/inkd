# frozen_string_literal: true

require_relative 'apps/kitty'
require_relative 'apps/neovim'
require_relative 'apps/xcolors'
require_relative './constants'

require 'thor'

class InkdCLI < Thor
  THEMES_FILES = 'themes/*.rb'

  desc 'color COLORSCHEME', 'Generate colorscheme files and reload apps'
  option :list, type: :boolean
  def color(colorscheme = nil, shade = 'dark')
    return list_themes if options[:list] || !colorscheme

    create_output_directory

    theme = init_colorscheme colorscheme, shade
    Kitty.theme = theme.kitty
    Neovim.theme = theme.neovim
    Xcolors.theme = theme.xcolors
  end

  # TODO: implement me!
  desc 'bar SHAPE', 'Generate bar files and reload apps'
  option :list, type: :boolean
  def bar(_shape)
    puts 'Not implemented!'
  end

  # TODO: implement me!
  desc 'font FONT', 'Generate font files and reload apps'
  option :list, type: :boolean
  def font(_font)
    puts 'Not implemented!'
  end

  private

  def create_output_directory
    return if Dir.exist? Constants.output_dir

    Dir.mkdir Constants.output_dir
  end

  def init_colorscheme(theme, shade)
    theme_class = "#{theme.capitalize}#{shade.capitalize}"
    require_relative "themes/#{theme}"
    eval "#{theme_class}.new", binding, __FILE__, __LINE__
  end

  # TODO: list the shades also
  def list_themes
    puts 'Enter one of the following colors:'
    Dir.glob(File.join(__dir__, THEMES_FILES)).map { |file| puts(File.basename(file, '.rb')) }
  end
end
