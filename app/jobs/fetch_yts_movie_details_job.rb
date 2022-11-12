class FetchYtsMovieDetailsJob
  include Sidekiq::Job

  def perform(movie_id, url)
    Movie.find(movie_id)
    response = Faraday.get(url).body
    movie = Nokogiri::HTML(response)

    # movie.css('.browse-movie-wrap').each do |movie|
    #   title = movie.css(".browse-movie-bottom a").text
    #   year = movie.css(".browse-movie-year").text
    #   # movie_link = movie.css(".browse-movie-bottom a").first.attributes["href"].value
    #   movie = Movie.where(title: title, year: year).first_or_create
    #
    #   # movie_link
    #   # movie
    # end
  end
end