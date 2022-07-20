# frozen_string_literal: true

require 'constants'

module Utils
  module_function

  def to_pascal(input)
    input.to_s.split('_').map(&:capitalize).join
  end

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
      return if Dir.exist? Constants.output_dir

      Dir.mkdir Constants.output_dir
    end

    def write_file(lines, output_file)
      path = File.join Constants.output_dir, output_file
      File.open(path, 'w') do |file|
        lines.each { |line| file.write "#{line}\n" }
      end
    end

    def print_theme_names
      puts 'Enter one of the following colors:'
      theme_file_dir = File.join __dir__, Constants.theme_files
      theme_files = Dir.glob theme_file_dir
      theme_files.each { |file| puts File.basename(file, '.rb') }
    end

    def print_font_names
      Constants.fonts.each_key { |font| puts font }
    end
  end
end

module ColorschemeBuilder
  module_function

  def load(theme:, shade:)
    theme_class = "#{theme.capitalize}#{shade.capitalize}"
    require_relative "themes/#{theme}"
    eval "#{theme_class}.new", binding, __FILE__, __LINE__
  end
end
