# frozen_string_literal: true

module Lualine
  @highlights = %i[
    bg
    fg
    red
    green
    yellow
    blue
    cyan
    magenta
    violet
    orange
    darkblue
  ].freeze
  @output_file = 'lualine.ink.lua'

  module_function

  def highlights
    Struct.new(*@highlights, keyword_init: true)
  end

  def theme=(lualine_theme)
    lines = lualine_theme.to_h.map { |k, v| "  #{k} = '#{v}'," }
    lines.unshift('return {')
    lines << '}'
    Inkd.write_to_output lines, @output_file
  end
end
