# frozen_string_literal: true
require_relative './theme'
require_relative '../apps/xcolors'
require_relative '../apps/neovim'
require_relative '../apps/kitty'
require_relative '../apps/lualine'

class Catppuccin < Theme
  def initialize
    @none = 'none'
    @rosewater = '#F4DBD6'
    @flamingo = '#F0C6C6'
    @pink = '#F5BDE6'
    @mauve = '#C6A0F6'
    @red = '#ED8796'
    @maroon = '#EE99A0'
    @peach = '#F5A97F'
    @yellow = '#EED49F'
    @green = '#A6DA95'
    @teal = '#8BD5CA'
    @sky = '#91D7E3'
    @sapphire = '#7DC4E4'
    @blue = '#8AADF4'
    @lavender = '#B7BDF8'

    @text = '#CAD3F5'
    @subtext1 = '#B8C0E0'
    @subtext0 = '#A5ADCB'
    @overlay2 = '#939AB7'
    @overlay1 = '#8087A2'
    @overlay0 = '#6E738D'
    @surface2 = '#5B6078'
    @surface1 = '#494D64'
    @surface0 = '#363A4F'

    @base = '#24273A'
    @mantle = '#1E2030'
    @crust = '#181926'
  end

  def kitty
    @kitty ||= Kitty.highlights.new(
      cursor: @peach,
      foreground: @text,
      background: @base,
      color0: @crust,
      color1: @red,
      color2: @green,
      color3: @yellow,
      color4: @blue,
      color5: @pink,
      color6: @sky,
      color7: @text,
      color8: @surface1,
      color9: @red,
      color10: @green,
      color11: @yellow,
      color12: @blue,
      color13: @pink,
      color14: @sky,
      color15: @text
    )
  end

  def neovim
    @neovim ||= Neovim.highlights.new(
      Boolean: { fg: @peach },
      BufferCurrent: { fg: @yellow, style: :bold },
      BufferCurrentMod: { fg: @blue },
      BufferCurrentSign: { fg: @blue },
      BufferTabPageFill: { fg: @blue },
      Character: { fg: @teal },
      ColorColumn: { bg: @surface0 },
      Comment: { fg: @surface2, style: :italic },
      Conceal: { fg: @overlay1 },
      Conditional: { fg: @red },
      Constant: { fg: @peach },
      Cursor: { fg: @base, bg: @text },
      CursorColumn: { bg: @mantle },
      CursorIm: { fg: @base, bg: @text },
      CursorLine: { bg: @surface0 },
      CursorLineNr: { fg: @lavender },
      DebugBreakpoint: { fg: @base, bg: @red },
      DiffAdd: { fg: @green },
      DiffChange: { fg: @yellow },
      DiffDelete: { fg: @red },
      DiffText: { style: :reverse },
      Directory: { fg: @blue },
      EndOfBuffer: { fg: @base },
      Error: { fg: @red },
      ErrorMsg: { fg: @red, style: :bold },
      Float: { fg: @peach },
      FoldColumn: { fg: @base, bg: @overlay0 },
      Folded: { fg: @blue, bg: @surface1 },
      Function: { fg: @blue },
      htmlH1: { fg: @pink },
      htmlH2: { fg: @blue },
      htmlH3: { fg: @peach },
      Identifier: { fg: @flamingo },
      IncSearch: { bg: inc_search, fg: @mantle },
      Include: { fg: @pink },
      Keyword: { fg: @pink },
      lCursor: { fg: @none, bg: @none, style: :reverse },
      Label: { fg: @peach },
      LineNr: { fg: @surface1 },
      Macro: { fg: @yellow },
      MatchParen: { fg: @peach, style: :bold },
      ModeMsg: { fg: @text, style: :bold },
      Normal: { bg: @base },
      Number: { fg: @peach },
      Operator: { fg: @sky },
      Pmenu: { bg: @surface0, fg: @overlay2 },
      PmenuSel: { fg: @text, bg: @surface1, style: :bold },
      PreProc: { fg: @pink },
      Question: { fg: @blue },
      QuickFixLine: { bg: @surface1, style: :bold },
      Repeat: { fg: @red },
      Search: { bg: search, fg: @text },
      SignColumn: { fg: @surface1, bg: @none },
      Special: { fg: @pink },
      SpecialChar: { fg: @yellow },
      SpellBad: { fg: @red, bg: @none, style: :undercurl },
      SpellCap: { fg: @blue, bg: @none, style: :undercurl },
      SpellLocal: { fg: @cyan, bg: @none, style: :undercurl },
      SpellRare: { fg: @purple, bg: @none, style: :undercurl },
      Statement: { fg: @mauve },
      StatusLine: { fg: @text, bg: @mantle },
      StatusLineNc: { fg: @surface1, bg: @mantle },
      StorageClass: { fg: @yellow },
      String: { fg: @green },
      Structure: { fg: @yellow, style: :italic },
      TSAttribute: { fg: @yellow },
      TSBoolean: { fg: @green },
      TSCharacter: { fg: @green },
      TSConditional: { fg: @mauve },
      TSConstBuiltin: { fg: @peach, style: :italic },
      TSConstant: { fg: @red, style: :italic },
      TSConstructor: { fg: @foreground },
      TSException: { fg: @mauve },
      TSField: { fg: @teal },
      TSFloat: { fg: @peach },
      TSFuncBuiltin: { fg: @peach },
      TSFuncMacro: { fg: @teal },
      TSFunction: { fg: @blue },
      TSInclude: { fg: @mauve },
      TSKeywordOperator: { fg: @mauve },
      TSLabel: { fg: @purple },
      TSMath: { fg: @green },
      TSMethod: { fg: @blue },
      TSNamespace: { fg: @blue },
      TSNumber: { fg: @peach },
      TSOperator: { fg: @sky },
      TSParameter: { fg: @red, style: :italic },
      TSProperty: { fg: @teal },
      TSPunctSpecial: { fg: @sky },
      TSRepeat: { fg: @mauve },
      TSSymbol: { fg: @yellow },
      TSText: { fg: @green },
      TSType: { fg: @yellow },
      TSTypeBuiltin: { fg: @yellow },
      TSVariable: { fg: @red },
      TSVariableBuiltin: { fg: @red },
      TabLine: { fg: @surface1, bg: @mantle },
      TabLineFill: { bg: @crust },
      TabLineSel: { fg: @green, bg: @surface1 },
      Tag: { fg: @yellow },
      Terminal: { fg: @text, bg: @base },
      Todo: { fg: @yellow, style: :italic },
      Type: { fg: @blue },
      Typedef: { fg: @yellow },
      Underlined: { style: :underline },
      vCursor: { fg: @none, bg: @none, style: :reverse },
      VertSplit: { fg: @crust },
      Visual: { bg: @surface1, style: :bold },
      VisualNos: { fg: @surface1, style: :bold },
      WarningMsg: { fg: @yellow, style: :bold },
      WhichKeyFloat: { fg: @text, bg: @base },
      Whitespace: { fg: @mantle },
      WildMenu: { bg: @overlay0 }
    )
  end

  def lualine
    @lualine ||= Lualine.highlights.new(
      bg: @crust,
      fg: @text,
      red: @red,
      green: @green,
      yellow: @yellow,
      blue: @blue,
      cyan: @sky,
      magenta: @pink,
      violet: @mauve,
      orange: @peach,
      darkblue: @sapphire
    )
  end

  def xcolors
    @xcolors ||= Xcolors.highlights.new(
      foreground: @base,
      background: @background,
      color0: @crust,
      color1: @red,
      color2: @green,
      color3: @yellow,
      color4: @blue,
      color5: @mauve,
      color6: @sky,
      color7: @white,
      color8: @overlay2,
      color9: @red,
      color10: @green,
      color11: @yellow,
      color12: @blue,
      color13: @mauve,
      color14: @sky,
      color15: @text
    )
  end

  def cursorline
    blend @surface0, @base, 64
  end

  def search
    blend @sky, @base, 30
  end

  def inc_search
    blend @sky, @base, 90
  end
end

class CatppuccinMacchiato < Catppuccin
end
