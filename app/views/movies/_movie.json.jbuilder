json.extract! movie, :id, :poster, :title, :plot, :rating, :year, :created_at, :updated_at
json.url movie_url(movie, format: :json)
