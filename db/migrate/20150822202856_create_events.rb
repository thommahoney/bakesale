class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.string :name
      t.integer :organization_id

      t.timestamps null: false
    end
  end
end
