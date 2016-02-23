class AddSocialLinksToUser < ActiveRecord::Migration
  def change
    add_column :users, :social_links, :hstore
  end
end
