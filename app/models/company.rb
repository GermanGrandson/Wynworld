class Company < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode
  before_save :capitalize_name


  has_many :employments
  has_many :users, through: :employments

  validates :name, :city, :state, :zip, presence: true

  def full_address
    [street1, city, state, zip].compact.join(', ')
  end

  def capitalize_name
    self.name = self.name.split.collect(&:capitalize).join(' ') if self.name && !self.name.blank?
  end

  scope :search, ->(name) { where('name LIKE ? OR name LIKE ? OR name LIKE ?', "%#{name.include?"#{name}".upcase}%", "%#{name.capitalize}%", "%#{name.upcase}%") if name.present? }

end
