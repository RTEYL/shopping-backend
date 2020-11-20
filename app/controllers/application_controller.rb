class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  helper_method :current_user

    def current_user
      @current_user ||= User.find_by_id(session[:user])
    end
end
