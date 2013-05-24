class AppDelegate < ProMotion::Delegate
  def on_load(app, options)
    open MainScreen.new

  end
end