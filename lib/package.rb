# frozen_string_literal: true

module Package
  module_function

  def supported_app_files
    Dir.glob(app_directory_glob).select do |e|
      File.file?(e) && File.basename(e, '.rb') != 'app'
    end
  end

  def supported_app_names
    supported_app_files.map do |file|
      File.basename(file, '.rb')
    end
  end

  def theme_names
    Dir.glob(theme_directory_glob)
       .select { |e| File.file?(e) && File.basename(e, '.rb') != 'theme' }
       .select { |e| File.extname(e) == '.rb' }
       .map { |f| File.basename(f, '.rb') }
  end

  def app_directory_glob
    "#{File.dirname(__FILE__)}/apps/*"
  end

  def theme_directory_glob
    "#{File.dirname(__FILE__)}/themes/*"
  end

  private_class_method :supported_app_files, :app_directory_glob, :theme_directory_glob
end

module AppAutoloader
  def self.included(_module)
    Package.supported_app_names.each { |app| require "apps/#{app}" }
  end
end
