# frozen_string_literal: true

require_relative '../apps/xcolors'
require_relative '../apps/neovim'
require_relative '../apps/kitty'
require_relative '../theme'

class Tokyo < Theme
  def initialize
    super
    @bg_dark = '#1f2335'
    @background = '#24283b'
    @bg_highlight = '#292e42'
    @black = '#414868'
    @foreground = '#c0caf5'
    @fg_dark = '#a9b1d6'
    @fg_gutter = '#3b4261'
    @dark3 = '#545c7e'
    @comment = '#565f89'
    @dark5 = '#737aa2'
    @blue0 = '#3d59a1'
    @blue = '#7aa2f7'
    @cyan = '#7dcfff'
    @blue1 = '#2ac3de'
    @blue2 = '#0db9d7'
    @blue5 = '#89ddff'
    @blue6 = '#B4F9F8'
    @blue7 = '#394b70'
    @magenta = '#bb9af7'
    @magenta2 = '#ff007c'
    @purple = '#9d7cd8'
    @orange = '#ff9e64'
    @yellow = '#e0af68'
    @green = '#9ece6a'
    @green1 = '#73daca'
    @green2 = '#41a6b5'
    @teal = '#1abc9c'
    @red = '#f7768e'
    @red1 = '#db4b4b'
    @git_add = '#164846'
    @git_change = '#394b70'
    @git_delete = '#823c41'
    @git_conflict = '#bb7a61'

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
      color7: @comment,
      color8: @dark3,
      color9: @magenta2,
      color10: @green1,
      color11: @orange,
      color12: @blue1,
      color13: @magenta,
      color14: @blue5,
      color15: @dark5
    )

    @neovim = Neovim.highlights.new(
      boolean: { fg: @green },
      buffer_current: { fg: @yellow, bg: @background, style: :bold },
      buffer_current_mod: { fg: @blue, bg: @background },
      buffer_current_sign: { fg: @blue, bg: @background },
      buffer_inactive: { fg: @foreground, bg: @bg_highlight },
      buffer_inactive_mod: { fg: @blue, bg: @bg_highlight },
      buffer_inactive_sign: { fg: @blue, bg: @bg_highlight },
      buffer_inactive_targe: { fg: @foreground, bg: @bg_highlight },
      buffer_tab_page_fill: { fg: @blue, bg: @background },
      character: { fg: @green },
      color_column: { fg: @none, bg: @black },
      comment: { fg: @comment, style: :italic },
      conceal: { fg: @dark5, bg: @none },
      conditional: { fg: @purple },
      constant: { fg: @orange, style: :italic },
      cursor: { fg: @none, bg: @none, style: :reverse },
      cursor_column: { fg: @none, bg: @bg_highlight },
      cursor_im: { fg: @none, bg: @none, style: :reverse },
      cursor_line: { fg: @none, bg: @bg_highlight },
      cursor_line_nr: { fg: @dark5, style: :bold },
      define: { fg: @purple },
      diff_add: { fg: @git_add, bg: @background },
      diff_change: { fg: @git_change, bg: @background },
      diff_delete: { fg: @git_delete, bg: @background },
      diff_text: { fg: @background, bg: @foreground },
      directory: { fg: @foreground, bg: @none },
      end_of_buffer: { fg: @background, bg: @none },
      error: { fg: @red },
      error_msg: { fg: @red, bg: @none, style: :bold },
      exception: { fg: @cyan },
      float: { fg: @green },
      fold_column: { fg: @foreground, bg: @background },
      folded: { fg: @blue, bg: @fg_gutter },
      function: { fg: @blue2 },
      identifier: { fg: @magenta },
      inc_search: { fg: @black, bg: @orange },
      macro: { fg: @yellow },
      match_paren: { fg: @orange, bg: @none },
      mode_msg: { fg: @foreground, bg: @none, style: :bold },
      non_text: { fg: @dark3 },
      normal: { bg: @background },
      normal_float: { fg: @foreground, bg: @bg_highlight },
      operator: { fg: @blue5 },
      pmenu: { fg: @foreground, bg: @background },
      pmenu_sbar: { fg: @purple, bg: @bg_highlight },
      pmenu_sel: { fg: @bg_highlight, bg: @blue2 },
      pmenu_thumb: { bg: @fg_gutter },
      pre_proc: { fg: @cyan },
      question: { fg: @blue },
      quick_fix_line: { fg: @purple, style: :bold },
      repeat: { fg: @purple },
      search: { fg: @background, bg: @foreground },
      special: { fg: @blue1 },
      special_char: { fg: @yellow },
      special_comment: { fg: @bg_highlight },
      special_key: { fg: @dark3 },
      spell_bad: { fg: @red, bg: @none, style: :undercurl },
      spell_cap: { fg: @yellow, bg: @none, style: :undercurl },
      spell_local: { fg: @blue2, bg: @none, style: :undercurl },
      spell_rare: { fg: @blue5, bg: @none, style: :undercurl },
      statement: { fg: @magenta },
      status_line: { fg: @bg_highlight, bg: @fg_gutter, style: @none },
      status_line_nc: { fg: @bg_highlight, bg: @fg_gutter, style: @none },
      storage_class: { fg: @red, style: :italic },
      string: { fg: @green },
      structure: { fg: @red, style: :italic },
      ts_annotation: { fg: @purple },
      ts_attribute: { fg: @yellow },
      ts_boolean: { fg: @green },
      ts_character: { fg: @green },
      ts_const_builtin: { fg: @cyan, style: :italic },
      ts_constant: { fg: @red, style: :italic },
      ts_constructor: { fg: @foreground },
      ts_function: { fg: @blue },
      ts_function_builtin: { fg: @blue },
      ts_include: { fg: @purple },
      ts_keyword_function: { fg: @purple },
      ts_keyword_operator: { fg: @purple },
      ts_label: { fg: @purple },
      ts_math: { fg: @green },
      ts_method: { fg: @blue },
      ts_namespace: { fg: @yellow },
      ts_number: { fg: @yellow },
      ts_parameter: { fg: @red, style: :italic },
      ts_punct_delimitter: { fg: @bg_highlight },
      ts_punct_special: { fg: @yellow },
      ts_symbol: { fg: @yellow },
      ts_text: { fg: @green },
      ts_type: { fg: @yellow },
      ts_type_builtin: { fg: @magenta },
      ts_variable: { fg: @red },
      ts_variable_builtin: { fg: @cyan },
      tabline_fill: { style: @none },
      tabline_sel: { bg: @background, fg: @blue },
      tag: { fg: @yellow },
      terminal: { fg: @foreground, bg: @background },
      title: { fg: @purple, style: :bold },
      todo: { fg: @yellow, style: :italic },
      type: { fg: @red, style: :italic },
      typedef: { fg: @purple },
      underlined: { style: :underline },
      vert_split: { fg: @background },
      visual: { fg: @none, bg: @fg_gutter },
      visual_nos: { fg: @background, bg: @background, style: :underline },
      warning_msg: { fg: @yellow, bg: @none, style: :bold },
      whitespace: { fg: @bg_highlight },
      wild_menu: { fg: @foreground, bg: @green },
      debug_breakpoint: { fg: @background, bg: @red },
      buffer_line_separator: { fg: @background, bg: @bg_highlight },
      buffer_line_separator_selected: { fg: @background, bg: @bg_highlight },
      which_key_float: { fg: @foreground, bg: @bg_dark }
    )

    @kitty = Kitty.highlights.new(
      cursor: @yellow,
      foreground: @foreground,
      background: @background,
      color0: @black,
      color1: @red,
      color2: @green,
      color3: @yellow,
      color4: @blue,
      color5: @magenta,
      color6: @cyan,
      color7: @comment,
      color8: @dark3,
      color9: @red1,
      color10: @green2,
      color11: @orange,
      color12: @blue5,
      color13: @purple,
      color14: @cyan,
      color15: @dark5
    )

    @app_vars = [@xcolors, @neovim, @kitty]
  end
end

class TokyoStorm < Tokyo
end

class TokyoDay < Tokyo
end

class TokyoNight < Tokyo
end
