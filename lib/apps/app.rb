# frozen_string_literal: true

class App
  def apply_theme!
    raise NotImplementedError
  end

  def name
    underscore(self.class.to_s).to_sym
  end

  private

  def underscore(string)
    string.gsub(/::/, '/')
          .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
          .gsub(/([a-z\d])([A-Z])/, '\1_\2')
          .tr('-', '_')
          .downcase
  end
end
