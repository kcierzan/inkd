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
    return Inkd.list_themes if options[:list] || !colorscheme

    Inkd.create_output_directory

    theme = Inkd.init_colorscheme colorscheme, shade
    Kitty.theme = theme.kitty
    Neovim.theme = theme.neovim
    Xcolors.theme = theme.xcolors if Inkd.os_is_linux?
    Lualine.theme = theme.lualine
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
  def font(font = nil)
    return Inkd.list_fonts if options[:list] || !font

    Kitty.font = font
  end
end
