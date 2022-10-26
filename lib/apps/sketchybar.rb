#  frozen_string_literal: true

require 'apps/app'
require 'utils'

class Sketchybar < App
  OUTPUT_FILE = 'sketchybar.ink.sh'
  FONT_OUTPUT_FILE = 'sketchybar-font.ink.sh'
  THEME_TEMPLATE = <<~THEME
    #!/usr/bin/env sh

    sketchybar --bar color=0xFF%<bg>s
    sketchybar --default label.color=0xFF%<label_color>s \\
                         icon.color=0xFF%<icon_color>s
  THEME

  FONT_TEMPLATE = <<~FONT
    #!/usr/bin/env sh

    sketchybar --default icon.font=%<font>s \\
                         label.font=%<font>s
  FONT

  def apply_theme!(theme)
    Utils::Filesystem.write_file(
      theme_file_lines(theme),
      OUTPUT_FILE
    )
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
    theme.transform_values { |val| val[1..].upcase }
  end

  def theme_file_lines(theme)
    theme = strip_hashes theme
    format(
      THEME_TEMPLATE,
      {
        bg: theme['bg'],
        label_color: theme['label_color'],
        icon_color: theme['icon_color']
      }
    ).split("\n")
  end
end
