# frozen_string_literal: true

require_relative '../apps/xcolors'
require_relative '../apps/neovim'
require_relative '../apps/kitty'
require_relative '../apps/lualine'

class Tokyo
  def initialize
    @none = 'none'
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
  end

  def xcolors
    @xcolors ||= Xcolors.highlights.new(
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
  end

  def lualine
    @lualine ||= Lualine.highlights.new(
      bg: @bg_dark,
      fg: @foreground,
      red: @red,
      green: @green1,
      yellow: @yellow,
      blue: @blue,
      cyan: @cyan,
      magenta: @magenta2,
      violet: @magenta,
      orange: @orange,
      darkblue: @bg_dark
    )
  end

  def kitty
    @kitty ||= Kitty.highlights.new(
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
  end

  def neovim
    @neovim ||= Neovim.highlights.new(
      Boolean: { fg: @green },
      BufferCurrent: { fg: @yellow, bg: @background, style: :bold },
      BufferCurrentMod: { fg: @blue, bg: @background },
      BufferCurrentSign: { fg: @blue, bg: @background },
      BufferInactive: { fg: @foreground, bg: @bg_highlight },
      BufferInactiveMod: { fg: @blue, bg: @bg_highlight },
      BufferInactiveSign: { fg: @blue, bg: @bg_highlight },
      BufferInactiveTarge: { fg: @foreground, bg: @bg_highlight },
      BufferTabPageFill: { fg: @blue, bg: @background },
      Character: { fg: @green },
      ColorColumn: { fg: @none, bg: @black },
      Comment: { fg: @comment, style: :italic },
      Conceal: { fg: @dark5, bg: @none },
      Conditional: { fg: @purple },
      Constant: { fg: @orange, style: :italic },
      Cursor: { fg: @none, bg: @none, style: :reverse },
      CursorColumn: { fg: @none, bg: @bg_highlight },
      CursorIm: { fg: @none, bg: @none, style: :reverse },
      CursorLine: { fg: @none, bg: @bg_highlight },
      CursorLineNr: { fg: @dark5, style: :bold },
      Define: { fg: @purple },
      DiffAdd: { fg: @git_add, bg: @background },
      DiffChange: { fg: @git_change, bg: @background },
      DiffDelete: { fg: @git_delete, bg: @background },
      DiffText: { fg: @background, bg: @foreground },
      Directory: { fg: @foreground, bg: @none },
      EndOfBuffer: { fg: @background, bg: @none },
      Error: { fg: @red },
      ErrorMsg: { fg: @red, bg: @none, style: :bold },
      Exception: { fg: @cyan },
      Float: { fg: @green },
      FoldColumn: { fg: @foreground, bg: @background },
      Folded: { fg: @blue, bg: @fg_gutter },
      Function: { fg: @blue },
      Identifier: { fg: @magenta },
      IncSearch: { fg: @black, bg: @orange },
      LineNr: { fg: @fg_gutter },
      Macro: { fg: @yellow },
      MatchParen: { fg: @orange, bg: @none },
      ModeMsg: { fg: @foreground, bg: @none, style: :bold },
      NonText: { fg: @dark3 },
      Normal: { bg: @background },
      NormalFloat: { fg: @foreground, bg: @bg_highlight },
      Operator: { fg: @blue5 },
      Pmenu: { fg: @foreground, bg: @background },
      PmenuSbar: { fg: @purple, bg: @bg_highlight },
      PmenuSel: { fg: @bg_highlight, bg: @blue2 },
      PmenuThumb: { bg: @fg_gutter },
      PreProc: { fg: @cyan },
      Question: { fg: @blue },
      QuickFixLine: { fg: @purple, style: :bold },
      Repeat: { fg: @purple },
      Search: { fg: @background, bg: @foreground },
      Special: { fg: @blue1 },
      SpecialChar: { fg: @yellow },
      SpecialComment: { fg: @bg_highlight },
      SpecialKey: { fg: @dark3 },
      SpellBad: { fg: @red, bg: @none, style: :undercurl },
      SpellCap: { fg: @yellow, bg: @none, style: :undercurl },
      SpellLocal: { fg: @blue2, bg: @none, style: :undercurl },
      SpellRare: { fg: @blue5, bg: @none, style: :undercurl },
      Statement: { fg: @magenta },
      StatusLine: { fg: @bg_highlight, bg: @fg_gutter, style: @none },
      StatusLineNc: { fg: @bg_highlight, bg: @fg_gutter, style: @none },
      StorageClass: { fg: @red, style: :italic },
      String: { fg: @green },
      Structure: { fg: @red, style: :italic },
      SignColumn: { fg: @none, bg: @none },
      TSAnnotation: { fg: @purple },
      TSAttribute: { fg: @yellow },
      TSBoolean: { fg: @green },
      TSCharacter: { fg: @green },
      TSConstBuiltin: { fg: @cyan, style: :italic },
      TSConstant: { fg: @red, style: :italic },
      TSConstructor: { fg: @foreground },
      TSField: { fg: @green1 },
      TSFunction: { fg: @blue },
      TSFuncBuiltin: { fg: @blue },
      TSInclude: { fg: @purple },
      TSKeyword: { fg: @purple },
      TSKeywordFunction: { fg: @magenta },
      TSKeywordOperator: { fg: @purple },
      TSLabel: { fg: @blue },
      TSMath: { fg: @green },
      TSMethod: { fg: @blue },
      TSNamespace: { fg: @yellow },
      TSNumber: { fg: @yellow },
      TSParameter: { fg: @yellow, style: :italic },
      TSPunctDelimitter: { fg: @blue5 },
      TSPunctBracket: { fg: @fg_dark },
      TSPunctSpecial: { fg: @yellow },
      TSSymbol: { fg: @yellow },
      TSTextReference: { fg: @teal },
      TSText: { fg: @green },
      TSType: { fg: @yellow },
      TSTypeBuiltin: { fg: @magenta },
      TSVariableBuiltin: { fg: @red },
      TabLineFill: { style: @none },
      TabLineSel: { bg: @background, fg: @blue },
      Tag: { fg: @yellow },
      Terminal: { fg: @foreground, bg: @background },
      Title: { fg: @purple, style: :bold },
      Todo: { fg: @yellow, style: :italic },
      Type: { fg: @blue1, style: :italic },
      Typedef: { fg: @purple },
      Underlined: { style: :underline },
      VertSplit: { fg: @background },
      Visual: { fg: @none, bg: @fg_gutter },
      VisualNos: { fg: @background, bg: @background, style: :underline },
      WarningMsg: { fg: @yellow, bg: @none, style: :bold },
      Whitespace: { fg: @bg_highlight },
      WildMenu: { fg: @foreground, bg: @green },
      DebugBreakpoint: { fg: @background, bg: @red },
      BufferLineSeparator: { fg: @background, bg: @bg_highlight },
      BufferLineSeparatorSelected: { fg: @background, bg: @bg_highlight },
      WhichKeyFloat: { fg: @foreground, bg: @bg_dark },
      NvimTreeNormal: { fg: @foreground, bg: @bg_dark }
    )
  end
end

class TokyoStorm < Tokyo
end

class TokyoDay < Tokyo
end

class TokyoNight < Tokyo
end
