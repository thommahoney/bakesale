class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :amount
      t.integer :user_payment_id

      t.timestamps null: false
    end
  end
end
