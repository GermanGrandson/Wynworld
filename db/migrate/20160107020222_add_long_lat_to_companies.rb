class AddLongLatToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :latitude, :float
    add_column :companies, :longitude, :float
    add_column :companies, :contact_first, :string
    add_column :companies, :contact_last, :string
    add_column :companies, :note, :text
    add_column :companies, :contact_email, :string
    add_column :companies, :tech_contact_f, :string
    add_column :companies, :tech_contact_l, :string
    add_column :companies, :tech_email, :string
    add_column :companies, :contact_phone, :string
  end
end
