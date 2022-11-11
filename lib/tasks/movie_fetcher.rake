# rails -vT
# rails movie_fetcher:yts
namespace :movie_fetcher do
  desc "Fetch movies from yts"
  task yts: :environment do
    # There are currently 2290 pages
    (1..2290).each do |i|
      FetchYtsPageJob.perform_async(i)
    end
  end
end



