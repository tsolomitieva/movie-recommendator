module MoviesHelper
    def poster_for_movie(movie)
        if movie.poster.attached?
            return movie.poster
        else
            return 'default.jpg'
        end
    end
end
