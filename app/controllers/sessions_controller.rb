class SessionsController < ApplicationController

  def create

    user = User.find_by(email: user_params['email']).try(:authenticate, user_params['password'])

    if user
      token = encode_token({
        user_id: user.id,
        exp: (Time.now + 1.week).to_i
        })
      render json: {
        status: :user_login_successful,
        logged_in: true,
        jwt: token,
        user: UserSerializer.new(user).serializable_hash[:data][:attributes]
      }
    else
      render json: {status: 401, errors: 'Invalid Login'}
    end
  end

  def logged_in
    if current_user
      token = encode_token({
        user_id: current_user.id,
        exp: (Time.now + 1.week).to_i
        })
      render json: {
        logged_in: true,
        jwt: token,
        user: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
        user: UserSerializer.new(user).serializable_hash[:data][:attributes]
      }
    else
      render json: {user: {}, logged_in: false}
    end
  end

  def logout
    if current_user
      render json: {status: 200, logged_out: true}
    else
      render json: {status: 401, errors: 'unauthorized access'}
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
