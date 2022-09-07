# frozen_string_literal: true

require 'themes/theme'

class Catppuccin < Theme
  def neovim
    theme = super
    theme['Search']['bg'] = search
    theme['IncSearch']['bg'] = inc_search
    theme['CursorLine']['bg'] = cursorline
    theme
  end

  private

  def cursorline
    blend palette['surface0'], palette['base'], 64
  end

  def search
    blend palette['sky'], palette['base'], 30
  end

  def inc_search
    blend palette['sky'], paletee['base'], 90
  end
end

class CatppuccinMacchiato < Catppuccin
end
