class ApplicationController < ActionController::Base
  helper_method :current_user
  #before_action :authenticate_user!, unless: :authentication_exempt?
  helper_method :hide_menu?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    redirect_to login_path, alert: 'Please login' unless current_user
  end

  def authentication_exempt?
    (controller_name == 'sessions' && (action_name == 'new' || action_name == 'create')) ||
      (controller_name == 'users' && action_name == 'create') ||
      (controller_name == 'pages' && action_name == 'index') ||
      (controller_name == 'collection_points' && collection_points_exempt?)
  end

  def hide_menu?
    (controller_name == 'sessions' && action_name == 'new') ||
      (controller_name == 'pages' && action_name == 'index')
  end

  def collection_points_exempt?
    action_name == 'search' || action_name == 'nearby'
  end
end
