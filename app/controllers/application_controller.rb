class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  helper_method :current_user, :isAdmin?

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end

    def isAdmin?
      current_user.admin
    end

    def validate_admin
      if !isAdmin?
        render json: {status: 401, errors: 'unauthorized access'}
      end
    end
end
