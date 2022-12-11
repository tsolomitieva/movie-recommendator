require 'rails_helper'

RSpec.describe "MoviesController", type: :request do
  let(:admin) { FactoryBot.create(:user, :admin)}
  let(:user) { FactoryBot.create(:user)}
  let(:movie) { FactoryBot.create(:movie)}
  describe "GET#new" do
    it 'renders a successful response' do
      sign_in admin
      get new_admin_movie_path
      expect(response).to have_http_status(200)
    end
  end 
  describe "GET#edit" do
    it "renders a successful response" do
      sign_in admin
      get edit_admin_movie_path(movie)
      expect(response).to be_successful
    end
  end
  describe "GET#new" do
    it 'redirects to authentication"' do
      sign_in user
      get new_admin_movie_path
      expect(response).to have_http_status(:found)
    end
  end 
  describe "GET#edit" do
   it "redirects to authentication" do
      sign_in user
      get edit_admin_movie_path(movie)
      expect(response).to have_http_status(:found)
    end
  end
   describe "POST#create" do
     it 'returns a successful response' do
       sign_in admin
       expect { post admin_movies_path, params: { movie: movie.attributes }}
       .to change(Movie, :count).by(1)
     end
   end 
   describe "POST#create" do
     xit 'returns a successful response' do
       sign_in admin
       expect { post admin_movies_path, params: { movie: movie.attributes }}
       .to change(Movie, :count).by(0)

     end
   end 
   
end