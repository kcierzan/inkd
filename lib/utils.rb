# frozen_string_literal: true

require 'constants'

module Utils
  module OS
    module_function

    def linux?
      RUBY_PLATFORM.include? 'linux'
    end

    def darwin?
      RUBY_PLATFORM.include? 'darwin'
    end
  end

  module Filesystem
    module_function

    def create_output_directory
      return if Dir.exist? Constants::OUTPUT_DIR

      Dir.mkdir Constants::OUTPUT_DIR
    end

    def write_file(lines, output_file)
      path = File.join Constants::OUTPUT_DIR, output_file
      File.open(path, 'w') do |file|
        lines.each { |line| file.write "#{line}\n" }
      end
    end
  end
end

module ColorschemeBuilder
  module_function

  def load(theme:, shade:)
    theme_class = "#{theme.capitalize}#{shade.capitalize}"
    require "themes/#{theme}"
    eval "#{theme_class}.new", binding, __FILE__, __LINE__
  end
end
