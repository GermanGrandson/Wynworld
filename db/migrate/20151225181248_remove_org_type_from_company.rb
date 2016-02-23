class RemoveOrgTypeFromCompany < ActiveRecord::Migration
  def change
    remove_column :companies, :orgtype, :json
  end
end
