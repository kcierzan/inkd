# frozen_string_literal: true

require 'themes/theme'

class Catppuccin < Theme
  def colors_for_app(app)
    return super(app) unless app == :neovim

    super(app).tap do |theme|
      theme['Search']['bg'] = search
      theme['IncSearch']['bg'] = inc_search
      theme['CursorLine']['bg'] = cursorline
    end
  end

  private

  def cursorline
    blend(palette['base'], palette['surface0'], 50)
  end

  def search
    blend(palette['sky'], palette['base'], 50)
  end

  def inc_search
    blend(palette['sky'], palette['base'], 50)
  end
end
