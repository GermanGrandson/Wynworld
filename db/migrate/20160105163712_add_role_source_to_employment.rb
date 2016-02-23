class AddRoleSourceToEmployment < ActiveRecord::Migration
  def change
    add_column :employments, :rolesource, :string
  end
end
