require 'rails_helper'

RSpec.describe "MoviesController", type: :request do
  let(:user) { FactoryBot.create(:user)}
  let(:admin) { FactoryBot.create(:user, :admin)}
  let(:movie) { FactoryBot.create(:movie)}
  describe "GET#index" do
    it 'returns a successful response' do
      sign_in user
      get movies_path
      expect(response).to be_successful
    end
  end
  describe "GET#index" do
    it 'redirects to authentication' do
      get movies_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end
  describe "GET#show" do
    it "returns a successful response" do
      sign_in user
      get movie_path(movie)
      expect(response).to be_successful
    end
  end
  describe "GET#show" do
    it 'redirects to authentication' do
      get movie_path(movie)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
  describe "GET#random_movie" do
    it 'redirects to authentication' do
      get random_movie_movies_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "GET#random_movie" do
    it 'returns a successful response' do
      sign_in user
      get random_movie_movies_path
      expect(response).to redirect_to(movies_path)
    end
  end
  
end
