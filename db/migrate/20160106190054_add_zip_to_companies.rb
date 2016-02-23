class AddZipToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :zip, :integer
  end
end
