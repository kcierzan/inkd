# frozen_string_literal: true

require 'erubi'
require 'tilt'

class App
  # attr_reader :theme_directory
  INKD_OUTPUT_DIR = "#{Dir.home}/.inkd"

  def theme=(theme)
    return unless for_current_os?

    rendered_template = Tilt::ErubiTemplate.new(@theme_template_file).render(self, **theme.colors)
    path = File.join(INKD_OUTPUT_DIR, @theme_output_file)
    File.open(path, 'w+') { |file| file.write(rendered_template) }
    reload
  end

  def font=() end
  def bars=() end

  private

  def reload() end

  def for_current_os?
    @supported_oses.any? { |os| RUBY_PLATFORM.include? os.to_s }
  end
end
