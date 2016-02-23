class AddFieldsToEmployment < ActiveRecord::Migration
  def change
    add_column :employments, :salary, :integer
    add_column :employments, :start_date, :date
    add_column :employments, :end_date, :date
  end
end
