# frozen_string_literal: true

require_relative '../constants'
require_relative '../utils'

module Neovim
  @highlights = %i[
    boolean
    buffer_current
    buffer_current_mod
    buffer_current_sign
    buffer_inactive
    buffer_inactive_mod
    buffer_inactive_sign
    buffer_inactive_targe
    buffer_tab_page_fill
    character
    color_column
    comment
    conceal
    conditional
    constant
    cursor
    cursor_column
    cursor_im
    cursor_line
    cursor_line_nr
    debug
    define
    delimiter
    diff_add
    diff_change
    diff_delete
    diff_text
    directory
    end_of_buffer
    error
    error_msg
    exception
    float
    fold_column
    folded
    function
    identifier
    ignore
    inc_search
    include
    keyword
    label
    line_nr
    macro
    match_paren
    mode_msg
    non_text
    normal
    normal_float
    number
    operator
    pmenu
    pmenu_sbar
    pmenu_sel
    pmenu_sel_bold
    pmenu_thumb
    pre_condit
    pre_proc
    question
    quick_fix_line
    repeat
    search
    sign_column
    special
    special_char
    special_comment
    special_key
    spell_bad
    spell_cap
    spell_local
    spell_rare
    statement
    status_line
    status_line_nc
    storage_class
    string
    structure
    t_s_annotation
    t_s_attribute
    t_s_boolean
    t_s_character
    t_s_conditional
    t_s_const_builtin
    t_s_constant
    t_s_constructor
    t_s_const_macro
    t_s_emphasis
    t_s_error
    t_s_exception
    t_s_field
    t_s_float
    t_s_none
    t_s_func_macro
    t_s_function
    t_s_function_builtin
    t_s_include
    t_s_keyword
    t_s_keyword_function
    t_s_keyword_operator
    t_s_label
    t_s_literal
    t_s_math
    t_s_method
    t_s_namespace
    t_s_number
    t_s_operator
    t_s_parameter
    t_s_parameter_reference
    t_s_property
    t_s_punct_bracket
    t_s_punct_delimitter
    t_s_punct_special
    t_s_strike
    t_s_string
    t_s_string_regex
    t_s_strong
    t_s_structure
    t_s_symbol
    t_s_tag
    t_s_tag_delimitter
    t_s_text
    t_s_text_reference
    t_s_title
    t_s_type
    t_s_type_builtin
    t_s_uri
    t_s_underline
    t_s_variable
    t_s_variable_builtin
    tabline_fill
    tabline_sel
    tag
    terminal
    title
    todo
    type
    typedef
    underlined
    vert_split
    visual
    visual_nos
    warning_msg
    whitespace
    wild_menu
    debug_breakpoint
    i_cursor
    l_cursor
    v_cursor
    qf_filename
    buffer_line_separator
    buffer_line_separator_selected
    buffer_line_separator_visible
    which_key_float
    nvim_tree_normal
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
      "  #{Utils.to_pascal hi} = { #{props.join(', ')} };"
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
