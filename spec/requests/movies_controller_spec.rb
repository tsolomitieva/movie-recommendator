require 'rails_helper'

RSpec.describe "MoviesController", type: :request do
  let(:user) { FactoryBot.create(:user)}
  describe "GET#index" do
    it 'should returns a success response' do
      sign_in user
      get movies_path
      expect(response).to have_http_status(200)
    end
  end
   


  
end
