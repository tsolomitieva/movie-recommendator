class Movie < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: true

    has_one_attached :poster
    has_many :categories_movies
    has_many :categories, through: :categories_movies

    acts_as_taggable_on :tags

end
