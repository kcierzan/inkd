# frozen_string_literal: true

module Constants
  @output_dir = "#{Dir.home}/.inkd"
  @theme_base_class = 'theme'
  @theme_files = 'themes/*.rb'
  @fonts = {
    sf: {
      font_family: 'Liga SFMono Nerd Font'
    },
    iosevka: {
      font_family: 'Iosevka Nerd Font'
    },
    roboto: {
      font_family: 'RobotoMono Nerd Font'
    },
    fira: {
      font_family: 'FiraCode Nerd Font Retina',
      bold_font: 'FiraCode Nerd Font Bold',
      italic_font: 'FiraCode Nerd Font Light',
      bold_italic_font: 'FiraCode Nerd Font Bold'
    },
    victor: {
      font_family: 'VictorMono Nerd Font',
      italic_font: 'VictorMono Nerd Font Italic'
    },
    jetbrains: {
      font_family: 'JetbrainsMono Nerd Font'
    },
    cousine: {
      font_family: 'Cousine Nerd Font'
    },
    inconsolata: {
      font_family: 'InconsolataLGC Nerd Font'
    },
    blex: {
      font_family: 'BlexMono Nerd Font'
    },
    caskaydia: {
      font_family: 'CaskaydiaCove Nerd Font'
    },
    hack: {
      font_family: 'Hack Nerd Font'
    }
  }

  class << self
    attr_reader :output_dir, :theme_files, :fonts, :theme_base_class
  end
end
