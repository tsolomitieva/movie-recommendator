module MoviesHelper
    def set_default_poster(movie)
        if movie.poster.nil? || movie.poster.blank?
            return 'default.jpg'
        else
            return movie.poster
        end
    end
end
