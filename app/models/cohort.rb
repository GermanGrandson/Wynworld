class Cohort < ActiveRecord::Base
  has_many :users, dependent: :destroy

  validates :name, :location, :graddate, presence: true
end
