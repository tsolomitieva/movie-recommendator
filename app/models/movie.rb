class Movie < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: true

    has_one_attached :poster
    has_many :categories_movie
    has_many :categories, through: :categories_movie
end
