class User < ApplicationRecord
  before_create :generate_list

  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :users_movies
  has_many :movies, through: :users_movies

  enum role: { user: 0, admin: 1 }

  def active_for_authentication?
    super && !ban
  end

  def generate_list
    self.public_list_uid = SecureRandom.hex(6)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
