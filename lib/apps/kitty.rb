# frozen_string_literal: true

require_relative '../app'

class Kitty < App
  @theme_vars = %i[
    kitty_cursor
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

  def initialize
    super
    @supported_oses = %i[linux darwin].freeze
    @theme_output_file = 'kitty.ink.conf'
    @theme_template_file = get_template_for __FILE__
  end

  def self.theme_vars
    Struct.new(*@theme_vars, keyword_init: true)
  end

  private

  def reload
    `ps aux | grep 'kitty' | grep -v 'grep' | awk '{print $2}' | xargs kill -SIGUSR1`
  end
end
