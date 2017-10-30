class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authorize
    redirect_to '/login' unless current_user
  end
end
