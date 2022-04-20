# frozen_string_literal: true

require_relative '../apps/xcolors'
require_relative '../apps/neovim'
require_relative '../apps/kitty'
require_relative '../theme'

class One < Theme
  def initialize
    super
    @foreground = '#B2BED1'
    @background = '#2c2e34'
    @bg_dark = '#212226'
    @bg_bright = '#303339'
    @bg_brighter = '#42444e'
    @bg_brightest = '#4d4f5b'
    @black = '#393f4a'
    @red = '#ec7279'
    @green = '#a0c980'
    @yellow = '#deb974'
    @blue = '#6cb6eb'
    @purple = '#d38aea'
    @cyan = '#5dbbc1'
    @cyan_bright = '#4db5bd'
    @white = '#b9bfc9'
    @black_bright = '#6f7683'
    @red_bright = '#c9665b'
    @green_bright = '#62ac65'
    @yellow_bright = '#d9a97c'
    @blue_bright = '#71bdf2'
    @purple_bright = '#a9a1e1'
    @white_bright = '#afb0b5'
    @cursor = '#528bff'
    @cursor_text = @background

    @xcolors = Xcolors.highlights.new(
      foreground: @foreground,
      background: @background,
      color0: @black,
      color1: @red,
      color2: @green,
      color3: @yellow,
      color4: @blue,
      color5: @purple,
      color6: @cyan,
      color7: @white,
      color8: @black_bright,
      color9: @red_bright,
      color10: @green_bright,
      color11: @yellow_bright,
      color12: @blue_bright,
      color13: @purple_bright,
      color14: @cyan_bright,
      color15: @white_bright
    )

    @neovim = Neovim.highlights.new(
      boolean: { fg: @green },
      buffer_current: { fg: @yellow, bg: @background, style: :bold },
      buffer_current_mod: { fg: @blue, bg: @background },
      buffer_current_sign: { fg: @blue, bg: @background },
      buffer_inactive: { fg: @foreground, bg: @bg_bright },
      buffer_inactive_mod: { fg: @blue, bg: @bg_bright },
      buffer_inactive_sign: { fg: @blue, bg: @bg_bright },
      buffer_inactive_targe: { fg: @foreground, bg: @bg_bright },
      buffer_tab_page_fill: { fg: @blue, bg: @background },
      character: { fg: @green },
      color_column: { fg: @none, bg: @bg_bright },
      comment: { fg: @black_bright, style: :italic },
      conceal: { fg: @bg_bright, bg: @none },
      conditional: { fg: @purple },
      constant: { fg: @yellow, style: :italic },
      cursor: { fg: @none, bg: @none, style: :reverse },
      cursor_column: { fg: @none, bg: @black_bright },
      cursor_im: { fg: @none, bg: @none, style: :reverse },
      cursor_line: { fg: @none, bg: @bg_bright },
      cursor_line_nr: { fg: @blue, bg: @bg_bright, style: :bold },
      define: { fg: @purple },
      diff_add: { fg: @green, bg: @background },
      diff_change: { fg: @yellow, bg: @background },
      diff_delete: { fg: @red, bg: @background },
      diff_text: { fg: @background, bg: @foreground },
      directory: { fg: @foreground, bg: @none },
      end_of_buffer: { fg: @background, bg: @none },
      error: { fg: @red },
      error_msg: { fg: @red, bg: @none, style: :bold },
      exception: { fg: @purple },
      float: { fg: @green },
      fold_column: { fg: @foreground, bg: @background },
      folded: { fg: @bg_bright, bg: @bg_bright },
      function: { fg: @blue },
      identifier: { fg: @cyan },
      inc_search: { fg: @bg_bright, bg: @yellow, style: @none },
      include: { fg: @purple },
      keyword: { fg: @purple },
      label: { fg: @yellow },
      line_nr: { fg: @black_bright },
      macro: { fg: @yellow },
      match_paren: { fg: @red, bg: @none },
      mode_msg: { fg: @foreground, bg: @none, style: :bold },
      non_text: { fg: @bg_bright },
      normal: { bg: @background },
      normal_float: { fg: @foreground, bg: @bg_bright },
      number: { fg: @green },
      operator: { fg: @purple },
      pmenu: { fg: @foreground, bg: @bg_brighter },
      pmenu_sbar: { fg: @purple, bg: @bg_brighter },
      pmenu_sel: { fg: @bg_brighter, bg: @blue },
      pmenu_sel_bold: { fg: @bg_brighter, bg: @blue, style: :bold },
      pmenu_thumb: { fg: @purple, bg: @green },
      pre_condit: { fg: @purple },
      pre_proc: { fg: @purple },
      question: { fg: @yellow },
      quick_fix_line: { fg: @purple, style: :bold },
      repeat: { fg: @purple },
      search: { fg: @background, bg: @yellow },
      special: { fg: @blue },
      special_char: { fg: @yellow },
      special_comment: { fg: @bg_bright },
      special_key: { fg: @bg_bright },
      spell_bad: { fg: @red, bg: @none, style: :undercurl },
      spell_cap: { fg: @blue, bg: @none, style: :undercurl },
      spell_local: { fg: @cyan, bg: @none, style: :undercurl },
      spell_rare: { fg: @purple, bg: @none, style: :undercurl },
      statement: { fg: @purple },
      status_line: { fg: @bg_bright, bg: @bg_brighter, style: @none },
      status_line_nc: { fg: @bg_bright, bg: @bg_brighter, style: @none },
      storage_class: { fg: @red, style: :italic },
      string: { fg: @green },
      structure: { fg: @red, style: :italic },
      sign_column: { fg: @none, bg: @none },
      t_s_annotation: { fg: @purple },
      t_s_attribute: { fg: @yellow },
      t_s_boolean: { fg: @green },
      t_s_character: { fg: @green },
      t_s_const_builtin: { fg: @cyan, style: :italic },
      t_s_constant: { fg: @red, style: :italic },
      t_s_constructor: { fg: @foreground },
      t_s_function: { fg: @blue },
      t_s_function_builtin: { fg: @blue },
      t_s_include: { fg: @purple },
      t_s_keyword_function: { fg: @purple },
      t_s_keyword_operator: { fg: @purple },
      t_s_label: { fg: @purple },
      t_s_math: { fg: @green },
      t_s_method: { fg: @blue },
      t_s_namespace: { fg: @yellow },
      t_s_number: { fg: @yellow },
      t_s_parameter: { fg: @red, style: :italic },
      t_s_punct_delimitter: { fg: @bg_brighter },
      t_s_punct_special: { fg: @yellow },
      t_s_symbol: { fg: @yellow },
      t_s_text: { fg: @green },
      t_s_type: { fg: @yellow },
      t_s_type_builtin: { fg: @cyan },
      t_s_variable: { fg: @red },
      t_s_variable_builtin: { fg: @cyan },
      tabline_fill: { style: @none },
      tabline_sel: { bg: @background },
      tag: { fg: @yellow },
      terminal: { fg: @foreground, bg: @background },
      title: { fg: @purple, style: :bold },
      todo: { fg: @yellow, style: :italic },
      type: { fg: @red, style: :italic },
      typedef: { fg: @purple },
      underlined: { style: :underline },
      vert_split: { fg: @background },
      visual: { fg: @none, bg: @bg_brighter },
      visual_nos: { fg: @background, bg: @background, style: :underline },
      warning_msg: { fg: @yellow, bg: @none, style: :bold },
      whitespace: { fg: @bg_brighter },
      wild_menu: { fg: @foreground, bg: @green },
      debug_breakpoint: { fg: @background, bg: @red },
      i_cursor: { fg: @bg_bright, bg: @none, style: :reverse },
      l_cursor: { fg: @none, bg: @none, style: :reverse },
      v_cursor: { fg: @none, bg: @none, style: :reverse },
      buffer_line_separator: { fg: @background, bg: @bg_brighter },
      buffer_line_separator_selected: { fg: @background, bg: @bg_brighter },
      which_key_float: { fg: @foreground, bg: @bg_dark }
    )

    @kitty = Kitty.highlights.new(
      cursor: @blue,
      foreground: @foreground,
      background: @background,
      color0: @black,
      color1: @red,
      color2: @green,
      color3: @yellow,
      color4: @blue,
      color5: @purple,
      color6: @cyan,
      color7: @white,
      color8: @black_bright,
      color9: @red_bright,
      color10: @green_bright,
      color11: @yellow_bright,
      color12: @blue_bright,
      color13: @purple_bright,
      color14: @cyan_bright,
      color15: @white_bright
    )

    @app_vars = [@xcolors, @neovim, @kitty]
  end
end

class OneDark < One
end

# TODO: make a light version
class OneLight < One
end
