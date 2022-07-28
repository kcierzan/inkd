# frozen_string_literal: true

require_relative '../constants'
require_relative '../utils'

module Neovim
  @highlights = %i[
    Boolean
    BufferCurrent
    BufferCurrentMod
    BufferCurrentSign
    BufferInactive
    BufferInactiveMod
    BufferInactiveSign
    BufferInactiveTarge
    BufferTabPageFill
    Character
    ColorColumn
    Comment
    Conceal
    Conditional
    Constant
    Cursor
    CursorColumn
    CursorIm
    CursorLine
    CursorLineNr
    Debug
    Define
    Delimiter
    DiffAdd
    DiffChange
    DiffDelete
    DiffText
    Directory
    EndOfBuffer
    Error
    ErrorMsg
    Exception
    Float
    FoldColumn
    Folded
    Function
    Identifier
    Ignore
    IncSearch
    Include
    Keyword
    Label
    LineNr
    Macro
    MatchParen
    ModeMsg
    NonText
    Normal
    NormalFloat
    Number
    Operator
    Pmenu
    PmenuSbar
    PmenuSel
    PmenuSelBold
    PmenuThumb
    PreCondit
    PreProc
    Question
    QuickFixLine
    Repeat
    Search
    SignColumn
    Special
    SpecialChar
    SpecialComment
    SpecialKey
    SpellBad
    SpellCap
    SpellLocal
    SpellRare
    Statement
    StatusLine
    StatusLineNc
    StorageClass
    String
    Structure
    TSAnnotation
    TSAttribute
    TSBoolean
    TSCharacter
    TSConditional
    TSConstBuiltin
    TSConstant
    TSConstructor
    TSConstMacro
    TSEmphasis
    TSError
    TSException
    TSField
    TSFloat
    TSNone
    TSFuncMacro
    TSFunction
    TSFuncBuiltin
    TSRepeat
    TSInclude
    TSKeyword
    TSKeywordFunction
    TSKeywordOperator
    TSLabel
    TSLiteral
    TSMath
    TSMethod
    TSNamespace
    TSNumber
    TSOperator
    TSParameter
    TSParameterReference
    TSProperty
    TSPunctBracket
    TSPunctDelimitter
    TSPunctSpecial
    TSStrike
    TSString
    TSStringRegex
    TSStrong
    TSStructure
    TSSymbol
    TSTag
    TSTagDelimitter
    TSText
    TSTextReference
    TSTitle
    TSType
    TSTypeBuiltin
    TSUri
    TSUnderline
    TSVariable
    TSVariableBuiltin
    TabLine
    TabLineFill
    TabLineSel
    Tag
    Terminal
    Title
    Todo
    Type
    Typedef
    Underlined
    VertSplit
    Visual
    VisualNos
    WarningMsg
    Whitespace
    WildMenu
    DebugBreakpoint
    iCursor
    lCursor
    vCursor
    QfFilename
    BufferLineSeparator
    BufferLineSeparatorSelected
    BufferLineSeparatorVisible
    WhichKeyFloat
    NvimTreeNormal
    htmlH1
    htmlH2
    htmlH3
  ].freeze
  @output_file = 'neovim.ink.lua'

  module_function

  def highlights
    Struct.new(*@highlights, keyword_init: true)
  end

  def filter_empty_properties(nvim_theme)
    nvim_theme.to_h.filter { |_, v| v.respond_to?(:empty?) && !v.empty? }
  end

  def to_lua_table(properties)
    table = properties.map do |hi, props|
      props = props.reduce([]) do |memo, (k, v)|
        memo << "#{k} = '#{v}'"
      end
      "  #{hi} = { #{props.join(', ')} };"
    end
    table.unshift 'return {'
    table << '}'
  end

  def theme=(nvim_theme)
    properties = filter_empty_properties nvim_theme
    table = to_lua_table properties
    Utils::Filesystem.write_file table, @output_file
    reload
  end

  def reload
    nvim_socket = ENV['NVIM_SOCKET']
    return unless nvim_socket

    `nvr --nostart --remote-send ':Restart<CR>'` if File.exist? nvim_socket
  end

  private_class_method :to_lua_table, :filter_empty_properties
end
