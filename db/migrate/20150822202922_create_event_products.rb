class CreateEventProducts < ActiveRecord::Migration
  def change
    create_table :event_products do |t|
      t.integer :event_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
