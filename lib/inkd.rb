# frozen_string_literal: true

require_relative 'apps/kitty'
require_relative 'apps/neovim'
require_relative 'apps/xcolors'
require_relative 'apps/lualine'
require_relative 'constants'
require_relative 'utils'

require 'thor'

class InkdCLI < Thor
  desc 'color COLORSCHEME', 'Generate colorscheme files and reload apps'
  option :list, type: :boolean
  def color(colorscheme = nil, shade = 'dark')
    return Utils::Filesystem.print_theme_names if options[:list] || !colorscheme

    Utils::Filesystem.create_output_directory

    theme = ColorschemeBuilder.load(theme: colorscheme, shade: shade)
    Kitty.theme = theme.kitty
    Neovim.theme = theme.neovim
    Xcolors.theme = theme.xcolors if Utils::OS.linux?
    Lualine.theme = theme.lualine
  end

  # TODO: implement me!
  desc 'font FONT', 'Generate font files and reload apps'
  option :list, type: :boolean
  def font(font = nil)
    return Utils::Filesystem.print_font_names if options[:list] || !font

    Kitty.font = font
  end
end
