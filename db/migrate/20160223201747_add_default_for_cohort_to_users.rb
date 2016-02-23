class AddDefaultForCohortToUsers < ActiveRecord::Migration
  def change
    change_column :users, :cohort_id, :integer, :default => 1
  end
end
