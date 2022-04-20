# frozen_string_literal: true

require 'rake'

Gem::Specification.new do |s|
  s.name = 'inkd'
  s.version = '0.0.0'
  s.summary = 'Inkd 🐙'
  s.description = 'Theme all your apps'
  s.authors = ['Kyle Cierzan']
  s.email = 'kcierzan@gmail.com'
  s.files = FileList.new 'lib/**/*.rb', 'lib/**/*.erb', 'bin/*'
  s.homepage = 'https://rubygems.org/gems/inkd'
  s.license = 'MIT'
  s.executables << 'ink'
  s.add_runtime_dependency 'rake', '~> 13'
  s.add_runtime_dependency 'thor', '~> 1'
  s.required_ruby_version = '>= 2.7.5'
end
