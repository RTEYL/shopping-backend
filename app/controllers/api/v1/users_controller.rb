class Api::V1::UsersController < ApplicationController

  before_action :validate_admin

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find_by_id(params[:id])
    if user
      render json: user
    else
      render json: {errors: 'user does not exist'}
    end
  end

  def edit
    user = User.find_by_id(params[:id])
    if user
      render json: user
    else
      render json: {errors: 'user does not exist'}
    end
  end

  def update
    user = User.find_by_id(params[:id])
    if user && user.id != current_user || current_user.id === 1 && !user.admin
      user.update(user_params)
      if user.save
        render json: {status: 201, user: user, message: 'User updated successfully'}
      else
        reder json: {status: 400, errors: user.errors.full_messages}
      end
    else
      render json: {status: 400, errors: 'Server was unable to find user'}
    end
  end

  def destroy
    user = User.find_by_id(params[:id])
    if user && user.id != current_user && !user.admin
      user.destroy
      if user.destroyed?
        render json: {status: 201, errors: "user was removed from database"}
      else
        render json: {status: 400, errors: "server request failed to remove user"}
      end
    else
      render json: {status: 400, errors: 'User not found or user is an admin'}
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :admin)
  end
end