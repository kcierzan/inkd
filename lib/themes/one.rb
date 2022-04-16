# frozen_string_literal: true

require_relative '../apps/xcolors'
require_relative '../apps/neovim'
require_relative '../apps/kitty'
require_relative '../theme'

# TODO: make a base class
class One < Theme
  NONE = 'NONE'
  FOREGROUND = '#B2BED1'
  BACKGROUND = '#2c2e34'
  BG_BRIGHT = '#303339'
  BG_BRIGHTER = '#42444e'
  BG_BRIGHTEST = '#4d4f5b'
  BLACK = '#393f4a'
  RED = '#ec7279'
  GREEN = '#a0c980'
  YELLOW = '#deb974'
  BLUE = '#6cb6eb'
  PURPLE = '#d38aea'
  CYAN = '#5dbbc1'
  CYAN_BRIGHT = '#4db5bd'
  WHITE = '#b9bfc9'
  BLACK_BRIGHT = '#6f7683'
  RED_BRIGHT = '#c9665b'
  GREEN_BRIGHT = '#62ac65'
  YELLOW_BRIGHT = '#d9a97c'
  BLUE_BRIGHT = '#71bdf2'
  PURPLE_BRIGHT = '#a9a1e1'
  WHITE_BRIGHT = '#afb0b5'
  CURSOR = '#528bff'
  CURSOR_TEXT = BACKGROUND

  def initialize
    @xcolors = Xcolors.highlights.new(
      foreground: FOREGROUND,
      background: BACKGROUND,
      xcolors00: BLACK,
      xcolors01: RED,
      xcolors02: GREEN,
      xcolors03: YELLOW,
      xcolors04: BLUE,
      xcolors05: PURPLE,
      xcolors06: CYAN,
      xcolors07: WHITE,
      xcolors08: BLACK_BRIGHT,
      xcolors09: RED_BRIGHT,
      xcolors10: GREEN_BRIGHT,
      xcolors11: YELLOW_BRIGHT,
      xcolors12: BLUE_BRIGHT,
      xcolors13: PURPLE_BRIGHT,
      xcolors14: CYAN_BRIGHT,
      xcolors15: WHITE_BRIGHT
    )

    @neovim = Neovim.highlights.new(
      boolean: { fg: GREEN },
      buffer_current: { fg: YELLOW, bg: BACKGROUND, style: :bold },
      buffer_current_mod: { fg: BLUE, bg: BACKGROUND },
      buffer_current_sign: { fg: BLUE, bg: BACKGROUND },
      buffer_inactive: { fg: FOREGROUND, bg: BG_BRIGHT },
      buffer_inactive_mod: { fg: BLUE, bg: BG_BRIGHT },
      buffer_inactive_sign: { fg: BLUE, bg: BG_BRIGHT },
      buffer_inactive_targe: { fg: FOREGROUND, bg: BG_BRIGHT },
      buffer_tab_page_fill: { fg: BLUE, bg: BACKGROUND },
      character: { fg: GREEN },
      color_column: { fg: NONE, bg: BG_BRIGHT },
      comment: { fg: BLACK_BRIGHT, style: :italic },
      conceal: { fg: BG_BRIGHT, bg: NONE },
      conditional: { fg: PURPLE },
      constant: { fg: YELLOW, style: :italic },
      cursor: { fg: NONE, bg: NONE, style: :reverse },
      cursor_column: { fg: NONE, bg: BLACK_BRIGHT },
      cursor_im: { fg: NONE, bg: NONE, style: :reverse },
      cursor_line: { fg: NONE, bg: BG_BRIGHT },
      cursor_line_nr: { fg: BLUE, bg: BG_BRIGHT, style: :bold },
      debug: {},
      define: { fg: PURPLE },
      delimiter: {},
      diff_add: { fg: GREEN, bg: BACKGROUND },
      diff_change: { fg: YELLOW, bg: BACKGROUND },
      diff_delete: { fg: RED, bg: BACKGROUND },
      diff_text: { fg: BACKGROUND, bg: FOREGROUND },
      directory: { fg: FOREGROUND, bg: NONE },
      end_of_buffer: { fg: BACKGROUND, bg: NONE },
      error: { fg: RED },
      error_msg: { fg: RED, bg: NONE, style: :bold },
      exception: { fg: PURPLE },
      float: { fg: GREEN },
      fold_column: { fg: FOREGROUND, bg: BACKGROUND },
      folded: { fg: BG_BRIGHT, bg: BG_BRIGHT },
      function: { fg: BLUE },
      identifier: { fg: CYAN },
      ignore: {},
      inc_search: { fg: BG_BRIGHT, bg: YELLOW, style: NONE },
      include: { fg: PURPLE },
      keyword: { fg: PURPLE },
      label: { fg: YELLOW },
      line_nr: { fg: BLACK_BRIGHT },
      macro: { fg: YELLOW },
      match_paren: { fg: RED, bg: NONE },
      mode_msg: { fg: FOREGROUND, bg: NONE, style: :bold },
      non_text: { fg: BG_BRIGHT },
      normal: { bg: BACKGROUND },
      normal_float: { fg: FOREGROUND, bg: BG_BRIGHT },
      number: { fg: GREEN },
      operator: { fg: PURPLE },
      pmenu: { fg: FOREGROUND, bg: BG_BRIGHTER },
      pmenu_sbar: { fg: PURPLE, bg: BG_BRIGHTER },
      pmenu_sel: { fg: BG_BRIGHTER, bg: BLUE },
      pmenu_sel_bold: { fg: BG_BRIGHTER, bg: BLUE, style: :bold },
      pmenu_thumb: { fg: PURPLE, bg: GREEN },
      pre_condit: { fg: PURPLE },
      pre_proc: { fg: PURPLE },
      question: { fg: YELLOW },
      quick_fix_line: { fg: PURPLE, style: :bold },
      repeat: { fg: PURPLE },
      search: { fg: BACKGROUND, bg: YELLOW },
      sign_column: {},
      special: { fg: BLUE },
      special_char: { fg: YELLOW },
      special_comment: { fg: BG_BRIGHT },
      special_key: { fg: BG_BRIGHT },
      spell_bad: { fg: RED, bg: NONE, style: :undercurl },
      spell_cap: { fg: BLUE, bg: NONE, style: :undercurl },
      spell_local: { fg: CYAN, bg: NONE, style: :undercurl },
      spell_rare: { fg: PURPLE, bg: NONE, style: :undercurl },
      statement: { fg: PURPLE },
      status_line: { fg: BG_BRIGHT, bg: BG_BRIGHTER, style: NONE },
      status_line_nc: { fg: BG_BRIGHT, bg: BG_BRIGHTER, style: NONE },
      storage_class: { fg: RED, style: :italic },
      string: { fg: GREEN },
      structure: { fg: RED, style: :italic },
      ts_annotation: { fg: PURPLE },
      ts_attribute: { fg: YELLOW },
      ts_boolean: { fg: GREEN },
      ts_character: { fg: GREEN },
      ts_conditional: {},
      ts_const_builtin: { fg: CYAN, style: :italic },
      ts_constant: { fg: RED, style: :italic },
      ts_constructor: { fg: FOREGROUND },
      ts_const_macro: {},
      ts_emphasis: {},
      ts_error: {},
      ts_exception: {},
      ts_field: {},
      ts_float: {},
      ts_none: {},
      ts_func_macro: {},
      ts_function: { fg: BLUE },
      ts_function_builtin: { fg: BLUE },
      ts_include: { fg: PURPLE },
      ts_keyword: {},
      ts_keyword_function: { fg: PURPLE },
      ts_keyword_operator: { fg: PURPLE },
      ts_label: { fg: PURPLE },
      ts_literal: {},
      ts_math: { fg: GREEN },
      ts_method: { fg: BLUE },
      ts_namespace: { fg: YELLOW },
      ts_number: { fg: YELLOW },
      ts_operator: {},
      ts_parameter: { fg: RED, style: :italic },
      ts_parameter_reference: {},
      ts_property: {},
      ts_punct_bracket: {},
      ts_punct_delimitter: { fg: BG_BRIGHTER },
      ts_punct_special: { fg: YELLOW },
      ts_repeat: {},
      ts_strike: {},
      ts_string: {},
      ts_string_regex: {},
      ts_strong: {},
      ts_structure: {},
      ts_symbol: { fg: YELLOW },
      ts_tag: {},
      ts_tag_delimitter: {},
      ts_text: { fg: GREEN },
      ts_title: {},
      ts_type: { fg: YELLOW },
      ts_type_builtin: { fg: CYAN },
      ts_uri: {},
      ts_underline: {},
      ts_variable: { fg: RED },
      ts_variable_builtin: { fg: CYAN },
      tabline_fill: { style: NONE },
      tabline_sel: { bg: BACKGROUND },
      tag: { fg: YELLOW },
      terminal: { fg: FOREGROUND, bg: BACKGROUND },
      title: { fg: PURPLE, style: :bold },
      todo: { fg: YELLOW, style: :italic },
      type: { fg: RED, style: :italic },
      typedef: { fg: PURPLE },
      underlined: { style: :underline },
      vert_split: { fg: BACKGROUND },
      visual: { fg: NONE, bg: BG_BRIGHTER },
      visual_nos: { fg: BACKGROUND, bg: BACKGROUND, style: :underline },
      warning_msg: { fg: YELLOW, bg: NONE, style: :bold },
      whitespace: { fg: BG_BRIGHTER },
      wild_menu: { fg: FOREGROUND, bg: GREEN },
      debug_breakpoint: { fg: BACKGROUND, bg: RED },
      i_cursor: { fg: BG_BRIGHT, bg: NONE, style: :reverse },
      l_cursor: { fg: NONE, bg: NONE, style: :reverse },
      v_cursor: { fg: NONE, bg: NONE, style: :reverse },
      qf_filename: {},
      buffer_line_separator: { fg: BACKGROUND, bg: BG_BRIGHTER },
      buffer_line_separator_selected: { fg: BACKGROUND, bg: BG_BRIGHTER },
      buffer_line_separator_visible: {}
    )

    @kitty = Kitty.highlights.new(
      kitty_cursor: BLUE,
      foreground: FOREGROUND,
      background: BACKGROUND,
      color0: BLACK,
      color1: RED,
      color2: GREEN,
      color3: YELLOW,
      color4: BLUE,
      color5: PURPLE,
      color6: CYAN,
      color7: WHITE,
      color8: BLACK_BRIGHT,
      color9: RED_BRIGHT,
      color10: GREEN_BRIGHT,
      color11: YELLOW_BRIGHT,
      color12: BLUE_BRIGHT,
      color13: PURPLE_BRIGHT,
      color14: CYAN_BRIGHT,
      color15: WHITE_BRIGHT
    )
    @app_vars = [@xcolors, @neovim, @kitty]
  end
end

class OneDark < One
end

# TODO: make a light version of this...
class OneLight < One
end
