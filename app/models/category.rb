class Category < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true
    
    has_many :movies, through: :categories_movie
end
