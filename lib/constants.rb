# frozen_string_literal: true

module Constants
  @output_dir = "#{Dir.home}/.inkd"
  @theme_files = 'themes/*.rb'

  class << self
    attr_reader :output_dir, :theme_files
  end
end
