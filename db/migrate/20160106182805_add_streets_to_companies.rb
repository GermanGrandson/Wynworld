class AddStreetsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :street1, :string
    add_column :companies, :street2, :string
  end
end
