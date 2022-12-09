require 'rails_helper'

RSpec.describe "MoviesController", type: :request do
  DatabaseCleaner.clean
  let(:admin) { FactoryBot.create(:user, :admin)}
  let(:user) { FactoryBot.create(:user)}
  describe "GET#index" do
    it 'renders a successful response' do
      sign_in admin
      get admin_users_path
      expect(response).to have_http_status(200)
    end
  end 
  
  #describe "POST#ban_user" do
  #   it 'renders a successful response' do
  #     sign_in admin
  #     post ban_account_admin_user_path(user) 
  #     expect(user.ban).to be true
  #   end
  # end 
  
end