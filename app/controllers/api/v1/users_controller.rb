class Api::V1::UsersController < ApplicationController

  before_action :validate_admin

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.create(user_params)
    if user.valid?
      render json: {
        status: :created,
        user: UserSerializer.new(user).serializable_hash[:data][:attributes]
      }
    else
      render json: {status: 500, errors: user.errors.full_messages}
    end
  end

  def show
    user = User.find_by_id(params[:id])
    if user
      render json: UserSerializer.new(user).serializable_hash[:data][:attributes]
    else
      render json: {errors: 'user does not exist'}
    end
  end

  def edit
    user = User.find_by_id(params[:id])
    if user
      render json: UserSerializer.new(user).serializable_hash[:data][:attributes]
    else
      render json: {errors: 'user does not exist'}
    end
  end

  def update
    user = User.find_by_id(params[:id])
    if user && (user.id != current_user || !user.admin) || current_user.id === 1
      user.update(user_params)
      if user.save
        render json: {
          status: 201,
           user: UserSerializer.new(user).serializable_hash[:data][:attributes],
            message: 'User updated successfully'}
      else
        reder json: {status: 400, errors: user.errors.full_messages}
      end
    else
      render json: {status: 400, errors: 'Server was unable to find user'}
    end
  end

  def destroy
    user = User.find_by_id(params[:id])
    if user && user.id != current_user || current_user.id === 1 && !user.admin
      user.destroy
      if user.destroyed?
        render json: {status: 201, message: "user was removed from database"}
      else
        render json: {status: 400, errors: "server request failed to remove user"}
      end
    else
      render json: {status: 400, errors: 'User not found or user is an admin'}
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :admin)
  end
end