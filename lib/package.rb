# frozen_string_literal: true

require 'constants'

module Package
  SUPPORTED_APPS = ['kitty', 'neovim', 'neovim_terminal', 'lualine'].freeze

  module_function

  def supported_app_files
    Dir.glob(app_directory_glob).select { |file| supported_file? file }
  end

  def supported_file?(file)
    filename = File.basename(file, '.rb')

    File.file?(file) &&
      SUPPORTED_APPS.include?(filename)
  end

  def supported_app_names
    supported_app_files.map do |file|
      File.basename(file, '.rb')
    end
  end

  def app_classes
    supported_app_names.map { |name| snake_to_capital_case(name) }
  end

  def snake_to_capital_case(snake)
    snake.split('_').collect(&:capitalize).join
  end

  def theme_names
    @theme_names ||= Dir.glob(theme_directory_glob)
                        .select { |e| ruby_theme_file? e }
                        .map { |f| File.basename(f, '.rb') }
  end

  def app_directory_glob
    "#{File.dirname(__FILE__)}/apps/*"
  end

  def theme_directory_glob
    "#{File.dirname(__FILE__)}/themes/*"
  end

  def valid_theme?(theme_name)
    theme_names.include?(theme_name)
  end

  def valid_font?(font)
    Constants::FONTS.keys.include?(font.to_sym)
  end

  def ruby_theme_file?(filename)
    File.file?(filename) &&
      File.basename(filename, '.rb') != 'theme' &&
      File.extname(filename) == '.rb'
  end

  private_class_method :supported_app_files, :app_directory_glob, :theme_directory_glob, :snake_to_capital_case, :ruby_theme_file?
end

module AppAutoloader
  def self.included(_module)
    Package.supported_app_names.each { |app| require "apps/#{app}" }
  end
end
