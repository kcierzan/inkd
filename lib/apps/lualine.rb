# frozen_string_literal: true

require 'apps/app'
require 'utils'

class Lualine < App
  OUTPUT_FILE = 'lualine.ink.lua'

  def apply_theme!(theme)
    lines = theme.map { |k, v| "  #{k} = '#{v}'," }
    lines.unshift('return {')
    lines << '}'
    Utils::Filesystem.write_file lines, OUTPUT_FILE
  end

  private

  def reload!; end
end
