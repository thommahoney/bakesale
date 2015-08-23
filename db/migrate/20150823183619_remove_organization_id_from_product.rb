class RemoveOrganizationIdFromProduct < ActiveRecord::Migration
  def change
    remove_column :products, :organization_id
  end
end
