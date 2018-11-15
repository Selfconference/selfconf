class Speaker < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  validates :bio, presence: true
  validates :headshot, presence: true
  has_many :votes, dependent: :destroy
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :sessions
  accepts_nested_attributes_for :sessions, reject_if: :all_blank, allow_destroy: true

  default_scope -> { order("#{table_name}.name ASC") }

  def admin?
    roles.include?(Role.admin)
  end

  def selector?
    roles.include?(Role.selector)
  end
end
