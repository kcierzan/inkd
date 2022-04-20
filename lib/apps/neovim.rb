# frozen_string_literal: true

require_relative '../app'

class Neovim < App
  @theme_vars = %i[
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
    ts_annotation
    ts_attribute
    ts_boolean
    ts_character
    ts_conditional
    ts_const_builtin
    ts_constant
    ts_constructor
    ts_const_macro
    ts_emphasis
    ts_error
    ts_exception
    ts_field
    ts_float
    ts_none
    ts_func_macro
    ts_function
    ts_function_builtin
    ts_include
    ts_keyword
    ts_keyword_function
    ts_keyword_operator
    ts_label
    ts_literal
    ts_math
    ts_method
    ts_namespace
    ts_number
    ts_operator
    ts_parameter
    ts_parameter_reference
    ts_property
    ts_punct_bracket
    ts_punct_delimitter
    ts_punct_special
    ts_strike
    ts_string
    ts_string_regex
    ts_strong
    ts_structure
    ts_symbol
    ts_tag
    ts_tag_delimitter
    ts_text
    ts_title
    ts_type
    ts_type_builtin
    ts_uri
    ts_underline
    ts_variable
    ts_variable_builtin
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
  ].freeze

  def initialize
    super
    @supported_oses = %i[linux darwin].freeze
    @theme_output_file = 'neovim.ink.test.lua'
  end

  def self.highlights
    Struct.new(*@theme_vars, keyword_init: true) do
      def to_h
        # turn the ruby hashmaps into strings that look like lua tables
        theme_arr = super.map do |hi, props|
          if props
            props = props.reduce([]) do |memo, (k, v)|
              memo << "#{k} = '#{v}'"
            end
            [hi, props.join(', ')]
          else
            [hi, '']
          end
        end
        theme_arr.to_h
      end
    end
  end

  def theme=(theme)
    return unless for_current_os?

    first_line = "local highlights = {\n"
    path = File.join(INKD_OUTPUT_DIR, @theme_output_file)
    File.open(path, 'w') do |file|
      file.write first_line
      theme.neovim.each do |highlight, values|
        line = "  #{to_pascal highlight} = { #{values} };\n"
        file.write line
      end
      file.write "}\n"
      file.write "return highlights\n"
    end
  end

  private

  def to_pascal(input)
    input.to_s.split('_').map(&:capitalize).join
  end

  def reload
    nvim_socket = ENV['NVIM_SOCKET']
    `nvr --nostart --remote-send ':Restart<CR>'` if File.exist? nvim_socket
  end
end
