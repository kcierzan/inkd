# frozen_string_literal: true

require 'apps/app'
require 'utils'
require 'constants'

class Kitty < App
  OUTPUT_FILE = 'kitty.ink.conf'
  FONT_OUTPUT_FILE = 'kitty-font.ink.conf'

  def apply_theme!(theme)
    lines = theme.map { |k, v| "#{k} #{v}" }
    Utils::Filesystem.write_file lines, OUTPUT_FILE
    reload!
  end

  def apply_font!(font)
    lines = Constants::FONTS[font.to_sym].reduce([]) { |memo, (k, v)| memo << "#{k} #{v}" }
    Utils::Filesystem.write_file lines, FONT_OUTPUT_FILE
    reload!
  end

  private

  def reload!
    `pgrep -a 'kitty' | xargs kill -SIGUSR1`
  end
end
