class Api::V1::OrdersController < ApplicationController

  def  create
    byebug
    user = User.find_by_id(params[:user])
    if user && user.id === current_user.id
      user.orders.build(params[:data])
    end

  end


end