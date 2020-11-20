class Api::V1::OrdersController < ApplicationController

  def  create
    byebug
    user = User.find_by_id(order_params[:user_id])
    if user && user.id === current_user.id
      order = user.orders.build(order_params)
    else
      order = Orders.create(order_params)
    end

  end

private

def order_params
  params.require(:order_data).permit(:user_id, :city, :country_code, :line1, :line2, :postal_code, :recipient_name, :state, :email, :payerID, :paymentID, :paymentToken)
end

end