# frozen_string_literal: true

require 'package'

module AppAutoloader
  def self.included(_module)
    Package.supported_app_names.each { |app| require "apps/#{app}" }
  end
end
