# frozen_string_literal: true

require_relative '../apps/xcolors'
require_relative '../apps/neovim'
require_relative '../apps/kitty'
require_relative '../apps/lualine'

class One
  def initialize
    @none = 'none'
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
  end

  def neovim
    @neovim ||= Neovim.highlights.new(
      Boolean: { fg: @green },
      BufferCurrent: { fg: @yellow, bg: @background, style: :bold },
      BufferCurrentMod: { fg: @blue, bg: @background },
      BufferCurrentSign: { fg: @blue, bg: @background },
      BufferInactive: { fg: @foreground, bg: @bg_bright },
      BufferInactiveMod: { fg: @blue, bg: @bg_bright },
      BufferInactiveSign: { fg: @blue, bg: @bg_bright },
      BufferInactiveTarge: { fg: @foreground, bg: @bg_bright },
      BufferTabPageFill: { fg: @blue, bg: @background },
      Character: { fg: @green },
      ColorColumn: { fg: @none, bg: @bg_bright },
      Comment: { fg: @black_bright, style: :italic },
      Conceal: { fg: @bg_bright, bg: @none },
      Conditional: { fg: @purple },
      Constant: { fg: @yellow, style: :italic },
      Cursor: { fg: @none, bg: @none, style: :reverse },
      CursorColumn: { fg: @none, bg: @black_bright },
      CursorIm: { fg: @none, bg: @none, style: :reverse },
      CursorLine: { fg: @none, bg: @bg_bright },
      CursorLineNr: { fg: @blue, bg: @bg_bright, style: :bold },
      Define: { fg: @purple },
      DiffAdd: { fg: @green, bg: @background },
      DiffChange: { fg: @yellow, bg: @background },
      DiffDelete: { fg: @red, bg: @background },
      DiffText: { fg: @background, bg: @foreground },
      Directory: { fg: @foreground, bg: @none },
      EndOfBuffer: { fg: @background, bg: @none },
      Error: { fg: @red },
      ErrorMsg: { fg: @red, bg: @none, style: :bold },
      Exception: { fg: @purple },
      Float: { fg: @green },
      FoldColumn: { fg: @foreground, bg: @background },
      Folded: { fg: @bg_bright, bg: @bg_bright },
      Function: { fg: @blue },
      Identifier: { fg: @cyan },
      IncSearch: { fg: @bg_bright, bg: @yellow, style: @none },
      Include: { fg: @purple },
      Keyword: { fg: @purple },
      Label: { fg: @yellow },
      LineNr: { fg: @black_bright },
      Macro: { fg: @yellow },
      MatchParen: { fg: @red, bg: @none },
      ModeMsg: { fg: @foreground, bg: @none, style: :bold },
      NonText: { fg: @bg_bright },
      Normal: { bg: @background },
      NormalFloat: { fg: @foreground, bg: @bg_bright },
      Number: { fg: @green },
      Operator: { fg: @purple },
      Pmenu: { fg: @foreground, bg: @bg_brighter },
      PmenuSbar: { fg: @purple, bg: @bg_brighter },
      PmenuSel: { fg: @bg_brighter, bg: @blue },
      PmenuSelBold: { fg: @bg_brighter, bg: @blue, style: :bold },
      PmenuThumb: { fg: @purple, bg: @green },
      PreCondit: { fg: @purple },
      PreProc: { fg: @purple },
      Question: { fg: @yellow },
      QuickFixLine: { fg: @purple, style: :bold },
      Repeat: { fg: @purple },
      Search: { fg: @background, bg: @yellow },
      Special: { fg: @blue },
      SpecialChar: { fg: @yellow },
      SpecialComment: { fg: @bg_bright },
      SpecialKey: { fg: @bg_bright },
      SpellBad: { fg: @red, bg: @none, style: :undercurl },
      SpellCap: { fg: @blue, bg: @none, style: :undercurl },
      SpellLocal: { fg: @cyan, bg: @none, style: :undercurl },
      SpellRare: { fg: @purple, bg: @none, style: :undercurl },
      Statement: { fg: @purple },
      StatusLine: { fg: @bg_bright, bg: @bg_brighter, style: @none },
      StatusLineNc: { fg: @bg_bright, bg: @bg_brighter, style: @none },
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
      TSFunction: { fg: @blue },
      TSFuncBuiltin: { fg: @blue },
      TSInclude: { fg: @purple },
      TSKeywordFunction: { fg: @purple },
      TSKeywordOperator: { fg: @purple },
      TSLabel: { fg: @purple },
      TSMath: { fg: @green },
      TSMethod: { fg: @blue },
      TSNamespace: { fg: @yellow },
      TSNumber: { fg: @yellow },
      TSParameter: { fg: @red, style: :italic },
      TSPunctDelimitter: { fg: @bg_brighter },
      TSPunctSpecial: { fg: @yellow },
      TSSymbol: { fg: @yellow },
      TSText: { fg: @green },
      TSType: { fg: @yellow },
      TSTypeBuiltin: { fg: @cyan },
      TSVariable: { fg: @red },
      TSVariableBuiltin: { fg: @cyan },
      TabLineFill: { style: @none },
      TabLineSel: { bg: @background },
      Tag: { fg: @yellow },
      Terminal: { fg: @foreground, bg: @background },
      Title: { fg: @purple, style: :bold },
      Todo: { fg: @yellow, style: :italic },
      Type: { fg: @red, style: :italic },
      Typedef: { fg: @purple },
      Underlined: { style: :underline },
      VertSplit: { fg: @background },
      Visual: { fg: @none, bg: @bg_brighter },
      VisualNos: { fg: @background, bg: @background, style: :underline },
      WarningMsg: { fg: @yellow, bg: @none, style: :bold },
      Whitespace: { fg: @bg_brighter },
      WildMenu: { fg: @foreground, bg: @green },
      DebugBreakpoint: { fg: @background, bg: @red },
      iCursor: { fg: @bg_bright, bg: @none, style: :reverse },
      lCursor: { fg: @none, bg: @none, style: :reverse },
      vCursor: { fg: @none, bg: @none, style: :reverse },
      BufferLineSeparator: { fg: @background, bg: @bg_brighter },
      BufferLineSeparatorSelected: { fg: @background, bg: @bg_brighter },
      WhichKeyFloat: { fg: @foreground, bg: @bg_dark },
      htmlH1: { fg: @blue },
      htmlH2: { fg: @purple },
      htmlH3: { fg: @green }
    )
  end

  def kitty
    @kitty ||= Kitty.highlights.new(
      cursor: @cursor,
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
  end

  def lualine
    @lualine ||= Lualine.highlights.new(
      bg: @bg_dark,
      fg: @foreground,
      red: @red,
      green: @green,
      yellow: @yellow,
      blue: @blue,
      cyan: @cyan,
      magenta: @magenta,
      violet: @purple,
      orange: @yellow_bright,
      darkblue: @blue_bright
    )
  end
end

class OneDark < One
end

# TODO: make a light version
class OneLight < One
end
