class AddOrgTypeToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :preferences, :hstore
  end
end
