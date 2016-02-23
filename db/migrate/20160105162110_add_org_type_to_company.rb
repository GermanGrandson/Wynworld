class AddOrgTypeToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :orgtype, :string
  end
end
