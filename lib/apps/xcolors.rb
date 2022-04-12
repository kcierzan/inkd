# frozen_string_literal: true

require_relative '../app'

class Xcolors < App
  @theme_vars = %i[
    foreground
    background
    xcolors00
    xcolors01
    xcolors02
    xcolors03
    xcolors04
    xcolors05
    xcolors06
    xcolors07
    xcolors08
    xcolors09
    xcolors10
    xcolors11
    xcolors12
    xcolors13
    xcolors14
    xcolors15
  ].freeze

  def initialize
    super
    @supported_oses = %i[linux].freeze
    @theme_output_file = 'xcolors.ink'
    @theme_template_file = get_template_for __FILE__
  end

  def self.theme_vars
    Struct.new(*@theme_vars, keyword_init: true)
  end

  private

  def reload
    `xrdb merge #{File.join Dir.home, '.Xresources'} 2>/dev/null`
  end
end
