class FetchYtsPageJob
  include Sidekiq::Job

  def perform(page_number)
    # puts i
    response = Faraday.get("https://yts.mx/browse-movies?page=#{page_number}").body
    movies = Nokogiri::HTML(response)
    movies.css('.browse-movie-wrap').each do |movie|
      title = movie.css(".browse-movie-bottom a").text
      year = movie.css(".browse-movie-year").text
      movie = Movie.where(title: title, year: year).first_or_create
      # movie_link = movie.css(".browse-movie-bottom a").first.attributes["href"].value
      # FetchYtsMovieDetailsJob.perform_async(movie.id, movie_link)
    end
  end
end