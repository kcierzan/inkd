# frozen_string_literal: true

require_relative '../constants'
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
  @supported_oses = %i[linux].freeze
  @output_file = 'xcolors.ink'

  def self.highlights
    Struct.new(*@highlights, keyword_init: true)
  end

  def self.theme=(xcolors_theme)
    lines = xcolors_theme.to_h.map { |k, v| "*.#{k}: #{v}" }
    lines << "*.color257: #{xcolors_theme.foreground}"
    lines << "*.color256: #{xcolors_theme.background}"
    lines << "Sxiv.foreground: #{xcolors_theme.foreground}"
    lines << "Sxiv.background: #{xcolors_theme.background}"
    Utils.write_to_output lines, @output_file, @supported_oses
    reload
  end

  def self.reload
    `xrdb merge #{File.join Dir.home, '.Xresources'} 2>/dev/null`
  end
end
