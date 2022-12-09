require 'rails_helper'

RSpec.describe "MoviesController", type: :request do
  let(:admin) { FactoryBot.create(:user, :admin)}
  let(:user) { FactoryBot.create(:user)}
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
      movie = Movie.create(title: "testmovie")
      get edit_admin_movie_path(movie)
      expect(response).to be_successful
    end
  end
  describe "GET#new" do
    it 'redirects to authedication"' do
      sign_in user
      get new_admin_movie_path
      expect(response).to have_http_status(302)
    end
  end 
  describe "GET#edit" do
   it "redirects to authedication" do
      sign_in user
      movie = Movie.create(title: "testmovie")
      get edit_admin_movie_path(movie)
      expect(response).to have_http_status(302)
    end
  end
   describe "POST#create" do
     it 'returns a successful response' do
       sign_in admin
       expect { post admin_movies_path, params: { movie: { title: "test" }}}
       .to change(Movie, :count).by(1)
     end
   end 
   describe "POST#create" do
     it 'redirects to authentication' do
       sign_in user
       expect { post admin_movies_path, params: { movie: { title: "test" }}}
       .to change(Movie, :count).by(0)
      end
   end 
end