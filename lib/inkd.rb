# frozen_string_literal: true

require_relative 'app'
require 'thor'

class InkdCLI < Thor
  APPS_FILES = 'lib/apps/*.rb'

  def initialize(*args)
    super(*args)
    @apps = init_apps
  end

  desc 'color COLORSCHEME', 'Generate colorscheme files and reload apps'
  # TODO: implement me!
  # option :list, type: :boolean
  def color(colorscheme, shade = 'dark')
    theme = init_colorscheme colorscheme, shade
    create_output_directory
    @apps.map { |app| app.theme = theme }
  end

  # TODO: implement me!
  desc 'bar SHAPE', 'Generate bar files and reload apps'
  option :list, type: :boolean
  def bar(shape) end

  # TODO: implement me!
  desc 'font FONT', 'Generate font files and reload apps'
  option :list, type: :boolean
  def font(font) end

  private

  def create_output_directory
    return if Dir.exist? App::INKD_OUTPUT_DIR

    Dir.mkdir(App::INKD_OUTPUT_DIR)
  end

  def init_apps
    Dir.glob(APPS_FILES).map do |file|
      require_relative file.split('/').drop(1).join('/')
      eval("#{File.basename(file, '.rb').capitalize}.new", binding, __FILE__, __LINE__)
    end
  end

  def init_colorscheme(theme, shade)
    theme_class = "#{theme.capitalize}#{shade.capitalize}"
    require "themes/#{theme}"
    eval "#{theme_class}.new", binding, __FILE__, __LINE__
  end
end
