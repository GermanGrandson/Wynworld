class AddTypeToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :orgtype, :json
  end
end
