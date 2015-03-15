class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  ActiveScaffold.set_defaults do |config|
    config.ignore_columns << :versions   #fill in configuration option here
#    config.actions.add :export
#    config.export_default_delimiter = "|"
  end 
ActiveScaffold::DataStructures::Column.show_blank_record = false
  protect_from_forgery with: :exception
end
