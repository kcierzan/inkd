# frozen_string_literal: true

require_relative '../utils'

module Kitty
  @highlights = %i[
    cursor
    foreground
    background
    color0
    color1
    color2
    color3
    color4
    color5
    color6
    color7
    color8
    color9
    color10
    color11
    color12
    color13
    color14
    color15
  ]
  @output_file = 'kitty.ink.conf'
  @font_output_file = 'kitty-font.ink.conf'

  module_function

  def highlights
    Struct.new(*@highlights, keyword_init: true)
  end

  def theme=(kitty_theme)
    lines = kitty_theme.to_h.map { |k, v| "#{k} #{v}" }
    Utils::Filesystem.write_file lines, @output_file
    reload
  end

  def font=(font)
    lines = @fonts[font].reduce([]) { |memo, (k, v)| memo << "#{k} #{v}" }
    Utils::Filesystem.write_file lines, @font_output_file
  end

  def reload
    `ps aux | grep 'kitty' | grep -v 'grep' | awk '{print $2}' | xargs kill -SIGUSR1`
  end
end
