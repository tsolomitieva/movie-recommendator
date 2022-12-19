module MoviesHelper

  def poster_for_movie(movie)
    if movie.poster.attached?
      return movie.poster
    else
      return 'default.jpg'
    end
  end

  def want_to_see_button(users_movie, movie)
    if users_movie && users_movie.status == 'want_to_see'
      return button_to '', delete_movie_status_movie_path(movie),method: :delete, class: 'btn btn-outline-light  border rounded-pill mt-4 btn-outline bi bi-x-lg m-2'
    else
      return button_to '', add_movie_status_movie_path(movie, status: 'want_to_see'), method: :post, class: 'btn btn-outline-light  border rounded-pill mt-4 btn-outline bi bi-plus m-2'
    end
  end

  def like_button(users_movie, movie)
    if users_movie && users_movie.status == 'like'
      return button_to '', delete_movie_status_movie_path(movie), method: :delete, class: 'btn btn-outline-light  border rounded-pill mt-4 btn-outline bi bi-hand-thumbs-up-fill m-2'
    else
      return button_to '', add_movie_status_movie_path(movie, status: 'like'), method: :post, class: 'btn btn-outline-light  border rounded-pill mt-4 btn-outline bi bi-hand-thumbs-up m-2'
    end
  end

  def dislike_button(users_movie, movie)
    if users_movie && users_movie.status == 'dislike'
      return button_to '', delete_movie_status_movie_path(movie), method: :delete, class: 'btn btn-outline-light  border rounded-pill mt-4 btn-outline bi bi-hand-thumbs-down-fill m-2'
    else
      return button_to '', add_movie_status_movie_path(movie, status: 'dislike'), method: :post, class: 'btn btn-outline-light  border rounded-pill mt-4 btn-outline bi bi-hand-thumbs-down m-2'
    end
  end
end
