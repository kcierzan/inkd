# frozen_string_literal: true

require 'apps/app'
require 'constants'
require 'utils'

class Neovim < App
  OUTPUT_FILE = 'neovim.ink.lua'

  def apply_theme!(theme)
    table = to_lua_table theme
    Utils::Filesystem.write_file table, OUTPUT_FILE
    reload!
  end

  private

  def reload!
    nvim_socket = ENV['NVIM_SOCKET']
    return unless nvim_socket

    `nvr --nostart --remote-send ':Restart<CR>'` if File.exist? nvim_socket
  end

  def to_lua_table(theme)
    table = theme.map do |hi, props|
      props = props.reduce([]) do |memo, (k, v)|
        memo << parse_lua_key_value(k, v)
      end
      to_lua_highlight_key(highlight: hi, properties: props)
    end
    wrap_return_lua_table_literal table
  end

  def parse_lua_key_value(key, value)
    value = "'#{value}'" unless [true, false].include? value

    "#{key} = #{value}"
  end

  def wrap_return_lua_table_literal(table)
    table.unshift 'return {'
    table << '}'
  end

  def to_lua_highlight_key(highlight:, properties:)
    "  #{highlight} = { #{properties.join(', ')} };"
  end
end
