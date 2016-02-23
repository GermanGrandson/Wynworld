class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true
      t.string :jobtitle, default: ""

      t.timestamps null: false
    end
  end
end
