class UsersMovie < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :status, presence: true
  enum status: { want_to_see: 0, like: 1, dislike: 2 }
end
