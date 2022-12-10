require 'rails_helper'

RSpec.describe Movie, type: :model do
  it "is not valid without a title" do
    movie = Movie.new(title: nil)
    expect(movie).to_not be_valid
  end
end

