#  frozen_string_literal: true

require 'apps/app'
require 'utils'

class Sketchybar < App
  OUTPUT_FILE = 'sketchybar.ink.sh'
  FONT_OUTPUT_FILE = 'sketchybar-font.ink.sh'
  THEME_TEMPLATE = <<~CONFIG
    #!/usr/bin/env sh

    sketchybar --bar color=0xFF%<bg>s
    sketchybar --default label.color=0xFF%<label_color>s \\
                         icon.color=0xFF%<icon_color>s
  CONFIG

  FONT_TEMPLATE = <<~FONT_CONFIG
    #!/usr/bin/env sh

    sketchybar --default icon.font=%<font>s \\
                         label.font=%<font>s
  FONT_CONFIG

  def apply_theme!(theme)
    theme = strip_hashes theme
    lines = format(
      THEME_TEMPLATE,
      {
        bg: theme['bg'],
        label_color: theme['label_color'],
        icon_color: theme['icon_color']
      }
    )
    Utils::Filesystem.write_file lines.split("\n"), OUTPUT_FILE
    reload!
  end

  def apply_font!(font)
    font_name = Constants::FONTS[font.to_sym][:font_family]
    lines = format(FONT_TEMPLATE, { font: font_name })
    Utils::Filesystem.write_file lines.split("\n"), FONT_OUTPUT_FILE
    reload!
  end

  private

  def reload!
    `brew services restart sketchybar`
  end

  def strip_hashes(theme)
    theme.each { |k, v| theme[k] = v[1..].upcase }
  end
end
