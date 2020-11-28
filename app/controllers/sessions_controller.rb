class SessionsController < ApplicationController

  def create
    session["init"] = true

    user = User.find_by(email: user_params['email']).try(:authenticate, user_params['password'])

    if user
      session[:user_id] = user.id
      render json: {
        status: :user_login_successful,
        logged_in: true,
        user: user
      }
    else
      render json: {status: 401, errors: 'Invalid Login'}
    end
  end

  def logged_in
    if session[:user_id]
      user = User.find_by_id(session[:user_id])
      render json: {
        logged_in: true,
        user: user
      }
    else
      render json: {user: {}, logged_in: false}
    end
  end

  def logout
    reset_session
    render json: {status: 200, logged_out: true}
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end