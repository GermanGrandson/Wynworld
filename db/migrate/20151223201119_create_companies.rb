class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :description
      t.string :website
      t.boolean :hp

      t.timestamps null: false
    end
  end
end
