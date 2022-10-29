class Movie < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: true
    has_one_attached :poster
end
