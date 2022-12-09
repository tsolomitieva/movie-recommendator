require 'rails_helper'

RSpec.describe "MoviesController", type: :request do
  let(:user) { FactoryBot.create(:user)}
  let(:admin) { FactoryBot.create(:user, :admin)}
  describe "GET#index" do
    it 'returns a successful response' do
      sign_in user
      get movies_path
      expect(response).to be_successful
    end
  end
  describe "GET#index" do
    it 'redirects to authedication' do
      get movies_path
      expect(response).to have_http_status(302)
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
  describe "GET#show" do
    it 'redirects to authedication' do
      movie = Movie.create(title: "test")
      get movie_path(movie)
      expect(response).to have_http_status(302)
    end
  end
#  describe "POST#create" do
#     it 'returns a successful response' do
#       sign_in admin
#       movie= Movie.create(title: 'test')
#       expect { post movies_path, params: { movie: { title: "test" }}}
#       .to change(Movie, :count).by(1)
#     end
#   end 
  # describe "POST#create" do
  #   it 'redirects to authedication' do
  #     sign_in user
  #     movie= Movie.create(title: 'test')
  #     expect { post movies_path, params: { movie: { title: "test" }}}
  #     .to change(Movie, :count).by(0)
  #   end
  # end 
end
