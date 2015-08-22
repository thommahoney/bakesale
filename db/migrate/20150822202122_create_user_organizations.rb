class CreateUserOrganizations < ActiveRecord::Migration
  def change
    create_table :user_organizations do |t|
      t.string :user_id
      t.string :org_id

      t.timestamps null: false
    end
  end
end
