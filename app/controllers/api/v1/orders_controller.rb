class Api::V1::OrdersController < ApplicationController

  def  create
    user = User.find_by_id(order_params[:user_id])
    if user
      if user.id === current_user.id
        byebug
        order = user.orders.build(order_params)
      else
        render json: {status: 401}
      end
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
  params.require(:order_data).permit(:user_id, :city, :country_code, :line1, :line2, :postal_code, :recipient_name, :state, :email, :payerID, :paymentID, :paymentToken)
end

end