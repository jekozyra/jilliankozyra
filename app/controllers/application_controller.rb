class ApplicationController < ActionController::Base
  protect_from_forgery
  
#  protected
  def admin_authorize
    unless current_user and current_user.admin?
      #session[:original_uri] = request.request_uri
      flash[:notice] = "Only admins can access this section!"
      redirect_to root_url
    end
  end
  
  def authorize
    unless current_user
      #session[:original_uri] = request.request_uri
      flash[:notice] = "You must be logged in to access this section!"
      redirect_to root_url
    end
  end
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
end
