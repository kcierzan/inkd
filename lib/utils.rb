# frozen_string_literal: true

require 'constants'

module Inkd
  def self.to_pascal(input)
    input.to_s.split('_').map(&:capitalize).join
  end

  def self.os_is_linux?
    RUBY_PLATFORM.include? 'linux'
  end

  def self.os_is_darwin?
    RUBY_PLATFORM.include? 'darwin'
  end

  def self.write_to_output(lines, output_file)
    path = File.join Constants.output_dir, output_file
    File.open(path, 'w') do |file|
      lines.map { |line| file.write "#{line}\n" }
    end
  end

  def self.create_output_directory
    return if Dir.exist? Constants.output_dir

    Dir.mkdir Constants.output_dir
  end

  def self.init_colorscheme(theme, shade)
    theme_class = "#{theme.capitalize}#{shade.capitalize}"
    require_relative "themes/#{theme}"
    eval "#{theme_class}.new", binding, __FILE__, __LINE__
  end

  # TODO: list the shades also
  def self.list_themes
    puts 'Enter one of the following colors:'
    theme_file_dir = File.join __dir__, Constants.theme_files
    theme_files = Dir.glob theme_file_dir
    theme_files.each do |file|
      puts File.basename(file, '.rb')
    end
  end

  def self.list_fonts
    Constants.fonts.keys.map { |font| puts font }
  end

  def self.font_families_fot(font)
    Constants.fonts[font]
  end
end
