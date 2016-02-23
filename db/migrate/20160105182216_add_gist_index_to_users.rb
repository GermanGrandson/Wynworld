class AddGistIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :status, using: :gist
  end
end
