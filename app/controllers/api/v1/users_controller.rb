class UsersController < ApplicationController

  def show
    user = User.find_by_id(params[:id])
    if user
      render json: user
    else
      render json: {errors: 'user does not exist'}
    end
  end

end