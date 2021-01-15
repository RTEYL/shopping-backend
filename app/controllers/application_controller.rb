class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  helper_method :encode_token, :auth_header, :decoded_token, :current_user, :isAdmin?, :validate_admin

  SECRET = Rails.application.secrets.secret_key_base

  def encode_token(payload)
    JWT.encode(payload, SECRET)
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, SECRET, true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

    def current_user
      if decoded_token
        user_id = decoded_token[0]['user_id']
        return User.find_by(id: user_id)
      end
    end

    def isAdmin?
      if current_user
        current_user.admin
      end
    end

    def validate_admin
      if !isAdmin?
        render json: {status: 401, errors: 'unauthorized access'}
      end
    end
end
