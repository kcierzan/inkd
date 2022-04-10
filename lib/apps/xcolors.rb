# frozen_string_literal: true

require_relative '../app'

class Xcolors < App
  def initialize
    super
    @supported_oses = %i[linux].freeze
    @theme_output_file = 'xcolors.ink'
    @theme_template_file = "lib/apps/templates/#{File.basename(__FILE__, '.rb')}.erb"
  end

  def self.theme_vars
    Struct.new(
      :foreground,
      :background,
      :xcolors_00,
      :xcolors_01,
      :xcolors_02,
      :xcolors_03,
      :xcolors_04,
      :xcolors_05,
      :xcolors_06,
      :xcolors_07,
      :xcolors_08,
      :xcolors_09,
      :xcolors_10,
      :xcolors_11,
      :xcolors_12,
      :xcolors_13,
      :xcolors_14,
      :xcolors_15,
      keyword_init: true
    )
  end

  private

  def reload
    `xrdb merge #{File.join Dir.home, '.Xresources'} 2>/dev/null`
  end
end
