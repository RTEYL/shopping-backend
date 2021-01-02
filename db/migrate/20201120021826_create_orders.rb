class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: true, foreign_key: true
      t.string :city
      t.string :country_code
      t.string :line1
      t.string :line2
      t.string :postal_code
      t.string :recipient_name
      t.string :state
      t.string :email
      t.string :payerID
      t.string :paymentID
      t.string :paymentToken

      t.timestamps
    end
  end
end
