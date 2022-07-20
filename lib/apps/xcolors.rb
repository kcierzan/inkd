# frozen_string_literal: true
require_relative '../utils'

module Xcolors
  @highlights = %i[
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
  ].freeze
  @output_file = 'xcolors.ink'

  module_function

  def highlights
    Struct.new(*@highlights, keyword_init: true)
  end

  def theme=(xcolors_theme)
    lines = xcolors_theme.to_h.map { |k, v| "*.#{k}: #{v}" }
    lines << "*.color257: #{xcolors_theme.foreground}"
    lines << "*.color256: #{xcolors_theme.background}"
    lines << "Sxiv.foreground: #{xcolors_theme.foreground}"
    lines << "Sxiv.background: #{xcolors_theme.background}"
    Utils::Filesystem.write_file lines, @output_file
    reload
  end

  def reload
    `xrdb merge #{File.join Dir.home, '.Xresources'} 2>/dev/null`
  end
end
