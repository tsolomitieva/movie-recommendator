class User < ApplicationRecord
  
  enum role: { user: 0, admin: 1 }
  
  def active_for_authentication?
    super && !self.ban
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
