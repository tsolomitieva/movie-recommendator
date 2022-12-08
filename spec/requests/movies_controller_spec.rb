require 'rails_helper'

RSpec.describe "MoviesController", type: :request do
  let(:user) { FactoryBot.create(:user)}
  describe "GET#index" do
    it 'returns a successful response' do
      sign_in user
      get movies_path
      expect(response).to have_http_status(200)
    end
  end
  describe "GET#show" do
    it "returns a successful response" do
      sign_in user
      movie = Movie.create(title: "test")
      get movie_path(movie)
      expect(response).to be_successful
    end
  end

end
