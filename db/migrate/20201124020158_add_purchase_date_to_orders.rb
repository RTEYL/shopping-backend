class AddPurchaseDateToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :purchase_date, :string
  end
end
