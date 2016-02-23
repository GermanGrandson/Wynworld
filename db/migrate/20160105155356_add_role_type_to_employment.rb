class AddRoleTypeToEmployment < ActiveRecord::Migration
  def change
    add_column :employments, :roletype, :string
  end
end
