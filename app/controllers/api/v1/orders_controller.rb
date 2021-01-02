class Api::V1::OrdersController < ApplicationController

  def index
    user = User.find_by_id(params[:user_id])
    if user
      orders = user.orders.all
      render json: {status: 201, orders: orders}
    else
      render json: {status: 401}
    end
  end

  def  create
    user = User.find_by_id(params[:user][:id])
    if user
      order = user.orders.build(order_params)
    else
      order = Order.create(order_params)
    end
    if order.save
      render json: {status: 201, order: order}
    else
      render json: {status: 400, errors: 'Order was unable to be processed'}
    end

  end

private

def order_params
  params.require(:order_data).permit(:user_id, :city, :country_code, :line1, :line2, :postal_code, :recipient_name, :state, :email, :payerID, :paymentID, :paymentToken, :purchase_date)
end

end