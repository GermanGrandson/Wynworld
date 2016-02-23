class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader
  belongs_to :cohort
  has_many :employments, dependent: :destroy
  has_many :companies, through: :employments
  before_save :capitalize_name

  validates :fname, :lname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },

                   uniqueness: { case_sensitive: false }

  store_accessor :status, :seeking, :reason
  store_accessor :social_links, :slack, :github, :linkedin, :portfolio

  scope :filter, ->(chicken){
    joins(:companies).where('companies.name = ?', chicken) if chicken.present?
  }
  scope :search, ->(fname){where('fname LIKE ? OR fname LIKE ?', "%#{fname.capitalize}%", "%#{fname.downcase}") if fname.present?}

  def capitalize_name
    if !self.admin == "false"
        self.fname = self.fname.capitalize
        self.lname = self.lname.capitalize
      end
    end
end
