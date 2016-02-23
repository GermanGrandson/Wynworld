class AddCurrentToEmployment < ActiveRecord::Migration
  def change
    add_column :employments, :current, :boolean, :default => false
  end
end
