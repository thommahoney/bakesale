class ChangeOrgIdToOrganizationId < ActiveRecord::Migration
  def change
    rename_column :user_organizations, :org_id, :organization_id
  end
end
