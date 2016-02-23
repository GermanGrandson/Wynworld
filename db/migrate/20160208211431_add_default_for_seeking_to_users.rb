class AddDefaultForSeekingToUsers < ActiveRecord::Migration
  def change
    change_column :users, :status, :hstore, default: "", null:false
    change_column :users, :social_links, :hstore, default: "", null:false
  end
end
