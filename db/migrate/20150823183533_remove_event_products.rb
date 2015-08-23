class RemoveEventProducts < ActiveRecord::Migration
  def change
    drop_table :event_products
  end
end
