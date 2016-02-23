class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :name
      t.string :location
      t.date :graddate

      t.timestamps null: false
    end
  end
end
