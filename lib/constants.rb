# frozen_string_literal: true

module Constants
  @output_dir = "#{Dir.home}/.inkd"

  class << self
    attr_reader :output_dir
  end
end
