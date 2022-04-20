# frozen_string_literal: true

class App
  INKD_OUTPUT_DIR = "#{Dir.home}/.inkd"

  protected

  def font=() end
  def bars=() end

  def for_current_os?
    @supported_oses.any? { |os| RUBY_PLATFORM.include? os.to_s }
  end
end
