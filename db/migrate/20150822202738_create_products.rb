class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :image
      t.text :description
      t.integer :price
      t.integer :organization_id

      t.timestamps null: false
    end
  end
end
