class Theme
  def colors
    @app_vars.reduce({}) { |vars, app| vars.merge(app.to_h) }
  end
end
