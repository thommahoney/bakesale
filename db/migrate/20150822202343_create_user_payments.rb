class CreateUserPayments < ActiveRecord::Migration
  def change
    create_table :user_payments do |t|
      t.string :user_id
      t.string :simplify_authorization_id

      t.timestamps null: false
    end
  end
end
