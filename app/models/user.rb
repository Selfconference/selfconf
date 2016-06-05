class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  validates :bio, presence: true
  validates :headshot, presence: true
  has_many :votes, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_and_belongs_to_many :roles
  belongs_to :speaker

  def admin?
    roles.include?(Role.find_by_name("admin"))
  end

  def selector?
    roles.include?(Role.find_by_name("selector"))
  end
end
