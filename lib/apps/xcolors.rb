# frozen_string_literal: true

require_relative '../app'

class Xcolors < App
  @theme_vars = %i[
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

  def initialize
    super
    @supported_oses = %i[linux].freeze
    @theme_output_file = 'xcolors.ink'
  end

  def self.highlights
    Struct.new(*@theme_vars, keyword_init: true)
  end

  def theme=(theme)
    return unless for_current_os?

    path = File.join(INKD_OUTPUT_DIR, @theme_output_file)
    File.open(path, 'w') do |file|
      theme.xcolors.to_h.each do |k, v|
        file.write "*.#{k}: #{v}\n"
      end
      file.write "*.color257: #{theme.xcolors.foreground}\n"
      file.write "*.color256: #{theme.xcolors.background}\n"
      file.write "Sxiv.foreground: #{theme.xcolors.foreground}\n"
      file.write "Sxiv.background: #{theme.xcolors.background}\n"
    end
    reload
  end

  private

  def reload
    `xrdb merge #{File.join Dir.home, '.Xresources'} 2>/dev/null`
  end
end
