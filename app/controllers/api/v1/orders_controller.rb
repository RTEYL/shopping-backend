class Api::V1::OrdersController < ApplicationController

  def  create
    byebug
    user = User.find_by_id(params[:user])
    if user && user.id === current_user.id
      user.orders.build(params[:data])
    end

  end

private

def order_params
  params.require(:order_data).permit(:user_id, :city, :country_code, :line1, :line2, :postal_code, :recipient_name, :state, :email, :payerID, :paymentID, :paymentToken)
end

end