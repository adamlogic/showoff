
# Since MockupsController subclasses (and thus loads) ApplicationController, we need to make sure that
# it gets reloaded in development. Without this, things will break after the first reload.
ActiveSupport::Dependencies.load_once_paths.delete(File.expand_path(File.dirname(__FILE__))+'/app/controllers')

