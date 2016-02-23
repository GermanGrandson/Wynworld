class RemovePreferencesFromCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :preferences, :hstore
  end
end
