# frozen_string_literal: true

require_relative 'apps/kitty'
require_relative 'apps/neovim'
require_relative 'apps/xcolors'
require_relative 'constants'
require_relative 'utils'

require 'thor'

class InkdCLI < Thor
  desc 'color COLORSCHEME', 'Generate colorscheme files and reload apps'
  option :list, type: :boolean
  def color(colorscheme = nil, shade = 'dark')
    return Utils.list_themes if options[:list] || !colorscheme

    Utils.create_output_directory

    theme = Utils.init_colorscheme colorscheme, shade
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
end
