class AddStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :status, :hstore
  end
end
