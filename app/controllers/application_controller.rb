class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource

protected

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == "new"
      "welcome"
    else
      "application"
    end
  end

  # def layout_by_resource
  #    if devise_controller?
  #      puts "devise controller in use"
  #    end
  # end
  #



end
