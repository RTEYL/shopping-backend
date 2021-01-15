class RegistrationsController < ApplicationController

  def create
    user = User.create(user_params)

    if user.valid?
      token = encode_token({
        user_id: user.id,
        exp: (Time.now + 1.week).to_i
        })

      render json: {
        status: :created,
        jwt: token,
        user: UserSerializer.new(user).serializable_hash[:data][:attributes],
        logged_in: true
      }
    else
      render json: {status: 500, errors: user.errors.full_messages}
    end
  end

  private

     def user_params
         params.require(:user).permit(:email, :password, :password_confirmation)
     end

end
