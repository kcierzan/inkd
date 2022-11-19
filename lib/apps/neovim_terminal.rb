# frozen_string_literal: true

require 'apps/app'

class NeovimTerminal < App
  OUTPUT_FILE = 'neovim_terminal.ink.lua'

  def apply_theme!(theme)
    lines = theme.map { |var, color| vim_global_string(var, color) }
    Utils::Filesystem.write_file lines, OUTPUT_FILE
  end

  private

  def vim_global_string(key, value)
    "vim.g.#{key} = \"#{value}\""
  end
end
