# frozen_string_literal: true

require 'constants'

module Utils
  def self.to_pascal(input)
    input.to_s.split('_').map(&:capitalize).join
  end

  def self.for_current_os?(supported_oses)
    supported_oses.any? { |os| RUBY_PLATFORM.include? os.to_s }
  end

  def self.write_to_output(lines, output_file, supported_oses)
    return unless for_current_os? supported_oses

    path = File.join Constants.output_dir, output_file
    File.open(path, 'w') do |file|
      lines.map { |line| file.write "#{line}\n" }
    end
  end
end
