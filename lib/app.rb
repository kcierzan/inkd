# frozen_string_literal: true

require 'erubi'
require 'tilt'

class App
  INKD_OUTPUT_DIR = "#{Dir.home}/.inkd"
  INKD_TEMPLATE_DIR = 'lib/apps/templates'

  def theme=(theme)
    return unless for_current_os?

    rendered_template = Tilt::ErubiTemplate.new(@theme_template_file).render(self, **theme.colors)
    path = File.join(INKD_OUTPUT_DIR, @theme_output_file)
    File.open(path, 'w+') { |file| file.write rendered_template }
    reload
  end

  protected

  def font=() end
  def bars=() end

  def get_template_for(file)
    File.join INKD_TEMPLATE_DIR, "#{File.basename(file, '.rb')}.erb"
  end

  private

  def for_current_os?
    @supported_oses.any? { |os| RUBY_PLATFORM.include? os.to_s }
  end
end
