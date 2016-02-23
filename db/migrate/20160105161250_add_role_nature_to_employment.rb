class AddRoleNatureToEmployment < ActiveRecord::Migration
  def change
    add_column :employments, :rolenature, :string
  end
end
