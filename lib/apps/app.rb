# frozen_string_literal: true

class App
  def apply_theme!
    raise NotImplementedError
  end

  def reload!
    raise NotImplementedError
  end

  def name
    self.class.to_s.downcase.to_sym
  end
end
