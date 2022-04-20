# frozen_string_literal: true

class Theme
  attr_reader :kitty, :xcolors, :neovim

  def initialize
    @none = 'none'
  end

  def colors
    @app_vars.reduce({}) do |vars, app|
      vars.merge(app.to_h)
    end
  end
end
