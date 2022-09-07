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
        memo << "#{k} = '#{v}'"
      end
      "  #{hi} = { #{props.join(', ')} };"
    end
    table.unshift 'return {'
    table << '}'
  end
end
