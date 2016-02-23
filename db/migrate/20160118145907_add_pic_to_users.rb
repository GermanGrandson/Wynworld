class AddPicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :picurl, :string
  end
end
