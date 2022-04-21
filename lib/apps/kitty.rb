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
  @supported_oses = %i[linux darwin].freeze
  @output_file = 'kitty.ink.conf'

  def self.highlights
    Struct.new(*@highlights, keyword_init: true)
  end

  def self.theme=(kitty_theme)
    lines = kitty_theme.to_h.map { |k, v| "#{k} #{v}" }
    Utils.write_to_output(lines, @output_file, @supported_oses)
    reload
  end

  def self.reload
    `ps aux | grep 'kitty' | grep -v 'grep' | awk '{print $2}' | xargs kill -SIGUSR1`
  end
end
